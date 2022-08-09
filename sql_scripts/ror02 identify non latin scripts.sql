
-- create a table with the 
-- non latin script names
update ror.all_names a
set country_code = n.country_code
from ror.all_names n
where a.ror_id = n.ror_id
and n.source_id = 1
and a.source_id > 1;


drop table if exists ror.non_latin_names;
create table ror.non_latin_names as
select ror_id, country_code, name, '' as char1, 0 as c1_ascii, '' as script
from ror.all_names
where (name > 'zzzz'
and substring(name, 1, 1) <> '(')
or (substring(name, 2) > 'zzzz'
and substring(name, 1, 1) = '(');

--15557

select * from ror.all_names;
select * from ror.non_latin_names;

-- japanese names have a specific script 
-- (Alias for Han + Hiragana + Katakana)

-- this needs to be done before some country
-- codes become * after being identified
-- as multi-national companies

update ror.non_latin_names
set script = 'Jpan'
where country_code = 'JP';

-- 3103

-- identify and store first relevant character
update ror.non_latin_names
set char1 = substring(name, 1, 1)
where script = ''
and substring(name, 1, 1) <> '(';

--12431

update ror.non_latin_names
set char1 = substring(name, 2, 1)
where script = ''
and substring(name, 1, 1) = '(';

--23

-- get ascii code for first rel;evant character
update ror.non_latin_names
set c1_ascii = ascii(char1)
where script = '';

--12454

-- assign script name according to 
-- ascii value 

