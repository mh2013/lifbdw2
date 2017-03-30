

DROP TABLE TPCSV_ETA_BRUT;

CREATE TABLE "TPCSV_ETA_BRUT" (	
  "IDENTIFIANT" VARCHAR2(28 BYTE), 
	"LIBELLE" VARCHAR2(128 BYTE), 
	"SIGLE" VARCHAR2(28 BYTE), 
	"TYPE_ETABLISSEMENT" VARCHAR2(128 BYTE), 
	"SECTEUR_ETABLISSEMENT" VARCHAR2(26 BYTE), 
	"SITE_INTERNET" VARCHAR2(128 BYTE), 
	"GEOLOCALISATION" VARCHAR2(64 BYTE), 
	"ELEMENT_WIKIDATA" VARCHAR2(128 BYTE), 
	"RATTACHEMENT" VARCHAR2(128 BYTE), 
	"RATTACHEMENT_IDENTIFIANTS" VARCHAR2(26 BYTE), 
	"DERNIER_DECRET_LEGIFRANCE" VARCHAR2(1024 BYTE), 
	"LOCALISATION" VARCHAR2(128 BYTE), 
	"CODE_COMMUNE" VARCHAR2(26 BYTE), 
	"COMMUNE" VARCHAR2(26 BYTE), 
	"CODE_UNITE_URBAINE" VARCHAR2(26 BYTE), 
	"UNITE_URBAINE" VARCHAR2(128 BYTE), 
	"CODE_DEPARTEMENT" VARCHAR2(26 BYTE), 
	"DEPARTEMENT" VARCHAR2(26 BYTE), 
	"CODE_ACADEMIE" VARCHAR2(26 BYTE), 
	"ACADEMIE" VARCHAR2(26 BYTE), 
	"CODE_REGION" VARCHAR2(26 BYTE), 
	"REGION" VARCHAR2(128 BYTE), 
	"MENTION_DISTRIBUTION" VARCHAR2(128 BYTE), 
	"ADRESSE" VARCHAR2(128 BYTE), 
	"LIEU_DIT" VARCHAR2(128 BYTE), 
	"BOITE_POSTALE" VARCHAR2(26 BYTE), 
	"CODE_POSTAL" VARCHAR2(26 BYTE), 
	"LOCALITE" VARCHAR2(26 BYTE), 
	"PAYS" VARCHAR2(26 BYTE), 
	"NUMERO_TEL" VARCHAR2(26 BYTE), 
	"SIRET" NUMBER(16,0), 
	"IDENTIFIANT_ETER" VARCHAR2(26 BYTE), 
	"IDENTIFIANT_FREEBASE" VARCHAR2(128 BYTE), 
	"STATUT_JURIDIQUE_COURT" VARCHAR2(26 BYTE), 
	"STATUT_JURIDIQUE" VARCHAR2(128 BYTE), 
	"QUALIFICATION_COURT" VARCHAR2(26 BYTE), 
	"QUALIFICATION" VARCHAR2(128 BYTE), 
	"COMPTE_FACEBOOK" VARCHAR2(256 BYTE), 
	"COMPTE_TWITTER" VARCHAR2(128 BYTE), 
	"COMPTE_FLICKR" VARCHAR2(128 BYTE), 
	"FLUX_RSS" VARCHAR2(1024 BYTE), 
	"COMPTE_LINKEDIN" VARCHAR2(256 BYTE), 
	"COMPTE_PINTEREST" VARCHAR2(128 BYTE), 
	"COMPTE_FRANCE_CULTURE" VARCHAR2(128 BYTE), 
	"COMPTE_SCRIBD" VARCHAR2(128 BYTE), 
	"COMPTE_SCOOPIT" VARCHAR2(128 BYTE), 
	"COMPTE_TUMBLR" VARCHAR2(128 BYTE), 
	"COMPTE_VIADEO" VARCHAR2(128 BYTE), 
	"COMPTE_DAILYMOTION" VARCHAR2(128 BYTE), 
	"COMPTE_VIMEO" VARCHAR2(128 BYTE), 
	"COMPTE_YOUTUBE" VARCHAR2(128 BYTE), 
	"COMPTE_GOOGLEPLUS" VARCHAR2(128 BYTE), 
	"AUTRES" VARCHAR2(256 BYTE), 
	"MOOC" VARCHAR2(26 BYTE), 
	"STATUT_OPERATEUR_LOLF" VARCHAR2(128 BYTE), 
	"LIBELLE_MISSION_CHEF_DE_FILE" VARCHAR2(128 BYTE), 
	"IDENTIFIANT_LOLF_CHEF_DE_FILE" NUMBER(5,0), 
	"LIBELLE_LOLF_CHEF_DE_FILE" VARCHAR2(256 BYTE), 
	"IDENTIFIANTS_AUTRES_LOLF" VARCHAR2(26 BYTE), 
	"LIBELLES_AUTRES_LOLF" VARCHAR2(26 BYTE), 
	"ASSOCIATION" VARCHAR2(128 BYTE), 
	"ASSOCIATION_IDENTIFIANTS" VARCHAR2(26 BYTE)
   );
   
   DROP TABLE TPCSV_INS_BRUT;

