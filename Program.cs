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
            // set up data link
            DataLayer db_layer = new DataLayer();

            // set up data tables
            table_creator creator = new table_creator(db_layer.ConnString);
            creator.create_orgs();
            creator.create_org_acronyms();
            creator.create_org_aliases();
            creator.create_org_extids();
            creator.create_org_labels();
            creator.create_org_links();
            creator.create_org_types();

            // read in the json file 
            // consists of an array of non-named objects, each equivalent to the ror_org class
            string file_location = @"D:\OneDrive\ECRIN\MDR Metadata scheme\ROR data\ror.json";
            string jsonString = File.ReadAllText(file_location);

            ror_org[] rordata = JsonSerializer.Deserialize<ror_org[]>(jsonString);
            OrgCopyHelpers ch = new OrgCopyHelpers();

            // use the data model to read it
            // as a serialised object
            int n = 100000;
            foreach (ror_org ro in rordata)
            {
                n++;
                if (n % 100 == 0 ) Console.WriteLine(n.ToString() + " records processed");
                // go through each object found

                List<ror_org_in_db> orgs = new List<ror_org_in_db>();
                ror_org_in_db rodb = new ror_org_in_db();
                rodb.id = n;
                rodb.ror_id = ro.id;
                rodb.name = ro.name;
                rodb.status = ro.status;
                rodb.wikipedia_url = ro.wikipedia_url;
                rodb.country_name = ro.country.country_name;
                rodb.country_code = ro.country.country_code;
                orgs.Add(rodb);
                db_layer.StoreOrg(ch.org_helper, orgs);


                // org aliases
                List<alias_in_db> aliases = new List<alias_in_db>();
                if (ro.aliases != null && ro.aliases.Length > 0)
                {
                    foreach(string s in ro.aliases)
                    {
                        aliases.Add(new alias_in_db(n, s));
                    }

                    db_layer.StoreAliases(ch.alias_helper, aliases);
                }


                // org acronyms
                List<acronym_in_db> acronyms = new List<acronym_in_db>();
                if (ro.acronyms != null && ro.acronyms.Length > 0)
                {
                    foreach (string s in ro.acronyms)
                    {
                        acronyms.Add(new acronym_in_db(n, s));
                    }

                    db_layer.StoreAcronyms(ch.acronym_helper, acronyms);
                }


                // links
                List<link_in_db> links = new List<link_in_db>();
                if (ro.links != null && ro.links.Length > 0)
                {
                    foreach (string s in ro.links)
                    {
                        links.Add(new link_in_db(n, s));
                    }

                    db_layer.StoreLinks(ch.link_helper, links);
                }


                // types
                List<type_in_db> types = new List<type_in_db>();
                if (ro.types != null && ro.types.Length > 0)
                {
                    foreach (string s in ro.types)
                    {
                        types.Add(new type_in_db(n, s));
                    }

                    db_layer.StoreTypes(ch.type_helper, types);
                }


                // labels
                List<label_in_db> labels = new List<label_in_db>();
                if (ro.labels != null && ro.labels.Length > 0)
                {
                    foreach (label_object lob in ro.labels)
                    {
                        if (lob.iso639 != null)
                        {
                            labels.Add(new label_in_db(n, "iso369", lob.iso639));
                        }
                        if (lob.label != null)
                        {
                            labels.Add(new label_in_db(n, "label", lob.label));
                        }
                    }

                    db_layer.StoreLabels(ch.label_helper, labels);
                }


                if (ro.external_ids != null)
                {
                    external_ids exids = ro.external_ids;
                    List<exid_in_db> all_exids = new List<exid_in_db>();


                    if (exids.FundRef != null)
                    {
                        List<exid_in_db> exids_in_db = new List<exid_in_db>();
                        if (exids.FundRef.all != null && exids.FundRef.all.Length > 0)
                        {
                            foreach (string s in exids.FundRef.all)
                            {
                                exids_in_db.Add(new exid_in_db(n, "FundRef", s, false));
                            }
                        }
                        if (exids.FundRef.preferred != null && exids.FundRef.preferred != "null")
                        {
                            foreach (exid_in_db exdb in exids_in_db)
                            {
                                if (exdb.value == exids.FundRef.preferred)
                                {
                                    exdb.preferred = true;
                                    break;
                                }
                            }
                        }
                        all_exids.AddRange(exids_in_db);
                    }


                    if (exids.OrgRef != null)
                    {
                        List<exid_in_db> exids_in_db = new List<exid_in_db>();
                        if (exids.OrgRef.all != null && exids.OrgRef.all.Length > 0)
                        {
                            foreach (string s in exids.OrgRef.all)
                            {
                                exids_in_db.Add(new exid_in_db(n, "OrgRef", s, false));
                            }
                        }
                        if (exids.OrgRef.preferred != null && exids.OrgRef.preferred != "null")
                        {
                            foreach (exid_in_db exdb in exids_in_db)
                            {
                                if (exdb.value == exids.OrgRef.preferred)
                                {
                                    exdb.preferred = true;
                                    break;
                                }
                            }
                        }
                        all_exids.AddRange(exids_in_db);
                    }


                    if (exids.ISNI != null)
                    {
                        List<exid_in_db> exids_in_db = new List<exid_in_db>();
                        if (exids.ISNI.all != null && exids.ISNI.all.Length > 0)
                        {
                            foreach (string s in exids.ISNI.all)
                            {
                                exids_in_db.Add(new exid_in_db(n, "ISNI", s, false));
                            }
                        }
                        if (exids.ISNI.preferred != null && exids.ISNI.preferred != "null")
                        {
                            foreach (exid_in_db exdb in exids_in_db)
                            {
                                if (exdb.value == exids.ISNI.preferred)
                                {
                                    exdb.preferred = true;
                                    break;
                                }
                            }
                        }
                        all_exids.AddRange(exids_in_db);
                    }


                    if (exids.GRID != null)
                    {
                        List<exid_in_db> exids_in_db = new List<exid_in_db>();
                        if (exids.GRID.all != null)
                        {
                            exids_in_db.Add(new exid_in_db(n, "GRID", exids.GRID.all, false));
                        }
                        if (exids.GRID.preferred != null && exids.GRID.preferred != "null")
                        {
                            foreach (exid_in_db exdb in exids_in_db)
                            {
                                if (exdb.value == exids.GRID.preferred)
                                {
                                    exdb.preferred = true;
                                    break;
                                }
                            }
                        }
                        all_exids.AddRange(exids_in_db);
                    }


                    if (exids.Wikidata != null)
                    {
                        List<exid_in_db> exids_in_db = new List<exid_in_db>();
                        if (exids.Wikidata.all != null && exids.Wikidata.all.Length > 0)
                        {
                            foreach (string s in exids.Wikidata.all)
                            {
                                exids_in_db.Add(new exid_in_db(n, "Wikidata", s, false));
                            }
                        }
                        if (exids.Wikidata.preferred != null && exids.Wikidata.preferred != "null")
                        {
                            foreach (exid_in_db exdb in exids_in_db)
                            {
                                if (exdb.value == exids.Wikidata.preferred)
                                {
                                    exdb.preferred = true;
                                    break;
                                }
                            }
                        }
                        all_exids.AddRange(exids_in_db);
                    }


                    if (exids.UCAS != null)
                    {
                        List<exid_in_db> exids_in_db = new List<exid_in_db>();
                        if (exids.UCAS.all != null && exids.UCAS.all.Length > 0)
                        {
                            foreach (string s in exids.UCAS.all)
                            {
                                exids_in_db.Add(new exid_in_db(n, "UCAS", s, false));
                            }
                        }
                        if (exids.UCAS.preferred != null && exids.UCAS.preferred != "null")
                        {
                            foreach (exid_in_db exdb in exids_in_db)
                            {
                                if (exdb.value == exids.UCAS.preferred)
                                {
                                    exdb.preferred = true;
                                    break;
                                }
                            }
                        }
                        all_exids.AddRange(exids_in_db);
                    }


                    if (exids.HESA != null)
                    {
                        List<exid_in_db> exids_in_db = new List<exid_in_db>();
                        if (exids.HESA.all != null && exids.HESA.all.Length > 0)
                        {
                            foreach (string s in exids.HESA.all)
                            {
                                exids_in_db.Add(new exid_in_db(n, "HESA", s, false));
                            }
                        }
                        if (exids.HESA.preferred != null && exids.HESA.preferred != "null")
                        {
                            foreach (exid_in_db exdb in exids_in_db)
                            {
                                if (exdb.value == exids.HESA.preferred)
                                {
                                    exdb.preferred = true;
                                    break;
                                }
                            }
                        }
                        all_exids.AddRange(exids_in_db);
                    }


                    if (exids.UKPRN != null)
                    {
                        List<exid_in_db> exids_in_db = new List<exid_in_db>();
                        if (exids.UKPRN.all != null && exids.UKPRN.all.Length > 0)
                        {
                            foreach (string s in exids.UKPRN.all)
                            {
                                exids_in_db.Add(new exid_in_db(n, "UKPRN", s, false));
                            }
                        }
                        if (exids.UKPRN.preferred != null && exids.UKPRN.preferred != "null")
                        {
                            foreach (exid_in_db exdb in exids_in_db)
                            {
                                if (exdb.value == exids.UKPRN.preferred)
                                {
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
