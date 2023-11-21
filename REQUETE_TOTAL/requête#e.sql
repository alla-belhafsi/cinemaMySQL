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
