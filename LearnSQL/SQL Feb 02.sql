# Value Extraction

USE farmers_market;

SELECT customer_id, MAX(customer_id) OVER() AS `Max ID`
FROM customer;

SELECT customer_id, MAX(customer_id) OVER(ORDER BY customer_id 
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS `Max ID`,
SUM(customer_id) OVER(ORDER BY customer_id 
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS `Sum ID`
FROM customer;

# FIRST_VALUE()

SELECT customer_id, FIRST_VALUE(customer_id) OVER(ORDER BY customer_id 
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS `First Value ID`
FROM customer
ORDER BY customer_id ASC;

SELECT customer_id, FIRST_VALUE(customer_id) OVER(ORDER BY customer_id 
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS `First Value ID`
FROM customer
ORDER BY customer_id DESC;


SELECT customer_id, customer_first_name, FIRST_VALUE(customer_id) OVER(ORDER BY customer_id 
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS `First Value ID ASC`,
FIRST_VALUE(customer_id) OVER(ORDER BY customer_id DESC
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS `First Value ID DESC`
FROM customer;

SELECT customer_id, FIRST_VALUE(customer_id) OVER(ORDER BY customer_id 
ROWS BETWEEN CURRENT ROW AND CURRENT ROW) AS `First Value ID`
FROM customer
ORDER BY customer_id ASC;

SELECT customer_first_name, FIRST_VALUE(customer_first_name) OVER(ORDER BY customer_first_name
ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING) AS `First Value ID`
FROM customer
ORDER BY customer_first_name ASC;

SELECT customer_first_name, FIRST_VALUE(customer_first_name) OVER(ORDER BY customer_first_name
ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS `First Value ID`
FROM customer
ORDER BY customer_first_name ASC;

SELECT customer_id, customer_zip, FIRST_VALUE(customer_id) OVER(PARTITION BY customer_zip ORDER BY customer_id) AS `First Value ID`
FROM customer
ORDER BY customer_id ASC;

# Nth_VALUE()

SELECT customer_id, customer_zip, NTH_VALUE(customer_id, 3) OVER(PARTITION BY customer_zip ORDER BY customer_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) 
FROM customer
;


SELECT customer_id, customer_zip, NTH_VALUE(customer_id, 3) OVER(ORDER BY customer_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) 
FROM customer
;

# LEAD - Ahead/Preceding
# LAG - Behind/Following

SELECT customer_first_name, LAG(customer_first_name,1 ) OVER(ORDER BY customer_first_name ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) 
FROM customer
;

SELECT customer_first_name, LEAD(customer_first_name,1 ) OVER(ORDER BY customer_first_name ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) 
FROM customer
;


# Date and Time Functions
# TIME SERIES ANALYSIS

# "yyyy-mm-dd HH:MM:SS.Milliseconds"

