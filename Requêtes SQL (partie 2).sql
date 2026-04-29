Partie 2.1 – Compréhension des jeux de données

-- INVENTAIRE DES TABLES

SHOW TABLES IN SCHEMA ANYCOMPANY_LAB.SILVER;


-- TABLE 1 : CUSTOMER_DEMOGRAPHICS_CLEAN

-- Aperçu
SELECT *
FROM ANYCOMPANY_LAB.SILVER.CUSTOMER_DEMOGRAPHICS_CLEAN
LIMIT 20;

-- Nombre de lignes
SELECT COUNT(*) AS nombre_de_lignes
FROM ANYCOMPANY_LAB.SILVER.CUSTOMER_DEMOGRAPHICS_CLEAN;

-- Structure de la table
DESC TABLE ANYCOMPANY_LAB.SILVER.CUSTOMER_DEMOGRAPHICS_CLEAN;

-- Valeurs manquantes
SELECT
    COUNT(*) AS nombre_total_de_lignes,
    COUNT_IF(NAME IS NULL) AS nom_manquant,
    COUNT_IF(BIRTH_DATE IS NULL) AS date_naissance_manquante,
    COUNT_IF(GENDER IS NULL) AS genre_manquant,
    COUNT_IF(REGION IS NULL) AS region_manquante,
    COUNT_IF(COUNTRY IS NULL) AS pays_manquant,
    COUNT_IF(CITY IS NULL) AS ville_manquante,
    COUNT_IF(MARITAL_STATUS IS NULL) AS statut_marital_manquant,
    COUNT_IF(ANNUAL_INCOME IS NULL) AS revenu_annuel_manquant
FROM ANYCOMPANY_LAB.SILVER.CUSTOMER_DEMOGRAPHICS_CLEAN;


-- TABLE 2 : CUSTOMER_SERVICE_INTERACTIONS_CLEAN

-- Aperçu
SELECT *
FROM ANYCOMPANY_LAB.SILVER.CUSTOMER_SERVICE_INTERACTIONS_CLEAN
LIMIT 20;

-- Nombre de lignes
SELECT COUNT(*) AS nombre_de_lignes
FROM ANYCOMPANY_LAB.SILVER.CUSTOMER_SERVICE_INTERACTIONS_CLEAN;

-- Structure de la table
DESC TABLE ANYCOMPANY_LAB.SILVER.CUSTOMER_SERVICE_INTERACTIONS_CLEAN;

-- Période couverte
SELECT
    MIN(INTERACTION_DATE) AS date_debut,
    MAX(INTERACTION_DATE) AS date_fin
FROM ANYCOMPANY_LAB.SILVER.CUSTOMER_SERVICE_INTERACTIONS_CLEAN;

-- Valeurs manquantes
SELECT
    COUNT(*) AS nombre_total_de_lignes,
    COUNT_IF(INTERACTION_ID IS NULL) AS id_interaction_manquant,
    COUNT_IF(INTERACTION_DATE IS NULL) AS date_interaction_manquante,
    COUNT_IF(INTERACTION_TYPE IS NULL) AS type_interaction_manquant,
    COUNT_IF(ISSUE_CATEGORY IS NULL) AS categorie_probleme_manquante,
    COUNT_IF(DESCRIPTION IS NULL) AS description_manquante,
    COUNT_IF(DURATION_MINUTES IS NULL) AS duree_manquante,
    COUNT_IF(RESOLUTION_STATUS IS NULL) AS statut_resolution_manquant,
    COUNT_IF(FOLLOW_UP_REQUIRED IS NULL) AS suivi_manquant,
    COUNT_IF(SATISFACTION_SCORE IS NULL) AS score_satisfaction_manquant
FROM ANYCOMPANY_LAB.SILVER.CUSTOMER_SERVICE_INTERACTIONS_CLEAN;


-- TABLE 3 : EMPLOYEE_RECORDS_CLEAN

-- Aperçu
SELECT *
FROM ANYCOMPANY_LAB.SILVER.EMPLOYEE_RECORDS_CLEAN
LIMIT 20;

-- Nombre de lignes
SELECT COUNT(*) AS nombre_de_lignes
FROM ANYCOMPANY_LAB.SILVER.EMPLOYEE_RECORDS_CLEAN;

