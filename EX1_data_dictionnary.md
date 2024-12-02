# Dictionnaire de Données

| Property     | Comment                                       | Entity      | Type           | Identifier |
| ------------ | --------------------------------------------- | ----------- | -------------- | ---------- |
| id           | Identifiant unique du produit                 | products    | INT            | Oui        |
| name         | Nom du produit                                | products    | VARCHAR(255)   | Non        |
| price        | Prix du produit                               | products    | DECIMAL(10, 2) | Non        |
| stock        | Quantité en stock du produit                  | products    | INT            | Non        |
| id           | Identifiant unique du client                  | customers   | INT            | Oui        |
| name         | Nom du client                                 | customers   | VARCHAR(255)   | Non        |
| email        | Adresse email du client                       | customers   | VARCHAR(255)   | Non        |
| id           | Identifiant unique de la commande             | orders      | INT            | Oui        |
| customer_id  | Identifiant du client ayant passé la commande | orders      | INT            | Non        |
| order_date   | Date de la commande                           | orders      | DATE           | Non        |
| customer_id  | FOREIGN KEY                                   | orders      | INT            | Non        |
| id           | Identifiant unique de l'élément de commande   | order_items | INT            | Oui        |
| order_id     | Identifiant de la commande                    | order_items | INT            | Non        |
| product_id   | Identifiant du produit                        | order_items | INT            | Non        |
| quantity     | Quantité de produit commandée                 | order_items | INT            | Non        |
| order_id     | FOREIGN KEY                                   | order_items | INT            | Non        |
| customers_id | FOREIGN KEY                                   | order_items | INT            | Non        |
| id           | Identifiant unique de l'avis                  | reviews     | INT            | Oui        |
| product_id   | Identifiant du produit évalué                 | reviews     | INT            | Non        |
| customer_id  | Identifiant du client ayant laissé l'avis     | reviews     | INT            | Non        |
| rating       | Note donnée au produit                        | reviews     | INT            | Non        |
| comment      | Commentaire laissé par le client              | reviews     | TEXT           | Non        |
| product_id   | FOREIGN KEY                                   | reviews     | INT            | Non        |
| customers_id | FOREIGN KEY                                   | reviews     | INT            | Non        |
