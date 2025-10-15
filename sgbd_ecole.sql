DROP TABLE IF EXISTS activites_pratiquees;
DROP TABLE IF EXISTS charge;
DROP TABLE IF EXISTS resultats;
DROP TABLE IF EXISTS cours;
DROP TABLE IF EXISTS eleves;
DROP TABLE IF EXISTS professeurs;
DROP TABLE IF EXISTS activites;



CREATE TABLE activites
(
    niveau       integer     NOT NULL,
    nom_activite varchar(20) NOT NULL,
    equipe       varchar(32) DEFAULT NULL,
    PRIMARY KEY (niveau, nom_activite)
);

CREATE TABLE professeurs
(
    num_prof       integer NOT NULL,
    nom_prof       varchar(20) DEFAULT NULL,
    specialite     varchar(50) DEFAULT NULL,
    date_entree    date        DEFAULT NULL,
    der_prom       date        DEFAULT NULL,
    salaire_base   integer     DEFAULT NULL,
    salaire_actuel integer     DEFAULT NULL,
    PRIMARY KEY (num_prof)
);

CREATE TABLE cours
(
    num_cours   integer NOT NULL,
    nom_cours   varchar(40) DEFAULT NULL,
    nb_heures   integer     DEFAULT NULL,
    annee_cours integer     DEFAULT NULL,
    PRIMARY KEY (num_cours)
);


CREATE TABLE eleves
(
    num_eleve      integer     NOT NULL,
    nom_eleve      varchar(20) NOT NULL,
    prenom         varchar(20) NOT NULL,
    date_naissance date    DEFAULT NULL,
    temps_ecran    integer DEFAULT 0,
    annee          integer DEFAULT NULL,
    PRIMARY KEY (num_eleve)
);


CREATE TABLE activites_pratiquees
(
    num_eleve    integer     NOT NULL,
    niveau       integer     NOT NULL,
    nom_activite varchar(20) NOT NULL,
    PRIMARY KEY (num_eleve, niveau, nom_activite),
    KEY ref_activ (niveau, nom_activite),
    CONSTRAINT ref_activ FOREIGN KEY (niveau, nom_activite) REFERENCES activites (niveau, nom_activite),
    CONSTRAINT ref_eleves_ap FOREIGN KEY (num_eleve) REFERENCES eleves (num_eleve)
);


CREATE TABLE charge
(
    num_cours integer NOT NULL,
    num_prof  integer NOT NULL,
    PRIMARY KEY (num_prof, num_cours),
    KEY ref_cours_ch (num_cours),
    CONSTRAINT ref_cours_ch FOREIGN KEY (num_cours) REFERENCES cours (num_cours),
    CONSTRAINT ref_profs_ch FOREIGN KEY (num_prof) REFERENCES professeurs (num_prof)
);


CREATE TABLE resultats
(
    num_eleve integer NOT NULL,
    num_cours integer NOT NULL,
    points    integer DEFAULT NULL,
    PRIMARY KEY (num_eleve, num_cours),
    KEY ref_cours (num_cours),
    CONSTRAINT ref_cours FOREIGN KEY (num_cours) REFERENCES cours (num_cours),
    CONSTRAINT ref_eleves FOREIGN KEY (num_eleve) REFERENCES eleves (num_eleve)
);


-- Contenu de la table activites
INSERT INTO activites (niveau, nom_activite, equipe)
VALUES (1, 'Hackathon Web', 'CodeLab'),
       (1, 'Création graphique', 'Pixel Squad'),
       (1, 'Jeux vidéo rétro', 'Ctrl+Play'),
       (2, 'Développement mobile', 'Swift & Co'),
       (2, 'UX Design Sprint', 'Design Thinkers'),
       (2, 'Compétition de code', 'Syntax Error'),
       (3, 'Projet Web final', 'DevMasters');

-- Contenu de la table cours
INSERT INTO cours (num_cours, nom_cours, nb_heures, annee_cours)
VALUES (1, 'Multimédia', 45, 2),
       (2, 'Systèmes de gestion de contenu', 45, 1),
       (3, 'Programmation côté client (JavaScript)', 30, 1),
       (4, 'Programmation côté serveur (PHP)', 45, 2),
       (5, 'Design d’applications mobiles', 60, 2),
       (6, 'Projets Web', 90, 3),
       (7, 'Gestion de projet', 30, 3);

