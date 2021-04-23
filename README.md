# ror_data
Downloads ROR dataset and loads to Postgres tables

A very 'quick and dirty' C# console program that takes the large json file published by ROR, deserialises it into organisation objects, and then splits the data in those objects into PostgreSQL tables. Tables are created for the organisations ('orgs', with id, name, year established, country etc.), and then organisation aliases, acronyms, addresses,  geonamesand NUTS location details, relationships, types, labels and external ids.

N.B. The program expects to find a file in the project folder called appsettings.json, not in the github repository, which should include 4 settings, three for the database connection string ("host", "user", "password") and a fourth with the path of the source json file ("jsonpath").

Dependencies:
The program is written in .net core. 
It uses the nuget packages Dapper, Dapper.Contrib and Npgsql for connection to the db, Microsoft.Extensions.Configuration and Microsoft.Extensions.Configuration.Json for reading the json settings file, and PostgresSQLCopyHelper for transferring lists of objects to the database. 