-- Structure de la table
DESC TABLE ANYCOMPANY_LAB.SILVER.EMPLOYEE_RECORDS_CLEAN;

-- Période couverte
SELECT
    MIN(HIRE_DATE) AS date_debut,
    MAX(HIRE_DATE) AS date_fin
FROM ANYCOMPANY_LAB.SILVER.EMPLOYEE_RECORDS_CLEAN;

-- Valeurs manquantes
SELECT
    COUNT(*) AS nombre_total_de_lignes,
    COUNT_IF(EMPLOYEE_ID IS NULL) AS id_employe_manquant,
    COUNT_IF(NAME IS NULL) AS nom_manquant,
    COUNT_IF(BIRTH_DATE IS NULL) AS date_naissance_manquante,
    COUNT_IF(HIRE_DATE IS NULL) AS date_embauche_manquante,
    COUNT_IF(DEPARTMENT IS NULL) AS departement_manquant,
    COUNT_IF(JOB_TITLE IS NULL) AS poste_manquant,
    COUNT_IF(SALARY IS NULL) AS salaire_manquant,
    COUNT_IF(REGION IS NULL) AS region_manquante,
    COUNT_IF(EMAIL IS NULL) AS email_manquant
FROM ANYCOMPANY_LAB.SILVER.EMPLOYEE_RECORDS_CLEAN;


-- TABLE 4 : FINANCIAL_TRANSACTIONS_CLEAN

-- Aperçu
SELECT *
FROM ANYCOMPANY_LAB.SILVER.FINANCIAL_TRANSACTIONS_CLEAN
LIMIT 20;

-- Nombre de lignes
SELECT COUNT(*) AS nombre_de_lignes
FROM ANYCOMPANY_LAB.SILVER.FINANCIAL_TRANSACTIONS_CLEAN;

-- Structure de la table
DESC TABLE ANYCOMPANY_LAB.SILVER.FINANCIAL_TRANSACTIONS_CLEAN;

-- Période couverte
SELECT
    MIN(TRANSACTION_DATE) AS date_debut,
    MAX(TRANSACTION_DATE) AS date_fin
FROM ANYCOMPANY_LAB.SILVER.FINANCIAL_TRANSACTIONS_CLEAN;

-- Valeurs manquantes
SELECT
    COUNT(*) AS nombre_total_de_lignes,
    COUNT_IF(TRANSACTION_ID IS NULL) AS id_transaction_manquant,
    COUNT_IF(TRANSACTION_DATE IS NULL) AS date_transaction_manquante,
    COUNT_IF(TRANSACTION_TYPE IS NULL) AS type_transaction_manquant,
    COUNT_IF(AMOUNT IS NULL) AS montant_manquant,
    COUNT_IF(PAYMENT_METHOD IS NULL) AS mode_paiement_manquant,
    COUNT_IF(ENTITY IS NULL) AS entite_manquante,
    COUNT_IF(REGION IS NULL) AS region_manquante,
    COUNT_IF(ACCOUNT_CODE IS NULL) AS code_compte_manquant
FROM ANYCOMPANY_LAB.SILVER.FINANCIAL_TRANSACTIONS_CLEAN;


-- TABLE 5 : INVENTORY_CLEAN

-- Aperçu
SELECT *
FROM ANYCOMPANY_LAB.SILVER.INVENTORY_CLEAN
LIMIT 20;

-- Nombre de lignes
SELECT COUNT(*) AS nombre_de_lignes
FROM ANYCOMPANY_LAB.SILVER.INVENTORY_CLEAN;

-- Structure de la table
DESC TABLE ANYCOMPANY_LAB.SILVER.INVENTORY_CLEAN;

-- Période couverte
SELECT
    MIN(LAST_RESTOCK_DATE) AS date_debut,
    MAX(LAST_RESTOCK_DATE) AS date_fin
FROM ANYCOMPANY_LAB.SILVER.INVENTORY_CLEAN;

