
-- create a table capturing the parent child relationships
-- of companies in the system. Only companies are considered,
-- and only the parent child relationships where the same 
-- 'stem' name is used, but with a diiferent country suffix.

-- this restricts the parent child relationships to a single
-- level, i.e. nested child-parent relationships where the stem
-- would change are not included....

-- first need to correct 2 errors
update ror.orgs set is_company = true where ror_id = 'https://ror.org/009dxjw45';
update ror.orgs set is_company = true where ror_id = 'https://ror.org/0344txx64';

drop table if exists ror.chpar_companies;
create table ror.chpar_companies as 
select g.id, g.ror_id, g.name, g.qualifier, g.country_code, 
r.type, 
g2.id as tid, g2.ror_id as tror_id, g2.name as tname, 
g2.qualifier as tqualifier, g2.country_code as tcountry_code 
from ror.org_relationships r
inner join ror.orgs g
on r.ror_id = g.ror_id
inner join ror.orgs g2
on r.target_ror_id = g2.ror_id
where type = 'Parent'
and g.is_company = true
and (g.name = g2.name
	or g.name ilike '%fresenius kalbi%'
	or g.name ilike '%daichi sankyo%')
order by g.name;

--3161 created

-- select * from ror.chpar_companies 
-- add acronyms from child companies (not already present)
-- to parent company record

insert into ror.org_acronyms(id, ror_id, acronym)
select distinct ch.tid, ch.tror_id, ch.acronym
from
   (select c.ror_id as rid, c.tid, c.tror_id, a.acronym 
    from ror.chpar_companies c
    inner join ror.org_acronyms a
    on c.ror_id = a.ror_id) ch
left join
   (select c.ror_id as rid, c.tror_id, a.acronym 
    from ror.chpar_companies c
    inner join ror.org_acronyms a
    on c.tror_id = a.ror_id) p
on ch.rid = p.rid
and lower(ch.acronym) = lower(p.acronym)
where p.rid is null;

--42 inserted

-- delete acronyms from child orgs

delete from ror.org_acronyms r
using ror.chpar_companies c
where r.ror_id = c.ror_id;

--272 deleted

-- add aliases from child companies (not already present)
-- to parent company record

insert into ror.org_aliases(id, ror_id, alias)
select distinct ch.tid, ch.tror_id, ch.alias
from
   (select c.ror_id as rid, c.tid, c.tror_id, a.alias 
    from ror.chpar_companies c
    inner join ror.org_aliases a
    on c.ror_id = a.ror_id) ch
left join
   (select c.ror_id as rid, c.tror_id, a.alias 
    from ror.chpar_companies c
    inner join ror.org_aliases a
    on c.tror_id = a.ror_id) p
on ch.rid = p.rid
and lower(ch.alias) = lower(p.alias)
where p.rid is null;

--215 inserted

-- delete aliases from child orgs

delete from ror.org_aliases r
using ror.chpar_companies c
where r.ror_id = c.ror_id;

-- 799 deleted

-- add labels from child companies (not already present)
-- to parent company record

insert into ror.org_labels(id, ror_id, value)
select distinct ch.tid, ch.tror_id, ch.value
from
   (select c.ror_id as rid, c.tid, c.tror_id, a.value 
    from ror.chpar_companies c
    inner join ror.org_labels a
    on c.ror_id = a.ror_id) ch
left join
   (select c.ror_id as rid, c.tror_id, a.value 
    from ror.chpar_companies c
    inner join ror.org_labels a
    on c.tror_id = a.ror_id) p
on ch.rid = p.rid
and lower(ch.value) = lower(p.value)
where p.rid is null;

--75 inserted

-- delete aliases from child orgs

delete from ror.org_labels r
using ror.chpar_companies c
where r.ror_id = c.ror_id;

--94 deleted
 
-- add address data of child orgs to parent org, as an additional location
-- N.B. parent retains address #1, child companies have address ids 2 onwards
drop table if exists ror.temp_addlist;
create table ror.temp_addlist as
select c.tror_id, c.tname, ROW_NUMBER() OVER(PARTITION BY tror_id) + 1 as rn, a.id, a.ror_id
from ror.org_addresses a
inner join ror.chpar_companies c 
on a.ror_id = c.ror_id
order by  c.tname, rn;

--3161 

-- update address sequence numbers
update ror.org_addresses a
set add_id = t.rn
from ror.temp_addlist t
where 
a.ror_id = t.ror_id;

--3161 updated

-- update address ror_ids
update ror.org_addresses a
set id = tid, ror_id = tror_id
from ror.chpar_companies c 
where 
a.ror_id = c.ror_id;

--3161 updated

-- add city_admins data of child org asddresses
-- update address sequence numbers
update ror.org_city_admins a
set add_id = t.rn
from ror.temp_addlist t
where 
a.ror_id = t.ror_id;

