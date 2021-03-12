using PostgreSQLCopyHelper;
using System;
using System.Collections.Generic;
using System.Text;

namespace ror_data
{
    public class OrgCopyHelpers
    {
        public PostgreSQLCopyHelper<ror_org_in_db> org_helper =
            new PostgreSQLCopyHelper<ror_org_in_db>("ror", "orgs")
                .MapInteger("id", x => x.id)
                .MapVarchar("ror_id", x => x.ror_id)
                .MapVarchar("name", x => x.name)
                .MapVarchar("status", x => x.status)
                .MapVarchar("wikipedia_url", x => x.wikipedia_url)
                .MapVarchar("country_name", x => x.country_name)
                .MapVarchar("country_code", x => x.country_code);

        public PostgreSQLCopyHelper<alias_in_db> alias_helper =
            new PostgreSQLCopyHelper<alias_in_db>("ror", "org_aliases")
                .MapInteger("id", x => x.id)
                .MapVarchar("alias", x => x.alias);

        public PostgreSQLCopyHelper<acronym_in_db> acronym_helper =
            new PostgreSQLCopyHelper<acronym_in_db>("ror", "org_acronyms")
                .MapInteger("id", x => x.id)
                .MapVarchar("acronym", x => x.acronym);

        public PostgreSQLCopyHelper<link_in_db> link_helper =
            new PostgreSQLCopyHelper<link_in_db>("ror", "org_links")
                .MapInteger("id", x => x.id)
                .MapVarchar("link", x => x.link);

        public PostgreSQLCopyHelper<type_in_db> type_helper =
            new PostgreSQLCopyHelper<type_in_db>("ror", "org_types")
                .MapInteger("id", x => x.id)
                .MapVarchar("orgtype", x => x.orgtype);

        public PostgreSQLCopyHelper<label_in_db> label_helper =
            new PostgreSQLCopyHelper<label_in_db>("ror", "org_labels")
                .MapInteger("id", x => x.id)
                .MapVarchar("labeltype", x => x.labeltype)
                .MapVarchar("value", x => x.value);

        public PostgreSQLCopyHelper<exid_in_db> extern_ids_helper =
            new PostgreSQLCopyHelper<exid_in_db>("ror", "org_extids")
                .MapInteger("id", x => x.id)
                .MapVarchar("exidtype", x => x.exidtype)
                .MapVarchar("value", x => x.value)
                .MapBoolean("preferred", x => x.preferred);

    }

}
