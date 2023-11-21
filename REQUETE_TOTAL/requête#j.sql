-- QUESTION J ---  Nombre d’hommes et de femmes parmi les acteurs

-- Sélection des colonnes du sexe et de la personne
SELECT personne.sexe, COUNT(*) AS nombre_acteurs

-- Tables utilisées pour la requête
FROM personne

-- Jointure avec la table acteur sur leur relation d'ID de la personne
INNER JOIN acteur ON personne.id_personne = acteur.id_personne

-- Regroupement des résultats par le sexe pour obtenir les totaux par sexe
GROUP BY personne.sexe;