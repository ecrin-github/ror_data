# ror_data
Downloads ROR dataset and loads to Postgres tables

A very 'quick and dirty' C# console program that takes the large json file published by ROR, deserialises it into organisation objects, and then splits the data in those objects into PostgreSQL tables. Tables are created for the organisation (id, name, country etc.), and then organisation aliases, acronyms, links, types, labels and external ids.
