

---------------------------------------------------------------
-- German
---------------------------------------------------------------

update ror.all_names set language = 'de'
where (name ilike '%klinikum%'
or name ilike '%Universität%'
or name ilike '%Forschung%'
or name ilike '%zentrum%'
or name ilike '%fabrik%'
or name ilike '%für%')
and country_code in ('DE', 'AT', 'CH', 'LI', 'LU')
and language is null;

--1020

update ror.all_names set language = 'de'
where (name ilike '%krankenhaus%'
or name ilike '%hochschule%'
or name ilike '%Österreich%'
or name ilike 'bundes%'
or name ilike 'kantons%'
or name ilike '%deutsch%')
and country_code in ('DE', 'AT', 'CH', 'LI', 'LU')
and language is null;

--396

update ror.all_names set language = 'de'
where (name ilike '%allgemeine%'
or name ilike '%gemeinschaft%'
or name ilike '%asklepios%'
or name ilike '%bayerische%')
and country_code in ('DE', 'AT', 'CH', 'LI', 'LU')
and language is null;

--31

update ror.all_names set language = 'de'
where (name ilike '%Institut %'
or name ilike '%Institut')
and country_code in ('DE', 'AT', 'LI')
and language is null;

--98

update ror.all_names set language = 'de'
where (name ilike '%Academia %'
or name ilike '%klinik%'
or name ilike '%kliniken%')
and country_code in ('DE', 'AT', 'CH', 'LI', 'LU')
and language is null;

--171

update ror.all_names set language = 'de'
where (name ilike '% der %'
or name ilike '%Ökologi%'
or name ilike '%Historischer%'
or name ilike '% am %'
or name ilike '%Bibliothek%')
and country_code in ('DE', 'AT', 'CH', 'LI', 'LU')
and language is null;

--53

update ror.all_names set language = 'de'
where (name ilike '%Bibliotheca%'
or name ilike '%Biblioteca%'
or name ilike '%Biologische%'
or name ilike '%schaft%'
or name ilike '%stiftung%')
and country_code in ('DE', 'AT', 'CH', 'LI', 'LU')
and language is null;

--180

update ror.all_names set language = 'de'
where (name ilike '%emisches%'
or name ilike '% und %'
or name ilike '%schulen%'
or name like 'DRK%'
or name ilike '%Verein%'
or name ilike '%Zahnärzte%')
and country_code in ('DE', 'AT', 'CH', 'LI', 'LU')
and language is null;

--52

update ror.all_names set language = 'de'
where (name ilike '%Kommunikation%'
or name ilike '%Apotheke%'
or name ilike '%Endokrinologikum%'
or name like 'Europäische%'
or name ilike '%Fachverband%')
and country_code in ('DE', 'AT', 'CH', 'LI', 'LU')
and language is null;

--9

update ror.all_names set language = 'de'
where (name ilike '%Feuerwehr%'
or name ilike '%Förderverein%'
or name ilike '%Generaldirektion%'
or name like 'Germanisches%'
or name like 'Schweizerische%'	 
or name ilike '%Gesundheit%')
and country_code in ('DE', 'AT', 'CH', 'LI', 'LU')
and language is null;

--15

update ror.all_names set language = 'de'
where (name ilike '%terapi%'
or name ilike '%Hochschul%'
or name ilike '%Hoffnungsbaum%'
or name like 'vereinigung%'
or name ilike '%krebs%'
or name ilike '%kinder%')
and country_code in ('DE', 'AT', 'CH', 'LI', 'LU')
and language is null;

--13

update ror.all_names set language = 'de'
where (name ilike '%landes%'
or name ilike '%Medizinische%'
or name ilike '%kabinett%'
or name like '%Neue%'
or name like '%Stadt%'
or name like '%Staats%'
or name ilike '%ziologische%')
and country_code in ('DE', 'AT', 'CH', 'LI', 'LU')
and language is null;

--58


---------------------------------------------------------------
-- Italian 
---------------------------------------------------------------

update ror.all_names set language = 'it'
where (name ilike '%istituto%'
or name ilike '%accademia%'
or name ilike '%agenzia%'
or name ilike '%azienda%'
or name ilike '%associazione%'
or name ilike '%conservatorio%' 
) and language is null;