CREATE TABLE "TPCSV_INS_BRUT" (   
  "ANNEE" NUMBER(6,0), 
	"NUM_ETABLISSEMENT" VARCHAR2(26 BYTE), 
	"NOM_ETABLISSEMENT" VARCHAR2(128 BYTE), 
	"CODE_ACADEMIE" VARCHAR2(26 BYTE), 
	"NOM_ACADEMIE" VARCHAR2(26 BYTE), 
	"CODE_DOMAINE" VARCHAR2(26 BYTE), 
	"NOM_DOMAINE" VARCHAR2(128 BYTE), 
	"CODE_DISCIPLINE" VARCHAR2(26 BYTE), 
	"NOM_DISCIPLINE" VARCHAR2(128 BYTE), 
	"REMARQUE" VARCHAR2(256 BYTE), 
	"NB_REPONSES" NUMBER(6,0), 
	"TAUX_REPONSE" NUMBER(5,0), 
	"POIDS_DISCIPLINE" VARCHAR2(20 BYTE), 
	"TAUX_INSERTION" VARCHAR2(26 BYTE), 
	"TAUX_CADRES_INTERMEDIAIRES" VARCHAR2(26 BYTE), 
	"TAUX_STABLES" VARCHAR2(26 BYTE), 
	"TAUX_TEMPS_PLEIN" VARCHAR2(26 BYTE), 
	"SALAIRE_NET_MEDIAN" VARCHAR2(26 BYTE), 
	"SALAIRE_BRUT_ANNUEL" VARCHAR2(26 BYTE), 
	"TAUX_DIPLOMES_BOURSIERS" VARCHAR2(20 BYTE), 
	"TAUX_CHOMAGE_REGIONAL" VARCHAR2(26 BYTE), 
	"SALAIRE_NET_MEDIAN_REGION" VARCHAR2(20 BYTE), 
	"TAUX_CADRES" VARCHAR2(26 BYTE), 
	"TAUX_EXTERIEURS" VARCHAR2(26 BYTE), 
	"TAUX_FEMMES" VARCHAR2(26 BYTE)
   )  ;
   
   --Exercice 3 --
   --nombre de tuple--
   SELECT COUNT (*)
   FROM TPCSV_INS_BRUT;
   
   SELECT COUNT(DISTINCT NOM_ETABLISSEMENT)
   FROM TPCSV_INS_BRUT;
   
   SELECT COUNT(DISTINCT ANNEE)
   FROM TPCSV_INS_BRUT;
   
   SELECT COUNT(DISTINCT NOM_ACADEMIE)
   FROM TPCSV_INS_BRUT;
   
   SELECT COUNT(DISTINCT NOM_DOMAINE)
   FROM TPCSV_INS_BRUT;
   
   SELECT COUNT(DISTINCT NOM_DISCIPLINE)
   FROM TPCSV_INS_BRUT;
   
   --TEST DFS --
   --NOM DOMAINE -> CODE DOMAINE vrai 
    (SELECT COUNT(*)
   FROM (SELECT DISTINCT NOM_DOMAINE
         FROM TPCSV_INS_BRUT))
         MINUS
   (SELECT COUNT(*)
   FROM (SELECT DISTINCT NOM_DOMAINE,CODE_DOMAINE
         FROM TPCSV_INS_BRUT));
   --CODE DOMAINE -> NOM DOMAINE vrai 
    (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_DOMAINE
         FROM TPCSV_INS_BRUT))
         MINUS
   (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_DOMAINE,NOM_DOMAINE
         FROM TPCSV_INS_BRUT));
   --NOM DISCIPLINE -> CODE DISCIPLINE vrai 
    (SELECT COUNT(*)
   FROM (SELECT DISTINCT NOM_DISCIPLINE
         FROM TPCSV_INS_BRUT))
         MINUS
   (SELECT COUNT(*)
   FROM (SELECT DISTINCT NOM_DISCIPLINE,CODE_DISCIPLINE
         FROM TPCSV_INS_BRUT));
   --CODE DISCIPLINE -> NOM DISCIPLINE vrai 
    (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_DISCIPLINE
         FROM TPCSV_INS_BRUT))
         MINUS
   (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_DISCIPLINE,NOM_DISCIPLINE
         FROM TPCSV_INS_BRUT));
   --CODE DISCIPLINE -> CODE DOMAINE vrai
    (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_DISCIPLINE
         FROM TPCSV_INS_BRUT))
         MINUS
   (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_DISCIPLINE,CODE_DOMAINE
         FROM TPCSV_INS_BRUT));
   --CODE DOMAINE -> CODE DISCIPLINE faux
    (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_DOMAINE
         FROM TPCSV_INS_BRUT))
         MINUS
   (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_DOMAINE,CODE_DISCIPLINE
         FROM TPCSV_INS_BRUT));
         
    (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_DISCIPLINE
         FROM TPCSV_INS_BRUT))
         MINUS
   (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_DISCIPLINE,NOM_DOMAINE,CODE_DOMAINE,NOM_DISCIPLINE
         FROM TPCSV_INS_BRUT))
   --exercice 4 --
   --1
   SELECT DISTINCT NOM_DISCIPLINE
   FROM TPCSV_INS_BRUT
   WHERE ANNEE = '2011' AND NOM_DISCIPLINE NOT IN (SELECT DISTINCT NOM_DISCIPLINE 
   FROM TPCSV_INS_BRUT 
   WHERE ANNEE = '2010')
   
   --2 
   SELECT NB_REPONSES_TOT_DISC18,NB_REPONSES_TOT_DISC19_DISC20
   FROM (SELECT SUM(NB_REPONSES) AS NB_REPONSES_TOT_DISC18
         FROM TPCSV_INS_BRUT 
         WHERE CODE_DISCIPLINE = 'disc18'),
   (SELECT SUM(NB_REPONSES) AS NB_REPONSES_TOT_DISC19_DISC20
   FROM TPCSV_INS_BRUT 
   WHERE CODE_DISCIPLINE = 'disc19' OR CODE_DISCIPLINE = 'disc20')
   
 --exercice 2
