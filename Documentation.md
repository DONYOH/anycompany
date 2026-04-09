**Partie 2.1 – Compréhension des jeux de données**

TABLE 1 — CUSTOMER\_DEMOGRAPHICS\_CLEAN

**Périmètre métier**

Cette table contient les informations démographiques des clients. Elle permet de décrire le profil des clients selon leur âge, leur genre, leur localisation et certains éléments socio-économiques.

**Colonnes clés**

Les principales colonnes de cette table sont :

- NAME  
- BIRTH\_DATE  
- GENDER  
- REGION  
- COUNTRY  
- CITY  
- MARITAL\_STATUS  
- ANNUAL\_INCOME

**Volume**

La table contient 5000 lignes.

**Période couverte**

Cette table ne contient pas de vraie période métier d’activité. Elle contient uniquement une date de naissance (BIRTH\_DATE), qui sert à caractériser les clients mais pas à suivre une activité dans le temps.

**Valeurs manquantes et anomalies**

Aucune valeur manquante n’a été détectée sur les colonnes testées.

**Utilité pour l’analyse**

Cette table est utile pour segmenter les clients selon leur profil démographique. Elle peut servir à identifier des segments de clientèle selon la région, le genre ou encore le revenu annuel.

TABLE 2 — CUSTOMER\_SERVICE\_INTERACTIONS\_CLEAN

**Périmètre métier**

Cette table regroupe les interactions entre les clients et le service client. Elle permet de suivre la nature des demandes, les catégories de problèmes, les durées de traitement et le niveau de satisfaction.

**Colonnes clés**

Les principales colonnes sont :

- INTERACTION\_ID  
- INTERACTION\_DATE  
- INTERACTION\_TYPE  
- ISSUE\_CATEGORY  
- DESCRIPTION  
- DURATION\_MINUTES  
- RESOLUTION\_STATUS  
- FOLLOW\_UP\_REQUIRED  
- SATISFACTION\_SCORE

**Volume**

La table contient 5000 lignes.

**Période couverte**

La période couverte va du 2010-01-06 au 2023-12-30.

**Valeurs manquantes et anomalies**

Aucune valeur manquante n’a été détectée sur les colonnes testées.

**Utilité pour l’analyse**

Cette table est utile pour analyser l’expérience client, repérer les types de problèmes les plus fréquents, mesurer la qualité du traitement et étudier la satisfaction des clients.

TABLE 3 — EMPLOYEE\_RECORDS\_CLEAN

**Périmètre métier**

Cette table contient des informations internes sur les employés. Elle relève davantage du contexte organisationnel que du cœur de l’analyse marketing.

**Colonnes clés**

Les principales colonnes sont :

- EMPLOYEE\_ID  
- NAME  
- BIRTH\_DATE  
- HIRE\_DATE  
- DEPARTMENT  
- JOB\_TITLE  
- SALARY  
- REGION  
- EMAIL

**Volume**

La table contient 5000 lignes.

**Période couverte**

La période couverte pour les dates d’embauche va du 2000-01-01 au 2023-12-29.

**Valeurs manquantes et anomalies**

Aucune valeur manquante n’a été détectée sur les colonnes testées.

**Utilité pour l’analyse**

Cette table peut servir de contexte organisationnel, mais elle n’est pas prioritaire pour l’analyse marketing demandée dans la phase 2\.

TABLE 4 — FINANCIAL\_TRANSACTIONS\_CLEAN

**Périmètre métier**

Cette table contient les transactions financières de l’entreprise. Elle constitue une table centrale pour l’analyse des ventes et de l’activité commerciale.

**Colonnes clés**

Les principales colonnes sont :

- TRANSACTION\_ID  
- TRANSACTION\_DATE  
- TRANSACTION\_TYPE  
- AMOUNT  
- PAYMENT\_METHOD  
- ENTITY  
- REGION  
- ACCOUNT\_CODE

**Volume**

La table contient 5000 lignes.

**Période couverte**

La période couverte va du 2010-01-02 au 2023-12-30.

**Valeurs manquantes et anomalies**

Aucune valeur manquante n’a été détectée sur les colonnes testées.

**Anomalies ou points d’attention**

