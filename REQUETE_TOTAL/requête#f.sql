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

-- Filtre pour sélectionner un film en particulier
WHERE film.id_film = 2;


