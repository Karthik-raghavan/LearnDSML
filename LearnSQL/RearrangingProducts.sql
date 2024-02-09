/*Write a query to rearrange the Products table so each row has (product_id, store, price). If a product is unavailable in a store, 
do not include a row with that product_id and store combination in the result table.*/

WITH `store` AS

(
 ( SELECT product_id, 'store1' AS `store`,store1 AS `price`
  FROM products
  WHERE store1 IS NOT NULL
)

UNION ALL

(
  SELECT product_id, 'store2' , store2
  FROM products
  WHERE store2 IS NOT NULL
)
UNION ALL
(
  SELECT product_id, 'store3', store3
  FROM products
  WHERE store3 IS NOT NULL
)
)

SELECT *
FROM store
ORDER BY product_id ASC, store ASC
