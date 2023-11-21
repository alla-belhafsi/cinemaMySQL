-- QUESTION B --- Liste des films dont la durée excède 2h15 classés par durée (du + long au + court)

-- Sélection de la colonne 'titre'
SELECT film.titre AS titre

-- Table utilisée dans la requête
FROM film

-- Filtre pour une durée spécifique (2h15)
WHERE film.durer >= 135

-- Trier les résultats de la 'durer' du + long au + court 
ORDER BY film.durer DESC;
