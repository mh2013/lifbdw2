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
--IDENTIFIANT est une clef 
(SELECT COUNT(*)
   FROM (SELECT DISTINCT IDENTIFIANT
         FROM TPCSV_ETA_BRUT))
         MINUS
   (SELECT DISTINCT COUNT(*)
   FROM TPCSV_ETA_BRUT);
--libelle unique:
select libelle, count(libelle)
from TPCSV_ETA_BRUT
group by libelle;

--sigle:
select *
from TPCSV_ETA_BRUT t1, TPCSV_ETA_BRUT t2 
where t1.sigle is not null and t2.sigle is not null and t1.sigle = t2.sigle and t1.identifiant!=t2.identifiant;
   
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
         FROM TPCSV_INS_BRUT));
		 
	--3)clé minimale : code_discipline,code_domaine
   --exercice 4 --
   --1
   SELECT DISTINCT NOM_DISCIPLINE
   FROM TPCSV_INS_BRUT
   WHERE ANNEE = '2011' AND NOM_DISCIPLINE NOT IN (SELECT DISTINCT NOM_DISCIPLINE 
   FROM TPCSV_INS_BRUT 
   WHERE ANNEE = '2010');
   
   --2 
   SELECT NB_REPONSES_TOT_DISC18,NB_REPONSES_TOT_DISC19_DISC20
   FROM (SELECT SUM(NB_REPONSES) AS NB_REPONSES_TOT_DISC18
         FROM TPCSV_INS_BRUT 
         WHERE CODE_DISCIPLINE = 'disc18'),
   (SELECT SUM(NB_REPONSES) AS NB_REPONSES_TOT_DISC19_DISC20
   FROM TPCSV_INS_BRUT 
   WHERE CODE_DISCIPLINE = 'disc19' OR CODE_DISCIPLINE = 'disc20');
   


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
 WHERE NOM_DISCIPLINE LIKE 'Ensemble%';
   
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