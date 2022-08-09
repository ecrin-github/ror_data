-- DELETION OF DUPLICATE NAMES 

-- First look for duplicates within tables 
 
drop table if exists ror.dup_labels;
create table ror.dup_labels as 
select id, lower(value) as lowervalue, count(id)
from ror.org_labels
group by id, lower(value)
having count(id) > 1
order by count(id) desc; 

-- (32 rows created)

-- Examine the duplicates in detail
/*
select dl.id, ror_id, count, seq_num, language, value
from ror.dup_labels dl
inner join ror.org_labels gl
on dl.id = gl.id
and dl.lowervalue = lower(gl.value)
order by ror_id, seq_num;
*/

-- In  general the duplicate labels have different language codes, but some of those language codes are wrong, or at least over enthusiastic. 
-- The following statements eliminate the duplicate label record by removing the ones with either an inaccurate or redundant language code.

delete from ror.org_labels where ror_id = 'https://ror.org/05nmttp70' and lower(value) = 'comisión nacional de actividades espaciales' and language in ('de', 'it', 'en', 'fr');
delete from ror.org_labels where ror_id = 'https://ror.org/00by1q217' and lower(value) = 'hoffmann-la roche' and language in ('it','fr');
delete from ror.org_labels where ror_id = 'https://ror.org/017gx5z33' and lower(value) = 'proquest' and language in ('es', 'fr');
delete from ror.org_labels where ror_id = 'https://ror.org/02fv52296' and lower(value) = 'micron technology' and language in ('es', 'fr');
delete from ror.org_labels where ror_id = 'https://ror.org/00fcpmw49' and lower(value) = 'instituto federal de santa catarina' and language in ('en', 'fr');
delete from ror.org_labels where ror_id = 'https://ror.org/01qckj285' and lower(value) = 'universidade da coruña' and language in ('gl');
delete from ror.org_labels where ror_id = 'https://ror.org/01bnjbv91' and lower(value) = 'università degli studi di sassari' and language in ('nl');
delete from ror.org_labels where ror_id = 'https://ror.org/03v8adn41' and lower(value) = 'queens college, city university of new york' and language in ('fr');
delete from ror.org_labels where ror_id = 'https://ror.org/04ezk3x31' and lower(value) = 'universitat de tolosa-joan jaurés' and language in ('oc');
delete from ror.org_labels where ror_id = 'https://ror.org/00dsy9f04' and lower(value) = 'ebsco information services' and language in ('fr');
delete from ror.org_labels where ror_id = 'https://ror.org/04dzb7272' and lower(value) = 'gale' and language in ('fr');
delete from ror.org_labels where ror_id = 'https://ror.org/038ajz246' and lower(value) = 'london academy of music and dramatic art' and language in ('cy');
delete from ror.org_labels where ror_id = 'https://ror.org/00yrf4e35' and lower(value) = 'osservatorio astronomico di torino' and language in ('de');
delete from ror.org_labels where ror_id = 'https://ror.org/042k2q423' and lower(value) = 'universidade católica do salvador' and language in ('en');
delete from ror.org_labels where ror_id = 'https://ror.org/01tzdej37' and lower(value) = 'instituto federal da bahia' and language in ('en');
delete from ror.org_labels where ror_id = 'https://ror.org/01cdn3r29' and lower(value) = 'école des beaux-arts' and language in ('ca');
delete from ror.org_labels where ror_id = 'https://ror.org/04facnr46' and lower(value) = 'european university' and language in ('it', 'fr');
delete from ror.org_labels where ror_id = 'https://ror.org/028vtqb15' and lower(value) = 'बिरला प्रौद्योगिकी संस्थान' and language in ('ne');
delete from ror.org_labels where ror_id = 'https://ror.org/0553w5c95' and lower(value) = 'instituto federal de minas gerais' and language in ('en');
delete from ror.org_labels where ror_id = 'https://ror.org/01767d733' and lower(value) = 'erasmushogeschool brussel' and language in ('fr');
delete from ror.org_labels where ror_id = 'https://ror.org/05dfxeg46' and lower(value) = 'institut henri poincaré' and language in ('ca');
delete from ror.org_labels where ror_id = 'https://ror.org/00bep5t26' and lower(value) = 'biblioteca de catalunya' and language in ('gl');
delete from ror.org_labels where ror_id = 'https://ror.org/05e0vkr08' and lower(value) = 'bibliothèque nationale de luxembourg' and language in ('de');
delete from ror.org_labels where ror_id = 'https://ror.org/03gpapx10' and lower(value) = 'instituto rio branco' and language in ('es');
delete from ror.org_labels where ror_id = 'https://ror.org/01kwczx50' and lower(value) = 'skadden, arps, slate, meagher & flom' and language in ('fr');
delete from ror.org_labels where ror_id = 'https://ror.org/00zb6nk96' and lower(value) = 'labor spiez' and language in ('rm');
delete from ror.org_labels where ror_id = 'https://ror.org/05c2g3729' and lower(value) = 'ministarstvo vanjskih poslova' and language in ('hr');
delete from ror.org_labels where ror_id = 'https://ror.org/04r5ddq29' and lower(value) = 'école pour l’informatique et les techniques avancées' and language in ('oc');
delete from ror.org_labels where ror_id = 'https://ror.org/00wnzj089' and lower(value) = 'école nationale d’administration' and language in ('eu', 'br');
delete from ror.org_labels where ror_id = 'https://ror.org/01azzms13' and lower(value) = 'universitat miguel hernández d’elx' and language in ('oc');
delete from ror.org_labels where ror_id = 'https://ror.org/01xqwbk25' and lower(value) = 'us securities and exchange commission' and language in ('es');
delete from ror.org_labels where ror_id = 'https://ror.org/02q4res37' and lower(value) = 'institut d’électronique de microélectronique et de nanotechnologie' and language in ('ca');