-- Contenu de la table eleves
INSERT INTO eleves (num_eleve, nom_eleve, prenom, date_naissance, annee, temps_ecran)
VALUES (1, 'Dupont', 'Léa', '2005-03-14', 1, 7.5),
       (2, 'Nguyen', 'Lucas', '2004-11-02', 1, 8.2),
       (3, 'Mertens', 'Chloé', '2003-07-21', 2, 9.0),
       (4, 'Hernandez', 'Diego', '2003-02-10', 2, 8.6),
       (5, 'De Wilde', 'Nora', '2005-05-30', 1, 6.8),
       (6, 'Moreau', 'Eliott', '2002-10-18', 3, 10.5),
       (7, 'Lemaire', 'Sarah', '2004-01-24', 2, 9.3),
       (8, 'Martin', 'Yanis', '2003-06-12', 3, 10.1),
       (9, 'Rossi', 'Elena', '2005-09-03', 1, 6.2),
       (10, 'Bakker', 'Noah', '2002-04-07', 3, 9.8),
       (11, 'Coppens', 'Mathis', '2004-12-12', 3, 10.2),
       (12, 'Renard', 'Zoé', '2005-07-09', 2, 7.9),
       (13, 'Dumont', 'Alexis', '2003-11-25', 3, 8.7),
       (14, 'Dupont', 'Marie', '2005-03-14', 1, 7.5);

-- Contenu de la table professeurs
INSERT INTO professeurs (num_prof, nom_prof, specialite, date_entree, der_prom, salaire_base, salaire_actuel)
VALUES (1, 'Dubois', 'Développement Web', '2012-09-01', '2019-09-01', 3800.00, 4500.00),
       (2, 'Leroy', 'Bases de données', '2015-10-15', '2021-09-01', 3600.00, 4100.00),
       (3, 'Van den Broeck', 'UI/UX Design', '2010-02-20', '2020-10-01', 4000.00, 4800.00),
       (4, 'Santos', 'Développement mobile', '2018-03-10', NULL, 3400.00, 3400.00),
       (5, 'Chen', 'Programmation JavaScript', '2016-11-25', '2022-09-01', 3700.00, 4300.00),
       (6, 'Laurent', 'Gestion de projet', '2009-09-01', '2018-09-01', 4200.00, 5000.00),
       (7, 'Jacobs', 'Multimédia', '2014-05-17', NULL, 3500.00, 3700.00),
       (8, 'Linus', 'Développement Web', '2020-09-01', NULL, 3900.00, 3900.00),
       (9, 'Petit', 'Bases de données', '2008-01-15', NULL, 3300.00, 3300.00),
       (10, 'grand', 'Bases de données', '2002-09-15', NULL, 3300.00, 4300.00),
       (11, 'Marchal', NULL, '2011-09-10', '2018-09-01', 3600.00, 4200.00);
;

-- Contenu de la table activites_pratiquees
INSERT INTO activites_pratiquees (num_eleve, niveau, nom_activite)
VALUES (1, 1, 'Hackathon Web'),
       (2, 1, 'Hackathon Web'),
       (5, 1, 'Hackathon Web'),
       (9, 1, 'Création graphique'),
       (3, 2, 'Développement mobile'),
       (4, 2, 'UX Design Sprint'),
       (7, 2, 'UX Design Sprint'),
       (8, 3, 'Projet Web final'),
       (6, 3, 'Projet Web final'),
       (10, 3, 'Projet Web final');

-- Contenu de la table charge
INSERT INTO charge (num_cours, num_prof)
VALUES (1, 1),
       (2, 2),
       (3, 5),
       (4, 1),
       (4, 4),
       (5, 4),
       (5, 3),
       (6, 6),
       (6, 8);

-- Contenu de la table resultats
INSERT INTO resultats (num_eleve, num_cours, points)
VALUES (1, 1, 16),
       (1, 2, 15),
       (1, 3, 17),
       (2, 1, 13),
       (2, 3, 12),
       (3, 2, 18),
       (3, 4, 15),
       (4, 4, 17),
       (4, 5, 14),
       (5, 1, 18),
       (5, 3, 19),
       (6, 5, 16),
       (6, 6, 20),
       (7, 2, 14),
       (7, 5, 15),
       (8, 4, 17),
       (8, 6, 18),
       (9, 3, 16),
       (9, 5, 15),
       (10, 6, 19);

COMMIT;
