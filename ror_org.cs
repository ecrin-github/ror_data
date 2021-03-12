using System;
using System.Collections.Generic;
using System.Text;

namespace ror_data
{
    public class ror_org
    {
        public string id { get; set; }
        public string status { get; set; }
        public string name { get; set; }

        public string[] aliases { get; set; }
        public string[] acronyms { get; set; }
        public string wikipedia_url { get; set; }

        public external_ids external_ids { get; set; }
        public country country { get; set; }

        public label_object[] labels { get; set; }
        public string[] links { get; set; }
        public string[] types { get; set; }
    }

    public class country
    {
        public string country_name { get; set; }
        public string country_code { get; set; }
    }


    public class external_ids
    {
        public external_ref FundRef { get; set; }
        public external_ref OrgRef { get; set; }
        public external_ref ISNI { get; set; }
        public grid_ref GRID { get; set; }
        public external_ref Wikidata { get; set; }
        public external_ref UCAS { get; set; }
        public external_ref HESA { get; set; }
        public external_ref UKPRN { get; set; }
    }


    public class external_ref
    {
        public string[] all { get; set; }
        public string preferred { get; set; }
    }

    public class grid_ref
    {
        public string all { get; set; }
        public string preferred { get; set; }
    }

    public class label_object
    {
        public string iso639 { get; set; }
        public string label { get; set; }
    }

    public class ror_org_in_db
    {
        public int id { get; set; }
        public string ror_id { get; set; }
        public string status { get; set; }
        public string name { get; set; }
        public string wikipedia_url { get; set; }
        public string country_name { get; set; }
        public string country_code { get; set; }
    }

    public class alias_in_db
    {
        public int id { get; set; }
        public string alias { get; set; }

        public alias_in_db(int _n, string _alias)
        {
            id = _n;
            alias = _alias;
        }
    }

    public class acronym_in_db
    {
        public int id { get; set; }
        public string acronym { get; set; }

        public acronym_in_db(int _n, string _acronym)
        {
            id = _n;
            acronym = _acronym;
        }
    }

    public class link_in_db
    {
        public int id { get; set; }
        public string link { get; set; }

        public link_in_db(int _n, string _link)
        {
            id = _n;
            link = _link;
        }
    }

    public class type_in_db
    {
        public int id { get; set; }
        public string orgtype { get; set; }

        public type_in_db(int _n, string _orgtype)
        {
            id = _n;
            orgtype = _orgtype;
        }
    }


    public class label_in_db
    {
        public int id { get; set; }
        public string labeltype { get; set; }
        public string value { get; set; }

        public label_in_db(int _n, string _labeltype, string _value)
        {
            id = _n;
            labeltype = _labeltype;
            value = _value;
        }
    }


    public class exid_in_db
    {
        public int id { get; set; }
        public string exidtype { get; set; }
        public string value { get; set; }
        public bool preferred { get; set; }

        public exid_in_db(int _n, string _exidtype, string _value, bool _preferred)
        {
            id = _n;
            exidtype = _exidtype;
            value = _value;
            preferred = _preferred;
        }
    }
}