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
