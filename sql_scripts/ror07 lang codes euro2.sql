

---------------------------------------------------------------
-- Dutch
---------------------------------------------------------------

update ror.all_names set language = 'nl'
where (name ilike '%ziekenhuis%' 
or name ilike '%ziekenhuizen%'  
or name ilike '%kliniek%'
or name ilike '%centrum%'
or name ilike '% voor %'
or name ilike '%groep%'
or name ilike '%stichting%'
)
and country_code in ('NL', 'BE')
and language is null;

--296

update ror.all_names set language = 'nl'
where (name ilike '%nederlandsche%' 
or name ilike '%nederlandse%'  
or name ilike '%instituut%'
or name ilike '%specialisten%'
or name ilike '%fonds%'
or name ilike '%gemeente%'
or name ilike '%kundige%'
)
and country_code in ('NL', 'BE')
and language is null;

--74

update ror.all_names set language = 'nl'
where (name ilike 'GGD%' 
or name ilike 'GGz%'  
or name ilike '%hogeschool%'
or name ilike '%huisarts%'
or name ilike '%universiteit%'
or name ilike '%maatschap%'
or name ilike '%gasthuis%'
)
and country_code in ('NL', 'BE')
and language is null;

--52

update ror.all_names set language = 'nl'
where (name ilike '%vereniging%' 
or name ilike '%medisch%'  
or name ilike '%zorg%'
or name ilike '%meenschap%'
or name ilike '%stedelijk%'
or name ilike '%gezondheid%'
or name ilike '%groot%'
)
and country_code in ('NL', 'BE')
and language is null;

--45

update ror.all_names set language = 'nl'
where (name ilike '%Astronomisch%' 
or name ilike '%Belastingdienst%'  
or name ilike '%Christelijk%'
or name ilike '%Hoogstraat%'
or name ilike '%Viersprong%'
or name ilike '%Uitvoering%'
or name ilike '%Erfgoed%'
or name ilike '%Verslavingszorg%'
)
and country_code in ('NL', 'BE')
and language is null;

--8

update ror.all_names set language = 'nl'
where (name ilike '%Erfelijke%' 
or name ilike '%Vereniging%'  
or name ilike '%Katholieke%'
or name ilike '%Landelijk%'
or name ilike '%Orthopedische%'
or name ilike '%Opleidingen%'
or name ilike '%Praktijk%'
or name ilike '%Regieorgaan%'
or name ilike '%Vogelonderzoek%'
)
and country_code in ('NL', 'BE')
and language is null;

--8


---------------------------------------------------------------
-- Czech
---------------------------------------------------------------

update ror.all_names set language = 'cs'
where (name ilike '%akademie%' 
or name ilike '%asociace%'  
or name ilike '%centrum%'
or name ilike '%Česká%'
or name ilike '%Česko%'
or name ilike '%Český%'
or name ilike '%Dětské%'
)
and country_code in ('CZ')
and language is null;

--86

update ror.all_names set language = 'cs'
where (name ilike '%Dům%' 
or name ilike '%Fakultní%'  
or name ilike '%Ústav%'
or name ilike '%Institut pro%'
or name ilike '%Krajská%'
or name ilike '%Městská%'
or name ilike '%Nadace%'
)
and country_code in ('CZ')
and language is null;

--58

update ror.all_names set language = 'cs'
where (name ilike '%Národní%' 
or name ilike '%Nemocnice%'  
or name ilike '%Oblastní%'
or name ilike '%Poliklinika%'
or name ilike '%Povodí%'
or name ilike '%Rybářství%'
or name ilike '%Sdružené%'
)
and country_code in ('CZ')
and language is null;

--47

update ror.all_names set language = 'cs'
where (name ilike '%Slezská%' 
or name ilike '%Společnost%'  
or name ilike '%Správa%'
or name ilike '%Střední%'
or name ilike '%Svaz%'
or name ilike '%Muzeum%'
or name ilike '%Vysoká%'
)
and country_code in ('CZ')
and language is null;

--52

update ror.all_names set language = 'cs'
where (name ilike '%Vyšší%' 
or name ilike '%Výzkumná%'  
or name ilike '%Základní%'
or name ilike '%Zdravotnická%'
or name ilike '%Zemědělské%'
or name ilike '%Skola%'
or name ilike '%Organizace%'
)
and country_code in ('CZ')
and language is null;

--20

