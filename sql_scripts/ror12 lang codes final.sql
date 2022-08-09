
---------------------------------------------------------------
-- Set defult languages for the folowing countries - in most cases English
---------------------------------------------------------------

update ror.all_names set language = 'en'
where country_code in ('AU', 'GB', 'US', 'RU', 'JP')
and language is null;

--28470

update ror.all_names set language = 'en'
where country_code in ('AD', 'AE', 'AF', 'AG', 'AM')
and language is null;

--169

update ror.all_names set language = 'en'
where country_code in ('BS', 'BT', 'BW', 'BY', 'BZ')
and language is null;

--138

update ror.all_names set language = 'en'
where country_code in ('AL', 'CN', 'IE', 'IN')
and language is null;

--6340

update ror.all_names set language = 'en'
where country_code in ('AX', 'BB', 'BD', 'CW', 'CY')
and language is null;

--265

update ror.all_names set language = 'en'
where country_code in ('GD', 'GQ', 'GR', 'GM', 'GI', 'GH', 'GW', 'GY')
and language is null;

--463

update ror.all_names set language = 'en'
where country_code in ('IS', 'IM', 'IQ', 'IR', 'JE', 'JM', 'JO', 'KE')
and language is null;

--708

update ror.all_names set language = 'en'
where country_code in ('ZW', 'ZM', 'ZA', 'YE', 'TZ', 'UG', 'PS', 'QA', 'RW')
and language is null;

--1172

update ror.all_names set language = 'fr'
where country_code in ('GP' )
and language is null;

--4

update ror.all_names set language = 'en'
where (name ilike '%Austrian%'
or name ilike '%Belgian%'
or name ilike '%Brazilian%')
and language is null;

--24

update ror.all_names set language = 'en'
where (name ilike '%United Nations%'
or name ilike '%canadian%'
or name ilike '%swiss %'
or name ilike '%Czech%'
or name ilike '%german%'
or name ilike '%danish%')
and language is null;     

-- 278

update ror.all_names set language = 'en'
where (name ilike '%estonian%'
or name ilike '%spanish%'
or name ilike '%finnish%'
or name ilike '%greek%'
)
and language is null;     

--31

update ror.all_names set language = 'en'
where (name ilike '%french%'
or name ilike '%croatian%'
or name ilike '%hungarian%'
or name ilike '%national %'
or name ilike '%israel%'
)
and language is null;     

--385

update ror.all_names set language = 'en'
where (name ilike '%italian%'
or name ilike '%korean%'
or name ilike '%korea %'
or name ilike '%luxembourg%'
or name ilike '%maltese%'
or name ilike 'mauritian%'
or name ilike '%mexican%'
or name ilike '%malaysian%'
or name ilike '%Norwegian %'
or name ilike '%Norway %'
)
and language is null;     

--229

update ror.all_names set language = 'en'
where (name ilike '%thai %'
or name ilike '%thai %'
or name ilike '%turkish%'
or name ilike '%taiwan%'
or name ilike '%polish%'
or name ilike '%portuguese%'
or name ilike '%serbian%'
or name ilike '%swedish%' 	   
or name ilike '%singapor%'
or name ilike '%slovenia%'
or name ilike '%slovakia%'
)
and language is null;     

--88

update ror.all_names set language = 'en'
where (name ilike '%argentinian%'
or name ilike '%bulgarian%'
or name ilike '%chilean%'
or name ilike '%colombian%'
or name ilike '%egypt%'
or name ilike '%indonesia%'
or name ilike '%liechtenstein%'
or name ilike '%sri lanka%'
or name ilike '%ithuanian%' 
or name ilike '%latvian%'
or name ilike '%moroccan%'
or name ilike '%nigerian%'
or name ilike '%new zealand%'
or name ilike '%romanian%'
or name ilike '%vietnam%'
)
and language is null;

--83

update ror.all_names set language = 'es'
where name ilike '%hospital%' and country_code in ('AR', 'BO', 'CL', 'CO', 'CR', 'CU', 'DO', 'EC', 'ES', 'GQ', 'GT', 'HN', 'MX', 'NI', 'PE', 'PY', 'UY', 'VE')
and language is null;

--265

update ror.all_names set language = 'pt'
where name ilike '%hospital%' and country_code in ('PT', 'BR', 'CV', 'AO', 'MZ', 'GW', 'ST', 'TL')
and language is null;

--143

update ror.all_names set language = 'en'
where name ilike '% hospital %' 
or name ilike '%hospital'
or name ilike 'hospital %'
and language is null;

--7476

update ror.all_names set language = 'en'
where (name ilike '% of %'
or name ilike '% and %'
)
and language is null;     

--630
 
-- update acronyms if all other names are of a single language
update ror.all_names an
set language = singlang.language
from 
(with langs as (select distinct id, language
     from ror.all_names an
     where an.source_id <> 4
     and an.language is not null)
select l2.id, langs.language
from (select id from langs
     group by langs.id
     having count(langs.id) = 1) l2
	 inner join langs
	 on l2.id = langs.id) singlang
where an.id = singlang.id
and an.source_id = 4
and an.language is null;

--8932

-- set scripts
-- do the latin characters
-- but exclude those with initial bracket


update ror.all_names
set script = 'Latn'
where name <= 'zzzz'
and substring(name, 1,1) <> '(';

--177,524

--do those with initial bracket taking 
--into account second charactedr
update ror.all_names
set script = 'Latn'
where substring(name, 2) <= 'zzzz'
and substring(name, 1, 1) = '(';

--1

-- update from the non_latin table

update ror.all_names a
set script = n.script
from ror.non_latin_names n
where a.ror_id = n.ror_id
and a.name = n.name;

--15481
 
select s.* from ror.manual_langs_set s
inner join ror.all_names a
on s.ror_id = a.ror_id
and s.name = a.name
where a.language is null;

update ror.all_names a
set language = s.language
from ror.manual_langs_set s
where s.ror_id = a.ror_id
and s.name = a.name
and a.language is null;

/*
select * from ror.all_names 
where script = ''
order by ror_id


select count(*) from ror.all_names where language is not null and language <> '';
-- 178,033
select count(*) from ror.all_names where language is null or language = '';
-- 15060
select count(*) from ror.all_names where (language is null or language = '') and source_id <> 4
-- 6005
select count(*) from ror.all_names
-- 193,093
select * from ror.all_names order by ror_id
*/

-- finally create a table of name / city / countries to match
drop table if exists ror.names_to_match;
create table ror.names_to_match as
select a.id, a.ror_id, a.name, a.language, g.city, a.country_code
from ror.all_names a
inner join ror.orgs g
on a.ror_id = g.ror_id
where a.script = 'Latn';

--177551

/*
-- update acronyms if all other names, 
-- of the same script as the acronym, are of a single language
-- currently does not seem to have any additional effect
update ror.all_names an
set language = singlang.language
from 
(with langs as 
 	(select distinct id, language, script
     from ror.all_names an
     where an.source_id <> 4
     and an.language is not null
	 and an.language <> 'cm')
select l2.id, langs.language, langs.script
from 
 	(select id from langs
     group by langs.id
     having count(langs.id) = 1) l2
inner join langs
on l2.id = langs.id) singlang
	 
where an.id = singlang.id
and an.script = singlang.script
and an.source_id = 4
and an.language is null;
*/