--381

update ror.all_names set language = 'it'
where (name ilike '%consorzio%' 
or name ilike '%fondazione%' 
or name ilike 'gruppo%' 
or name ilike '%ospedale %' 
or name ilike '%policlinico %' 
or name ilike '%società %' 
) and language is null;

--308

update ror.all_names set language = 'it'
where name ilike '%centro%' and country_code in ('IT')
and language is null;

--45

update ror.all_names set language = 'it'
where name ilike '%Universitari%' and country_code in ('IT')
and language is null;

--4


---------------------------------------------------------------
-- Spanish 
---------------------------------------------------------------

update ror.all_names set language = 'es'
where (name ilike '%instituto%' 
or name ilike '%centro%' 
or name ilike '%nacional%' 
or name ilike '%universidades%' 
or name ilike '%universidad%' 
or name ilike '%esperança%' 
or name ilike '%universitari%' 
or name ilike '%ciencia%' 
)
and country_code in ('AR', 'BO', 'CL', 'CO', 'CR', 'CU', 'DO', 'EC', 'ES', 'GQ', 'GT', 'HN', 'MX', 'NI', 'PE', 'PY', 'UY', 'VE')
and language is null;

--1697

update ror.all_names set language = 'es'
where (name ilike '%Asociación%'
or name ilike '%Fundación%'
or name ilike '%Ministerio%'
or name ilike '%Servicio%'
or name ilike '%Corporación%'
or name ilike '%Institución%'
or name ilike '%salud%'
)
and country_code in ('AR', 'BO', 'CL', 'CO', 'CR', 'CU', 'DO', 'EC', 'ES', 'GQ', 'GT', 'HN', 'MX', 'NI', 'PE', 'PY', 'UY', 'VE')
and language is null;

--238

update ror.all_names set language = 'es'
where (name ilike '%biblioteca%'
or name ilike '%insituto%'
or name ilike '%escuela%'   
or name ilike '%colegio%' 
or name ilike '%comisión%' 
)
and country_code in ('AR', 'BO', 'CL', 'CO', 'CR', 'CU', 'DO', 'EC', 'ES', 'GQ', 'GT', 'HN', 'MX', 'NI', 'PE', 'PY', 'UY', 'VE')
and language is null;

--58


---------------------------------------------------------------
-- Portuguese 
---------------------------------------------------------------

update ror.all_names set language = 'pt'
where (name ilike '%instituto%' 
or name ilike '%centro%'
or name ilike '%nacional%'   
or name ilike '%universidades%' 
or name ilike '%universidade%' 
or name ilike '%esperança%' 
or name ilike '%universitari%' 
or name ilike '%ciencia%' 
)
and country_code in ('PT', 'BR', 'CV', 'AO', 'MZ', 'GW', 'ST', 'TL')
and language is null;

--716

update ror.all_names set language = 'pt'
where (name ilike '%Associação%'
or name ilike '%Fundação%'
or name ilike '%Fundacao%'
or name ilike '%Ministério%'
or name ilike '%Faculdade%'
or name ilike '%sociedade%'
)
and country_code in ('PT', 'BR', 'CV', 'AO', 'MZ', 'GW', 'ST', 'TL')
and language is null;

--275

update ror.all_names set language = 'pt'
where (name ilike '%laboratório%'
or name ilike '%academia%'
or name ilike '%escola%'   
or name ilike '%departamento%' 
or name ilike '%secretaria%' 
)
and country_code in ('PT', 'BR', 'CV', 'AO', 'MZ', 'GW', 'ST', 'TL')
and language is null;

--87

update ror.all_names set language = 'pt'
where (name ilike '%museu%'
or name ilike '%governo%'
or name ilike '%prefeitura%'   
or name ilike '%companhia%' 
or name ilike 'INCT de%' 
)
and country_code in ('PT', 'BR', 'CV', 'AO', 'MZ', 'GW', 'ST', 'TL')
and language is null;

--47

---------------------------------------------------------------
-- galician exception
---------------------------------------------------------------

update ror.all_names set language = 'gl'
where name ilike '%Universidade de Vigo%';

--1

