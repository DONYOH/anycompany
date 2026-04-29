-- CONFIGURATION : SCHÉMA SILVER UNIQUEMENT
USE DATABASE ANYCOMPANY_LAB;
CREATE SCHEMA IF NOT EXISTS SILVER;
USE SCHEMA SILVER;

-- 1. CLIENTS (Nettoyage et Dédoublonnage sur Nom/Date de Naissance)
CREATE OR REPLACE TABLE customer_demographics_clean AS
SELECT 
    INITCAP(name) as name,
    TRY_TO_DATE(date_of_birth::TEXT) as birth_date,
    NVL(UPPER(gender::TEXT), 'UNKNOWN') as gender,
    UPPER(region::TEXT) as region,
    UPPER(country::TEXT) as country,
    city,
    marital_status,
    TRY_CAST(annual_income::TEXT AS NUMBER(12,2)) as annual_income
FROM ANYCOMPANY_LAB.BRONZE.customer_demographics
QUALIFY ROW_NUMBER() OVER (PARTITION BY name, date_of_birth ORDER BY annual_income DESC) = 1;

-- 2. SERVICE CLIENT (Interactions)
CREATE OR REPLACE TABLE customer_service_interactions_clean AS
SELECT 
    interaction_id,
    TRY_TO_DATE(interaction_date::TEXT) as interaction_date,
    interaction_type,
    issue_category,
    description,
    duration_minutes::FLOAT as duration_minutes,
    resolution_status,
    CASE 
        WHEN UPPER(follow_up_required::TEXT) IN ('YES', 'TRUE', '1') THEN TRUE 
        ELSE FALSE 
    END as follow_up_required,
    customer_satisfaction::NUMBER as satisfaction_score
FROM ANYCOMPANY_LAB.BRONZE.customer_service_interactions
WHERE interaction_id IS NOT NULL;

-- 3. FINANCE (Transactions)
CREATE OR REPLACE TABLE financial_transactions_clean AS
SELECT 
    transaction_id,
    TRY_TO_DATE(transaction_date::TEXT) as transaction_date,
    UPPER(transaction_type::TEXT) as transaction_type,
    ABS(TRY_CAST(amount::TEXT AS FLOAT)) as amount,
    payment_method,
    entity,
    region,
    account_code
FROM ANYCOMPANY_LAB.BRONZE.financial_transactions
WHERE transaction_id IS NOT NULL AND amount IS NOT NULL;

-- 4. MARKETING (Campagnes)
CREATE OR REPLACE TABLE marketing_campaigns_clean AS
SELECT 
    campaign_id,
    campaign_name,
    campaign_type,
    product_category,
    TRY_TO_DATE(start_date::TEXT) as start_date,
    TRY_TO_DATE(end_date::TEXT) as end_date,
    region,
    TRY_CAST(budget::TEXT AS FLOAT) as budget,
    TRY_CAST(reach::TEXT AS NUMBER) as reach,
    TRY_CAST(conversion_rate::TEXT AS FLOAT) as conversion_rate
FROM ANYCOMPANY_LAB.BRONZE.marketing_campaigns;

-- 5. PROMOTIONS
CREATE OR REPLACE TABLE promotions_clean AS
SELECT 
    promotion_id,
    product_category,
    promotion_type,
    TRY_CAST(REPLACE(discount_percentage::TEXT, '%', '') AS FLOAT) as discount_pct,
    TRY_TO_DATE(start_date::TEXT) as start_date,
    TRY_TO_DATE(end_date::TEXT) as end_date,
    region
FROM ANYCOMPANY_LAB.BRONZE.promotions;

-- 6. LOGISTIQUE (Shipping)
CREATE OR REPLACE TABLE logistics_and_shipping_clean AS
SELECT 
    shipment_id,
    order_id,
    TRY_TO_DATE(ship_date::TEXT) as ship_date,
    TRY_TO_DATE(estimated_delivery::TEXT) as est_delivery_date,
    shipping_method,
    status,
    TRY_CAST(shipping_cost::TEXT AS FLOAT) as shipping_cost,
    carrier,
    DATEDIFF('day', TRY_TO_DATE(ship_date::TEXT), TRY_TO_DATE(estimated_delivery::TEXT)) as planned_days
FROM ANYCOMPANY_LAB.BRONZE.logistics_and_shipping;