update ror.all_names set language = 'cs'
where (name ilike '%Nakladatelství%' 
or name ilike '%Agentuře%'  
or name ilike '%Architektonická%'
or name ilike '%Dalšího%'
or name ilike '%Nemocných%'
or name ilike '%sdružení%'
or name ilike '%Studijní%'
)
and country_code in ('CZ')
and language is null;

--14

update ror.all_names set language = 'cs'
where (name ilike '%Železárny%' 
or name ilike '%iniciativa%'  
or name ilike '%Asociací%'
or name ilike '%dobré%'
or name ilike '%provozní%'
or name ilike '%Kamene%'
)
and country_code in ('CZ')
and language is null;

--3


---------------------------------------------------------------
-- Slovak
---------------------------------------------------------------

update ror.all_names set language = 'sk'
where (name ilike '%Agentúra%' 
or name ilike '%Akadémia%'  
or name ilike '%Akademická%'
or name ilike '%Asociácia%'
or name ilike '%Detská%'
or name ilike '%Európske%'
or name ilike '%Fakultná%'
)
and country_code = 'SK'
and language is null;

--13

update ror.all_names set language = 'sk'
where (name ilike '%ústav%' 
or name ilike '%Gymnázium%'  
or name ilike '%Inštitút%'
or name ilike '%Národné%'
or name ilike '%Národný%'
or name ilike '%Nemocnica%'
or name ilike '%klinika%'
)
and country_code = 'SK'
and language is null;

--46

update ror.all_names set language = 'sk'
where (name ilike '%Slovensk%' 
or name ilike '%Štátne%'
or name ilike '%Stredná%'
or name ilike '%múzeum%'
or name ilike '%opravovne%'
or name ilike '%Stredoeurópsky%'
or name ilike '%družstvo%'
)
and country_code = 'SK'
and language is null;

--20

update ror.all_names set language = 'sk'
where (name ilike '%Technický%' 
or name ilike '%škola%'  
or name ilike '%Hvezdáreň%'
or name ilike '%centrum%'
or name ilike '%Inžinierske%'
or name ilike '%Vyšné%'
)
and country_code = 'SK'
and language is null;

--14


---------------------------------------------------------------
-- Polish
---------------------------------------------------------------

update ror.all_names set language = 'pl'
where (name ilike '%Agencja%' 
or name ilike '%Akademia%'  
or name ilike '%Akademii%'
or name ilike '%Centrum%'
or name ilike '%Dolnośląsk%'
or name ilike '%Instytut%'
or name ilike '%Fundacja%'
)
and country_code = 'PL'
and language is null;

--173

update ror.all_names set language = 'pl'
where (name ilike '%Fundusz%' 
or name ilike '%Gdańska%'  
or name ilike '%Szkoła%'
or name ilike '%Grupa%'
or name ilike '%Polsk%'
or name ilike '%Hospicjum%'
or name ilike '%Instytut%'
)
and country_code = 'PL'
and language is null;

--99

update ror.all_names set language = 'pl'
where (name ilike '%Laboratorium%' 
or name ilike '%Muzeum%'  
or name ilike '%Okręgow%'
or name ilike '%Ośrodek%'
or name ilike '%Wydział%'
or name ilike '%Uniwersytet%'
)
and country_code = 'PL'
and language is null;

--19

update ror.all_names set language = 'pl'
where (name ilike '%Publiczny%' 
or name ilike '%Szpital%'  
or name ilike '%badań%'
or name ilike '%Śląskie%'
or name ilike '%Stowarzyszenie%'
or name ilike '%Uczelnia%'
)
and country_code = 'PL'
and language is null;

--42

update ror.all_names set language = 'pl'
where (name ilike '%Wojewódzki%' 
or name ilike '%Wojskowa%'  
or name ilike '%Agencji%'
or name ilike '%Organizacj%'
or name ilike '%Instytuc%'
or name ilike '%Zakład%'
)
and country_code = 'PL'
and language is null;

--5

update ror.all_names set language = 'pl'
where (name ilike '%Elektrycznych%' 
or name ilike '%Akademicka%'  
or name ilike '%Ogród%'
or name ilike '%Szynowe%'
or name ilike '%Energetyczny%'
or name ilike '%Miasta%'
or name ilike '%Innowacji%'
or name ilike '%Wszechnica%'
)
and country_code = 'PL'
and language is null;

--5


---------------------------------------------------------------
-- Croatian
---------------------------------------------------------------

