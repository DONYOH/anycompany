# Documentation du Data Product (Schéma ANALYTICS)

Cette documentation définit les tables analytiques mises à disposition pour les dashboards Streamlit et les modèles de Machine Learning.

## 1. Table `ventes_enrichies`
**Granularité :** 1 ligne = 1 transaction financière.
* `transaction_id` : Identifiant unique de la transaction.
* `transaction_date` : Date de la transaction.
* `transaction_type` : Type (Sale, Refund, Investment, etc.).
* `amount` : Montant de la transaction.
* `payment_method` : Moyen de paiement utilisé.
* `region_vente` : Région d'origine de la transaction.
* `shipment_id` : ID de l'expédition (si applicable).
* `shipping_method` : Méthode de livraison choisie par le client.
* `statut_livraison` : État actuel du colis.
* `shipping_cost` : Coût de l'expédition.

## 2. Table `clients_enrichis`
**Granularité :** 1 ligne = 1 client.
* `nom_client` : Nom complet du client.
* `pays` : Pays de résidence.
* `revenu_annuel` : Salaire/Revenu annuel déclaré.
* `statut_marital` : Situation familiale (Married, Divorced, etc.).
* `note_produit` : Note laissée sur un produit (sur 5).
* `titre_avis` : Titre du commentaire laissé par le client.
* `categorie_produit` : Catégorie du produit évalué.

## 3. Table `promotions_actives`
**Granularité :** 1 ligne = 1 campagne promotionnelle.
* `promotion_id` : Identifiant unique de la promotion.
* `nom_promotion` : Nom commercial de la campagne.
* `categorie_produit` : Catégorie de produits concernée par la réduction.
* `pourcentage_reduction` : Taux de remise (ex: 0.15 = 15%).
* `date_debut` : Premier jour de la promotion.
* `date_fin` : Dernier jour de la promotion.
* `region` : Zone géographique d'application.