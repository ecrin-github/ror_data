# ror_data
Downloads ROR dataset and loads to Postgres tables

A very 'quick and dirty' C# console program that takes the large json file published by ROR, deserialises it into organisation objects, and then splits the data in those objects into PostgreSQL tables. Tables are created for the organisations ('orgs', with id, name, year established, country etc.), and then organisation aliases, acronyms, addresses,  geonamesand NUTS location details, relationships, types, labels and external ids.

**Dependencies:**<br/>
The program is written in .net core. <br/>
It uses the nuget packages Dapper, Dapper.Contrib and Npgsql for connection to the db, Microsoft.Extensions.Configuration and Microsoft.Extensions.Configuration.Json for reading the json settings file, and PostgresSQLCopyHelper for transferring lists of objects to the database. <br/>
N.B. The program expects to find a file in the project folder called appsettings.json, not in the github repository, which should include 5 settings, four for the database connection string ("host", "user", "password", and "database") and a fourth with the path of the source json file ("jsonpath").<br/>
It also expects the database to have a schema called 'ror'.<br/>

**Operation:**<br/>
a) The program first drops and recreates all tables <br/>
b) It loads and reads the entire json file<br/>
c) It deserialises the fle into an array of ror_org objects<br/>
d) Each ror_org object is considered in turn, with the various data elements being restructured to match the target database records and then sent to the database for storage.<br/>
e) Records in all tables retain the ROR id of their source organisation, but they also include an integer id added by the program.<br/>
f) In some cases sequence numbers are added to repeating data elements, to aid in any subsequent deduplication.
g) Geonames and NUTS location data is included in the database only when non null.
