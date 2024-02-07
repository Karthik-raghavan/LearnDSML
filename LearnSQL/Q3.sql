# C - CUSTOMER REQUESTS A LIST OF CUSTOMERS WHO PURCHASED 2 OR MORE TYPES OF PRODUCTS OVERALL

SELECT c1.customer_id
FROM `farmers_market.customer_purchases` AS `c1`
JOIN
   `farmers_market.customer` AS `c2`
  ON c2.customer_id = c1.customer_id 
GROUP BY c1.customer_id
HAVING COUNT(DISTINCT product_id) >= 2