using Dapper.Contrib.Extensions;
using System;
using System.Collections.Generic;
using System.Text;

namespace ror_data
{
    // class representing the json structure
    
    public class ror_org
    {
        public string id { get; set; }
        public string name { get; set; }
        public string status { get; set; }
        public int? established { get; set; }
        public string email_address { get; set; }
        public string wikipedia_url { get; set; }

        public country country { get; set; }
        public address[] addresses { get; set; }

        public string[] aliases { get; set; }
        public string[] acronyms { get; set; }
        public string[] ip_addresses { get; set; }

        public relationship[] relationships { get; set; }
        public external_ids external_ids { get; set; }
        public label_object[] labels { get; set; }

        public string[] links { get; set; }
        public string[] types { get; set; }
    }


    // with the necessary internal class types listed below

    public class country
    {
        public string country_code { get; set; }
        public string country_name { get; set; }
    }

    public class relationship
    {
        public string type { get; set; }
        public string id { get; set; }
        public string label { get; set; }
    }

    public class address
    {
        public float? lat { get; set; }
        public float? lng { get; set; }
        public int? country_geonames_id { get; set; }
        public string state { get; set; }
        public string state_code { get; set; }
        public string city { get; set; }
        public string postcode { get; set; }
        public string line { get; set; }
        public bool primary { get; set; }
        public geonames_city geonames_city { get; set; }
    }

    public class geonames_city
    {
        public int? id { get; set; }
        public string city { get; set; }
        public gadmin geonames_admin1 { get; set; }
        public gadmin geonames_admin2 { get; set; }
        public nuts nuts_level1 { get; set; }
        public nuts nuts_level2 { get; set; }
        public nuts nuts_level3 { get; set; }
        public lice license { get; set; }
    }

    public class gadmin
    {
        public int? id { get; set; }
        public string code { get; set; }
        public string ascii_name { get; set; }
        public string name { get; set; }
    }

    public class nuts
    {
        public string name { get; set; }
        public string code { get; set; }
    }

    public class lice
    {
        public string attribution { get; set; }
        public string license { get; set; }
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


    // classes below used to hold information extracted
    // from json file, passed to dDB layer for transfer
    // to the database

    [Table("ror.orgs")]
    public class ror_org_in_db
    {
        [ExplicitKey]
        public int id { get; set; }
        public string ror_id { get; set; }
        public string name { get; set; }
        public string status { get; set; }
        public int? established { get; set; }
        public string email_address { get; set; }
        public string wikipedia_url { get; set; }
        public string country_name { get; set; }
        public string country_code { get; set; }
    }


    public class alias_in_db
    {
        public int id { get; set; }
        public string ror_id { get; set; }
        public int seq_num { get; set; }
        public string alias { get; set; }

        public alias_in_db(int _n, string _ror_id, int _seq_num, string _alias)
        {
            id = _n;
            ror_id = _ror_id;
            seq_num = _seq_num;
            alias = _alias;
        }
    }


    public class acronym_in_db
    {
        public int id { get; set; }
        public string ror_id { get; set; }
        public int seq_num { get; set; }
        public string acronym { get; set; }

        public acronym_in_db(int _n, string _ror_id, int _seq_num, string _acronym)
        {
            id = _n;
            ror_id = _ror_id;
            seq_num = _seq_num;
            acronym = _acronym;
        }
    }


    public class link_in_db
    {
        public int id { get; set; }
        public string ror_id { get; set; }
        public int seq_num { get; set; }
        public string link { get; set; }

        public link_in_db(int _n, string _ror_id, int _seq_num, string _link)
        {
            id = _n;
            ror_id = _ror_id;
            seq_num = _seq_num;
            link = _link;
        }
    }


    public class type_in_db
    {
        public int id { get; set; }
        public string ror_id { get; set; }
        public string orgtype { get; set; }

        public type_in_db(int _n, string _ror_id, string _orgtype)
        {
            id = _n;
            ror_id = _ror_id;
            orgtype = _orgtype;
        }
    }


    public class ip_address_in_db
    {
        public int id { get; set; }
        public string ror_id { get; set; }
        public string ip_address { get; set; }

        public ip_address_in_db(int _n, string _ror_id, string _ip_address)
        {
            id = _n;
            ror_id = _ror_id;
            ip_address = _ip_address;
        }
    }


