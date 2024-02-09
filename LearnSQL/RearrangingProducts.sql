/*Write a query to rearrange the Products table so each row has (product_id, store, price). If a product is unavailable in a store, 
do not include a row with that product_id and store combination in the result table.*/

SELECT *
FROM cte_products2
#ORDER BY product_id ASC, store ASC