using PostgreSQLCopyHelper;
using System;
using System.Collections.Generic;
using System.Text;

namespace ror_data
{
    public class OrgCopyHelpers
    {

        public PostgreSQLCopyHelper<alias_in_db> alias_helper =
            new PostgreSQLCopyHelper<alias_in_db>("ror", "org_aliases")
                .MapInteger("id", x => x.id)
                .MapVarchar("ror_id", x => x.ror_id)
                .MapInteger("seq_num", x => x.seq_num)
                .MapVarchar("alias", x => x.alias);

        public PostgreSQLCopyHelper<acronym_in_db> acronym_helper =
            new PostgreSQLCopyHelper<acronym_in_db>("ror", "org_acronyms")
                .MapInteger("id", x => x.id)
                .MapVarchar("ror_id", x => x.ror_id)
                .MapInteger("seq_num", x => x.seq_num)
                .MapVarchar("acronym", x => x.acronym);

        public PostgreSQLCopyHelper<link_in_db> link_helper =
            new PostgreSQLCopyHelper<link_in_db>("ror", "org_links")
                .MapInteger("id", x => x.id)
                .MapVarchar("ror_id", x => x.ror_id)
                .MapInteger("seq_num", x => x.seq_num)
                .MapVarchar("link", x => x.link);

        public PostgreSQLCopyHelper<type_in_db> type_helper =
            new PostgreSQLCopyHelper<type_in_db>("ror", "org_types")
                .MapInteger("id", x => x.id)
                .MapVarchar("ror_id", x => x.ror_id)
                .MapVarchar("orgtype", x => x.orgtype);

        public PostgreSQLCopyHelper<ip_address_in_db> ip_address_helper =
            new PostgreSQLCopyHelper<ip_address_in_db>("ror", "org_ip_addresses")
                .MapInteger("id", x => x.id)
                .MapVarchar("ror_id", x => x.ror_id)
                .MapVarchar("ip_address", x => x.ip_address);

        public PostgreSQLCopyHelper<label_in_db> label_helper =
            new PostgreSQLCopyHelper<label_in_db>("ror", "org_labels")
                .MapInteger("id", x => x.id)
                .MapVarchar("ror_id", x => x.ror_id)
                .MapInteger("seq_num", x => x.seq_num)
                .MapVarchar("language", x => x.language)
                .MapVarchar("value", x => x.value);

        public PostgreSQLCopyHelper<exid_in_db> extern_ids_helper =
            new PostgreSQLCopyHelper<exid_in_db>("ror", "org_extids")
                .MapInteger("id", x => x.id)
                .MapVarchar("ror_id", x => x.ror_id)
                .MapVarchar("exidtype", x => x.exidtype)
                .MapVarchar("value", x => x.value)
                .MapBoolean("preferred", x => x.preferred);

        public PostgreSQLCopyHelper<relationship_in_db> relationship_helper =
            new PostgreSQLCopyHelper<relationship_in_db>("ror", "org_relationships")
                .MapInteger("id", x => x.id)
                .MapVarchar("ror_id", x => x.ror_id)
                .MapVarchar("type", x => x.type)
                .MapVarchar("target_ror_id", x => x.target_ror_id)
                .MapVarchar("target_label", x => x.target_label);

        public PostgreSQLCopyHelper<address_in_db> address_helper =
            new PostgreSQLCopyHelper<address_in_db>("ror", "org_addresses")
                .MapInteger("id", x => x.id)
                .MapVarchar("ror_id", x => x.ror_id)
                .MapInteger("add_id", x => x.add_id)
                .MapDouble("lat", x => x.lat)
                .MapDouble("lng", x => x.lng)
                .MapInteger("geonames_country_id", x => x.geonames_country_id)
                .MapVarchar("state", x => x.state)
                .MapVarchar("state_code", x => x.state_code)
                .MapInteger("geonames_city_id", x => x.geonames_city_id)
                .MapVarchar("city", x => x.city)
                .MapVarchar("postcode", x => x.postcode)
                .MapVarchar("line", x => x.line)
                .MapBoolean("add_primary", x => x.add_primary);

        public PostgreSQLCopyHelper<city_admin_in_db> city_admin_helper =
            new PostgreSQLCopyHelper<city_admin_in_db>("ror", "org_city_admins")
                .MapInteger("id", x => x.id)
                .MapVarchar("ror_id", x => x.ror_id)
                .MapInteger("add_id", x => x.add_id)
                .MapInteger("geonames_city_id", x => x.geonames_city_id)
                .MapVarchar("city", x => x.city)
                .MapInteger("level", x => x.level)
                .MapInteger("geonames_admin_id", x => x.geonames_admin_id)
                .MapVarchar("geonames_admin_code", x => x.geonames_admin_code)
                .MapVarchar("admin_name", x => x.admin_name)
                .MapVarchar("admin_ascii_name", x => x.admin_ascii_name);

        public PostgreSQLCopyHelper<city_nuts_in_db> city_nuts_helper =
            new PostgreSQLCopyHelper<city_nuts_in_db>("ror", "org_city_nuts")
                .MapInteger("id", x => x.id)
                .MapVarchar("ror_id", x => x.ror_id)
                .MapInteger("add_id", x => x.add_id)
                .MapInteger("geonames_city_id", x => x.geonames_city_id)
                .MapVarchar("city", x => x.city)
                .MapInteger("level", x => x.level)
                .MapVarchar("nuts_code", x => x.nuts_code)
                .MapVarchar("nuts_name", x => x.nuts_name);

    }

}
