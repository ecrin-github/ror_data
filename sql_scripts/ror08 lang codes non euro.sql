
---------------------------------------------------------------
-- Turkish
---------------------------------------------------------------

update ror.all_names set language = 'tr'
where (name ilike '%Hastanesi%' 
or name ilike '%Üniversitesi%'  
or name ilike '%Universitesi%'
or name ilike '%Hastahanesi%'
or name ilike '%Türkiye%'
or name ilike '%Yüksek%'
)
and country_code = 'TR'
and language is null;

--133

update ror.all_names set language = 'tr'
where (name ilike '% ve %' 
or name ilike '% Tıp %'  
or name ilike '%Merkezi%'
or name ilike '%Türk%'
or name ilike '%Derneği%'
or name ilike '%Enstitüsü%'
)
and country_code = 'TR'
and language is null;

--16

update ror.all_names set language = 'tr'
where (name ilike '%Galata%' 
or name ilike '%Anadolu%'  
or name ilike '%Kalkınma%'
or name ilike '%Sağlık%'
or name ilike '%bilgem%'
or name ilike '%Dîcleyê%'
)
and country_code = 'TR'
and language is null;

--10


---------------------------------------------------------------
-- Japanese
---------------------------------------------------------------

update ror.all_names set language = 'ja'
where (name ilike '%Daigaku%' 
or name ilike '%Daigakkō%'  
or name ilike '%Kabushiki%'
or name ilike '%Nippon%'
or name ilike '%Kaihatsu%'
or name ilike '%Bijutsukan%'
)
and country_code = 'JP'
and language is null;

--470

update ror.all_names set language = 'ja'
where (name ilike '%kenritsu%' 
or name ilike '%Dokuritsu%'  
or name ilike '% Kikō%'
or name ilike '% Gakkō%'
or name ilike '%Kaihatsu%'
or name ilike '%-shō%'
)
and country_code = 'JP'
and language is null;

--45

update ror.all_names set language = 'ja'
where (name ilike '%Bunka Senta%' 
or name ilike '%Denryoku%'  
or name ilike '%Gakuen%'
or name ilike '%kagaku-kan%'
or name ilike '%Bungaku-kan%'
or name ilike '%-chō%'
)
and country_code = 'JP'
and language is null;

--74

update ror.all_names set language = 'ja'
where (name ilike '%大阪北逓信病院%' 
or name ilike '%大阪市立東洋陶磁美術館%'  
or name ilike '%釧路市立郷土博物館%'
or name ilike '%麻生電子ビジネス専門学校%'
or name ilike '%kotogakko%'
or name ilike '%mongakkō%'
or name ilike '%mongakkou%'   
)
and country_code = 'JP'
and language is null;

--11

update ror.all_names set language = 'ja'
where (name ilike '%Fukui%' 
or name ilike '%Hayashibara%'  
or name ilike '%Inuyamachuobyoin%'
or name ilike '%Kahoku%'
or name ilike '%Kinikyochuobyoin%'
or name ilike '%Kenkyuujo%'
)
and country_code = 'JP'
and language is null;

--23

update ror.all_names set language = 'ja'
where (name ilike '%Kōkō%' 
or name ilike '%shiritsu%'  
or name ilike '%kenkyūjo%'
or name ilike '%Kenkei%'
or name ilike '%Kyōdō%'
or name ilike '%kenkyūsho%'
)
and country_code = 'JP'
and language is null;

--14

update ror.all_names set language = 'ja'
where (name ilike '%Nihon%' 
or name ilike '%Kinzoku%'  
or name ilike '%Kyorindo%'
or name ilike '%Kenkyū%'
or name ilike '%Kokudo%'
or name ilike '%Jitsugyo%'
)
and country_code = 'JP'
and language is null;

--23

update ror.all_names set language = 'ja'
where (name ilike '%Fukusei%' 
or name ilike '%shiryokan%'  
or name ilike '%Gurūpu%'
or name ilike '%Shimonosekishiritsuchuobyoin%'
or name ilike '%Kenkyuukikou%'
or name ilike '%Kōtōsenmongakkō%'
or name ilike '%Toyokawashiminbyoin%'
or name ilike '%Tsuyama%'
)
and country_code = 'JP'
and language is null;

--17


---------------------------------------------------------------
-- Russian
---------------------------------------------------------------

update ror.all_names set language = 'ru'
where (name ilike '%Universitet%'
or name ilike '%Institut %'
or name ilike '%Institut'
or name ilike '%Oblastnoy%%'
or name ilike '%Gradostroitelstva%'
or name ilike '%Korporatsiya%'
or name ilike '%Akadémiya%'
)
and country_code = 'RU'
and language is null;

--99

update ror.all_names set language = 'ru'
where (name ilike '%Gosudarstvenn%' 
or name ilike '%Moskovskiy%'  
or name ilike '%biblioteka%'
or name ilike '%serossiyskiy%'
or name ilike '%Академия%'
or name ilike '%Белгородский%'
)
and country_code = 'RU'
and language is null;

--15

update ror.all_names set language = 'ru'
where (name ilike '%Federalnyy%' 
or name ilike '%Patologii%'  
or name ilike '%khirurgii%'
or name ilike '%Shkola%'
or name ilike '%Kombinat%'
or name ilike '%Tsentr%'
)
and country_code = 'RU'
and language is null;

--10

update ror.all_names set language = 'ru'
where (name ilike '%Московская%' 
or name ilike '%Институт%'  
or name ilike '%ВНИИ%'
or name ilike '%Г%'
or name ilike '%д%'
or name ilike '%ч%'
)
and country_code = 'RU'
and language is null;

--120

update ror.all_names set language = 'ru'
where (name ilike '%ж%' 
or name ilike '%и%'  
or name ilike '%л%'
or name ilike '%й%'
or name ilike '%б%'
or name ilike '%Ф%'
)
and country_code = 'RU'
and language is null;

--72

update ror.all_names set language = 'ru'
where (name ilike '%Gidrometcentr%' 
or name ilike '%Tsentr%'  
or name ilike '%Rezinovoy%'
or name ilike '%Rospotrebnadzor%'
or name ilike '%Rosleskhoz%'
or name ilike '%Rosinformagrotekh%'
or name ilike '%Nii%'
)
and country_code = 'RU'
and language is null;

--226


---------------------------------------------------------------
-- Indonesian 
---------------------------------------------------------------

update ror.all_names set language = 'id'
where (name ilike '%universitas%' 
or name ilike '%Akademi %'  
or name ilike '%Institut %'
or name ilike '%Politeknik%'
or name ilike '%Rumah Sakit%'
or name ilike '%Sekolah Tinggi%'
)
and country_code = 'ID'
and language is null;

--398

update ror.all_names set language = 'id'
where (name ilike '%Yayasan%' 
or name ilike '%Pengembangan%'  
or name ilike '%Kampus %'
or name ilike '%Teknologi%'
or name ilike '%Proefstation%'
or name ilike '%Konservatori%'
)
and country_code = 'ID'
and language is null;

--13

update ror.all_names set language = 'id'
where (name ilike '%Akademik%' 
or name ilike '%Kemdikbud%'  
or name ilike '%Kementerian %'
or name ilike '%Sumberdaya%'
or name ilike '%Yayasan%'
or name ilike '%Harapan%'
or name ilike '%Tinggi%'
)
and country_code = 'ID'
and language is null;

--9