--1) 198 identifiants dans la table tpcsv_eta_brut
select count(distinct IDENTIFIANT) 
from TPCSV_ETA_BRUT;

select identifiant, count(libelle) 
from TPCSV_ETA_BRUT
group by identifiant
having count(LIBELLE)>1;

--2)

delete from TPCSV_ETA_BRUT
where IDENTIFIANT is null;

--3)
--libelle unique:
select libelle, count(libelle)
from TPCSV_ETA_BRUT
group by libelle;

--sigle:
select *
from TPCSV_ETA_BRUT t1, TPCSV_ETA_BRUT t2 
where t1.sigle is not null and t2.sigle is not null and t1.sigle = t2.sigle and t1.identifiant!=t2.identifiant;



---exo 5
---1)
create or replace view DISCIPLINE_AGGREGATS as
select nom_domaine, CODE_DOMAINE, min(CODE_DISCIPLINE) as code_disc_fic, (count(DISTINCT code_discipline) - 1) as nb_disc_no_fic
from TPCSV_INS_BRUT
group by nom_domaine, code_domaine
having count(distinct CODE_DISCIPLINE)>1;

--2)
 SELECT DISTINCT CODE_DISCIPLINE
 FROM TPCSV_INS_BRUT 
 WHERE NOM_DISCIPLINE LIKE 'Ensemble%'
   
