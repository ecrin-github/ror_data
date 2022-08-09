using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.IO;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace ror_data
{
    class Program
    {
        static void Main(string[] args)
        {
            // Set up data link to Postgres database, schema 'ror'.

            DataLayer db_layer = new DataLayer();

            // Set up data tables.

            table_creator creator = new table_creator(db_layer.ConnString);
            creator.create_tables();

            // Establish copy helper functions, for transfer of data to db.

            OrgCopyHelpers ch = new OrgCopyHelpers();

            // Establish helper instance, to access the helper fumctions

            Helper h = new Helper();
            
            // Read in the json file, 
            // consists of an array of objects, each equivalent to the ror_org class.
            
            string jsonString = File.ReadAllText(db_layer.jsonPath);

            // Use the data model to read it as an array of serialised objects.

            ror_org[] rordata = JsonSerializer.Deserialize<ror_org[]>(jsonString);

            // n used as an internal integer id to link records, 
            // but the ror id also present in all tables.
            // go through each object found.

            int n = 100000;
            string rorid = "";
            foreach (ror_org ro in rordata)
            {
                n++;
                if (n % 100 == 0 ) Console.WriteLine((n - 100000).ToString() + " records processed");
                rorid = ro.id;
                
                // Organisation singleton attributes

                ror_org_in_db org = new ror_org_in_db();
                org.id = n;
                org.ror_id = rorid;
                org.ror_name = h.Clean(ro.name);
                org.status = ro.status;
                org.established = ro.established;
                org.email_address = ro.email_address;
                org.wikipedia_url = ro.wikipedia_url;
                org.country_name = ro.country.country_name;
                org.country_code = ro.country.country_code;

                if (org.ror_name.Contains("(") && org.ror_name.EndsWith(")"))
                {
                    int start_bracket_pos = org.ror_name.IndexOf("(");

                    // bracketed is any bracketed text, minus the brackets

                    string qual = org.ror_name
                        .Substring(start_bracket_pos + 1, org.ror_name.Length - start_bracket_pos - 2)
                        .Trim().ToLower();

                    // for a few non-country bracketed text - drop the bracket
                    // we just want the country suffiixes (mainly for companies) 

                    if (qual == "rybářství litomyšl" || qual == "qgenomics"
                        || qual == "ascr" || qual == "iris"
                        || qual == "duluth" || qual == "epa"
                        || qual == "engrs." || qual == "bicc"
                        || qual == "fbn" || qual == "group"
                        || qual == "gwzo")
                    {
                        org.ror_name = org.ror_name.Substring(0, start_bracket_pos -1 ).Trim();
                        org.name = org.ror_name;
                    }
                    else
                    {
                        // do some corrections along the way

                        if (qual == "brasil") { qual = "brazil"; }
                        if (qual == "czech republic") { qual = "czechia"; }
                        if (qual == "luxemburg") { qual = "luxembourg"; }
                        if (qual == "south korean") { qual = "south korea"; }
                        if (qual == "uk") { qual = "united kingdom"; }
                        if (qual == "united kindgom") { qual = "united kingdom"; }
                        if (qual == "usa") { qual = "united states"; }
                        if (qual == "unitedstates") { qual = "united states"; }
                        if (qual == "hong kong") { qual = "china"; }
                        if (qual == "hongkong") { qual = "china"; }
                        if (qual == "berlin") { qual = "germany"; }
                        if (qual == "macedonia") { qual = "north macedonia"; }
                        if (qual == "cape verde") { qual = "cabo verde"; }
                        if (qual.Contains("bosnia")) { qual = "bosnia and herzegovina"; }
                        if (qual.Contains("sweden"))
                        {
                            // lose some spurious (not visible in utf-8) characters
                            qual = "sweden";
                        }

                        qual = h.Capitalise(qual);

                        // may be 2 sets of brackets in the name... if this is the case
                        // the name stem includes the first bracketed portion and the
                        // bracketed_portion is the contents of the second set of brackets

                        if (qual.Contains(")") && qual.Contains("("))
                        {
                            // N.B brackets will be in that order -
                            // 'AAA (bbbb)(ccc)' has becomne 'AAA' and 'bbb) (ccc'
                            // needs to be 'AAA (bbb)' and 'ccc'

                            org.name = org.ror_name.Substring(0, start_bracket_pos + 1) + h.Capitalise(qual.Substring(0, qual.IndexOf(")") + 1));
                            org.qualifier = h.Capitalise(qual.Substring(qual.IndexOf("(") + 1));
                        }
                        else
                        {
                            org.name = org.ror_name.Substring(0, start_bracket_pos - 1);
                            org.qualifier = qual;
                        }
                    }
                }
                else
                {
                    org.name = org.ror_name;
                }

                // Types
                if (ro.types != null && ro.types.Length > 0)
                {
                    List<type_in_db> types = new List<type_in_db>();
                    foreach (string s in ro.types)
                    {
                        types.Add(new type_in_db(n, rorid, s));
                        switch(s)
                        {
                            case "Archive": org.is_archive = true; break;
                            case "Company": org.is_company = true; break;
                            case "Education": org.is_education = true; break;
                            case "Facility": org.is_facility = true; break;
                            case "Government": org.is_government = true; break;
                            case "Healthcare": org.is_healthcare = true; break;
                            case "Nonprofit": org.is_nonprofit = true; break;
                            case "Other": org.is_other = true; break;
                        }
                            
                    }

                    db_layer.StoreTypes(ch.type_helper, types);
                }


                // Aliases
                if (ro.aliases != null && ro.aliases.Length > 0)
                {
                    List<alias_in_db> aliases = new List<alias_in_db>();
                    int seq_num = 0;
                    foreach(string s in ro.aliases)
                    {
                        string t = h.Clean(s);
                        if (t != "")
                        {
                            seq_num++;
                            aliases.Add(new alias_in_db(n, rorid, seq_num, t));
                        }
                    }

                    db_layer.StoreAliases(ch.alias_helper, aliases);
                }


                // Acronyms
                if (ro.acronyms != null && ro.acronyms.Length > 0)
                {
                    List<acronym_in_db> acronyms = new List<acronym_in_db>();
                    int seq_num = 0;
                    foreach (string s in ro.acronyms)
                    {
                        string t = h.Clean(s);
                        if (t != "")
                        {
                            seq_num++;
                            acronyms.Add(new acronym_in_db(n, rorid, seq_num, t));
                        }
                    }

                    db_layer.StoreAcronyms(ch.acronym_helper, acronyms);
                }


                // Labels
                if (ro.labels != null && ro.labels.Length > 0)
                {
                    List<label_in_db> labels = new List<label_in_db>();
                    int seq_num = 0;
                    foreach (label_object lob in ro.labels)
                    {
                        string t = h.Clean(lob.label);
                        if (t != "")
                        {
                            seq_num++;
                            labels.Add(new label_in_db(n, rorid, seq_num, lob.iso639, t));
                        }
                    }

                    db_layer.StoreLabels(ch.label_helper, labels);
                }

 
                // Relationships
                if (ro.relationships != null && ro.relationships.Length > 0)
                {
                    List<relationship_in_db> relationships = new List<relationship_in_db>();
                    foreach (relationship r in ro.relationships)
                    {
                        relationships.Add(new relationship_in_db(n, rorid, r.type, r.id, r.label));
                    }

                    db_layer.StoreRelationships(ch.relationship_helper, relationships);
                }


                // Addresses
                if (ro.addresses != null && ro.addresses.Length > 0)
                {
                    List<address_in_db> addresses = new List<address_in_db>();
                    List<city_admin_in_db> city_admins = new List<city_admin_in_db>();
                    List<city_nuts_in_db> city_nuts = new List<city_nuts_in_db>();
  
                    int add_id = 0, gn_city_seq = 0;
                    foreach (address a in ro.addresses)
                    {
                        add_id++;
                        if (add_id == 1)
                        {
                            org.country_gn_id = a.country_geonames_id;
                        }

                        address_in_db adb = new address_in_db(n, rorid, add_id, a.lat, a.lng,
                             a.country_geonames_id, a.state, a.state_code, a.city,
                             a.postcode, a.line, a.primary);
   
                        if (a.geonames_city != null)
                        {
                            geonames_city gc = a.geonames_city;
                            gn_city_seq++;

                            adb.geonames_city_id = gc.id;
                            if (gn_city_seq == 1)
                            {
                                org.city_gn_id = gc.id;
                                org.city = gc.city;
                            }
                            else
                            {
                                org.city += ", " +gc.city + "[" + gc.id.ToString() + "]";
                            }
                             
                            if (gc.geonames_admin1 != null)
                            {
                                gadmin gca = gc.geonames_admin1;
                                if (gca.id != null || gca.name != null || 
                                    gca.ascii_name != null || gca.code != null)
                                {
                                    city_admins.Add(new city_admin_in_db(n, rorid, add_id, gc.id, gc.city, 1, 
                                        gca.id, gca.code, gca.name, gca.ascii_name));
                                }
                            }

                            if (gc.geonames_admin2 != null)
                            {
                                gadmin gca = gc.geonames_admin2;
                                if (gca.id != null || gca.name != null ||
                                    gca.ascii_name != null || gca.code != null)
                                {
                                    city_admins.Add(new city_admin_in_db(n, rorid, add_id, gc.id, gc.city, 2,
                                        gca.id, gca.code, gca.name, gca.ascii_name));
                                }
                            }

                            if (gc.nuts_level1 != null)
                            {
                                nuts gcn = gc.nuts_level1;
                                if (gcn.code != null || gcn.name != null)
                                {
                                    city_nuts.Add(new city_nuts_in_db(n, rorid, add_id, gc.id, gc.city, 1,
                                         gcn.code, gcn.name));
                                }
                            }

                            if (gc.nuts_level2 != null)
                            {
                                nuts gcn = gc.nuts_level2;
                                if (gcn.code != null || gcn.name != null)
                                {
                                    city_nuts.Add(new city_nuts_in_db(n, rorid, add_id, gc.id, gc.city, 2,
                                         gcn.code, gcn.name));
                                }
                            }

                            if (gc.nuts_level3 != null)
                            {
                                nuts gcn = gc.nuts_level3;
                                if (gcn.code != null || gcn.name != null)
                                {
                                    city_nuts.Add(new city_nuts_in_db(n, rorid, add_id, gc.id, gc.city, 3,
                                         gcn.code, gcn.name));
                                }
                            }
                        }

                        addresses.Add(adb);
                    }

                    if (addresses.Count > 0)
                    {
                        db_layer.StoreAddresses(ch.address_helper, addresses);
                    }

                    if (city_admins.Count > 0)
                    {
                        db_layer.StoreCityAdmins(ch.city_admin_helper, city_admins);
                    }

                    if (city_nuts.Count > 0)
                    {
                        db_layer.StoreCityNUTS(ch.city_nuts_helper, city_nuts);
                    }
                }

                // now org object can be stored in database
                db_layer.StoreOrg(org);
              
            }
        }
    }
}
