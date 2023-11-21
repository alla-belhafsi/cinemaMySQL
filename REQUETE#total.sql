-- QUESTION A ---  Informations d’un film (id_film) : titre, année, durée (au format HH:MM) et réalisateur 

-- Sélection des colonnes 'film.id_film', 'film.titre', 'film.dateParution', 'film.durer', 'personne.prenom' et 'personne.nom'
SELECT 
    film.id_film as id_film, 
    film.titre,
    -- Afficher la dateParution en année
    DATE_FORMAT(film.dateParution, '%Y') AS dateParutionFormat, 
    -- Afficher la durée au format (HH:ii)
    TIME_FORMAT(SEC_TO_TIME(film.durer*60),'%H:%i') AS dureeHeure,
    -- Afficher le prénom et le nom du réalisateur dans la même colonne
    CONCAT(personne.prenom, ' ', personne.nom) AS realisateur

-- Tables utilisées dans la requête
FROM film

-- Jointure avec la table 'realisateur' sur la relation d'ID de realisateur
INNER JOIN realisateur ON film.id_realisateur = realisateur.id_realisateur

-- Jointure avec la table 'personne' sur la relation d'ID de personne
INNER JOIN personne ON realisateur.id_personne = personne.id_personne;


---------------------------------------------------------------------------------


-- QUESTION B --- Liste des films dont la durée excède 2h15 classés par durée (du + long au + court)

-- Sélection de la colonne 'titre'
SELECT film.titre AS titre

-- Table utilisée dans la requête
FROM film

-- Filtre pour une durée spécifique (2h15)
WHERE film.durer >= 135

-- Trier les résultats de la 'durer' du + long au + court 
ORDER BY film.durer DESC;


---------------------------------------------------------------------------------


-- QUESTION C --- Liste des films d’un réalisateur (en précisant l’année de sortie) 

-- Sélection des colonnes de l'identité du réalisateur, les titres des films et l'année de sortie
SELECT 
    -- Afficher le prénom et le nom du réalisateur dans la même colonne
    CONCAT(personne.prenom, ' ', personne.nom) AS realisateur,
    film.titre AS titre, 
    -- Afficher la dateParution en année
    DATE_FORMAT(film.dateParution, '%Y') AS dateParutionFormat

-- Tables utilisées dans la requête
FROM realisateur

-- Jointure avec la table 'film' sur la relation d'ID de realisateur
INNER JOIN film ON realisateur.id_realisateur = film.id_realisateur

-- Jointure avec la table 'personne' sur la relation d'ID de personne
INNER JOIN personne ON realisateur.id_personne = personne.id_personne;


---------------------------------------------------------------------------------


-- QUESTION D --- Nombre de films par genre (classés dans l’ordre décroissant)

-- Sélection des colonnes de genre et le nombre de film
SELECT 
    genre.libelle AS libelle, 
    
    -- Compte le nombre de films
    count(posseder.id_film) AS nbFilm

-- Tables utilisées dans la requête
FROM posseder

-- Jointure avec la table 'genre' sur la relation d'ID de genre
INNER JOIN genre ON posseder.id_genre = genre.id_genre

-- Regroupement par genre pour obtenir le total des films par genre
GROUP BY posseder.id_genre

-- Trier les résultats par ordre décroissant
ORDER BY nbFilm DESC;


---------------------------------------------------------------------------------


-- QUESTION E --- Nombre de films par réalisateur (classés dans l’ordre décroissant)

-- Sélection des colonnes avec l'identité du réalisateur et le nombre de films
SELECT 
    -- Afficher le prénom et le nom du réalisateur dans la même colonne
    CONCAT(personne.prenom, ' ', personne.nom) AS realisateur,

    -- Compte le nombre de films
    count(film.id_film) AS nbFilm

-- Tables utilisées dans la requête
FROM film

-- Jointure avec la table realisateur sur la relation d'ID de realisateur
INNER JOIN realisateur ON film.id_realisateur = realisateur.id_realisateur

-- Jointure avec la table personne sur la relation d'ID de personne
INNER JOIN personne ON realisateur.id_personne = personne.id_personne

-- Regroupement par realisateur pour obtenir le total des films réalisés
GROUP BY realisateur.id_realisateur

-- Trier les résultats du nombre des films par ordre décroissant
ORDER BY nbFilm DESC;


---------------------------------------------------------------------------------


-- QUESTION F ---  Casting d’un film en particulier (id_film) : nom, prénom des acteurs + sexe

-- Sélection des colonnes du film, l'identité des acteurs et leurs sexes
SELECT 
    film.titre AS titre,
    -- Afficher le prénom et le nom de l'acteur dans la même colonne
    CONCAT(personne.prenom, ' ', personne.nom) AS acteur,
    personne.sexe

-- Table utilisées dans la requête
FROM casting

-- Jointure avec la table acteur sur la relation d'ID de l'acteur
INNER JOIN acteur ON casting.id_acteur = acteur.id_acteur

-- Jointure avec la table personne sur la relation d'ID de la personne
INNER JOIN personne ON acteur.id_personne = personne.id_personne

-- Jointure avec la table film sur la relation d'ID du film
INNER JOIN film ON casting.id_film = film.id_film