Même si la table est complète, elle contient plusieurs types de transactions et pas uniquement des ventes. Il faudra donc distinguer les transactions de type Sale des autres types de flux financiers.

**Utilité pour l’analyse**

Cette table est essentielle pour analyser l’évolution des transactions, les régions, les types de flux financiers et, potentiellement, les ventes réelles si l’on filtre correctement les types de transaction.

TABLE 5 — INVENTORY\_CLEAN

**Périmètre métier**

Cette table contient les données de stock et de réapprovisionnement. Elle permet d’analyser les niveaux de stock, les seuils de réapprovisionnement et les délais associés.

**Colonnes clés**

Les principales colonnes sont :

- PRODUCT\_ID  
- PRODUCT\_CATEGORY  
- REGION  
- COUNTRY  
- WAREHOUSE  
- CURRENT\_STOCK  
- REORDER\_POINT  
- LEAD\_TIME\_DAYS  
- LAST\_RESTOCK\_DATE

**Volume**

La table contient 5000 lignes.

**Période couverte**

La période couverte va du 2025-01-08 au 2025-02-06.

**Valeurs manquantes et anomalies**

Aucune valeur manquante n’a été détectée sur les colonnes testées.

**Utilité pour l’analyse**

Cette table est utile pour repérer les risques de rupture de stock et comprendre les contraintes d’approvisionnement.

TABLE 6 — LOGISTICS\_AND\_SHIPPING\_CLEAN

**Périmètre métier**

Cette table contient les données logistiques liées aux expéditions et livraisons. Elle permet d’étudier les délais et la performance opérationnelle de la chaîne logistique.

**Colonnes clés**

Les principales colonnes sont :

- SHIPMENT\_ID  
- ORDER\_ID  
- SHIP\_DATE  
- EST\_DELIVERY\_DATE  
- SHIPPING\_METHOD  
- STATUS  
- SHIPPING\_COST  
- CARRIER  
- PLANNED\_DAYS

**Volume**

La table contient 5000 lignes.

**Période couverte**

Période d’expédition : du 2010-01-01 au 2023-12-26

Période de livraison estimée : du 2010-01-08 au 2024-01-07

**Valeurs manquantes et anomalies**

Aucune valeur manquante n’a été détectée sur les colonnes testées.

**Utilité pour l’analyse**

Cette table est utile pour analyser la performance logistique, les délais, les coûts de livraison et leur impact potentiel sur l’activité.

TABLE 7 — MARKETING\_CAMPAIGNS\_CLEAN

**Périmètre métier**

Cette table contient les campagnes marketing menées par l’entreprise. Elle permet d’étudier les efforts marketing dans le temps, par catégorie produit et par région.

**Colonnes clés**

Les principales colonnes sont :

- CAMPAIGN\_ID  
- CAMPAIGN\_NAME  
- CAMPAIGN\_TYPE  
- PRODUCT\_CATEGORY  
- START\_DATE  
- END\_DATE  
- REGION  
- BUDGET  
- REACH

**Volume**

La table contient 5000 lignes.

**Période couverte**

La période couverte va du 2010-01-01 au 2018-01-11.

**Valeurs manquantes et anomalies**

Aucune valeur manquante n’a été détectée sur les colonnes testées.

**Utilité pour l’analyse**

Cette table est utile pour analyser les actions marketing selon le temps, la région et le type de campagne.

TABLE 8 — PRODUCT\_REVIEWS\_CLEAN

**Périmètre métier**

Cette table contient les avis associés aux produits. Elle pourrait normalement permettre d’étudier la perception des produits par les clients.

**Colonnes clés**

Les principales colonnes sont :

- REVIEW\_ID  
- PRODUCT\_ID  
- REVIEWER\_ID  
- RATING  
- REVIEW\_DATE  
- REVIEW\_TITLE  
- REVIEW\_TEXT  
- PRODUCT\_CATEGORY

**Volume**

La table contient 978 lignes.

**Période couverte**

Non exploitable, car REVIEW\_DATE est entièrement nulle :

date début : null

date fin : null

**Valeurs manquantes et anomalies**

Cette table présente des anomalies importantes :

identifiant avis manquant : 0

identifiant produit manquant : 0

identifiant auteur manquant : 0

