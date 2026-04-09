-- Requête 2 : Clients Enrichis (Mode "Système D")
-- Objectif : Contourner l'erreur de parsing de la table PRODUCT_REVIEWS
SELECT 
    c.name AS nom_client,
    c.country AS pays,
    c.annual_income AS revenu_annuel,
    c.marital_status AS statut_marital,
    pr.rating AS note_produit,
    pr.review_title AS titre_avis,
    pr.product_category AS categorie_produit
FROM ANYCOMPANY_LAB.SILVER.CUSTOMER_DEMOGRAPHICS_CLEAN c
LEFT JOIN ANYCOMPANY_LAB.SILVER.PRODUCT_REVIEWS_CLEAN pr 
    ON pr.REVIEW_ID LIKE '%' || c.name || '%';