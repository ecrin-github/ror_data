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

        public void create_orgs()
        {
            string sql_string = @"drop table if exists ror.orgs; 
                create table ror.orgs (
                    id                     INT
                  , ror_id                 VARCHAR
                  , name                   VARCHAR
                  , status                 VARCHAR
                  , country_name           VARCHAR
                  , country_code           VARCHAR
                  , wikipedia_url          VARCHAR
                );";

            using (var conn = new NpgsqlConnection(db_conn))
            {
                conn.Execute(sql_string);
            }
        }


        public void create_org_extids()
        {
            string sql_string = @"drop table if exists ror.org_extids; 
                create table ror.org_extids (
                    id                     INT
                  , exidtype               VARCHAR
                  , value                  VARCHAR
                  , preferred              BOOLEAN
                );";

            using (var conn = new NpgsqlConnection(db_conn))
            {
                conn.Execute(sql_string);
            }
        }


        public void create_org_aliases()
        {
            string sql_string = @"drop table if exists ror.org_aliases; 
                create table ror.org_aliases (
                    id                     INT
                  , alias                  VARCHAR
                );"; 
            
            using (var conn = new NpgsqlConnection(db_conn))
            {
                conn.Execute(sql_string);
            }
        }
                

        public void create_org_acronyms()
        {
            string sql_string = @"drop table if exists ror.org_acronyms; 
                create table ror.org_acronyms (
                    id                     INT
                  , acronym                VARCHAR
                );";

            using (var conn = new NpgsqlConnection(db_conn))
            {
                conn.Execute(sql_string);
            }
        }


        public void create_org_labels()
        {
            string sql_string = @"drop table if exists ror.org_labels; 
                create table ror.org_labels (
                    id                     INT
                  , labeltype              VARCHAR
                  , value                  VARCHAR
                );";

            using (var conn = new NpgsqlConnection(db_conn))
            {
                conn.Execute(sql_string);
            }
        }


        public void create_org_links()
        {
            string sql_string = @"drop table if exists ror.org_links; 
                create table ror.org_links (
                    id                     INT
                  , link                   VARCHAR
                );";

            using (var conn = new NpgsqlConnection(db_conn))
            {
                conn.Execute(sql_string);
            }
        }


        public void create_org_types()
        {
            string sql_string = @"drop table if exists ror.org_types; 
                create table ror.org_types (
                    id                     INT
                  , orgtype                VARCHAR
                );";

            using (var conn = new NpgsqlConnection(db_conn))
            {
                conn.Execute(sql_string);
            }
        }

    }
}
