
-- create a table capturing the parent child relationships
-- of non-commercial organisations in the system. 
-- Only the parent child relationships where the same 
--  name is used, but with the SAME country suffix.

-- this is therefore a much smaller set than with the company rationalisation

drop table if exists ror.chpar_noncomp;
create table ror.chpar_noncomp as 
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
and g.is_company = false
and g.name = g2.name
and g.country_code = g2.country_code
order by g.name;

--select * from ror.chpar_noncomp

--10 created

-- select * from ror.chpar_noncomp 
-- add acronyms from child companies (not already present)
-- to parent company record

insert into ror.org_acronyms(id, ror_id, acronym)
select distinct ch.tid, ch.tror_id, ch.acronym
from
   (select c.ror_id as rid, c.tid, c.tror_id, a.acronym 
    from ror.chpar_noncomp c
    inner join ror.org_acronyms a
    on c.ror_id = a.ror_id) ch
left join
   (select c.ror_id as rid, c.tror_id, a.acronym 
    from ror.chpar_noncomp c
    inner join ror.org_acronyms a
    on c.tror_id = a.ror_id) p
on ch.rid = p.rid
and lower(ch.acronym) = lower(p.acronym)
where p.rid is null;

--0 inserted

-- delete acronyms from child orgs

delete from ror.org_acronyms r
using ror.chpar_noncomp c
where r.ror_id = c.ror_id;

--5 deleted

-- add aliases from child companies (not already present)
-- to parent company record

insert into ror.org_aliases(id, ror_id, alias)
select distinct ch.tid, ch.tror_id, ch.alias
from
   (select c.ror_id as rid, c.tid, c.tror_id, a.alias 
    from ror.chpar_noncomp c
    inner join ror.org_aliases a
    on c.ror_id = a.ror_id) ch
left join
   (select c.ror_id as rid, c.tror_id, a.alias 
    from ror.chpar_noncomp c
    inner join ror.org_aliases a
    on c.tror_id = a.ror_id) p
on ch.rid = p.rid
and lower(ch.alias) = lower(p.alias)
where p.rid is null;

--0 inserted

-- delete aliases from child orgs

delete from ror.org_aliases r
using ror.chpar_noncomp c
where r.ror_id = c.ror_id;

-- 0 deleted

-- add labels from child companies (not already present)
-- to parent company record

insert into ror.org_labels(id, ror_id, value)
select distinct ch.tid, ch.tror_id, ch.value
from
   (select c.ror_id as rid, c.tid, c.tror_id, a.value 
    from ror.chpar_noncomp c
    inner join ror.org_labels a
    on c.ror_id = a.ror_id) ch
left join
   (select c.ror_id as rid, c.tror_id, a.value 
    from ror.chpar_noncomp c
    inner join ror.org_labels a
    on c.tror_id = a.ror_id) p
on ch.rid = p.rid
and lower(ch.value) = lower(p.value)
where p.rid is null;

--0 inserted

-- delete aliases from child orgs

delete from ror.org_labels r
using ror.chpar_noncomp c
where r.ror_id = c.ror_id;

--2 deleted
 
-- add address data of child orgs to parent org, as an additional location
-- N.B. parent retains address #1, child companies have address ids 2 onwards
drop table if exists ror.temp_addlist;
create table ror.temp_addlist as
select c.tror_id, c.tname, ROW_NUMBER() OVER(PARTITION BY tror_id) + 1 as rn, a.id, a.ror_id
from ror.org_addresses a
inner join ror.chpar_noncomp c 
on a.ror_id = c.ror_id
order by  c.tname, rn;

--10

-- update address sequence numbers
update ror.org_addresses a
set add_id = t.rn
from ror.temp_addlist t
where 
a.ror_id = t.ror_id;

--10 updated

-- update address ror_ids
update ror.org_addresses a
set id = tid, ror_id = tror_id
from ror.chpar_noncomp c 
where 
a.ror_id = c.ror_id;

--10 updated

-- add city_admins data of child org asddresses
-- update address sequence numbers
update ror.org_city_admins a
set add_id = t.rn
from ror.temp_addlist t
where 
a.ror_id = t.ror_id;

--18 updated

-- update address ror_ids
update ror.org_city_admins a
set id = tid, ror_id = tror_id
from ror.chpar_noncomp c 
where 
a.ror_id = c.ror_id;

--18 updated

-- add city_NUTS data of child org addresses
-- update address sequence numbers
update ror.org_city_nuts a
set add_id = t.rn
from ror.temp_addlist t
where 
a.ror_id = t.ror_id;

--12 updated

update ror.org_city_nuts a
set id = tid, ror_id = tror_id
from ror.chpar_noncomp c 
where 
a.ror_id = c.ror_id;

--12 updated

/*
select * from ror.org_addresses
where ror_id in (select distinct tror_id from ror.chpar_noncomp)
order by ror_id, add_id

select * from ror.org_city_admins
where ror_id in (select distinct tror_id from ror.chpar_noncomp)
order by ror_id, add_id

select * from ror.org_city_nuts
where ror_id in (select distinct tror_id from ror.chpar_noncomp)
order by ror_id, add_id
*/

drop table if exists ror.temp_addlist;

-- add relevant relationships of child orgs
-- (delete) parent relationship - but others - about 30

update ror.org_relationships r
set id = c.tid, ror_id = c.tror_id
from ror.chpar_noncomp c 
where r.ror_id = c.ror_id
and r.type <> 'Parent';

-- update 1

delete from ror.org_relationships r
using ror.chpar_noncomp c 
where r.ror_id = c.ror_id
and r.type = 'Parent';
 
-- deleted 11

-- Finally:
-- drop the child records from the ror.orgs table

delete from ror.orgs g
using ror.chpar_noncomp c 
where g.ror_id = c.ror_id;

--10 deleted

-- update the city and country data for the multi-national companies

update ror.orgs g
set city = 'multi'
from ror.chpar_noncomp c 
where g.ror_id = c.tror_id;

-- 8 updated

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

-- 193,076 records

-- Check no duplicates
 
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
--193,076
*/