-- Valeurs manquantes
SELECT
    COUNT(*) AS nombre_total_de_lignes,
    COUNT_IF(PRODUCT_ID IS NULL) AS id_produit_manquant,
    COUNT_IF(PRODUCT_CATEGORY IS NULL) AS categorie_produit_manquante,
    COUNT_IF(REGION IS NULL) AS region_manquante,
    COUNT_IF(COUNTRY IS NULL) AS pays_manquant,
    COUNT_IF(WAREHOUSE IS NULL) AS entrepot_manquant,
    COUNT_IF(CURRENT_STOCK IS NULL) AS stock_actuel_manquant,
    COUNT_IF(REORDER_POINT IS NULL) AS seuil_reapprovisionnement_manquant,
    COUNT_IF(LEAD_TIME_DAYS IS NULL) AS delai_manquant,
    COUNT_IF(LAST_RESTOCK_DATE IS NULL) AS date_restockage_manquante
FROM ANYCOMPANY_LAB.SILVER.INVENTORY_CLEAN;


-- TABLE 6 : LOGISTICS_AND_SHIPPING_CLEAN

-- Aperçu
SELECT *
FROM ANYCOMPANY_LAB.SILVER.LOGISTICS_AND_SHIPPING_CLEAN
LIMIT 20;

-- Nombre de lignes
SELECT COUNT(*) AS nombre_de_lignes
FROM ANYCOMPANY_LAB.SILVER.LOGISTICS_AND_SHIPPING_CLEAN;

-- Structure de la table
DESC TABLE ANYCOMPANY_LAB.SILVER.LOGISTICS_AND_SHIPPING_CLEAN;

-- Période couverte
SELECT
    MIN(SHIP_DATE) AS date_debut_expedition,
    MAX(SHIP_DATE) AS date_fin_expedition,
    MIN(EST_DELIVERY_DATE) AS date_debut_livraison,
    MAX(EST_DELIVERY_DATE) AS date_fin_livraison
FROM ANYCOMPANY_LAB.SILVER.LOGISTICS_AND_SHIPPING_CLEAN;

-- Valeurs manquantes
SELECT
    COUNT(*) AS nombre_total_de_lignes,
    COUNT_IF(SHIPMENT_ID IS NULL) AS id_expedition_manquant,
    COUNT_IF(ORDER_ID IS NULL) AS id_commande_manquant,
    COUNT_IF(SHIP_DATE IS NULL) AS date_expedition_manquante,
    COUNT_IF(EST_DELIVERY_DATE IS NULL) AS date_livraison_estimee_manquante,
    COUNT_IF(SHIPPING_METHOD IS NULL) AS mode_livraison_manquant,
    COUNT_IF(STATUS IS NULL) AS statut_manquant,
    COUNT_IF(SHIPPING_COST IS NULL) AS cout_livraison_manquant,
    COUNT_IF(CARRIER IS NULL) AS transporteur_manquant,
    COUNT_IF(PLANNED_DAYS IS NULL) AS jours_prevus_manquants
FROM ANYCOMPANY_LAB.SILVER.LOGISTICS_AND_SHIPPING_CLEAN;


-- TABLE 7 : MARKETING_CAMPAIGNS_CLEAN

-- Aperçu
SELECT *
FROM ANYCOMPANY_LAB.SILVER.MARKETING_CAMPAIGNS_CLEAN
LIMIT 20;

-- Nombre de lignes
SELECT COUNT(*) AS nombre_de_lignes
FROM ANYCOMPANY_LAB.SILVER.MARKETING_CAMPAIGNS_CLEAN;

-- Structure de la table
DESC TABLE ANYCOMPANY_LAB.SILVER.MARKETING_CAMPAIGNS_CLEAN;

-- Période couverte
SELECT
    MIN(START_DATE) AS date_debut,
    MAX(END_DATE) AS date_fin
FROM ANYCOMPANY_LAB.SILVER.MARKETING_CAMPAIGNS_CLEAN;

-- Valeurs manquantes
SELECT
    COUNT(*) AS nombre_total_de_lignes,
    COUNT_IF(CAMPAIGN_ID IS NULL) AS id_campagne_manquant,
    COUNT_IF(CAMPAIGN_NAME IS NULL) AS nom_campagne_manquant,
    COUNT_IF(CAMPAIGN_TYPE IS NULL) AS type_campagne_manquant,
    COUNT_IF(PRODUCT_CATEGORY IS NULL) AS categorie_produit_manquante,
    COUNT_IF(START_DATE IS NULL) AS date_debut_manquante,
    COUNT_IF(END_DATE IS NULL) AS date_fin_manquante,
    COUNT_IF(REGION IS NULL) AS region_manquante,
    COUNT_IF(BUDGET IS NULL) AS budget_manquant,
    COUNT_IF(REACH IS NULL) AS portee_manquante