-- Trier les résultats par film
ORDER BY film.id_film;


---------------------------------------------------------------------------------


-- QUESTION G --- Films tournés par un acteur en particulier (id_acteur) avec leur rôle et l’année de sortie (du film le plus récent au plus ancien)

-- Sélection des colonnes du film tournés, l'identité de l'acteur, son rôle et l'année de sortie
SELECT 
    film.titre AS titre,

    -- Afficher le prénom et le nom de l'acteur dans la même colonne
    CONCAT(personne.prenom, ' ', personne.nom) AS Acteur,
    role.nom,

    -- Afficher l'année de sortie du film
    DATE_FORMAT(film.dateParution, '%Y') AS dateSortie

-- Tables utilsées dans la requête
FROM casting

-- Jointure avec la table film sur la relation d'ID du film
INNER JOIN film ON casting.id_film = film.id_film

-- Jointure avec la table role sur la relation d'ID du rôle
INNER JOIN role ON casting.id_role = role.id_role

-- Jointure avec la table acteur sur la relation d'ID de l'acteur
INNER JOIN acteur ON casting.id_acteur = acteur.id_acteur

-- Jointure avec la table personne sur la relation d'ID de la personne
INNER JOIN personne ON acteur.id_acteur = personne.id_personne

-- Trier les résultats du film le plus récent au plus ancien
ORDER BY dateSortie DESC;


---------------------------------------------------------------------------------


-- QUESTION G --- Liste des personnes qui sont à la fois acteurs et réalisateurs

-- Sélection de la colonne de l'identité de la personne
SELECT CONCAT(personne.prenom, ' ', personne.nom) AS R_et_A

-- Tables utillisées par la requête
FROM personne

-- Jointure avec la table acteur avec la relation d'ID de la personne
INNER JOIN acteur ON personne.id_personne = acteur.id_personne

-- Jointure avec la table du realisateur avec la relation d'ID de la personne
INNER JOIN realisateur ON personne.id_personne = realisateur.id_personne;


---------------------------------------------------------------------------------


-- QUESTION I ---  Liste des films qui ont moins de 5 ans (classés du plus récent au plus ancien)

-- Sélection des colonnes du film et la date de parution
SELECT 
    film.titre AS films, 

    -- Calcul la différence d'année(s) entre aujourd'hui et la date de parution
     TIMESTAMPDIFF(YEAR, film.dateParution, NOW()) AS ageFilm

-- Tables utilisées de la requête
FROM film

-- Filtre qui sélectionne les films qui ont moins de 5 ans
WHERE TIMESTAMPDIFF(YEAR, film.dateParution, NOW()) < 5

-- Trier les résultats du plus récent au plus ancien
ORDER BY film.dateParution DESC;


---------------------------------------------------------------------------------


-- QUESTION J ---  Nombre d’hommes et de femmes parmi les acteurs

-- Sélection des colonnes du sexe et de la personne
SELECT personne.sexe, COUNT(*) AS nombre_acteurs

-- Tables utilisées pour la requête
FROM personne

-- Jointure avec la table acteur sur leur relation d'ID de la personne
INNER JOIN acteur ON personne.id_personne = acteur.id_personne

-- Regroupement des résultats par le sexe pour obtenir les totaux par sexe
GROUP BY personne.sexe;


---------------------------------------------------------------------------------


-- QUESTION K --- Liste des acteurs ayant plus de 50 ans (âge révolu et non révolu)

-- Sélection des colonnes de l'identité de la personne et de son âge
SELECT 
    -- Afficher le prénom et le nom des acteurs dans la même colonne
    CONCAT(personne.prenom, ' ', personne.nom) AS Acteurs,

    -- Calcul de l'âge révolu
    TIMESTAMPDIFF(YEAR, personne.dateNaissance, NOW()) AS AgeRev,

    -- Calcul l'âge non révolu
    YEAR(NOW()) - YEAR(personne.dateNaissance) AS AgeNonRev

-- Tables utilisées pour la requête
FROM personne

-- Jointure avec la table acteur sur la relation d'ID de la personne
INNER JOIN acteur ON personne.id_personne = acteur.id_personne

-- Filtre pour sélectionner les acteurs ayant plus de 50 (âge révolu et non révolu) 
WHERE YEAR(NOW()) - YEAR(personne.dateNaissance) >= 50

-- Trier les résultats du plus jeune au plus ancien
ORDER BY AgeRev ASC;


---------------------------------------------------------------------------------


-- QUESTION L ---  Acteurs ayant joué dans 3 films ou plus

-- Sélection des colonnes de l'identité des acteurs
SELECT 
    CONCAT(personne.prenom, ' ', personne.nom) AS Acteurs, 
    COUNT(casting.id_film) AS nbFilms

-- Tables utilisées de la requête
FROM casting

-- Jointure avec la table acteur sur la relation d'ID de l'acteur
INNER JOIN acteur ON casting.id_acteur = acteur.id_acteur

-- Jointure avec la table personne sur la relation d'ID de la personne
INNER JOIN personne ON acteur.id_personne = personne.id_personne

-- Regroupement des résultats par l'ID de l'acteur 
GROUP BY acteur.id_acteur

-- Application des conditons aux résultats
HAVING COUNT(casting.id_film) >= 3;