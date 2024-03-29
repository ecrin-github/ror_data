﻿using Dapper.Contrib.Extensions;
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
        private string json_path;

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
            builder.Database = settings["database"]; ;

            connString = builder.ConnectionString;

            json_path = settings["jsonpath"];
        }

        public string ConnString => connString;
        public string jsonPath => json_path;


        public ulong StoreOrgs(PostgreSQLCopyHelper<ror_org_in_db> copyHelper, IEnumerable<ror_org_in_db> entities)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                return copyHelper.SaveAll(conn, entities);
            }
        }


        public void StoreOrg(ror_org_in_db org)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Insert<ror_org_in_db>(org);
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


        public ulong StoreRelationships(PostgreSQLCopyHelper<relationship_in_db> copyHelper, IEnumerable<relationship_in_db> entities)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                return copyHelper.SaveAll(conn, entities);
            }
        }


        public ulong StoreAddresses(PostgreSQLCopyHelper<address_in_db> copyHelper, IEnumerable<address_in_db> entities)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                return copyHelper.SaveAll(conn, entities);
            }
        }


        public ulong StoreCityAdmins(PostgreSQLCopyHelper<city_admin_in_db> copyHelper, IEnumerable<city_admin_in_db> entities)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                return copyHelper.SaveAll(conn, entities);
            }
        }



        public ulong StoreCityNUTS(PostgreSQLCopyHelper<city_nuts_in_db> copyHelper, IEnumerable<city_nuts_in_db> entities)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                return copyHelper.SaveAll(conn, entities);
            }
        }

    }
}