FROM ANYCOMPANY_LAB.SILVER.MARKETING_CAMPAIGNS_CLEAN;


-- TABLE 8 : PRODUCT_REVIEWS_CLEAN

-- Aperçu
SELECT *
FROM ANYCOMPANY_LAB.SILVER.PRODUCT_REVIEWS_CLEAN
LIMIT 20;

-- Nombre de lignes
SELECT COUNT(*) AS nombre_de_lignes
FROM ANYCOMPANY_LAB.SILVER.PRODUCT_REVIEWS_CLEAN;

-- Structure de la table
DESC TABLE ANYCOMPANY_LAB.SILVER.PRODUCT_REVIEWS_CLEAN;

-- Période couverte
SELECT
    MIN(REVIEW_DATE) AS date_debut,
    MAX(REVIEW_DATE) AS date_fin
FROM ANYCOMPANY_LAB.SILVER.PRODUCT_REVIEWS_CLEAN;

-- Valeurs manquantes
SELECT
    COUNT(*) AS nombre_total_de_lignes,
    COUNT_IF(REVIEW_ID IS NULL) AS id_avis_manquant,
    COUNT_IF(PRODUCT_ID IS NULL) AS id_produit_manquant,
    COUNT_IF(REVIEWER_ID IS NULL) AS id_auteur_manquant,
    COUNT_IF(RATING IS NULL) AS note_manquante,
    COUNT_IF(REVIEW_DATE IS NULL) AS date_avis_manquante,
    COUNT_IF(REVIEW_TITLE IS NULL) AS titre_avis_manquant,
    COUNT_IF(REVIEW_TEXT IS NULL) AS texte_avis_manquant,
    COUNT_IF(PRODUCT_CATEGORY IS NULL) AS categorie_produit_manquante
FROM ANYCOMPANY_LAB.SILVER.PRODUCT_REVIEWS_CLEAN;


-- TABLE 9 : PROMOTIONS_CLEAN

-- Aperçu
SELECT *
FROM ANYCOMPANY_LAB.SILVER.PROMOTIONS_CLEAN
LIMIT 20;

-- Nombre de lignes
SELECT COUNT(*) AS nombre_de_lignes
FROM ANYCOMPANY_LAB.SILVER.PROMOTIONS_CLEAN;

-- Structure de la table
DESC TABLE ANYCOMPANY_LAB.SILVER.PROMOTIONS_CLEAN;

-- Période couverte
SELECT
    MIN(START_DATE) AS date_debut,
    MAX(END_DATE) AS date_fin
FROM ANYCOMPANY_LAB.SILVER.PROMOTIONS_CLEAN;

-- Valeurs manquantes
SELECT
    COUNT(*) AS nombre_total_de_lignes,
    COUNT_IF(PROMOTION_ID IS NULL) AS id_promotion_manquant,
    COUNT_IF(PRODUCT_CATEGORY IS NULL) AS categorie_produit_manquante,
    COUNT_IF(PROMOTION_TYPE IS NULL) AS type_promotion_manquant,
    COUNT_IF(DISCOUNT_PCT IS NULL) AS reduction_manquante,
    COUNT_IF(START_DATE IS NULL) AS date_debut_manquante,
    COUNT_IF(END_DATE IS NULL) AS date_fin_manquante,
    COUNT_IF(REGION IS NULL) AS region_manquante
FROM ANYCOMPANY_LAB.SILVER.PROMOTIONS_CLEAN;


-- TABLE 10 : STORE_LOCATIONS_CLEAN

-- Aperçu
SELECT *
FROM ANYCOMPANY_LAB.SILVER.STORE_LOCATIONS_CLEAN
LIMIT 20;

-- Nombre de lignes
SELECT COUNT(*) AS nombre_de_lignes
FROM ANYCOMPANY_LAB.SILVER.STORE_LOCATIONS_CLEAN;

-- Structure de la table
DESC TABLE ANYCOMPANY_LAB.SILVER.STORE_LOCATIONS_CLEAN;

