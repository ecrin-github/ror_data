using Dapper;
using Npgsql;

namespace ror_data
{
    class table_creator
    {
        string db_conn;

        public table_creator(string _db_conn)
        {
            db_conn = _db_conn;
        }


        public void create_tables()
        {
            create_orgs();
            create_org_extids();
            create_org_relationships();
            create_org_addresses();
            create_org_city_admins();
            create_org_city_nuts();
            create_org_acronyms();
            create_org_aliases();
            create_org_labels();
            create_org_links();
            create_org_types();
            create_org_ip_addresses(); 
        }


        private void execute_sql(string sql_string)
        {
            using (var conn = new NpgsqlConnection(db_conn))
            {
                conn.Execute(sql_string);
            }
        }


        private void create_orgs()
        {
            string sql_string = @"DROP TABLE IF EXISTS ror.orgs; 
                CREATE TABLE ror.orgs (
                    id                     INT
                  , ror_id                 VARCHAR
                  , name                   VARCHAR
                  , status                 VARCHAR
                  , established            INT
                  , country_name           VARCHAR
                  , country_code           VARCHAR
                  , email_address          VARCHAR
                  , wikipedia_url          VARCHAR
                );
                CREATE INDEX orgs_id ON ror.orgs(id);
                CREATE INDEX orgs_ror_id ON ror.orgs(ror_id);";
            execute_sql(sql_string);
        }

        private void create_org_aliases()
        {
            string sql_string = @"DROP TABLE IF EXISTS ror.org_aliases; 
                 CREATE TABLE ror.org_aliases (
                    id                     INT
                  , ror_id                 VARCHAR
                  , seq_num                INT
                  , alias                  VARCHAR
                );
                CREATE INDEX org_aliases_id ON ror.org_aliases(id);
                CREATE INDEX org_aliases_ror_id ON ror.org_aliases(ror_id);";
            execute_sql(sql_string);
        }


        private void create_org_acronyms()
        {
            string sql_string = @"DROP TABLE IF EXISTS ror.org_acronyms; 
                 CREATE TABLE ror.org_acronyms (
                    id                     INT
                  , ror_id                 VARCHAR
                  , seq_num                INT
                  , acronym                VARCHAR
                );
                CREATE INDEX org_acronyms_id ON ror.org_acronyms(id);
                CREATE INDEX org_acronyms_ror_id ON ror.org_acronyms(ror_id);";
            execute_sql(sql_string);
        }


        private void create_org_labels()
        {
            string sql_string = @"DROP TABLE IF EXISTS ror.org_labels; 
                 CREATE TABLE ror.org_labels (
                    id                     INT
                  , ror_id                 VARCHAR
                  , seq_num                INT
                  , language               VARCHAR
                  , value                  VARCHAR
                );
                CREATE INDEX org_labels_id ON ror.org_labels(id);
                CREATE INDEX org_labels_ror_id ON ror.org_labels(ror_id);";
            execute_sql(sql_string);
        }


        private void create_org_links()
        {
            string sql_string = @"DROP TABLE IF EXISTS ror.org_links; 
                 CREATE TABLE ror.org_links (
                    id                     INT
                  , seq_num                INT
                  , ror_id                 VARCHAR
                  , link                   VARCHAR
                );
                CREATE INDEX org_links_id ON ror.org_links(id);
                CREATE INDEX org_links_ror_id ON ror.org_links(ror_id);";
            execute_sql(sql_string);
        }


        private void create_org_types()
        {
            string sql_string = @"DROP TABLE IF EXISTS ror.org_types; 
                 CREATE TABLE ror.org_types (
                    id                     INT
                  , ror_id                 VARCHAR
                  , orgtype                VARCHAR
                );
                CREATE INDEX org_types_id ON ror.org_types(id);
                CREATE INDEX org_types_ror_id ON ror.org_types(ror_id);";
            execute_sql(sql_string);
        }


