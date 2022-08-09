

---------------------------------------------------------------
-- Set all blank language codes to null (in case some are empty strings)
-- Update all blank country codes, for all records, using the
-- code in the organisation (source id = 1) records
---------------------------------------------------------------

update ror.all_names set language = null
where language = '';


update ror.all_names a
set country_code = n.country_code
from ror.all_names n
where a.ror_id = n.ror_id
and n.source_id = 1
and a.source_id > 1;

--93,504

---------------------------------------------------------------
-- For organisations marked as companies 
-- mark their language code as 'cm' (need to add to lang list)
-- some companies not labelled as such - will need to be
-- redone with improved source data later
---------------------------------------------------------------

update ror.all_names a
set language = 'cm'
from ror.orgs g
where a.ror_id = g.ror_id
and a.source_id = 1
and g.is_company = true;

-- 26341 updated

---------------------------------------------------------------
-- For aliases, acronyms and labels that match these companies
-- also mark these as cm
-- companies may have different names in different countries, 
-- but they are still 'commercial' names, and are not necessarily
-- tied to any particular language
---------------------------------------------------------------

update ror.all_names a
set language = 'cm'
from ror.all_names n
where a.ror_id = n.ror_id
and n.source_id = 1
and n.language = 'cm'
and a.source_id > 1

-- 8933 updated

