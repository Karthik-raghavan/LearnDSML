# D - GIVE THE CUSTOMER ID AND FULL NAME OF CUSTOMER WHO ARE COMMON TO ALL 3 LIST A,B AND C

SELECT T1.customer_id,CONCAT(T4.customer_first_name,' ', T4.customer_last_name) AS `Full_Name`
FROM (SELECT DISTINCT c2.customer_id, SUM(c2.quantity * c2.cost_to_customer_per_qty)  AS `customer_spend_2019`
FROM `farmers_market.customer` AS `c1`
JOIN `farmers_market.customer_purchases` AS `c2`
ON c2.customer_id = c1.customer_id
WHERE EXTRACT(YEAR FROM c2.market_date) = 2019
GROUP by c2.customer_id
HAVING customer_spend_2019 > 250
ORDER BY customer_spend_2019 DESC) AS `T1`

INNER JOIN 

(
  SELECT DISTINCT c2.customer_id 
FROM `farmers_market.customer` AS `c1`
JOIN `farmers_market.customer_purchases` AS `c2`
ON c2.customer_id = c1.customer_id
) AS `T2`
ON T2.customer_id = T1.customer_id

INNER JOIN 

(
  SELECT c1.customer_id
FROM `farmers_market.customer_purchases` AS `c1`
JOIN
   `farmers_market.customer` AS `c2`
  ON c2.customer_id = c1.customer_id 
GROUP BY c1.customer_id
HAVING COUNT(DISTINCT product_id) >= 2
) AS `T3`
ON T3.customer_id = T2.customer_id

JOIN `farmers_market.customer` AS `T4`
ON T4.customer_id = T3.customer_id