-- Valeurs manquantes
SELECT
    COUNT(*) AS nombre_total_de_lignes,
    COUNT_IF(STORE_ID IS NULL) AS id_magasin_manquant,
    COUNT_IF(STORE_NAME IS NULL) AS nom_magasin_manquant,
    COUNT_IF(STORE_TYPE IS NULL) AS type_magasin_manquant,
    COUNT_IF(REGION IS NULL) AS region_manquante,
    COUNT_IF(COUNTRY IS NULL) AS pays_manquant,
    COUNT_IF(CITY IS NULL) AS ville_manquante,
    COUNT_IF(ADDRESS IS NULL) AS adresse_manquante,
    COUNT_IF(POSTAL_CODE IS NULL) AS code_postal_manquant,
    COUNT_IF(SQUARE_FOOTAGE IS NULL) AS surface_manquante,
    COUNT_IF(EMPLOYEE_COUNT IS NULL) AS nombre_employes_manquant
FROM ANYCOMPANY_LAB.SILVER.STORE_LOCATIONS_CLEAN;


-- TABLE 11 : SUPPLIER_INFORMATIONS_CLEAN

-- Aperçu
SELECT *
FROM ANYCOMPANY_LAB.SILVER.SUPPLIER_INFORMATIONS_CLEAN
LIMIT 20;

-- Nombre de lignes
SELECT COUNT(*) AS nombre_de_lignes
FROM ANYCOMPANY_LAB.SILVER.SUPPLIER_INFORMATIONS_CLEAN;

-- Structure de la table
DESC TABLE ANYCOMPANY_LAB.SILVER.SUPPLIER_INFORMATIONS_CLEAN;

-- Valeurs manquantes
SELECT
    COUNT(*) AS nombre_total_de_lignes,
    COUNT_IF(SUPPLIER_ID IS NULL) AS id_fournisseur_manquant,
    COUNT_IF(SUPPLIER_NAME IS NULL) AS nom_fournisseur_manquant,
    COUNT_IF(PRODUCT_CATEGORY IS NULL) AS categorie_produit_manquante,
    COUNT_IF(REGION IS NULL) AS region_manquante,
    COUNT_IF(COUNTRY IS NULL) AS pays_manquant,
    COUNT_IF(LEAD_TIME_DAYS IS NULL) AS delai_manquant,
    COUNT_IF(RELIABILITY_SCORE IS NULL) AS score_fiabilite_manquant,
    COUNT_IF(QUALITY_RATING IS NULL) AS note_qualite_manquante
FROM ANYCOMPANY_LAB.SILVER.SUPPLIER_INFORMATIONS_CLEAN;





Partie 2.2 – Analyses exploratoires descriptives

-- Analyse de l’évolution des ventes dans le temps
SELECT
    YEAR(TRANSACTION_DATE) AS annee,
    COUNT(*) AS nombre_ventes,
    TO_VARCHAR(ROUND(SUM(AMOUNT), 2), '999G999G999G999D00') AS montant_total_ventes
FROM ANYCOMPANY_LAB.SILVER.FINANCIAL_TRANSACTIONS_CLEAN
WHERE UPPER(TRANSACTION_TYPE) = 'SALE'
GROUP BY YEAR(TRANSACTION_DATE)
ORDER BY annee;


-- Performance par catégorie produit
SELECT
    PRODUCT_CATEGORY AS categorie_produit,
    COUNT(*) AS nombre_campagnes,
    TO_VARCHAR(ROUND(SUM(BUDGET), 2), '999G999G999G999D00') AS budget_total,
    ROUND(AVG(CONVERSION_RATE), 4) AS conversion_moyenne,
    TO_VARCHAR(ROUND(AVG(REACH), 0), '999G999G999G999') AS reach_moyen
FROM ANYCOMPANY_LAB.SILVER.MARKETING_CAMPAIGNS_CLEAN
GROUP BY PRODUCT_CATEGORY
ORDER BY SUM(BUDGET) DESC;


-- Performance par région
SELECT
    REGION AS region,
    COUNT(*) AS nombre_transactions,
    TO_VARCHAR(ROUND(SUM(AMOUNT), 2), '999G999G999G999D00') AS montant_total_transactions
FROM ANYCOMPANY_LAB.SILVER.FINANCIAL_TRANSACTIONS_CLEAN
GROUP BY REGION
ORDER BY SUM(AMOUNT) DESC;