--5581 updated

-- update address ror_ids
update ror.org_city_admins a
set id = tid, ror_id = tror_id
from ror.chpar_companies c 
where 
a.ror_id = c.ror_id;

--5581 updated

-- add city_NUTS data of child org addresses
-- update address sequence numbers
update ror.org_city_nuts a
set add_id = t.rn
from ror.temp_addlist t
where 
a.ror_id = t.ror_id;

--5478 updated

update ror.org_city_nuts a
set id = tid, ror_id = tror_id
from ror.chpar_companies c 
where 
a.ror_id = c.ror_id;

--5478 updated

/*
select * from ror.org_addresses
where ror_id in (select distinct tror_id from ror.chpar_companies)
order by ror_id, add_id

select * from ror.org_city_admins
where ror_id in (select distinct tror_id from ror.chpar_companies)
order by ror_id, add_id

select * from ror.org_city_nuts
where ror_id in (select distinct tror_id from ror.chpar_companies)
order by ror_id, add_id
*/

drop table if exists ror.temp_addlist;

-- add relevant relationships of child orgs
-- (delete) parent relationship - but others - about 30

update ror.org_relationships r
set id = c.tid, ror_id = c.tror_id
from ror.chpar_companies c 
where r.ror_id = c.ror_id
and r.type <> 'Parent';

-- update 30

delete from ror.org_relationships r
using ror.chpar_companies c 
where r.ror_id = c.ror_id
and r.type = 'Parent';
 
-- deleted 3164

-- Finally:
-- drop the child company records from the ror.orgs table

delete from ror.orgs g
using ror.chpar_companies c 
where g.ror_id = c.ror_id;

--3161 deleted

-- update the city and country data for the multi-national companies

update ror.orgs g
set city = 'multi', country_name = 'multi', country_code = '*'
from ror.chpar_companies c 
where g.ror_id = c.tror_id;

-- 1147 updated

-- question of whether for non commecrcial orgs the display qualifier should 
-- indicate a parent... may be useful for universities

-- RECOMBINE names, aliases, acronyms, labels into one table

drop table if exists ror.all_names;
create table ror.all_names as
select id, ror_id, name, language, null as script, country_code, 'orgs' as source, 1 as source_id from ror.orgs
union 
select id, ror_id, value, language, null, '', 'labels', 2 from ror.org_labels
union
select id, ror_id, alias, language, null, '', 'aliases', 3 from ror.org_aliases
union 
select id, ror_id, acronym, language, null, '', 'acronyms', 4 from ror.org_acronyms
order by id, source_id;

-- 193,108 records

-- Check no duplicates
/*
select id, name, count(id)
from ror.all_names
group by id, name 
having  count(id) > 1;
 -- 14 records
 */
 
-- the problem is that the additions check against existing names of the same type but not of different types
-- the check machanisms against cross type duplication must be run again

-- aliases and org names
delete from ror.org_aliases a
using ror.orgs g
where a.id = g.id
and lower(a.alias) = lower(g.ror_name);

-- 0 removed

-- some aliases and labels
delete from ror.org_aliases a
using ror.org_labels b
where a.id = b.id
and lower(a.alias) = lower(b.value);

-- 8 removed

-- labels and org names
delete from ror.org_labels b
using ror.orgs g
where b.id = g.id
and lower(b.value) = lower(g.ror_name);

-- 0 deleted

-- acronyms and aliases
delete from ror.org_acronyms a
using ror.org_aliases b
where a.id = b.id
and lower(a.acronym) = lower(b.alias);

-- 7 deleted

-- acronyms and labels
delete from ror.org_acronyms a
using ror.org_labels b
where a.id = b.id
and lower(a.acronym) = lower(b.value);

-- 0 deleted

-- acronyms and orgs
delete from ror.org_acronyms a
using ror.orgs g
where a.id = g.id
and lower(a.acronym) = lower(g.ror_name);

-- 0 deleted

-- RECOMBINE names, aliases, acronyms, labels into one table

drop table if exists ror.all_names;
create table ror.all_names as
select id, ror_id, name, language, null as script, country_code, 'orgs' as source, 1 as source_id from ror.orgs
union 
select id, ror_id, value, language, null, '', 'labels', 2 from ror.org_labels
union
select id, ror_id, alias, language, null, '', 'aliases', 3 from ror.org_aliases
union 
select id, ror_id, acronym, language, null, '', 'acronyms', 4 from ror.org_acronyms
order by id, source_id;

--193,093

/*
select id, name, count(id)
from ror.all_names
group by id, name 
having  count(id) > 1
-- 0 records
 
select id, name, count(id)
from ror.all_names
group by id, name 
having  count(id) = 1
--193,093
*/


