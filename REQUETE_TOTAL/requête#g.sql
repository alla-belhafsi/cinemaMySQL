-- QUESTION G --- Films tournés par un acteur en particulier (id_acteur) avec leur rôle et l’année de sortie (du film le plus récent au plus ancien)

-- Sélection des colonnes du film tournés, l'identité de l'acteur, son rôle et l'année de sortie
SELECT 
    film.titre AS films,

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

-- Filtre pour sélectionner un acteur en particulier
WHERE acteur.id_acteur = 1

-- Trier les résultats du film le plus récent au plus ancien
ORDER BY dateSortie DESC;