-- aliases - 7 of them were duplicated for the same org

drop table if exists ror.dup_aliases;
create table ror.dup_aliases as 
select id, lower(alias) as lowervalue, count(id)
from ror.org_aliases
group by id, lower(alias)
having count(id) > 1
order by count(id) desc; 

-- inspect the result
/*
select da.id, ror_id, count, seq_num, language, alias
from ror.dup_aliases da
inner join ror.org_aliases ga
on da.id = ga.id
and da.lowervalue = lower(ga.alias)
order by ror_id, seq_num;
*/

-- delete the ones with the higher sequence number

delete from ror.org_aliases a
using
  (select ga.id, max(seq_num) as maxseq
   from ror.dup_aliases da
   inner join ror.org_aliases ga
   on da.id = ga.id
   and da.lowervalue = lower(ga.alias)
   group by ga.id) maxdups
where a.id = maxdups.id
and a.seq_num = maxdups.maxseq;

-- 7 deleted

-- acronyms - 2 of them was duplicated for the same org

drop table if exists ror.dup_acronyms;
create table ror.dup_acronyms as 
select id, lower(acronym) as lowervalue, count(id)
from ror.org_acronyms
group by id, lower(acronym)
having count(id) > 1
order by count(id) desc; 

/*
select da.id, ror_id, count, seq_num, language, acronym
from ror.dup_acronyms da
inner join ror.org_acronyms ga
on da.id = ga.id
and da.lowervalue = lower(ga.acronym)
order by ror_id, seq_num;
*/

-- delete the one with the higher sequence number

delete from ror.org_acronyms a
using
  (select ga.id, max(seq_num) as maxseq
   from ror.dup_acronyms da
   inner join ror.org_acronyms ga
   on da.id = ga.id
   and da.lowervalue = lower(ga.acronym)
   group by ga.id) maxdups
where a.id = maxdups.id
and a.seq_num = maxdups.maxseq;

-- 2 deleted

-- there are still duplicates between the tables

-- some aliases are the same as the name given for the organisation
-- and need to be deleted
/*
select g.id, g.ror_id, g.name, a.alias from ror.org_aliases a
inner join ror.orgs g
on a.id = g.id
and lower(a.alias) = lower(g.name)
order by g.ror_id;
*/

delete from ror.org_aliases a
using ror.orgs g
where a.id = g.id
and lower(a.alias) = lower(g.name);

-- 87 removed

-- some aliases are the same as the name given for one of the labels
-- and need to be deleted
/*
select b.id, b.ror_id, b.value, a.alias from ror.org_aliases a
inner join ror.org_labels b
on a.id = b.id
and lower(a.alias) = lower(b.value)
order by b.ror_id;
*/

delete from ror.org_aliases a
using ror.org_labels b
where a.id = b.id
and lower(a.alias) = lower(b.value);

-- 354 removed

-- some labels may be the same as the organisation and need to be deleted
-- before that their language information can be transferred to the organisation

update ror.orgs g
set language = b.language 
FROM ror.org_labels b
where b.id = g.id
and lower(b.value) = lower(g.name);

/*
select g.id, g.ror_id, g.name, b.value from ror.org_labels b
inner join ror.orgs g
on b.id = g.id
and lower(g.name) = lower(b.value)
order by g.ror_id;
*/

delete from ror.org_labels b
using ror.orgs g
where b.id = g.id
and lower(b.value) = lower(g.name);

-- 102 deleted

-- acronyms need to have names that appear elsewhere removed...
/*
select a.id, a.ror_id, a.acronym, b.alias from ror.org_acronyms a
inner join ror.org_aliases b
on a.id = b.id
and lower(a.acronym) = lower(b.alias)
order by a.ror_id
*/

delete from ror.org_acronyms a
using ror.org_aliases b
where a.id = b.id
and lower(a.acronym) = lower(b.alias);

-- 5 deleted

/*
select a.id, a.ror_id, a.acronym, b.value from ror.org_acronyms a
inner join ror.org_labels b
on a.id = b.id
and lower(a.acronym) = lower(b.value)
order by a.ror_id
*/

delete from ror.org_acronyms a
using ror.org_labels b
where a.id = b.id
and lower(a.acronym) = lower(b.value);

-- 3 deleted

/*
select a.id, a.ror_id, a.acronym, g.name from ror.org_acronyms a
inner join ror.orgs g
on a.id = g.id
and lower(a.acronym) = lower(g.name)
order by a.ror_id
*/

delete from ror.org_acronyms a
using ror.orgs g
where a.id = g.id
and lower(a.acronym) = lower(g.name);

-- 43 deleted


-- combine names, aliases, acronyms, labels into one table

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

-- 197,102 records

-- Check no duplicates
/*
select id, name, count(id)
from ror.all_names
group by id, name 
having  count(id) > 1;
 -- 0 records
 
select id, name, count(id)
from ror.all_names
group by id, name 
having  count(id) = 1;
-- 197,102 records
*/
