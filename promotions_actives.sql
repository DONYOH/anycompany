-- Requête 3 : Promotions Actives (Data Product)
-- Objectif : Mettre à disposition le catalogue des promotions
SELECT 
    promotion_id,
    promotion_type AS nom_promotion,
    product_category AS categorie_produit,
    discount_pct AS pourcentage_reduction,
    start_date AS date_debut,
    end_date AS date_fin,
    region
FROM ANYCOMPANY_LAB.SILVER.PROMOTIONS_CLEAN;