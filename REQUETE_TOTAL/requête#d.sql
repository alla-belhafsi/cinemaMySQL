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