-- Répartition des clients par genre
SELECT
    GENDER AS genre,
    COUNT(*) AS nombre_clients
FROM ANYCOMPANY_LAB.SILVER.CUSTOMER_DEMOGRAPHICS_CLEAN
GROUP BY GENDER
ORDER BY nombre_clients DESC;


-- Répartition des clients par région
SELECT
    REGION AS region,
    COUNT(*) AS nombre_clients
FROM ANYCOMPANY_LAB.SILVER.CUSTOMER_DEMOGRAPHICS_CLEAN
GROUP BY REGION
ORDER BY nombre_clients DESC;


-- Revenu moyen des clients par région
SELECT
    REGION AS region,
    TO_VARCHAR(ROUND(AVG(ANNUAL_INCOME), 2), '999G999G999D00') AS revenu_moyen
FROM ANYCOMPANY_LAB.SILVER.CUSTOMER_DEMOGRAPHICS_CLEAN
GROUP BY REGION
ORDER BY AVG(ANNUAL_INCOME) DESC;









Partie 2.3 – Analyses business transverses

-- 1. VENTES & PROMOTIONS
-- Comparaison ventes avec / sans promotion
WITH ventes AS (
    SELECT
        REGION,
        YEAR(TRANSACTION_DATE) AS annee,
        COUNT(*) AS nombre_ventes,
        SUM(AMOUNT) AS montant_total_ventes
    FROM ANYCOMPANY_LAB.SILVER.FINANCIAL_TRANSACTIONS_CLEAN
    WHERE UPPER(TRANSACTION_TYPE) = 'SALE'
    GROUP BY REGION, YEAR(TRANSACTION_DATE)
),
promotions AS (
    SELECT
        REGION,
        YEAR(START_DATE) AS annee,
        COUNT(*) AS nombre_promotions
    FROM ANYCOMPANY_LAB.SILVER.PROMOTIONS_CLEAN
    GROUP BY REGION, YEAR(START_DATE)
)
SELECT
    v.REGION AS region,
    v.annee,
    v.nombre_ventes,
    TO_VARCHAR(ROUND(v.montant_total_ventes, 2), '999G999G999G999D00') AS montant_total_ventes,
    COALESCE(p.nombre_promotions, 0) AS nombre_promotions,
    CASE
        WHEN COALESCE(p.nombre_promotions, 0) > 0 THEN 'Avec promotion'
        ELSE 'Sans promotion'
    END AS statut_promotion
FROM ventes v
LEFT JOIN promotions p
    ON v.REGION = p.REGION
   AND v.annee = p.annee
ORDER BY v.annee, v.montant_total_ventes DESC;

-- Sensibilité des catégories aux promotions
SELECT
    PRODUCT_CATEGORY AS categorie_produit,
    COUNT(*) AS nombre_promotions,
    TO_VARCHAR(ROUND(AVG(DISCOUNT_PCT) * 100, 2), '999D00') || '%' AS reduction_moyenne,
    TO_VARCHAR(ROUND(MAX(DISCOUNT_PCT) * 100, 2), '999D00') || '%' AS reduction_max
FROM ANYCOMPANY_LAB.SILVER.PROMOTIONS_CLEAN
GROUP BY PRODUCT_CATEGORY
ORDER BY AVG(DISCOUNT_PCT) DESC, COUNT(*) DESC;

-- 2. MARKETING & PERFORMANCE COMMERCIALE
-- Lien campagne <-> ventes
WITH ventes_par_region AS (
    SELECT
        REGION,
        COUNT(*) AS nombre_ventes,
        SUM(AMOUNT) AS montant_total_ventes
    FROM ANYCOMPANY_LAB.SILVER.FINANCIAL_TRANSACTIONS_CLEAN
    WHERE UPPER(TRANSACTION_TYPE) = 'SALE'
    GROUP BY REGION
),
campagnes_par_region AS (
    SELECT
        REGION,
        COUNT(*) AS nombre_campagnes,
        SUM(BUDGET) AS budget_total,
        AVG(CONVERSION_RATE) AS conversion_moyenne,
        AVG(REACH) AS reach_moyen
    FROM ANYCOMPANY_LAB.SILVER.MARKETING_CAMPAIGNS_CLEAN
    GROUP BY REGION
)
SELECT
    c.REGION AS region,
    c.nombre_campagnes,
    TO_VARCHAR(ROUND(c.budget_total, 2), '999G999G999G999D00') AS budget_total,
    ROUND(c.conversion_moyenne, 4) AS conversion_moyenne,
    TO_VARCHAR(ROUND(c.reach_moyen, 0), '999G999G999G999') AS reach_moyen,
    COALESCE(v.nombre_ventes, 0) AS nombre_ventes,
    TO_VARCHAR(ROUND(COALESCE(v.montant_total_ventes, 0), 2), '999G999G999G999D00') AS montant_total_ventes