-- 7. AVIS PRODUITS (Reviews)
CREATE OR REPLACE TABLE product_reviews_clean AS
SELECT 
    review_id,
    product_id,
    reviewer_id,
    TRY_CAST(rating::TEXT AS FLOAT) as rating,
    TRY_TO_DATE(review_date::TEXT) as review_date,
    TRIM(review_title) as review_title,
    TRIM(review_text) as review_text,
    product_category
FROM ANYCOMPANY_LAB.BRONZE.product_reviews;

-- 8. RH (Employees)
CREATE OR REPLACE TABLE employee_records_clean AS
SELECT 
    employee_id,
    INITCAP(name) as name,
    TRY_TO_DATE(date_of_birth::TEXT) as birth_date,
    TRY_TO_DATE(hire_date::TEXT) as hire_date,
    department,
    job_title,
    TRY_CAST(salary::TEXT AS NUMBER(12,2)) as salary,
    region,
    LOWER(email) as email
FROM ANYCOMPANY_LAB.BRONZE.employee_records;

-- 9. FOURNISSEURS (Suppliers)
CREATE OR REPLACE TABLE supplier_informations_clean AS
SELECT 
    supplier_id,
    supplier_name,
    product_category,
    region,
    country,
    TRY_CAST(lead_time::TEXT AS NUMBER) as lead_time_days,
    TRY_CAST(reliability_score::TEXT AS FLOAT) as reliability_score,
    TRY_CAST(quality_rating::TEXT AS FLOAT) as quality_rating
FROM ANYCOMPANY_LAB.BRONZE.supplier_informations;

-- 10. INVENTAIRE (JSON FLAT)
CREATE OR REPLACE TABLE inventory_clean AS
SELECT 
    data:product_id::STRING as product_id,
    data:product_category::STRING as product_category,
    data:region::STRING as region,
    data:country::STRING as country,
    data:warehouse::STRING as warehouse,
    data:current_stock::NUMBER as current_stock,
    data:reorder_point::NUMBER as reorder_point,
    data:lead_time::NUMBER as lead_time_days,
    TRY_TO_DATE(data:last_restock_date::STRING) as last_restock_date
FROM ANYCOMPANY_LAB.BRONZE.json_inventory;

-- 11. MAGASINS (JSON FLAT)
CREATE OR REPLACE TABLE store_locations_clean AS
SELECT 
    data:store_id::STRING as store_id,
    data:store_name::STRING as store_name,
    data:store_type::STRING as store_type,
    UPPER(data:region::STRING) as region,
    UPPER(data:country::STRING) as country,
    data:city::STRING as city,
    data:address::STRING as address,
    data:postal_code::STRING as postal_code,
    data:square_footage::FLOAT as square_footage,
    data:employee_count::NUMBER as employee_count
FROM ANYCOMPANY_LAB.BRONZE.json_store_locations;

--Voire la liste des tables
SHOW TABLES;

--Vérification des lignes néttoyées 
USE DATABASE ANYCOMPANY_LAB;
-- Comparaison systématique des volumes entre les deux couches
SELECT 
    '1. Clients (Demographics)' AS TABLE_NAME,
    (SELECT COUNT(*) FROM BRONZE.customer_demographics) AS NB_BRONZE,
    (SELECT COUNT(*) FROM SILVER.customer_demographics_clean) AS NB_SILVER,
    (NB_BRONZE - NB_SILVER) AS LIGNES_NETTOYEES,
    CASE 
        WHEN NB_SILVER = 0 THEN 'ERREUR : Table Vide'
        WHEN NB_BRONZE = NB_SILVER THEN 'Intégrité Totale'
        ELSE 'Nettoyage effectué (Doublons/Nulls)'
    END AS STATUT
    
UNION ALL

SELECT 
    '2. Service Client (Interactions)',
    (SELECT COUNT(*) FROM BRONZE.customer_service_interactions),
    (SELECT COUNT(*) FROM SILVER.customer_service_interactions_clean),
    ((SELECT COUNT(*) FROM BRONZE.customer_service_interactions) - (SELECT COUNT(*) FROM SILVER.customer_service_interactions_clean)),
    CASE WHEN (SELECT COUNT(*) FROM SILVER.customer_service_interactions_clean) > 0 THEN 'OK' ELSE 'VIDE' END

UNION ALL