    public class label_in_db
    {
        public int id { get; set; }
        public string ror_id { get; set; }
        public int seq_num { get; set; }
        public string language { get; set; }
        public string value { get; set; }

        public label_in_db(int _n, string _ror_id, int _seq_num, 
                           string _language, string _value)
        {
            id = _n;
            ror_id = _ror_id;
            seq_num = _seq_num;
            language = _language;
            value = _value;
        }
    }


    public class relationship_in_db
    {
        public int id { get; set; }
        public string ror_id { get; set; }
        public string type { get; set; }
        public string target_ror_id { get; set; }
        public string target_label { get; set; }

        public relationship_in_db(int _n, string _ror_id, string _type, 
                                  string _target_ror_id, string _target_label)
        {
            id = _n;
            ror_id = _ror_id;
            type = _type;
            target_ror_id = _target_ror_id;
            target_label = _target_label;
        }
    }


    public class address_in_db
    {
        public int id { get; set; }
        public string ror_id { get; set; }
        public int add_id { get; set; }
        public float? lat { get; set; }
        public float? lng { get; set; }
        public int? geonames_country_id { get; set; }
        public string state { get; set; }
        public string state_code { get; set; }
        public int? geonames_city_id { get; set; }
        public string city { get; set; }
        public string postcode { get; set; }
        public string line { get; set; }
        public bool? add_primary { get; set; }

        public address_in_db(int _n, string _ror_id, int _add_id, float? _lat, float? _lng,
                             int? _geonames_country_id, string _state, string _state_code,
                             string _city, string _postcode,
                             string _line, bool _add_primary)
        {
            id = _n;
            ror_id = _ror_id;
            add_id = _add_id;
            lat = _lat;
            lng = _lng;
            geonames_country_id = _geonames_country_id;
            state = _state;
            state_code = _state_code;
            city = _city;
            postcode = _postcode;
            line = _line;
            add_primary = _add_primary;
        }
    }


    public class city_admin_in_db
    {
        public int id { get; set; }
        public string ror_id { get; set; }
        public int add_id { get; set; }
        public int? geonames_city_id { get; set; }
        public string city { get; set; }
        public int level { get; set; }
        public int? geonames_admin_id { get; set; }
        public string geonames_admin_code { get; set; }
        public string admin_name { get; set; }
        public string admin_ascii_name { get; set; }

        public city_admin_in_db(int _n, string _ror_id, int _add_id, int? _geonames_city_id, 
                                string _city, int _level, int? _geonames_admin_id,
                                string _geonames_admin_code, string _admin_name,
                                string _admin_ascii_name)
        {
            id = _n;
            ror_id = _ror_id;
            add_id = _add_id;
            geonames_city_id = _geonames_city_id;
            city = _city;
            level = _level;
            geonames_admin_id = _geonames_admin_id;
            geonames_admin_code = _geonames_admin_code;
            admin_name = _admin_name;
            admin_ascii_name = _admin_ascii_name;
        }
    }


    public class city_nuts_in_db
    {
        public int id { get; set; }
        public string ror_id { get; set; }
        public int add_id { get; set; }
        public int? geonames_city_id { get; set; }
        public string city { get; set; }
        public int level { get; set; }
        public string nuts_code { get; set; }
        public string nuts_name { get; set; }

        public city_nuts_in_db(int _n, string _ror_id, int _add_id, int? _geonames_city_id, 
                               string _city, int _level, string _nuts_code, 
                               string _nuts_name)
        {
            id = _n;
            ror_id = _ror_id;
            add_id = _add_id;
            geonames_city_id = _geonames_city_id;
            city = _city;
            level = _level;
            nuts_code = _nuts_code;
            nuts_name = _nuts_name;
        }
    }
      

    public class exid_in_db
    {
        public int id { get; set; }
        public string ror_id { get; set; }
        public string exidtype { get; set; }
        public string value { get; set; }
        public bool preferred { get; set; }

        public exid_in_db(int _n, string _ror_id, string _exidtype, string _value, bool _preferred)
        {
            id = _n;
            ror_id = _ror_id;
            exidtype = _exidtype;
            value = _value;
            preferred = _preferred;
        }
    }
}