# Find the total quantity sold in all the these transaction

USE farmers_market;

SELECT *
FROM customer_purchases;

SELECT SUM(quantity) AS `Total Sum`
FROM customer_purchases;

SELECT *
FROM customer_purchases;

# find the split of 2958 between 2019 and 2020

SELECT extract(year FROM market_date) AS `Year`,
extract(month FROM market_date) AS `Month`,
SUM(quantity) AS `Total Quantity in Years`
FROM customer_purchases
GROUP BY Year, Month
ORDER BY Year ASC, Month ASC;

## JOINS

# What is the average quantity purchased per transaction in farmers_market

SELECT avg(quantity)
FROM customer_purchases
GROUP BY quantity;

# Display transaction where customer purchased more than the average quantity

SELECT *
FROM customer_purchases
WHERE quantity > (SELECT avg(quantity)
FROM customer_purchases);

SELECT *
FROM customer_purchases
WHERE quantity > 2.949;

# display full names of customers who have purchased "above average" quantity in at least one transaction

SELECT concat(customer_first_name,' ', customer_last_name) AS `full_name`
FROM customer
WHERE customer_id IN (SELECT DISTINCT customer_id
FROM customer_purchases
WHERE quantity > (SELECT avg(quantity)
FROM customer_purchases))
;

SELECT  *
FROM customer
JOIN customer_purchases ON customer_purchases.customer_id = customer.customer_id
WHERE quantity > (SELECT avg(quantity)
FROM customer_purchases); 

# Display transaction details along with customer names for transactions which had above average quantity purchased

SELECT concat(customer_first_name,' ', customer_last_name) AS `full_name` # Not possible as the table is different
FROM (SELECT *
FROM customer_purchases
WHERE quantity > (SELECT avg(quantity)
FROM customer_purchases))
;

# JOIN
## INNER JOIN
## OUTER JOIN
## LEFT JOIN
## RIGHT JOIN

# Data from customer_purchases
# JOIN customer table

SELECT c.*, cp.*
FROM customer_purchases AS cp
INNER JOIN customer AS c ON c.customer_id = cp.customer_id;

SELECT DISTINCT customer_id
FROM customer
ORDER BY customer_id ASC;

SELECT DISTINCT customer_id
FROM customer_purchases
ORDER BY customer_id ASC;

SELECT c.customer_id
FROM customer c
JOIN customer_purchases cp ON cp.customer_id = c.customer_id
WHERE c.customer_id NOT IN (SELECT cp.customer_id FROM customer_purchases cp);

SELECT DISTINCT c.customer_id, cp.customer_id
FROM customer c
JOIN customer_purchases cp ON cp.customer_id = c.customer_id
oRDER BY c.customer_id,cp.customer_id;

# DISPLAY ALL TRANSACTION FROM CP ALONG WITH C DETAILS IF ANY FOUND

SELECT cp.*, c.*
FROM customer_purchases cp
LEFT JOIN customer c ON c.customer_id = cp.customer_id
WHERE c.customer_id IS NULL;

SELECT cp.*, c.*
FROM customer c
LEFT JOIN customer_purchases cp ON cp.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

SELECT cp.*, c.*
FROM customer c
RIGHT JOIN customer_purchases cp ON cp.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

SELECT cp.*, c.*
FROM customer_purchases cp
RIGHT JOIN customer c ON c.customer_id = cp.customer_id
WHERE c.customer_id IS NULL;