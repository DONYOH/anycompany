-- CONFIGURATION DE L'ENVIRONNEMENT
USE ROLE ACCOUNTADMIN;

CREATE DATABASE IF NOT EXISTS ANYCOMPANY_LAB;
CREATE SCHEMA IF NOT EXISTS ANYCOMPANY_LAB.BRONZE;
CREATE SCHEMA IF NOT EXISTS ANYCOMPANY_LAB.SILVER;

USE SCHEMA ANYCOMPANY_LAB.BRONZE;

-- 1. FORMATS DE FICHIERS
CREATE OR REPLACE FILE FORMAT CSV_FORMAT
  TYPE = 'CSV'
  FIELD_DELIMITER = ','
  RECORD_DELIMITER = '\n'
  SKIP_HEADER = 1
  FIELD_OPTIONALLY_ENCLOSED_BY = '\042' 
  NULL_IF = ('')
  TRIM_SPACE = TRUE;

CREATE OR REPLACE FILE FORMAT JSON_FORMAT
  TYPE = 'JSON'
  STRIP_OUTER_ARRAY = TRUE;

-- 2. STAGE S3
CREATE OR REPLACE STAGE CSV_STAGE 
  URL = 's3://logbrain-datalake/datasets/food-beverage/'
  FILE_FORMAT = CSV_FORMAT;

-- CRÉATION DES TABLES BRONZE
CREATE OR REPLACE TABLE customer_demographics (
    customer_id STRING,
    name STRING,
    date_of_birth STRING,
    gender STRING,
    region STRING,
    country STRING,
    city STRING,
    marital_status STRING,
    annual_income STRING
);

-- Correction : Ajout de customer_id et type STRING pour la date
CREATE OR REPLACE TABLE customer_service_interactions (
    interaction_id STRING,
    customer_id STRING,
    interaction_date STRING,
    interaction_type STRING,
    issue_category STRING,
    description STRING,
    duration_minutes STRING,
    resolution_status STRING,
    follow_up_required STRING,
    customer_satisfaction STRING
);

CREATE OR REPLACE TABLE financial_transactions (
    transaction_id STRING,
    transaction_date STRING,
    transaction_type STRING,
    amount STRING,
    payment_method STRING,
    entity STRING,
    region STRING,
    account_code STRING
);

CREATE OR REPLACE TABLE promotions (
    promotion_id STRING,
    product_category STRING,
    promotion_type STRING,
    discount_percentage STRING,
    start_date STRING,
    end_date STRING,
    region STRING
);

CREATE OR REPLACE TABLE marketing_campaigns (
    campaign_id STRING,
    campaign_name STRING,
    campaign_type STRING,
    product_category STRING,
    target_audience STRING,
    start_date STRING,
    end_date STRING,
    region STRING,
    budget STRING,
    reach STRING,
    conversion_rate STRING
);

CREATE OR REPLACE TABLE product_reviews (
    review_id STRING,
    product_id STRING,
    reviewer_id STRING,
    reviewer_name STRING,
    rating STRING,
    review_date STRING,
    review_title STRING,
    review_text STRING,
    product_category STRING
);

CREATE OR REPLACE TABLE logistics_and_shipping (
    shipment_id STRING,
    order_id STRING,
    ship_date STRING,
    estimated_delivery STRING,
    shipping_method STRING,
    status STRING,
    shipping_cost STRING,
    destination_region STRING,
    destination_country STRING,
    carrier STRING
);

CREATE OR REPLACE TABLE supplier_informations (
    supplier_id STRING,
    supplier_name STRING,
    product_category STRING,
    region STRING,
    country STRING,
    city STRING,
    lead_time STRING,
    reliability_score STRING,
    quality_rating STRING
);

CREATE OR REPLACE TABLE employee_records(
    employee_id STRING,
    name STRING,
    date_of_birth STRING,
    hire_date STRING,
    department STRING,
    job_title STRING,
    salary STRING,
    region STRING,
    country STRING,
    email STRING
);

-- Tables JSON simplifiées (Type VARIANT uniquement)
CREATE OR REPLACE TABLE json_store_locations (
    data VARIANT,
    ingested_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE json_inventory (
    data VARIANT,
    ingested_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);
-- CHARGEMENT DES DONNÉES (COPY INTO)
COPY INTO customer_demographics FROM @CSV_STAGE/customer_demographics.csv;
COPY INTO customer_service_interactions FROM @CSV_STAGE/customer_service_interactions.csv;
COPY INTO financial_transactions FROM @CSV_STAGE/financial_transactions.csv;
COPY INTO promotions FROM @CSV_STAGE/promotions-data.csv;
COPY INTO marketing_campaigns FROM @CSV_STAGE/marketing_campaigns.csv;

-- Chargement spécifique pour les avis (gestion colonnes manquantes)
COPY INTO product_reviews 
FROM @CSV_STAGE/product_reviews.csv 
FILE_FORMAT = (FORMAT_NAME = CSV_FORMAT ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE)
ON_ERROR = 'CONTINUE';

COPY INTO logistics_and_shipping FROM @CSV_STAGE/logistics_and_shipping.csv;
COPY INTO supplier_informations FROM @CSV_STAGE/supplier_information.csv;
COPY INTO employee_records FROM @CSV_STAGE/employee_records.csv;

-- Chargement JSON
COPY INTO json_inventory (data) FROM @CSV_STAGE/inventory.json FILE_FORMAT = (FORMAT_NAME = JSON_FORMAT);
COPY INTO json_store_locations (data) FROM @CSV_STAGE/store_locations.json FILE_FORMAT = (FORMAT_NAME = JSON_FORMAT);

-- VÉRIFICATIONS FINALES

-- 1. Résumé des volumes
SELECT 'customer_demographics' as table_name, COUNT(*) as row_count FROM customer_demographics
UNION ALL
SELECT 'customer_service_interactions', COUNT(*) FROM customer_service_interactions
UNION ALL
SELECT 'employee_records', COUNT(*) FROM employee_records
UNION ALL
SELECT 'financial_transactions', COUNT(*) FROM financial_transactions
UNION ALL
SELECT 'marketing_campaigns', COUNT(*) FROM marketing_campaigns
UNION ALL
SELECT 'product_reviews', COUNT(*) FROM product_reviews
UNION ALL
SELECT 'promotions', COUNT(*) FROM promotions
UNION ALL
SELECT 'logistics_and_shipping', COUNT(*) FROM logistics_and_shipping
UNION ALL
SELECT 'supplier_informations', COUNT(*) FROM supplier_informations
UNION ALL
SELECT 'json_inventory', COUNT(*) FROM json_inventory
UNION ALL
SELECT 'json_store_locations', COUNT(*) FROM json_store_locations;

-- 2. Aperçu des données JSON (pour vérifier l'extraction)
SELECT data:product_id::string as sample_id, data FROM json_inventory LIMIT 5;
