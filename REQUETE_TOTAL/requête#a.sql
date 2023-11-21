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

