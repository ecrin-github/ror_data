using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.IO;
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
                org.name = ro.name;
                org.status = ro.status;
                org.established = ro.established;
                org.email_address = ro.email_address;
                org.wikipedia_url = ro.wikipedia_url;
                org.country_name = ro.country.country_name;
                org.country_code = ro.country.country_code;
                db_layer.StoreOrg(org);


                // Aliases
                if (ro.aliases != null && ro.aliases.Length > 0)
                {
                    List<alias_in_db> aliases = new List<alias_in_db>();
                    int seq_num = 0;
                    foreach(string s in ro.aliases)
                    {
                        seq_num++;
                        aliases.Add(new alias_in_db(n, rorid, seq_num, s));
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
                        seq_num++;
                        acronyms.Add(new acronym_in_db(n, rorid, seq_num, s));
                    }

                    db_layer.StoreAcronyms(ch.acronym_helper, acronyms);
                }


                // Links
                if (ro.links != null && ro.links.Length > 0)
                {
                    List<link_in_db> links = new List<link_in_db>();
                    int seq_num = 0;
                    foreach (string s in ro.links)
                    {
                        seq_num++;
                        links.Add(new link_in_db(n, rorid, seq_num, s));
                    }

                    db_layer.StoreLinks(ch.link_helper, links);
                }


                // Labels
                if (ro.labels != null && ro.labels.Length > 0)
                {
                    List<label_in_db> labels = new List<label_in_db>();
                    int seq_num = 0;
                    foreach (label_object lob in ro.labels)
                    {
                        seq_num++;
                        labels.Add(new label_in_db(n, rorid, seq_num, lob.iso639, lob.label)); 
                    }

                    db_layer.StoreLabels(ch.label_helper, labels);
                }


                // Types
                if (ro.types != null && ro.types.Length > 0)
                {
                    List<type_in_db> types = new List<type_in_db>();
                    foreach (string s in ro.types)
                    {
                        types.Add(new type_in_db(n, rorid, s));
                    }

                    db_layer.StoreTypes(ch.type_helper, types);
                }


                // IP addresses
                if (ro.ip_addresses != null && ro.ip_addresses.Length > 0)
                {
                    List<ip_address_in_db> ip_addresses = new List<ip_address_in_db>();
                    foreach (string s in ro.ip_addresses)
                    {
                        ip_addresses.Add(new ip_address_in_db(n, rorid, s));
                    }

                    db_layer.StoreIPAddresses(ch.ip_address_helper, ip_addresses);
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

                    int add_id = 0;
                    foreach (address a in ro.addresses)
                    {
                        add_id++;
                        address_in_db adb = new address_in_db(n, rorid, add_id, a.lat, a.lng,
                             a.country_geonames_id, a.state, a.state_code, a.city,
                             a.postcode, a.line, a.primary);

                        if (a.geonames_city != null)
                        {
                            geonames_city gc = a.geonames_city;
                            adb.geonames_city_id = gc.id;

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


                //External Ids
                if (ro.external_ids != null)
                {
                    external_ids exids = ro.external_ids;
                    List<exid_in_db> all_exids = new List<exid_in_db>();

                    if (exids.FundRef != null) {

                        List<exid_in_db> exids_in_db = new List<exid_in_db>();

                        if (exids.FundRef.all != null && exids.FundRef.all.Length > 0) {
                            foreach (string s in exids.FundRef.all)
                            {
                                exids_in_db.Add(new exid_in_db(n, rorid, "FundRef", s, false));
                            }
                        }

                        if (exids.FundRef.preferred != null && exids.FundRef.preferred != "null") {
                            foreach (exid_in_db exdb in exids_in_db)
                            {
                                if (exdb.value == exids.FundRef.preferred) {
                                    exdb.preferred = true;
                                    break;
                                }
                            }
                        }

                        all_exids.AddRange(exids_in_db);
                    }
                    

                    if (exids.OrgRef != null) {

                        List<exid_in_db> exids_in_db = new List<exid_in_db>();

                        if (exids.OrgRef.all != null && exids.OrgRef.all.Length > 0) {
                            foreach (string s in exids.OrgRef.all)
                            {
                                exids_in_db.Add(new exid_in_db(n, rorid, "OrgRef", s, false));
                            }
                        }

                        if (exids.OrgRef.preferred != null && exids.OrgRef.preferred != "null") {
                            foreach (exid_in_db exdb in exids_in_db)
                            {
                                if (exdb.value == exids.OrgRef.preferred) {
                                    exdb.preferred = true;
                                    break;
                                }
                            }
                        }

                        all_exids.AddRange(exids_in_db);
                    }


                    if (exids.ISNI != null) {

                        List<exid_in_db> exids_in_db = new List<exid_in_db>();

                        if (exids.ISNI.all != null && exids.ISNI.all.Length > 0) {
                            foreach (string s in exids.ISNI.all)
                            {
                                exids_in_db.Add(new exid_in_db(n, rorid, "ISNI", s, false));
                            }
                        }

                        if (exids.ISNI.preferred != null && exids.ISNI.preferred != "null") {
                            foreach (exid_in_db exdb in exids_in_db)
                            {
                                if (exdb.value == exids.ISNI.preferred) {
                                    exdb.preferred = true;
                                    break;
                                }
                            }
                        }

                        all_exids.AddRange(exids_in_db);
                    }


                    if (exids.GRID != null) {

                        List<exid_in_db> exids_in_db = new List<exid_in_db>();

                        if (exids.GRID.all != null) {
                            exids_in_db.Add(new exid_in_db(n, rorid, "GRID", exids.GRID.all, false));
                        }

                        if (exids.GRID.preferred != null && exids.GRID.preferred != "null") {
                            foreach (exid_in_db exdb in exids_in_db)
                            {
                                if (exdb.value == exids.GRID.preferred) {
                                    exdb.preferred = true;
                                    break;
                                }
                            }
                        }

                        all_exids.AddRange(exids_in_db);
                    }


                    if (exids.Wikidata != null) {

                        List<exid_in_db> exids_in_db = new List<exid_in_db>();

                        if (exids.Wikidata.all != null && exids.Wikidata.all.Length > 0) {
                            foreach (string s in exids.Wikidata.all)
                            {
                                exids_in_db.Add(new exid_in_db(n, rorid, "Wikidata", s, false));
                            }
                        }

                        if (exids.Wikidata.preferred != null && exids.Wikidata.preferred != "null") {
                            foreach (exid_in_db exdb in exids_in_db)
                            {
                                if (exdb.value == exids.Wikidata.preferred) {
                                    exdb.preferred = true;
                                    break;
                                }
                            }
                        }

                        all_exids.AddRange(exids_in_db);
                    }


                    if (exids.UCAS != null) {

                        List<exid_in_db> exids_in_db = new List<exid_in_db>();

                        if (exids.UCAS.all != null && exids.UCAS.all.Length > 0) {
                            foreach (string s in exids.UCAS.all)
                            {
                                exids_in_db.Add(new exid_in_db(n, rorid, "UCAS", s, false));
                            }
                        }

                        if (exids.UCAS.preferred != null && exids.UCAS.preferred != "null") {
                            foreach (exid_in_db exdb in exids_in_db)
                            {
                                if (exdb.value == exids.UCAS.preferred) {
                                    exdb.preferred = true;
                                    break;
                                }
                            }
                        }

                        all_exids.AddRange(exids_in_db);
                    }


                    if (exids.HESA != null) {

                        List<exid_in_db> exids_in_db = new List<exid_in_db>();

                        if (exids.HESA.all != null && exids.HESA.all.Length > 0) {
                            foreach (string s in exids.HESA.all)
                            {
                                exids_in_db.Add(new exid_in_db(n, rorid, "HESA", s, false));
                            }
                        }

                        if (exids.HESA.preferred != null && exids.HESA.preferred != "null") {
                            foreach (exid_in_db exdb in exids_in_db)
                            {
                                if (exdb.value == exids.HESA.preferred) {
                                    exdb.preferred = true;
                                    break;
                                }
                            }
                        }

                        all_exids.AddRange(exids_in_db);
                    }


                    if (exids.UKPRN != null) {

                        List<exid_in_db> exids_in_db = new List<exid_in_db>();

                        if (exids.UKPRN.all != null && exids.UKPRN.all.Length > 0) {
                            foreach (string s in exids.UKPRN.all)
                            {
                                exids_in_db.Add(new exid_in_db(n, rorid, "UKPRN", s, false));
                            }
                        }

                        if (exids.UKPRN.preferred != null && exids.UKPRN.preferred != "null") {
                            foreach (exid_in_db exdb in exids_in_db)
                            {
                                if (exdb.value == exids.UKPRN.preferred) {
                                    exdb.preferred = true;
                                    break;
                                }
                            }
                        }

                        all_exids.AddRange(exids_in_db);
                    }


                    db_layer.StoreExternalIds(ch.extern_ids_helper, all_exids);

                }
            }
        }
    }
}
