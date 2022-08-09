# ror_data
Downloads ROR dataset and loads to Postgres tables

A 'quick and dirty' C# console program that takes the large json file published by ROR, deserialises it into organisation objects, and then splits the data in those objects into PostgreSQL tables. <br/>
Tables are created for the organisations ('orgs', with id, name, year established, country etc.), and then organisation aliases, acronyms, addresses, GeoNames and NUTS location details, relationships, types, and labels.<br/>
For easier matching with names in a target system organisation names, aliases, labels and acronyms are also aggregated and deduplicated into a single table.<br/><br/>

**Dependencies:**<br/>
The program is written in .net core. <br/>
It uses the nuget packages Dapper, Dapper.Contrib and Npgsql for connection to the db, Microsoft.Extensions.Configuration and Microsoft.Extensions.Configuration.Json for reading the json settings file, and PostgresSQLCopyHelper for transferring lists of objects to the database. <br/>
N.B. The program expects to find a file in the project folder called appsettings.json, not in the github repository, which should include 5 settings, four for the database connection string ("host", "user", "password", and "database") and a fifth with the path of the source json file ("jsonpath").<br/>
It also expects the database to have a schema called 'ror'.<br/><br/>

**Operation:**<br/>
a) The program first drops and recreates all tables <br/>
b) It loads and reads the entire json file<br/>
c) It deserialises the fle into an array of ror_org objects<br/>
d) Each ror_org object is considered in turn, with the various data elements being restructured to match the target database records and then sent to the database for storage.<br/>
e) Records in all tables retain the ROR id of their source organisation, but they also include an integer id added by the program. (The integer id is not guaranteed to be consistent between different extractions).<br/>
f) In some cases sequence numbers are added to repeating data elements, to aid in any subsequent deduplication.<br/>
g) Geonames and NUTS location data is included in the database only when non null.<br/>
h) Organisation names, aliases. labels anmd acronyms are de-duplicated and placed into a single table, though the source (original type) of the name is retained.<br/>
i) Links and excternal ids are not extracted, the idea being that the ror_id would be used by the target system to retrieve this data from ROR if and when it was required.<br/>
j) A small umber of non-printing unicode characters are removed from names (u+200B, u+200D, u+200E, u+202B, u+FEFF) to make further processing easier.<br/>
k) Periods and bullet points are removed from names (commas are retaioned).<br/>
l) Apostrophes, single and double quotes, and guillemets, are all rationalised into single left or right quotes, depending on their position relative to the words in the name.<br/>
m) Names which have a bracketed country name as a suffix are split, so that the name is the unbracketed portion. The country name is retained (it is normally already present in the record).<br/><br/>

k), l) and m) are to make the names compatible with the target system, but of course different target systems may have other requirements.<br/><br/>


**Post processing scripts**<br/>
An optional set of numbered sql scripts are included in the sql_scripts folder. Their uses are: <br/>
a) Script 1: Removes duplicates amongst names. This includes (i) duplicates within aliases, labels and acronyms, for the same ror_id, (ii) duplicates between those three tables, for the same ror_id, and (iii) between those tables and the main organisation table, again always considering the same ror_id.<br/>
Note that duplicates involving the main organisation table name use the name after the split described in m above. In other words, in these cases, acronyms, aliases or labels that are simply the ror name without the country name are removed.<br/>
b) Script 2: Identifies and stores (for addition later in the scripting process) the unicode script used within the names in the system. Most names are in Latin script but about 15,500 are not. The non-latin scripts are identified by using the unicode value of the initial character (after any initial bracket) and categorising the script according to a list of known script 'blocks', as published on the unicode web site. <br/>
c) Scripts 3 and 4: Simplifies some parent-child hierarchies. <br/>
Script 3 deals with companies that have branches in multiple countries, and which have a designated parent branch (and that have the same name in all locations). <br/>
These are rationalised to a single organisation with the parent ror_id value, the names and locations of the child branches being added to the parent organisation (which therefore ends up with multiple different location records). <br/>
Script 4 deals with a much smaller group of non-commercial organisations that have multiple branches in the *same* country, one of which is a designated parent organisation - these are simplified to the parent oprganisation in the same way.<br/>
Usimg both of these scripts corresponds to the particular user requirements in the target system (where knowledge of which national subsidiary of a company is involved is generally not important, or even meaningful). Other target systems may or may not find these scripts useful.<br/>
d) Scripts 5-12 try to identify the language of all the names, using the presence of key words and the country code associated with each name entry. Language codes are present for labels in the original data but not the other name types.<br/> 
The language is identified in about 95% of cases using this method, although detailed checking has not yet been done. The reason for trying to apply the language code to all names is to allow the language to be indicated in the UI of the target system.<br/>
The final scriopt (12) also reapplies the script data identified in script 2.