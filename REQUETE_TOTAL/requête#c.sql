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