
---------------------------------------------------------------
-- English
---------------------------------------------------------------

update ror.all_names set language = 'en'
where (name ilike '%university%'
or name ilike '%universities%'       
or name ilike '%institute for%'
or name ilike '%institute of%'
or name ilike '% institute%'	   
) and language is null;

-- 22584

update ror.all_names set language = 'en'
where (name ilike '%research centre%'
or name ilike '%research center%'
or name ilike '%ministry of%'
or name ilike '%ministry for%'
) and language is null;

--1528

update ror.all_names set language = 'en'
where (name ilike '%academy%'
or name ilike '%academies%'
or name ilike '%association of %'
or name ilike '%association for %'
or name ilike '%laboratory%'	  
or name ilike '%laboratories%'
or name ilike '%observatory%'
) and language is null;

--3104

update ror.all_names set language = 'en'
where (name ilike '%centre of%'
or name ilike '%centre for%'
or name ilike '%center for%'
or name ilike '%center of%'
or name ilike '% center%'
or name ilike '% centre%'
) and language is null;

--4977

update ror.all_names set language = 'en'
where (name ilike '%society%'
or name ilike '%department of%'
or name ilike '%department for%'
or name ilike 'health %'
or name ilike '%regional %'
) and language is null;

--3348

update ror.all_names set language = 'en'
where (name ilike '%clinical%'
or name ilike '%foundation%'
or name ilike '%european%'
or name ilike '%world%'   
or name ilike '%general hospital%'
) and language is null;

--5238

update ror.all_names set language = 'en'
where (name ilike '%college%'
or name ilike '%school%'
or name ilike '%division%'
or name ilike '%factory%'
or name ilike '%government%'
) and language is null;

--7176

update ror.all_names set language = 'en'
where (name ilike '%northern%'
or name ilike '%southern%'
or name ilike '%eastern%'
or name ilike '%western%'
or name ilike '%global%'
or name ilike '%wikimedia%'
) and language is null;

--472

update ror.all_names set language = 'en'
where (name ilike '%action %'
or name ilike '%advanced %'
or name ilike '%african %'
or name ilike '%agricultural %'
or name ilike '%air %'
or name ilike '%applied %'
or name ilike '%arab%'
) and language is null;

--414

update ror.all_names set language = 'en'
where (name ilike '%county%'
or name ilike '%council%'
or name ilike '%authority%'
or name ilike '%municipality%'
or name ilike '% company%'
or name ilike '% trust%'
or name ilike '%library%'
) and language is null;

--2725

update ror.all_names set language = 'en'
where (name ilike '%coalition%'
or name ilike '%technology%'
or name ilike '%knowledge%'
or name ilike '%museum%'
or name ilike '% agency%'
or name ilike '%directorate for %'
or name ilike '%cluster%'
) and language is null;

--2009

update ror.all_names set language = 'en'
where (name ilike '%alberta %'
or name ilike '%british %'
or name ilike '%calgary %'
or name ilike '%canada %'
or name ilike '%manitoba %'
or name ilike '%new bruinswick %'
or name ilike '%new brunswick %'
or name ilike '%newfoundland %'
or name ilike '%nova scotia %'
or name ilike '%ontario %'
or name ilike 'quebec %'
or name ilike 'québec %'
or name ilike '%saskatchewan %'   
) and language is null;

--185
