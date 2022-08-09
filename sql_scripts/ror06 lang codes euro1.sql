
-- Norway

update ror.all_names set language = 'no'
where (name ilike '%norsk%' 
or name ilike '%norge%'  
or name ilike '%det %' 
or name ilike '%forskning%' 
or name ilike '%institutt%' 
or name ilike '%heise %'   
or name ilike '%senter%' 
or name ilike '%direktoratet%' 
)
and country_code = 'NO'
and language is null;

--176

update ror.all_names set language = 'no'
where (name ilike '%foreningen%'
or name ilike '%forening%'  
or name ilike '%kommune%'  
or name ilike '%kommunale%' 
or name ilike '%sykehus%' 
or name ilike '%skole%' 
or name ilike '%skule%' 
or name ilike '%universitet%' 
)
and country_code = 'NO'
and language is null;

--139

update ror.all_names set language = 'no'
where (name ilike '% i %'
or name ilike '%kunnskaps%'  
or name ilike '%råd%'  
or name ilike '%registeret%' 
or name ilike '%kunnskaps%' 
or name ilike '%departementet%' 
or name ilike '%bibliotek%' 
or name ilike '%musea%' 
or name ilike '%havn%' 	   
)
and country_code = 'NO'
and language is null;

-- 25

update ror.all_names set language = 'no'
where (name ilike '%teknolog%'
or name ilike '%regionen%'  
or name ilike '%verket%'  
or name ilike '%klinikken%' 
or name ilike '%dyrehospital%' 
or name ilike '%sverk%' 
or name ilike '%svaret%' 
or name ilike '%sijte%' 
or name ilike '%ø%' 	   
)
and country_code = 'NO'
and language is null;

--52

update ror.all_names set language = 'no'
where (name ilike '%Eksportutvalget for fisk%'  
or name ilike '%Elvene Rundt Trondheimsfjorden%'  
or name ilike '%Guovdageaidnu%' 
or name ilike '%Halvors%' 
or name ilike '%Hermetikken Næringshage%' 
or name ilike '%Jærmuseet%' 
or name ilike '%Sjukehus%' 
or name ilike '%stilsynet%' 
)
and country_code = 'NO'
and language is null;

--7

update ror.all_names set language = 'no'
where (name ilike '%Sámiráđđi'  
or name ilike '%Samordna opptak%' 
or name ilike '%Valdres Folkemuseum%' 
 
)
and country_code = 'NO'
and language is null;

--3


---------------------------------------------------------------
-- Swedish
---------------------------------------------------------------

update ror.all_names set language = 'sv'
where (name ilike '%stiftelse%' 
or name ilike '%kliniken%'  
or name ilike '%fonden%'
or name ilike '%sjukhus%'
or name ilike '%forskning%'
or name ilike '%institutet%'
or name ilike '%centrum%'
)
and country_code = 'SE'
and language is null;

--137

update ror.all_names set language = 'sv'
where (name ilike '%universitetet%' 
or name ilike '%förbundet%'  
or name ilike '%sverige%'
or name ilike '%telsern%'
or name ilike '%landsting%'
or name ilike '%lasarett%'
or name ilike '%minnesfond%'
)
and country_code = 'SE'
and language is null;

--41

update ror.all_names set language = 'sv'
where (name ilike '%svensk%' 
or name ilike '%konstmuseum%'  
or name ilike '%kommun%'
or name ilike '%ningen%'
or name ilike '%huset%'
or name ilike '%ringen%'
or name ilike '% i %'
)
and country_code = 'SE'
and language is null;

--43 

update ror.all_names set language = 'sv'
where (name ilike '%Aleris Hälsocentral Bollnäs%' 
or name ilike '%Avfallshantering Östra Skaraborg%'  
or name ilike '%Centrallasarettet Växjö%'
or name ilike '%Göteborgs Tandläkare Sällskap%'
or name ilike '%Hälsans Nya Verktyg%'
or name ilike '%Industriella UtvecklingsCentra%'
or name ilike '%Länsstyrelsen Västra Götalands län%'
or name ilike '%Praktikertjänst%'
)
and country_code = 'SE'
and language is null;

