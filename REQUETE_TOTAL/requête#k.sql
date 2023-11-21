-- QUESTION K --- Liste des acteurs ayant plus de 50 ans (âge révolu et non révolu)

-- Sélection des colonnes de l'identité de la personne et de son âge
SELECT 
    -- Afficher le prénom et le nom des acteurs dans la même colonne
    CONCAT(personne.prenom, ' ', personne.nom) AS Acteurs,

    -- Calcul de l'âge révolu
    TIMESTAMPDIFF(YEAR, personne.dateNaissance, NOW()) AS AgeRev,

    -- Calcul l'âge non révolu
    YEAR(NOW()) - YEAR(personne.dateNaissance) AS AgeNonRev

-- Tables utilisées pour la requête
FROM personne

-- Jointure avec la table acteur sur la relation d'ID de la personne
INNER JOIN acteur ON personne.id_personne = acteur.id_personne

-- Filtre pour sélectionner les acteurs ayant plus de 50 (âge révolu et non révolu) 
WHERE YEAR(NOW()) - YEAR(personne.dateNaissance) >= 50

-- Trier les résultats du plus jeune au plus ancien
ORDER BY AgeRev ASC;