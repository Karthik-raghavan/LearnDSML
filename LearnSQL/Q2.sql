# B - Customer wants to find customer id who spent more than 100 in the year 2020

SELECT DISTINCT c2.customer_id 
FROM `farmers_market.customer` AS `c1`
JOIN `farmers_market.customer_purchases` AS `c2`
ON c2.customer_id = c1.customer_id
WHERE EXTRACT(YEAR FROM c2.market_date) = 2020
GROUP by c2.customer_id
HAVING SUM(c2.quantity * c2.cost_to_customer_per_qty) > 100