-- Requête 1 : Ventes Enrichies (Data Product)
-- Objectif : Combiner les ventes avec les données de logistique
SELECT 
    ft.transaction_id,
    ft.transaction_date,
    ft.transaction_type,
    ft.amount,
    ft.payment_method,
    ft.region AS region_vente,
    ls.shipment_id,
    ls.shipping_method,
    ls.status AS statut_livraison,
    ls.shipping_cost
FROM ANYCOMPANY_LAB.SILVER.FINANCIAL_TRANSACTIONS_CLEAN ft
LEFT JOIN ANYCOMPANY_LAB.SILVER.LOGISTICS_AND_SHIPPING_CLEAN ls 
    ON ft.transaction_id = ls.order_id;