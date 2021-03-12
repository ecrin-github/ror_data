using Dapper.Contrib.Extensions;
using Microsoft.Extensions.Configuration;
using Npgsql;
using PostgreSQLCopyHelper;
using System;
using System.Collections.Generic;

namespace ror_data
{

    public class DataLayer
    {
        private string connString;

        public DataLayer()
        {
            IConfigurationRoot settings = new ConfigurationBuilder()
            .SetBasePath(AppContext.BaseDirectory)
            .AddJsonFile("appsettings.json")
            .Build();

            NpgsqlConnectionStringBuilder builder = new NpgsqlConnectionStringBuilder();
            builder.Host = settings["host"];
            builder.Username = settings["user"];
            builder.Password = settings["password"];
            builder.Database = "ror";

            connString = builder.ConnectionString;
        }

        public string ConnString => connString;


        public ulong StoreOrg(PostgreSQLCopyHelper<ror_org_in_db> copyHelper, IEnumerable<ror_org_in_db> entities)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                return copyHelper.SaveAll(conn, entities);
            }
        }


        public ulong StoreAliases(PostgreSQLCopyHelper<alias_in_db> copyHelper, IEnumerable<alias_in_db> entities)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                return copyHelper.SaveAll(conn, entities);
            }
        }


        public ulong StoreAcronyms(PostgreSQLCopyHelper<acronym_in_db> copyHelper, IEnumerable<acronym_in_db> entities)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                return copyHelper.SaveAll(conn, entities);
            }
        }


        public ulong StoreLinks(PostgreSQLCopyHelper<link_in_db> copyHelper, IEnumerable<link_in_db> entities)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                return copyHelper.SaveAll(conn, entities);
            }
        }


        public ulong StoreTypes(PostgreSQLCopyHelper<type_in_db> copyHelper, IEnumerable<type_in_db> entities)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                return copyHelper.SaveAll(conn, entities);
            }
        }

        public ulong StoreLabels(PostgreSQLCopyHelper<label_in_db> copyHelper, IEnumerable<label_in_db> entities)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                return copyHelper.SaveAll(conn, entities);
            }
        }


        public ulong StoreExternalIds(PostgreSQLCopyHelper<exid_in_db> copyHelper, IEnumerable<exid_in_db> entities)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                return copyHelper.SaveAll(conn, entities);
            }
        }

    }
}