        private void create_org_ip_addresses()
        {
            string sql_string = @"DROP TABLE IF EXISTS ror.org_ip_addresses; 
                 CREATE TABLE ror.org_ip_addresses (
                    id                     INT
                  , ror_id                 VARCHAR
                  , ip_address             VARCHAR
                );
                CREATE INDEX org_ip_addresses_id ON ror.org_ip_addresses(id);
                CREATE INDEX org_ip_addresses_ror_id ON ror.org_ip_addresses(ror_id);";
            execute_sql(sql_string);
        }


        private void create_org_extids()
        {
            string sql_string = @"DROP TABLE IF EXISTS ror.org_extids; 
                 CREATE TABLE ror.org_extids (
                    id                     INT
                  , ror_id                 VARCHAR
                  , exidtype               VARCHAR
                  , value                  VARCHAR
                  , preferred              BOOLEAN
                );
                CREATE INDEX org_extids_id ON ror.org_extids(id);
                CREATE INDEX org_extids_ror_id ON ror.org_extids(ror_id);";
            execute_sql(sql_string);
        }


        private void create_org_relationships()
        {
            string sql_string = @"DROP TABLE IF EXISTS ror.org_relationships; 
                 CREATE TABLE ror.org_relationships (
                    id                     INT
                  , ror_id                 VARCHAR
                  , type                   VARCHAR
                  , target_ror_id          VARCHAR
                  , target_label           VARCHAR
                );
                CREATE INDEX org_relationships_id ON ror.org_relationships(id);
                CREATE INDEX org_relationships_ror_id ON ror.org_relationships(ror_id);";
            execute_sql(sql_string);
        }


        private void create_org_addresses()
        {
            string sql_string = @"DROP TABLE IF EXISTS ror.org_addresses; 
                 CREATE TABLE ror.org_addresses (
                    id                     INT
                  , ror_id                 VARCHAR
                  , add_id                 INT
                  , lat                    FLOAT
                  , lng                    FLOAT
                  , geonames_country_id    INT
                  , state                  VARCHAR
                  , state_code             VARCHAR
                  , geonames_city_id       INT
                  , city                   VARCHAR
                  , postcode               VARCHAR
                  , line                   VARCHAR
                  , add_primary            BOOLEAN
                );
                CREATE INDEX org_addresses_id ON ror.org_addresses(id);
                CREATE INDEX org_addresses_ror_id ON ror.org_addresses(ror_id);";
            execute_sql(sql_string);
        }


        private void create_org_city_admins()
        {
            string sql_string = @"DROP TABLE IF EXISTS ror.org_city_admins; 
                 CREATE TABLE ror.org_city_admins (
                    id                     INT
                  , ror_id                 VARCHAR
                  , add_id                 INT
                  , geonames_city_id       INT
                  , city                   VARCHAR
                  , level                  INT
                  , geonames_admin_id      INT
                  , geonames_admin_code    VARCHAR
                  , admin_name             VARCHAR
                  , admin_ascii_name       VARCHAR
                );
                CREATE INDEX org_city_admins_id ON ror.org_city_admins(id);
                CREATE INDEX org_city_admins_ror_id ON ror.org_city_admins(ror_id);";
            execute_sql(sql_string);
        }


        private void create_org_city_nuts()
        {
            string sql_string = @"DROP TABLE IF EXISTS ror.org_city_nuts; 
                 CREATE TABLE ror.org_city_nuts (
                    id                     INT
                  , ror_id                 VARCHAR
                  , add_id                 INT
                  , geonames_city_id       INT
                  , city                   VARCHAR
                  , level                  INT
                  , nuts_code              VARCHAR
                  , nuts_name              VARCHAR
                );
                CREATE INDEX org_city_nuts_id ON ror.org_city_nuts(id);
                CREATE INDEX org_city_nuts_ror_id ON ror.org_city_nuts(ror_id);";
            execute_sql(sql_string);
        }

    }
}