--3)
create or replace view domaine_aggregats as
select distinct NOM_DOMAINE,annee,nb_rep_disc_fic,nb_rep_disc_non_fic,(nb_rep_disc_fic-nb_rep_disc_non_fic) as diff from
(select distinct NOM_DOMAINE,annee,min(CODE_DISCIPLINE) as disc_fic, count(NB_REPONSES) as nb_rep_disc_fic
from TPCSV_INS_BRUT
group by NOM_DOMAINE,annee
having count (distinct CODE_DISCIPLINE)>1
order by NOM_DOMAINE) natural join
(select distinct NOM_DOMAINE,annee,count(NB_REPONSES) as nb_rep_disc_non_fic
from TPCSV_INS_BRUT
group by NOM_DOMAINE,annee
having count (distinct CODE_DISCIPLINE)>1
order by NOM_DOMAINE);

---exo 6
---1)
(select annee, code_discipline
from TPCSV_INS_BRUT)
minus
(select annee, code_discipline
from TPCSV_INS_BRUT
where NUM_ETABLISSEMENT='UNIV');

--2)
create or replace view UNIV_AGGREGATS as
select  t.annee, t.code_discipline, (nb_univ-nb_non_univ) as delta_univ from
(select annee, code_discipline,sum(nb_reponses)as nb_univ
from TPCSV_INS_BRUT
where NUM_ETABLISSEMENT='UNIV'
group by annee,CODE_DISCIPLINE
order by annee) t ,
(select annee, code_discipline,sum(nb_reponses)as nb_non_univ
from TPCSV_INS_BRUT
where NUM_ETABLISSEMENT != 'UNIV'
group by annee,CODE_DISCIPLINE
order by annee);

--3)
select distinct annee from univ_aggregats where delta_univ=0;
/*resultats
2010
2011
*/


---exo7
---1)le nombre total de réponses qu’il y a eu à l’enquête 2011
select nom_domaine,annee, sum(NB_REPONSES)
from TPCSV_INS_BRUT
where annee='2011' and NUM_ETABLISSEMENT != 'UNIV' and
CODE_DISCIPLINE not in (select min(code_discipline)
                    from TPCSV_INS_BRUT
                    group by nom_domaine
                    having count(distinct CODE_DISCIPLINE)>1)
group by nom_domaine,annee;

/*
Nom de domaine			  			Annee    Nb de reponses(requete sql)    Nb de reponses(doc stats pdf)   Taux d'erreur(%)
Sciences, technologies et santé	  	2011		8397						8382								0,17	    
Lettres, langues, arts	          	2011		2665						2664								0,037
Droit, économie et gestion	  		2011		11488						11465								0,2
Masters enseignement	          	2011		6103						6082								0,34
Sciences humaines et sociales	  	2011		6219						6215								0,064
*/

---2)
select distinct NOM_ETABLISSEMENT
from TPCSV_ins_BRUT
where NUM_ETABLISSEMENT not in (select identifiant
                                from TPCSV_eta_BRUT);
/* liste etablissement apparaissant dans TPCSV_ins_BRUT mais pas dans TPCSV_eta_BRUT
Bordeaux 4 - Montesquieu
Montpellier 1
Bordeaux 2 - Victor Segalen
Bordeaux 1 - Sciences technologies
Montpellier 2 - Sciences techniques du Languedoc
*/

