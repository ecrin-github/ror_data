
---------------------------------------------------------------
-- French
---------------------------------------------------------------

update ror.all_names set language = 'fr'
where (name ilike '%cégep %'
or name ilike '%cegep %'
or name ilike '%centre de %'
or name ilike '%centre d’%'
or name ilike '%centre des %'
or name ilike '%centre intégré%'
or name ilike '%institut de %'
or name ilike '%institut d’%'
or name ilike '%institut des %'
or name ilike '%institut français%'
) and language is null;

--389

update ror.all_names set language = 'fr'
where (name ilike '%université%'
or name ilike '%recherche%'
or name ilike '%hospitalier%'
or name ilike '%universitaire%'
or name ilike '%école%'
or name ilike 'chambre %'
or name ilike 'groupe %'
or name like 'CHU%'
or name ilike '%comité %'
) and language is null;

--946

update ror.all_names set language = 'fr'
where (name ilike '%clinique%'
or name ilike '%direction de%'
or name ilike '%direction générale%'
or name ilike '%société%'
or name ilike '%compagnie%'
or name ilike '%réseau %'
) and language is null;

--135

update ror.all_names set language = 'fr'
where (name ilike '%laboratoire%'
or name ilike '%fédération%'
or name ilike '%fondation%'
or name ilike '%département%'
or name ilike '%délégation%'
or name ilike '%académie%'   
) and language is null;

--473

update ror.all_names set language = 'fr'
where (name ilike '%conseil%'
or name ilike '%centre technique%'
or name ilike '%hôpital%'
or name ilike '%collège%'
or name ilike '%observatoire%'
or name ilike 'agence %'
) and language is null;

--302

update ror.all_names set language = 'fr'
where (name ilike '%association de %'
or name ilike '%association des %'
or name ilike '%association du %'
or name ilike '%association française%'
or name ilike '%association canadienne%'
or name ilike '%association pour %'
or name ilike '%association nationale %'
) and language is null;

--41

update ror.all_names set language = 'fr'
where (name ilike '%bibliothèque%'
or name ilike '%biologie %'
or name ilike '%cancéropôle %'
or name ilike '%institut supérieur %'
or name ilike '%institut technique %'
or name ilike '%santé %'
or name ilike '%unité %'
) and language is null;

--122

update ror.all_names set language = 'fr'
where (name ilike 'institut %'
or name ilike '% institut'
or name ilike '%l’institut%'
or name ilike '%institut du%'	   
) 
and language is null
and country_code in ('FR', 'BE', 'CA');

--128

update ror.all_names set language = 'fr'
where (name ilike 'centre %') 
and language is null
and country_code in ('FR', 'BE');

-- 110

update ror.all_names set language = 'fr'
where (name ilike '%Développement%'
or name ilike '%Abbaye %'
or name ilike '%milieu%'
or name ilike '%maladie%'
or name ilike '%aéri%'
or name ilike '%aéro%'   
) and language is null;

--41

update ror.all_names set language = 'fr'
where (name ilike '%services généraux%'
or name ilike '%thérapie%'
or name ilike '%régionale%'
or name ilike '%mondiale%'
or name ilike '%écologie%'
or name ilike '%Agroalimentaire%'   
) and language is null;

--14

update ror.all_names set language = 'fr'
where (name ilike '%alliance nationale%'
or name ilike '%ambassade%'
or name ilike '%Traitement%'
or name ilike '%Géométrie%'
or name ilike '%Animaux%'
or name ilike '%mondial%'
) and language is null;

--4

update ror.all_names set language = 'fr'
where (name ilike '%Génétique%'
or name ilike '%Archéologie%'
or name ilike '%Arché%'
or name ilike '%Archives de %'
or name ilike '% et Métier%'
or name ilike '%monde%'
) and language is null;

--36

update ror.all_names set language = 'fr'
where (name ilike '%Combattant%'
or name ilike '%Archidiocèse%'
or name ilike '%Archives Fédérales%'
or name ilike '%Archives Nationales%'
or name ilike '%Assemblée%'
or name ilike '%Publique%'
) and language is null;

--6

update ror.all_names set language = 'fr'
where (name ilike '%Européenne%'
or name ilike '%Francais%'
or name ilike '%Canadienne%'
or name ilike '%Moléculaire%'
or name ilike '%Entreprise%'
or name ilike '%Entretien%'
) and language is null;

--14

update ror.all_names set language = 'fr'
where (name ilike '%La Cité%'
or name ilike '%Ministère%'
or name ilike '%Musée%'
or name ilike '%Pôle%'
or name ilike '%Sciences Po%'
or name ilike '%fédéral%'
) and language is null;

--75

update ror.all_names set language = 'fr'
where (name like 'CH %'
or name like 'CHR %'
or name like 'CHRU %'
or name like 'CIC %'
or name like 'CISSS %' 
or name like 'CNR %' 
) and language is null;

--31

update ror.all_names set language = 'fr'
where (name ilike '%Ligue %'
or name ilike '%Parc national%'
or name ilike '%Parlement %'
or name ilike '%Pôle%'
or name ilike '%Regroupement %'
or name ilike '%Hôpitaux%' 
) and language is null;

--8

update ror.all_names set language = 'fr'
where (name ilike '%Hospitalière%'
or name ilike '%Autorité%' 
or name ilike '%Banque%'
or name ilike '%Centrale%'
or name ilike '%Droit%'
or name ilike 'ecole %'
) and language is null;

--29

update ror.all_names set language = 'fr'
where (name ilike '%Service Commun%'
or name ilike '%Service d%' 
or name ilike '%Service européen%'
or name ilike '% pour %'
or name ilike 'Ecologie %'
or name ilike '%Gouvernement%'
) and language is null;

--48

update ror.all_names set language = 'fr'
where (name ilike '%Diversité%'
or name ilike '%Édition%' 
or name ilike 'Bureau %'
or name ilike 'Faculté %'
or name ilike '%Beaux-Arts%'
or name ilike '%Processus%'
) and language is null;

--25



