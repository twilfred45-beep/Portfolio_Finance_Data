/*
====================================================
PROJET : ANALYSE BUDGETAIRE
DOMAINE : CONTROLE DE GESTION
OUTIL : MYSQL 8
====================================================

OBJECTIFS :
1. Comparer Budget et Réel
2. Calculer les écarts
3. Analyser les performances par service
4. Identifier les dépassements budgétaires
*/

/* ================================================
   1. CREATION DE LA TABLE
================================================ */

DROP TABLE IF EXISTS Suivi_Budgetaire;

CREATE TABLE Suivi_Budgetaire (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Service VARCHAR(100),
    Poste_Budgetaire VARCHAR(100),
    Budget_2026 DECIMAL(15,2),
    Reel_2026 DECIMAL(15,2)
);

/* ================================================
   2. INSERTION DES DONNEES
================================================ */

INSERT INTO Suivi_Budgetaire
(Service, Poste_Budgetaire, Budget_2026, Reel_2026)
VALUES
('RH', 'Salaires', 450000, 465000),
('RH', 'Formation', 25000, 22000),
('Finance', 'Salaires', 180000, 175000),
('Finance', 'Honoraires', 30000, 38000),
('Informatique', 'Logiciels', 60000, 72000),
('Informatique', 'Materiel', 45000, 41000),
('Commercial', 'Deplacements', 35000, 42000),
('Commercial', 'Salaires', 250000, 245000),
('Marketing', 'Publicite', 80000, 95000),
('Marketing', 'Evenements', 30000, 27000);

/* ================================================
   3. VERIFICATION DES DONNEES
================================================ */

SELECT *
FROM Suivi_Budgetaire;

/* ================================================
   4. ANALYSE BUDGETAIRE PAR SERVICE
================================================ */

SELECT
    Service,
    SUM(Budget_2026) AS Budget_Total,
    SUM(Reel_2026) AS Reel_Total,
    SUM(Reel_2026) - SUM(Budget_2026) AS Ecart

FROM Suivi_Budgetaire

GROUP BY Service

ORDER BY Ecart DESC;