--Exercice 8 
--TEST DFS --
   --CODE_REGION -> REGION VRAI
    (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_REGION
         FROM TPCSV_ETA_BRUT))
         MINUS
   (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_REGION,REGION
         FROM TPCSV_ETA_BRUT));
   --REGION -> CODE_REGION VRAI
    (SELECT COUNT(*)
   FROM (SELECT DISTINCT REGION
         FROM TPCSV_ETA_BRUT))
         MINUS
   (SELECT COUNT(*)
   FROM (SELECT DISTINCT REGION,CODE_REGION
         FROM TPCSV_ETA_BRUT));
   --CODE_DEPARTEMENT -> DEPARTEMENT VRAI
    (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_DEPARTEMENT
         FROM TPCSV_ETA_BRUT))
         MINUS
   (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_DEPARTEMENT,DEPARTEMENT
         FROM TPCSV_ETA_BRUT));
   --DEPARTEMENT-> CODE_DEPARTEMENT VRAI
    (SELECT COUNT(*)
   FROM (SELECT DISTINCT DEPARTEMENT
         FROM TPCSV_ETA_BRUT))
         MINUS
   (SELECT COUNT(*)
   FROM (SELECT DISTINCT DEPARTEMENT,CODE_DEPARTEMENT
         FROM TPCSV_ETA_BRUT));
   --CODE DEPARTEMENT -> CODE REGION VRAI
    (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_DEPARTEMENT
         FROM TPCSV_ETA_BRUT))
         MINUS
   (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_DEPARTEMENT,CODE_REGION
         FROM TPCSV_ETA_BRUT));
   --CODE REGION -> CODE DEPARTEMENT FAUX
    (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_REGION
         FROM TPCSV_ETA_BRUT))
         MINUS
   (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_REGION,CODE_DEPARTEMENT
         FROM TPCSV_ETA_BRUT));
         
  --CONTRE EXEMPLE 
  SELECT t1.CODE_REGION,t2.CODE_REGION,t1.CODE_DEPARTEMENT,t2.CODE_DEPARTEMENT
  FROM TPCSV_ETA_BRUT t1,TPCSV_ETA_BRUT t2
  WHERE t1.CODE_REGION=t2.CODE_REGION AND t1.CODE_DEPARTEMENT <> t2.CODE_DEPARTEMENT AND t1.CODE_DEPARTEMENT < t2.CODE_DEPARTEMENT 
  ORDER BY t1.CODE_REGION,t2.CODE_REGION ASC
  --CODE ACADEMIE -> ACADEMIE    VRAI   
    (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_ACADEMIE
         FROM TPCSV_ETA_BRUT))
         MINUS
   (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_ACADEMIE,ACADEMIE
         FROM TPCSV_ETA_BRUT));
 --ACADEMIE -> CODE ACADEMIE   VRAI    
    (SELECT COUNT(*)
   FROM (SELECT DISTINCT ACADEMIE
         FROM TPCSV_ETA_BRUT))
         MINUS
   (SELECT COUNT(*)
   FROM (SELECT DISTINCT ACADEMIE,CODE_ACADEMIE
         FROM TPCSV_ETA_BRUT)); 
 --CODE ACADEMIE -> CODE REGION  VRAI   
    (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_ACADEMIE
         FROM TPCSV_ETA_BRUT))
         MINUS
   (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_ACADEMIE,CODE_REGION
         FROM TPCSV_ETA_BRUT));
 --CODE REGION -> CODE ACADEMIE FAUX 
    (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_REGION
         FROM TPCSV_ETA_BRUT))
         MINUS
   (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_REGION,CODE_ACADEMIE
         FROM TPCSV_ETA_BRUT));
 --CONTRE EXEMPLE 
  SELECT t1.CODE_REGION,t2.CODE_REGION,t1.CODE_ACADEMIE,t2.CODE_ACADEMIE
  FROM TPCSV_ETA_BRUT t1,TPCSV_ETA_BRUT t2
  WHERE t1.CODE_REGION=t2.CODE_REGION AND t1.CODE_ACADEMIE <> t2.CODE_ACADEMIE AND t1.CODE_ACADEMIE < t2.CODE_ACADEMIE 
  ORDER BY t1.CODE_REGION,t2.CODE_REGION ASC
 --CODE DEPARTEMENT -> CODE ACADEMIE  VRAI   
    (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_DEPARTEMENT
         FROM TPCSV_ETA_BRUT))
         MINUS
   (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_DEPARTEMENT,CODE_ACADEMIE
         FROM TPCSV_ETA_BRUT));
 --CODE ACADEMIE -> CODE_DEPARTEMENT  FAUX     
    (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_ACADEMIE
         FROM TPCSV_ETA_BRUT))
         MINUS
   (SELECT COUNT(*)
   FROM (SELECT DISTINCT CODE_ACADEMIE,CODE_DEPARTEMENT
         FROM TPCSV_ETA_BRUT));
 --CONTRE EXEMPLE 
  SELECT t1.CODE_ACADEMIE,t2.CODE_ACADEMIE,t1.CODE_DEPARTEMENT,t2.CODE_DEPARTEMENT
  FROM TPCSV_ETA_BRUT t1,TPCSV_ETA_BRUT t2
  WHERE t1.CODE_ACADEMIE=t2.CODE_ACADEMIE AND t1.CODE_DEPARTEMENT <> t2.CODE_DEPARTEMENT AND t1.CODE_DEPARTEMENT < t2.CODE_DEPARTEMENT 
  ORDER BY t1.CODE_ACADEMIE,t2.CODE_ACADEMIE ASC;
  
  
  -- EXERCICE 9 
 --1)
  DROP TABLE TPCSV_REGION;
  
  CREATE TABLE TPCSV_REGION(
  CODE_REGION VARCHAR2(26 BYTE) NOT NULL PRIMARY KEY, 
  REGION VARCHAR2(128 BYTE));
  
  DROP TABLE TPCSV_DPT;
  
   CREATE TABLE TPCSV_DPT(
   CODE_DEPARTEMENT VARCHAR2(26 BYTE) NOT NULL PRIMARY KEY, 
   DEPARTEMENT VARCHAR2(26 BYTE),
   CODE_REGION VARCHAR2(26 BYTE),
   FOREIGN KEY (CODE_REGION) REFERENCES TPCSV_REGION(CODE_REGION) ON DELETE SET NULL);
  
  DROP TABLE TPCSV_ACADEMIE;
  
  CREATE TABLE TPCSV_ACADEMIE(
  CODE_ACADEMIE VARCHAR2(26 BYTE)NOT NULL PRIMARY KEY, 
  ACADEMIE VARCHAR2(26 BYTE),
  CODE_REGION VARCHAR2(26 BYTE),
  FOREIGN KEY (CODE_REGION) REFERENCES TPCSV_REGION(CODE_REGION) ON DELETE SET NULL);
  
  --2)
  INSERT INTO TPCSV_REGION 
  SELECT DISTINCT CODE_REGION,REGION 
  FROM TPCSV_ETA_BRUT;
  
  INSERT INTO TPCSV_DPT 
  SELECT DISTINCT CODE_DEPARTEMENT,DEPARTEMENT,CODE_REGION
  FROM TPCSV_ETA_BRUT;
  
  INSERT INTO TPCSV_ACADEMIE
  SELECT DISTINCT CODE_ACADEMIE,ACADEMIE,CODE_REGION
  FROM TPCSV_ETA_BRUT;
  
   --exercice 10 
  
  --1)
  DROP TABLE TPCSV_DOMAINE;
  
  CREATE TABLE TPCSV_DOMAINE(
  CODE_DOMAINE VARCHAR2(26 BYTE)NOT NULL PRIMARY KEY, 
  NOM_DOMAINE VARCHAR2(128 BYTE));
  
  DROP TABLE TPCSV_DISCIPLINE;
  
  CREATE TABLE TPCSV_DISCIPLINE(
  CODE_DISCIPLINE VARCHAR2(26 BYTE)NOT NULL PRIMARY KEY, 
  NOM_DISCIPLINE VARCHAR2(128 BYTE),
  CODE_DOMAINE VARCHAR2(26 BYTE),
  FOREIGN KEY (CODE_DOMAINE) REFERENCES TPCSV_DOMAINE(CODE_DOMAINE) ON DELETE SET NULL);
  
  --2)
  
  INSERT INTO TPCSV_DISCIPLINE
  SELECT DISTINCT CODE_DISCIPLINE,NOM_DISCIPLINE,CODE_DOMAINE
  FROM TPCSV_INS_BRUT
  ORDER BY CODE_DISCIPLINE ASC ;
  
  INSERT INTO TPCSV_DOMAINE
  SELECT DISTINCT CODE_DOMAINE,NOM_DOMAINE
  FROM TPCSV_INS_BRUT;
  
  
  --EXERCICE 11
  --1)
  ---verifier que les 7 chiffres d'etablissement sont un identifiant
  select distinct LIBELLE
from TPCSV_ETA_BRUT
group by libelle
having count(SUBSTR(identifiant,1,7))>1;
  --SECTEUR ETABLISSEMENT N'ADMET QUE DEUX VALEURS 
  SELECT COUNT(DISTINCT SECTEUR_ETABLISSEMENT)
  FROM TPCSV_ETA_BRUT