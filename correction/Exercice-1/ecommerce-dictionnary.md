| Property    | Comment     | Entity      | Type          | Identifier |
| ----------- | ----------- | ----------- | ------------- | ---------- |
| id          |             | products    | INT           | X          |
| name        |             | products    | VARCHAR       |            |
| price       |             | products    | DECIMAL(10,2) |            |
| stock       |             | products    | INT           |            |
| id          |             | customers   | INT           | X          |
| name        |             | customers   | VARCHAR       |            |
| email       |             | customers   | VARCHAR       |            |
| id          |             | orders      | INT           | X          |
| customer_id | FOREIGN KEY | orders      | INT           |            |
| order_date  |             | orders      | DATE          |            |
| id          |             | order_items | INT           | X          |
| order_id    | FOREIGN KEY | order_items | INT           |            |
| product_id  | FOREIGN KEY | order_items | INT           |            |
| quantity    |             | order_items | INT           |            |
| id          |             | reviews     | INT           | X          |
| product_id  | FOREIGN KEY | reviews     | INT           |            |
| customer_id | FOREIGN KEY | reviews     | INT           |            |
| rating      |             | reviews     | INT           |            |
| comment     |             | reviews     | TEXT          |            |

