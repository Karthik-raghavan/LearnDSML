SELECT 
 customer_first_name , customer_last_name 
FROM customer;

SELECT 
 *
FROM customer;

SELECT 
 customer_first_name , customer_last_name 
FROM customer
ORDER BY customer_first_name DESC 
LIMIT 2 
OFFSET 3;

SELECT customer_first_name
FROM customer
WHERE customer_zip = 22801
ORDER BY substr(customer_first_name,-3) ASC;