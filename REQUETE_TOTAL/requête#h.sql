-- QUESTION G --- Liste des personnes qui sont à la fois acteurs et réalisateurs

-- Sélection de la colonne de l'identité de la personne
SELECT CONCAT(personne.prenom, ' ', personne.nom) AS R_et_A

-- Tables utillisées par la requête
FROM personne

-- Jointure avec la table acteur avec la relation d'ID de la personne
INNER JOIN acteur ON personne.id_personne = acteur.id_personne

-- Jointure avec la table du realisateur avec la relation d'ID de la personne
INNER JOIN realisateur ON personne.id_personne = realisateur.id_personne;