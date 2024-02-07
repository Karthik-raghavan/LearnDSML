# A - Who are the customers who spent more than 250 dollar in the year 2019
# customer id and customer_spend_2019
SELECT DISTINCT c2.customer_id, SUM(c2.quantity * c2.cost_to_customer_per_qty)  AS `customer_spend_2019`
FROM `farmers_market.customer` AS `c1`
JOIN `farmers_market.customer_purchases` AS `c2`
ON c2.customer_id = c1.customer_id
WHERE EXTRACT(YEAR FROM c2.market_date) = 2019
GROUP by c2.customer_id
HAVING customer_spend_2019 > 250
ORDER BY customer_spend_2019 DESC