--7

update ror.all_names set language = 'sv'
where (name ilike '%Rinkebyakademien%' 
or name ilike '%Skandinaviska Kiropraktorhögskolan%'  
or name ilike '%Specialpedagogiska Skolmyndigheten%'
or name ilike '%Skånes Livsmedelsakademi%'
or name ilike '%TransportForsK%'
or name ilike '%Tunga Fordona%'
or name ilike '%Vårdcentralen Silentzvägen%'
or name ilike '%Wienerbageriet%'
)
and country_code = 'SE'
and language is null;

--7


---------------------------------------------------------------
-- Danish
---------------------------------------------------------------

update ror.all_names set language = 'da'
where (name ilike '% fond' 
or name ilike '% fonde'  
or name ilike '%fonden%'
or name ilike '%kommune%'
or name ilike '%sygehus%'
or name ilike '%dansk%'
or name ilike '%foreningen%'
)
and country_code = 'DK'
and language is null;

--78

update ror.all_names set language = 'da'
where (name ilike '% i %' 
or name ilike '%danmarks%'  
or name ilike '%klinik%'
or name ilike '% og %'
or name ilike '%skole%'
or name ilike '%regionshospital%'
or name ilike '%rigshospitalet%'
)
and country_code = 'DK'
and language is null;

--27

update ror.all_names set language = 'da'
where (name ilike '%teknolog%' 
or name ilike '%universitet%'  
or name ilike '%fondet%'
or name ilike '%arkiv%'
or name ilike '%tekniske%'
or name ilike '%hospitaler%'
or name ilike '%privathospital%'
)
and country_code = 'DK'
and language is null;

--10

update ror.all_names set language = 'da'
where (name ilike '%midt%' 
or name ilike '%nordvest%'  
or name ilike '%biblioteket%'
or name ilike '%gigthospital%'
or name ilike '%hospitalsenheden%'
or name ilike '%styrelsen%'
or name ilike '%nationalbanken%'
)
and country_code = 'DK'
and language is null;

--10

update ror.all_names set language = 'da'
where (name ilike '%Kræftens Bekæmpelse%' 
or name ilike '%Ensomme Gamles Vaern%'  
or name ilike '%Kriminalforsorgen%'
or name ilike '%Marselisborgcentret%'
or name ilike '%Ny Carlsberg Glyptotek%'
)
and country_code = 'DK'
and language is null;

--5


---------------------------------------------------------------
-- Finnish
---------------------------------------------------------------

update ror.all_names set language = 'fi'
where (name ilike '%universitetet%' 
or name ilike '%institutet%'  
or name ilike '%akademi%'
or name ilike '%säätiö%'
or name ilike '%sjukhus%'
or name ilike '%forsknings%'
or name ilike '%sairaala%'
)
and country_code = 'FI'
and language is null;

--47

update ror.all_names set language = 'fi'
where (name ilike '%suomen%' 
or name ilike '%yliopisto%'  
or name ilike '%stiftelsen%'
or name ilike '%liitto%'
or name ilike '%centrum%'
or name ilike '%keskus%'
or name ilike '%centralen%'
)
and country_code = 'FI'
and language is null;

--25

update ror.all_names set language = 'fi'
where (name ilike '% ja %' 
or name ilike '% och %'  
or name ilike '%laitos%'
or name ilike '%musseura%'
or name ilike '%räjät%'
or name ilike '%topiiri%'
or name ilike '%korkeakoul%'
)
and country_code = 'FI'
and language is null;

--21

update ror.all_names set language = 'fi'
where (name ilike '%Ab Lukko Oy%' 
or name ilike '%Amer-Yhtymä%'  
or name ilike '%kuntayhtymä%'
or name ilike '%Syöpäyhdisty%'
or name ilike '%Osakeyhtiö Kone Aktiebolag%'
or name ilike '%Pellervo Taloustutkimus%'
or name ilike '%Tekonivelsairaala Coxa%'
or name ilike '%Trafikverket%'  
or name ilike '%Työsuojelurahasto%'
or name ilike '%Ymparisto%'
)
and country_code = 'FI'
and language is null;

--6
