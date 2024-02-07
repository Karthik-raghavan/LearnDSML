# CTE - Common Table Expression

# Agile
# Easy to manage if there are lots of lines of code
# Multiple contributors (Integrating)

# makes code easy to read and debug

# It is like giving variable names to a table
# WITH is the keyword for naming tables


WITH `A` AS (
SELECT DISTINCT c2.customer_id, SUM(c2.quantity * c2.cost_to_customer_per_qty)  AS `customer_spend_2019`
FROM `farmers_market.customer` AS `c1`
JOIN `farmers_market.customer_purchases` AS `c2`
ON c2.customer_id = c1.customer_id
WHERE EXTRACT(YEAR FROM c2.market_date) = 2019
GROUP by c2.customer_id
HAVING customer_spend_2019 > 250
ORDER BY customer_spend_2019 DESC
),
`B` AS (
  SELECT DISTINCT c2.customer_id 
FROM `farmers_market.customer` AS `c1`
JOIN `farmers_market.customer_purchases` AS `c2`
ON c2.customer_id = c1.customer_id
),
`C` AS (
  SELECT c1.customer_id
FROM `farmers_market.customer_purchases` AS `c1`
JOIN
   `farmers_market.customer` AS `c2`
  ON c2.customer_id = c1.customer_id 
GROUP BY c1.customer_id
HAVING COUNT(DISTINCT product_id) >= 2
),
`D` AS (
  SELECT *
  FROM `farmers_market.customer`
)

SELECT A.customer_id, CONCAT(D.customer_first_name,' ', D.customer_last_name) AS `FN`
FROM A
INNER JOIN B
ON B.customer_id = A.customer_id
INNER JOIN C
ON C.customer_id = B.customer_id
JOIN D
ON D.customer_id = C.customer_id;


# WHAT IS THE USE OF CTE
# CODE REUSE
# READABILTIY
# NO PERFORMANCE IMPROVEMENT

# VIEWS

# BANK APP / NET BANKING 
# TRANSACTIONS FOR THE LAST 3 MONTHS

SELECT *
FROM customer_purchases;

# We should only be able to view data related to ours
# Temporary small view of the whole table

CREATE VIEW `VIEWFORCID7` AS (
SELECT *
FROM customer_purchases
WHERE customer_id = 7
);

# View is not saved in DB, but saved in memory as a logic and not as table
# CTE is not saved