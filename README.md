# 🚀 Rendu de Projet : Workshop Data-Driven Marketing Analytics
**Équipe Projet : Eric (Data Eng), Antoine (Business Analyst), Sofiane (ML Engineer)**

Ce projet documente la réponse technique et stratégique apportée à la crise de croissance de **AnyCompany Food & Beverage**. L'objectif est de piloter le redressement de la part de marché de 22 % à **32 % d'ici fin 2025**.

---

## 🏗️ Architecture Technique & Ressources

### 📂 Sources de Données (Data Lake)
Les données brutes ont été ingérées depuis le bucket Amazon S3 public :
* **URL Source S3** : `s3://logbrain-datalake/datasets/food-beverage/`
* **Format des fichiers** : 
    * 9 fichiers `.csv` (ex: `financial_transactions`, `customer_demographics`)
    * 2 fichiers `.json` (ex: `inventory.json`, `store_locations.json`)

### ☁️ Environnement Snowflake
* **Compte d'essai** : MBAESG (Rôle Étudiant)
* **Édition** : Enterprise
* **Cloud & Région** : AWS / `us-west-2`
* **Base de données** : `ANYCOMPANY_LAB`

---

## 👥 Équipe & Responsabilités

* **Eric (Data Engineer)** : Mise en place de l'infrastructure, création des `FILE FORMATS` et ingestion des données via `COPY INTO`.
* **Antoine (Business Analyst)** : Nettoyage des données (Schéma SILVER), analyses exploratoires SQL et définition des KPIs de performance.
* **Sofiane (ML Engineer)** : Conception du Data Product final, features engineering et déploiement de l'interface **Streamlit**.

---

## 🏗️ Parcours du Lab (Architecture Medallion)

Le projet suit une transformation de la donnée en trois couches distinctes dans Snowflake :

### Phase 1 : Ingestion (Schéma BRONZE)
* **Configuration** : Création d'un `STAGE` externe pointant vers S3.
* **Chargement** : Ingestion brute des 11 domaines métier (Ventes, Promotions, Marketing, Logistique, Inventaire, etc.).

### Phase 2 : Nettoyage & Exploration (Schéma SILVER)
* **Data Cleansing** : Suppression des doublons, gestion des valeurs nulles et normalisation des dates.
* **Qualité** : Correction des anomalies (ex: incohérences prénoms/genres et erreurs chronologiques dans les dates d'embauche).
* **Analyses Business** : Corrélation entre les campagnes marketing et l'évolution des transactions de vente.

### Phase 3 : Data Product & ML (Schéma ANALYTICS)
* **Data Product** : Création de la table `FACT_SALES_PERFORMANCE` pour croiser ventes et promotions en temps réel.
* **Machine Learning** : Modélisation sous **Streamlit** pour identifier les segments clients à haut potentiel et optimiser le budget marketing réduit (-30 %).

---

## 📈 Indicateurs Clés de Succès (KPIs)

| KPI | Source Snowflake | Objectif Business |
| :--- | :--- | :--- |
| **Market Share** | `FACT_SALES_PERFORMANCE` | Passer de 22 % à 32 % (Objectif T4 2025). |
| **Conversion Rate** | `marketing_campaigns` | Identifier les campagnes avec un taux > 7 %. |
| **Stock Health** | `inventory_clean` | Alerte automatique sur les produits avec un `Lead Time` > 15 jours. |

---

## 🚀 Instructions de Déploiement
1. **Initialisation** : Exécuter les scripts de création des schémas (`BRONZE`, `SILVER`, `ANALYTICS`).
2. **Ingestion** : Lancer le script de chargement `COPY INTO` à partir du stage S3.
3. **Transformation** : Exécuter les procédures SQL de nettoyage pour peupler la couche Silver.
4. **Visualisation** : Lancer l'application Streamlit avec la commande `streamlit run app.py` pour accéder au dashboard de pilotage.

---
**Date de rendu** : 9 Avril 2026  
**Société** : MBAESG / AnyCompany Food & Beverage  
**Lien Snowflake** : [Insérez l'URL de votre compte Snowflake ici]