update ror.non_latin_names set script = 'Grek' where script = '' and c1_ascii between 880 and 1023;
--248
update ror.non_latin_names set script = 'Cyrl' where script = '' and c1_ascii between 1024 and 1279;
--3366
update ror.non_latin_names set script = 'Armn' where script = '' and c1_ascii between 1328 and 1423;
--54
update ror.non_latin_names set script = 'Hebr' where script = '' and c1_ascii between 1424 and 1535;
--123
update ror.non_latin_names set script = 'Arab' where script = '' and c1_ascii between 1536 and 1791;
--1400
update ror.non_latin_names set script = 'Thaa' where script = '' and c1_ascii between 1920 and 1983;
--2
update ror.non_latin_names set script = 'Nkoo' where script = '' and c1_ascii between 1984 and 2047;
--0
update ror.non_latin_names set script = 'Deva' where script = '' and c1_ascii between 2304 and 2431;
--721
update ror.non_latin_names set script = 'Beng' where script = '' and c1_ascii between 2432 and 2559;
--233
update ror.non_latin_names set script = 'Guru' where script = '' and c1_ascii between 2560 and 2687;
--50
update ror.non_latin_names set script = 'Gujr' where script = '' and c1_ascii between 2688 and 2815;
--40
update ror.non_latin_names set script = 'Orya' where script = '' and c1_ascii between 2816 and 2943;
--13
update ror.non_latin_names set script = 'Taml' where script = '' and c1_ascii between 2944 and 3071;
--233
update ror.non_latin_names set script = 'Telu' where script = '' and c1_ascii between 3072 and 3199;
--100
update ror.non_latin_names set script = 'Knda' where script = '' and c1_ascii between 3200 and 3327;
--83
update ror.non_latin_names set script = 'Mlym' where script = '' and c1_ascii between 3328 and 3455;
--161
update ror.non_latin_names set script = 'Sinh' where script = '' and c1_ascii between 3456 and 3583;
--29
update ror.non_latin_names set script = 'Thai' where script = '' and c1_ascii between 3584 and 3711;
--217
update ror.non_latin_names set script = 'Laoo' where script = '' and c1_ascii between 3712 and 3839;
--10
update ror.non_latin_names set script = 'Tibt' where script = '' and c1_ascii between 3840 and 4095;
--3
update ror.non_latin_names set script = 'Mymr' where script = '' and c1_ascii between 4096 and 4255;
--49
update ror.non_latin_names set script = 'Geor' where script = '' and c1_ascii between 4256 and 4351;
--48
update ror.non_latin_names set script = 'Ethi' where script = '' and c1_ascii between 4608 and 4988;
--8
update ror.non_latin_names set script = 'Cans' where script = '' and c1_ascii between 5120 and 5759;
--1
update ror.non_latin_names set script = 'Tglg' where script = '' and c1_ascii between 5888 and 5919;
--0
update ror.non_latin_names set script = 'Hano' where script = '' and c1_ascii between 5920 and 5951;
--0
update ror.non_latin_names set script = 'Buhd' where script = '' and c1_ascii between 5952 and 5983;
--0
update ror.non_latin_names set script = 'Tagb' where script = '' and c1_ascii between 5984 and 6015;
--0
update ror.non_latin_names set script = 'Khmr' where script = '' and c1_ascii between 6016 and 6143;
--36
update ror.non_latin_names set script = 'Mong' where script = '' and c1_ascii between 6144 and 6319;
--0
update ror.non_latin_names set script = 'Limb' where script = '' and c1_ascii between 6400 and 6479;
--0
update ror.non_latin_names set script = 'Tale' where script = '' and c1_ascii between 6480 and 6527;
--0
update ror.non_latin_names set script = 'Talu' where script = '' and c1_ascii between 6528 and 6623;
--0
update ror.non_latin_names set script = 'Bugi' where script = '' and c1_ascii between 6656 and 6687;
--0
update ror.non_latin_names set script = 'Lana' where script = '' and c1_ascii between 6688 and 6831;
--0
update ror.non_latin_names set script = 'Bali' where script = '' and c1_ascii between 6912 and 7039;
--0
update ror.non_latin_names set script = 'Sund' where script = '' and c1_ascii between 7040 and 7103;
--0
update ror.non_latin_names set script = 'Batk' where script = '' and c1_ascii between 7104 and 7167;
--0
update ror.non_latin_names set script = 'Lepc' where script = '' and c1_ascii between 7168 and 7247;
--0
update ror.non_latin_names set script = 'Olck' where script = '' and c1_ascii between 7248 and 7295;
--0
update ror.non_latin_names set script = 'Hira' where script = '' and c1_ascii between 12352 and 12447;
--1
update ror.non_latin_names set script = 'Kana' where script = '' and c1_ascii between 12448 and 12543;
--35
update ror.non_latin_names set script = 'Bopo' where script = '' and c1_ascii between 12544 and 12591;
--0
update ror.non_latin_names set script = 'Hani' where script = '' and c1_ascii between 19968 and 40959;
--4051
update ror.non_latin_names set script = 'Yiii' where script = '' and c1_ascii between 40960 and 42127;
--0
update ror.non_latin_names set script = 'Saur' where script = '' and c1_ascii between 43136 and 43231;
--0
update ror.non_latin_names set script = 'Java' where script = '' and c1_ascii between 43392 and 43487;
--0
update ror.non_latin_names set script = 'Cham' where script = '' and c1_ascii between 43520 and 43615;
--0
update ror.non_latin_names set script = 'Tavt' where script = '' and c1_ascii between 43648 and 43743;
--0
update ror.non_latin_names set script = 'Mtei' where script = '' and c1_ascii between 43968 and 44031;
--0
update ror.non_latin_names set script = 'Hang' where script = '' and c1_ascii between 44032 and 55215;
--1253
-- additional hangu 'enclosed cjk characters'
update ror.non_latin_names set script = 'Hang' where script = '' and c1_ascii between 12800 and 12830;
--1
update ror.non_latin_names set script = 'Rohg' where script = '' and c1_ascii between 68864 and 68927;
--0
update ror.non_latin_names set script = 'Cakm' where script = '' and c1_ascii between 69888 and 69967;
--0
update ror.non_latin_names set script = 'Sind' where script = '' and c1_ascii between 70320 and 70399;
--0
update ror.non_latin_names set script = 'Newa' where script = '' and c1_ascii between 70656 and 70783;
--0
update ror.non_latin_names set script = 'Wara' where script = '' and c1_ascii between 71840 and 71935;
--0
update ror.non_latin_names set script = 'Pauc' where script = '' and c1_ascii between 72384 and 72447;
--0
update ror.non_latin_names set script = 'Gong' where script = '' and c1_ascii between 73056 and 73135;
--0
update ror.non_latin_names set script = 'Mroo' where script = '' and c1_ascii between 92736 and 92783;
--0
update ror.non_latin_names set script = 'Hmng' where script = '' and c1_ascii between 92928 and 93071;
--0
update ror.non_latin_names set script = 'Plrd' where script = '' and c1_ascii between 93952 and 94111;
--0
update ror.non_latin_names set script = 'Mend' where script = '' and c1_ascii between 124928 and 125151;
--0
update ror.non_latin_names set script = 'Adlm' where script = '' and c1_ascii between 125184 and 125279;
--0

/*
select * from ror.non_latin_names
order by name;

select * from ror.non_latin_names
where script = '';

*/