FROM campagnes_par_region c
LEFT JOIN ventes_par_region v
    ON c.REGION = v.REGION
ORDER BY c.budget_total DESC;

-- Identification des campagnes les plus efficaces
SELECT
    CAMPAIGN_NAME AS nom_campagne,
    REGION AS region,
    PRODUCT_CATEGORY AS categorie_produit,
    CAMPAIGN_TYPE AS type_campagne,
    TO_VARCHAR(ROUND(BUDGET, 2), '999G999G999G999D00') AS budget,
    TO_VARCHAR(ROUND(REACH, 0), '999G999G999G999') AS reach,
    ROUND(CONVERSION_RATE, 4) AS conversion_rate
FROM ANYCOMPANY_LAB.SILVER.MARKETING_CAMPAIGNS_CLEAN
ORDER BY CONVERSION_RATE DESC, BUDGET DESC, REACH DESC;

-- 3. EXPÉRIENCE CLIENT
-- Impact des avis produits sur les ventes 
SELECT
    COUNT(*) AS nombre_total_lignes,
    COUNT(PRODUCT_ID) AS product_id_renseigne,
    COUNT(PRODUCT_CATEGORY) AS categorie_renseignee,
    COUNT(RATING) AS rating_renseigne,
    COUNT(REVIEW_DATE) AS date_avis_renseignee
FROM ANYCOMPANY_LAB.SILVER.PRODUCT_REVIEWS_CLEAN;

-- Influence des interactions service client
SELECT
    INTERACTION_TYPE AS type_interaction,
    ISSUE_CATEGORY AS categorie_probleme,
    COUNT(*) AS nombre_interactions,
    ROUND(AVG(DURATION_MINUTES), 2) AS duree_moyenne_minutes,
    ROUND(AVG(SATISFACTION_SCORE), 2) AS satisfaction_moyenne
FROM ANYCOMPANY_LAB.SILVER.CUSTOMER_SERVICE_INTERACTIONS_CLEAN
GROUP BY INTERACTION_TYPE, ISSUE_CATEGORY
ORDER BY satisfaction_moyenne DESC, nombre_interactions DESC;

-- 4. OPÉRATIONS ET LOGISTIQUE
-- Ruptures de stock
SELECT
    REGION AS region,
    PRODUCT_CATEGORY AS categorie_produit,
    COUNT(*) AS nombre_produits,
    SUM(CASE WHEN CURRENT_STOCK <= REORDER_POINT THEN 1 ELSE 0 END) AS nombre_risque_rupture,
    ROUND(AVG(CURRENT_STOCK), 2) AS stock_moyen,
    ROUND(AVG(REORDER_POINT), 2) AS seuil_reappro_moyen,
    ROUND(AVG(LEAD_TIME_DAYS), 2) AS delai_moyen_reappro
FROM ANYCOMPANY_LAB.SILVER.INVENTORY_CLEAN
GROUP BY REGION, PRODUCT_CATEGORY
ORDER BY nombre_risque_rupture DESC, delai_moyen_reappro DESC;

-- Impact des délais de livraison
SELECT
    SHIPPING_METHOD AS mode_livraison,
    STATUS AS statut_livraison,
    COUNT(*) AS nombre_expeditions,
    ROUND(AVG(DATEDIFF('DAY', SHIP_DATE, EST_DELIVERY_DATE)), 2) AS delai_moyen_jours,
    ROUND(AVG(SHIPPING_COST), 2) AS cout_moyen_livraison
FROM ANYCOMPANY_LAB.SILVER.LOGISTICS_AND_SHIPPING_CLEAN
GROUP BY SHIPPING_METHOD, STATUS
ORDER BY delai_moyen_jours DESC, nombre_expeditions DESC;




