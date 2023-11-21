-- QUESTION L ---  Acteurs ayant joué dans 3 films ou plus

-- Sélection des colonnes de l'identité des acteurs
SELECT 
    CONCAT(personne.prenom, ' ', personne.nom) AS Acteurs, 
    
    -- Compte le nombre d'ID acteur 
    COUNT(casting.id_acteur) AS nbFilms

-- Tables utilisées de la requête
FROM casting

-- Jointure avec la table acteur sur la relation d'ID de l'acteur
INNER JOIN acteur ON casting.id_acteur = acteur.id_acteur

-- Jointure avec la table personne sur la relation d'ID de la personne
INNER JOIN personne ON acteur.id_personne = personne.id_personne

-- Regroupement des résultats par l'ID de l'acteur 
GROUP BY acteur.id_acteur

-- Application des conditons aux résultats
HAVING nbFilms >= 3;