SELECT 
    '3. Finance (Transactions)',
    (SELECT COUNT(*) FROM BRONZE.financial_transactions),
    (SELECT COUNT(*) FROM SILVER.financial_transactions_clean),
    ((SELECT COUNT(*) FROM BRONZE.financial_transactions) - (SELECT COUNT(*) FROM SILVER.financial_transactions_clean)),
    CASE WHEN (SELECT COUNT(*) FROM SILVER.financial_transactions_clean) > 0 THEN 'OK' ELSE 'VIDE' END

UNION ALL

SELECT 
    '4. Marketing (Campaigns)',
    (SELECT COUNT(*) FROM BRONZE.marketing_campaigns),
    (SELECT COUNT(*) FROM SILVER.marketing_campaigns_clean),
    ((SELECT COUNT(*) FROM BRONZE.marketing_campaigns) - (SELECT COUNT(*) FROM SILVER.marketing_campaigns_clean)),
    CASE WHEN (SELECT COUNT(*) FROM SILVER.marketing_campaigns_clean) > 0 THEN 'OK' ELSE 'VIDE' END

UNION ALL

SELECT 
    '5. Promotions',
    (SELECT COUNT(*) FROM BRONZE.promotions),
    (SELECT COUNT(*) FROM SILVER.promotions_clean),
    ((SELECT COUNT(*) FROM BRONZE.promotions) - (SELECT COUNT(*) FROM SILVER.promotions_clean)),
    CASE WHEN (SELECT COUNT(*) FROM SILVER.promotions_clean) > 0 THEN 'OK' ELSE 'VIDE' END

UNION ALL

SELECT 
    '6. Logistique (Shipping)',
    (SELECT COUNT(*) FROM BRONZE.logistics_and_shipping),
    (SELECT COUNT(*) FROM SILVER.logistics_and_shipping_clean),
    ((SELECT COUNT(*) FROM BRONZE.logistics_and_shipping) - (SELECT COUNT(*) FROM SILVER.logistics_and_shipping_clean)),
    CASE WHEN (SELECT COUNT(*) FROM SILVER.logistics_and_shipping_clean) > 0 THEN 'OK' ELSE 'VIDE' END

UNION ALL

SELECT 
    '7. Avis Produits (Reviews)',
    (SELECT COUNT(*) FROM BRONZE.product_reviews),
    (SELECT COUNT(*) FROM SILVER.product_reviews_clean),
    ((SELECT COUNT(*) FROM BRONZE.product_reviews) - (SELECT COUNT(*) FROM SILVER.product_reviews_clean)),
    CASE WHEN (SELECT COUNT(*) FROM SILVER.product_reviews_clean) > 0 THEN 'OK' ELSE 'VIDE' END

UNION ALL

SELECT 
    '8. RH (Employees)',
    (SELECT COUNT(*) FROM BRONZE.employee_records),
    (SELECT COUNT(*) FROM SILVER.employee_records_clean),
    ((SELECT COUNT(*) FROM BRONZE.employee_records) - (SELECT COUNT(*) FROM SILVER.employee_records_clean)),
    CASE WHEN (SELECT COUNT(*) FROM SILVER.employee_records_clean) > 0 THEN 'OK' ELSE 'VIDE' END

UNION ALL

SELECT 
    '9. Fournisseurs (Suppliers)',
    (SELECT COUNT(*) FROM BRONZE.supplier_informations),
    (SELECT COUNT(*) FROM SILVER.supplier_informations_clean),
    ((SELECT COUNT(*) FROM BRONZE.supplier_informations) - (SELECT COUNT(*) FROM SILVER.supplier_informations_clean)),
    CASE WHEN (SELECT COUNT(*) FROM SILVER.supplier_informations_clean) > 0 THEN 'OK' ELSE 'VIDE' END

UNION ALL

SELECT 
    '10. Inventaire (JSON)',
    (SELECT COUNT(*) FROM BRONZE.json_inventory),
    (SELECT COUNT(*) FROM SILVER.inventory_clean),
    0,
    CASE WHEN (SELECT COUNT(*) FROM SILVER.inventory_clean) > 0 THEN 'JSON Extrait' ELSE 'VIDE' END

UNION ALL

SELECT 
    '11. Magasins (JSON)',
    (SELECT COUNT(*) FROM BRONZE.json_store_locations),
    (SELECT COUNT(*) FROM SILVER.store_locations_clean),
    0,
    CASE WHEN (SELECT COUNT(*) FROM SILVER.store_locations_clean) > 0 THEN 'JSON Extrait' ELSE 'VIDE' END;   