update ror.all_names set language = 'hr'
where (name ilike '%Agencija%' 
or name ilike '%Hrvatsk%'  
or name ilike '%Institut %'
or name ilike '%Klinička%'
or name ilike '% za %'
or name ilike '%Ministarstvo%'
)
and country_code = 'HR'
and language is null;

--25

update ror.all_names set language = 'hr'
where (name ilike '%Opća%' 
or name ilike '%akademija%'  
or name ilike '%Tehničko%'
or name ilike '%Veleučilište%'
or name ilike '%Škola%'
or name ilike '%muzej%'
or name ilike '%Imunološki%'
)
and country_code = 'HR'
and language is null;

--9

---------------------------------------------------------------
-- Serbian
---------------------------------------------------------------

update ror.all_names set language = 'sr'
where (name ilike '%Univerzitet%' 
or name ilike '%Akademija%'  
or name ilike '%Klinički%'
or name ilike '% za %'
or name ilike '%Centar%'
or name ilike '%laboratorijsk%'
or name ilike '%Ministarstvo%'
or name ilike '%Zavod%'
or name ilike '%Универзитет%'
)
and country_code = 'RS'
and language is null;

--35

---------------------------------------------------------------
-- Slovenia
---------------------------------------------------------------

update ror.all_names set language = 'sl'
where (name ilike '%Agencija%' 
or name ilike '%Slovenije%'  
or name ilike '%Odličnosti%'
or name ilike '% za %'
or name ilike '%Šola%'
or name ilike '%Inštitut%'
)
and country_code = 'SI'
and language is null;

--75

update ror.all_names set language = 'sl'
where (name ilike '%Ekonomsk%' 
or name ilike '%Tehnološk%'  
or name ilike '%Zavod%'
or name ilike '%tehnologije%'
or name ilike '%muzej%'
or name ilike '%Klinika%'
)
and country_code = 'SI'
and language is null;

--6

update ror.all_names set language = 'sl'
where (name ilike '%Slovensk%' 
or name ilike '%Šolski%'  
or name ilike '%Splošna%'
or name ilike '%Univerzitetn%'
or name ilike '%Maribor%'
or name ilike '%Zdravstveni%'
)
and country_code = 'SI'
and language is null;

--20

update ror.all_names set language = 'sl'
where (name ilike '%bolnišnica%' 
or name ilike '%Celje%'  
or name ilike '%informatika%'
or name ilike '%eksperimentov%'
or name ilike '%ekološki%'
or name ilike '%Ključ%'
or name ilike '%Potniški%'
or name ilike '%Kemičnih%'
or name ilike '%Videm%'
)
and country_code = 'SI'
and language is null;

--9

---------------------------------------------------------------
-- Albanian
---------------------------------------------------------------

update ror.all_names set language = 'sq'
where name ilike '%Spitali Universitar%' 
or name ilike '%Sigurisë Ushqimore%' 
and language is null;

--2


---------------------------------------------------------------
-- Romania
---------------------------------------------------------------

update ror.all_names set language = 'ro'
where (name ilike '%Academia%' 
or name ilike '%Asociația%'  
or name ilike '%Asociatia%'
or name ilike '%Romana%'
or name ilike '%Român%'
or name ilike '%Romînă%'
)
and country_code = 'RO'
and language is null;

--16

update ror.all_names set language = 'ro'
where (name ilike '%Naţional%' 
or name ilike '%Nationala%'  
or name ilike '%Biblioteca%'
or name ilike '%Fundația%'
or name ilike '%pentru%'
or name ilike '%Institutul%'
or name ilike '%Tudományegyetem%'
or name ilike '%Comerț%'
)
and country_code = 'RO'
and language is null;

--51

update ror.all_names set language = 'ro'
where (name ilike '%Ministerul%' 
or name ilike '%Spitalul%'  
or name ilike '%Universitatea%'
or name ilike '%Clinica%'
or name ilike '%Urgenţă%'
or name ilike '%Colegiul%'
or name ilike '%Poliției%'
or name ilike '%Regia%'
)
and country_code = 'RO'
and language is null;

--62

---------------------------------------------------------------
-- Bulgaria
---------------------------------------------------------------

update ror.all_names set language = 'bg'
where (name ilike '%Akademiya%' 
or name ilike '%organichna%'  
or name ilike '%universitet%'
or name ilike '% za %'
or name ilike '%Ministerstvo%'
or name ilike '%Варна%'
)
and country_code = 'BG'
and language is null;

--13

