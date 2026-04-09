USE DATABASE ANYCOMPANY_LAB;
-- À exécuter dans Snowflake (ACCOUNTADMIN)
CREATE OR REPLACE API INTEGRATION git_api_integration
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/DONYOH')
  ENABLED = TRUE;

CREATE OR REPLACE GIT REPOSITORY anycompany
  API_INTEGRATION = git_api_integration
  ORIGIN = 'https://github.com/VOTRE_NOM/anycompany.git';

-- Pour récupérer les dernières modifications de GitHub dans Snowflake
ALTER GIT REPOSITORY anycompany_repo FETCH;

-- À exécuter à chaque fois que vous changez le code sur GitHub
ALTER GIT REPOSITORY ANYCOMPANY_LAB.SILVER.anycompany_repo FETCH;

-- Remplacez le chemin par celui de votre fichier dans le dépôt
EXECUTE IMMEDIATE FROM @ANYCOMPANY_LAB.SILVER.anycompany_repo/branches/main/silver_layer_setup.sql;


-- Sélection du rôle 
USE ROLE ACCOUNTADMIN;

ALTER ACCOUNT SET PASSWORD_POLICY = (
  MIN_LENGTH = 4
  MIN_UPPER_CASE_CHARS = 0
  MIN_LOWER_CASE_CHARS = 0
  MIN_NUMERIC_CHARS = 0
  MIN_SPECIAL_CHARS = 0
);

--------------------------------------------------
-- Gestion des rôles
--------------------------------------------------
USE ROLE SECURITYADMIN;

CREATE ROLE IF NOT EXISTS LECTURE;

GRANT USAGE ON DATABASE ANYCOMPANY_LAB TO ROLE LECTURE;
GRANT USAGE ON SCHEMA ANYCOMPANY_LAB.SILVER TO ROLE LECTURE;
GRANT SELECT ON ALL TABLES IN SCHEMA ANYCOMPANY_LAB.SILVER TO ROLE LECTURE;
GRANT SELECT ON FUTURE TABLES IN SCHEMA ANYCOMPANY_LAB.SILVER TO ROLE LECTURE;
GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE LECTURE;

--------------------------------------------------
-- Utilisateur ANTOINE
--------------------------------------------------
CREATE USER IF NOT EXISTS ANTOINE
  PASSWORD = '2026'
  LOGIN_NAME = 'antoine'
  EMAIL = 'antoinemekawy77300@gmail.com'
  MUST_CHANGE_PASSWORD = TRUE;

GRANT ROLE LECTURE TO USER ANTOINE;

ALTER USER ANTOINE 
SET DEFAULT_ROLE = LECTURE,
    DEFAULT_WAREHOUSE = COMPUTE_WH;

--------------------------------------------------
-- Utilisateur SOFIANE
--------------------------------------------------
CREATE USER IF NOT EXISTS SOFIANE
  PASSWORD = 'G7#v2k!L9pQx$n'
  LOGIN_NAME = 'sofianee'
  EMAIL = 'sof.elmorabit@gmail.com'
  MUST_CHANGE_PASSWORD = TRUE;

GRANT ROLE LECTURE TO USER SOFIANE;

ALTER USER SOFIANE 
SET DEFAULT_ROLE = LECTURE,
    DEFAULT_WAREHOUSE = COMPUTE_WH;

--------------------------------------------------
-- Vérification
--------------------------------------------------
SHOW USERS;