note manquante : 978

date avis manquante : 978

titre avis manquant : 362

texte avis manquant : 460

catégorie produit manquante : 559

**Utilité pour l’analyse**

Cette table est peu exploitable en l’état. Les colonnes les plus importantes, notamment la note et la date, sont entièrement manquantes. Elle ne peut donc pas servir à une analyse robuste de la satisfaction produit.

TABLE 9 — PROMOTIONS\_CLEAN

**Périmètre métier**

Cette table contient les promotions commerciales appliquées par catégorie de produit et par région.

**Colonnes clés**

Les principales colonnes sont :

- PROMOTION\_ID  
- PRODUCT\_CATEGORY  
- PROMOTION\_TYPE  
- DISCOUNT\_PCT  
- START\_DATE  
- END\_DATE  
- REGION

**Volume**

La table contient 87 lignes.

**Période couverte**

La période couverte va du 2020-01-01 au 2025-02-24.

**Valeurs manquantes et anomalies**

Aucune valeur manquante n’a été détectée sur les colonnes testées.

**Utilité pour l’analyse**

Cette table est utile pour analyser les promotions selon les régions et les catégories de produits.

TABLE 10 — STORE\_LOCATIONS\_CLEAN

**Périmètre métier**

Cette table contient les informations descriptives sur les magasins.

**Colonnes clés**

Les principales colonnes sont :

- STORE\_ID  
- STORE\_NAME  
- STORE\_TYPE  
- REGION  
- COUNTRY  
- CITY  
- ADDRESS  
- POSTAL\_CODE  
- SQUARE\_FOOTAGE  
- EMPLOYEE\_COUNT

**Volume**

La table contient 5000 lignes.

**Période couverte**

Pas de date métier dans cette table.

**Valeurs manquantes et anomalies**

Aucune valeur manquante n’a été détectée sur les colonnes testées.

**Utilité pour l’analyse**

Cette table peut servir à contextualiser géographiquement et structurellement les performances.

TABLE 11 — SUPPLIER\_INFORMATIONS\_CLEAN

**Périmètre métier**

Cette table contient les informations liées aux fournisseurs.

**Colonnes clés**

Les principales colonnes sont :

- SUPPLIER\_ID  
- SUPPLIER\_NAME  
- PRODUCT\_CATEGORY  
- REGION  
- COUNTRY  
- LEAD\_TIME\_DAYS  
- RELIABILITY\_SCORE  
- QUALITY\_RATING

**Volume**

La table contient 5000 lignes.

**Période couverte**

Pas de date métier dans cette table.

**Valeurs manquantes et anomalies**

Cette table présente une anomalie importante :

identifiant fournisseur manquant : 0

nom fournisseur manquant : 0

catégorie produit manquante : 0

région manquante : 0

pays manquant : 0

délai manquant : 0

score de fiabilité manquant : 0

note qualité manquante : 5000

La colonne QUALITY\_RATING est inutilisable car elle est vide sur toutes les lignes.

**Utilité pour l’analyse**

Cette table peut être utile pour analyser les fournisseurs, notamment via le score de fiabilité et les délais, mais la note de qualité ne pourra pas être utilisée.

**Conclusion générale de la phase 2.1**

Dans l’ensemble, le schéma SILVER présente une qualité de données globalement bonne. La majorité des tables contiennent 5000 lignes et ne présentent aucune valeur manquante sur les colonnes testées. Les tables les plus exploitables pour les analyses business sont notamment :

- FINANCIAL\_TRANSACTIONS\_CLEAN  
- MARKETING\_CAMPAIGNS\_CLEAN  
- PROMOTIONS\_CLEAN  
- CUSTOMER\_DEMOGRAPHICS\_CLEAN  
- CUSTOMER\_SERVICE\_INTERACTIONS\_CLEAN  
- LOGISTICS\_AND\_SHIPPING\_CLEAN  
- INVENTORY\_CLEAN

Deux tables présentent cependant des limites importantes :

- PRODUCT\_REVIEWS\_CLEAN, fortement dégradée, avec des champs essentiels manquants  
- SUPPLIER\_INFORMATIONS\_CLEAN, dont la colonne QUALITY\_RATING est totalement vide

