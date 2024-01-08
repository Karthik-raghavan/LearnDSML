## Filters
	# Comparing with 1 single value
	# comparing ranges
	# Compare with list
	# Compare string with pattern
## Aggregatig Functions
## Subqueries
## Grouping

SELECT *
FROM customer
WHERE customer_id BETWEEN 5 AND 15;

SELECT *
FROM customer_purchases
WHERE market_date BETWEEN '2019-01-01' and '2020-03-31';

## Exploratory Data Analysis (EDA)

SELECT *
FROM customer_purchases
WHERE extract(year FROM market_date) = 2020;

SELECT *
FROM customer_purchases
WHERE extract(year FROM market_date) = 2020
ORDER BY market_date ASC;


SELECT *
FROM customer_purchases
WHERE extract(year FROM market_date) = 2020
ORDER BY market_date DESC;

SELECT *
FROM customer
WHERE customer_id IN (1,5,7); #WHERE customer_id = 1 OR customer_id = 5 OR customer_id = 7

SELECT *
FROM customer
WHERE customer_first_name LIKE '%a%' OR customer_last_name LIKE '%a%' ;  # Pattern Matching

## Pattern Matching with Strings
# _(undercore) --> exactly 1 character represent
# %(percent) --> 0 or more characters represent
# Space is also a character

USE farmers_market ;

SELECT *
FROM customer;

SELECT `customer_id`
FROM customer;

SELECT *
FROM customer
WHERE customer_first_name LIKE 'a%';

SELECT *
FROM customer
WHERE customer_first_name LIKE '___';


SELECT *
FROM customer
WHERE customer_first_name LIKE '%e' or  customer_first_name LIKE '%E';

SELECT *
FROM customer
WHERE lower(customer_first_name) LIKE '%e' ;

SELECT *
FROM customer
WHERE customer_first_name LIKE '_a%' or  customer_first_name LIKE '_A%';


SELECT *
FROM customer
WHERE customer_last_name LIKE '%n_' or  customer_last_name LIKE '%N_';

# Aggregation --> Collect/Accumulate/Combine into one value
# Aggregate functions - count, Sum, Average, Min, Max

# SUM

SELECT sum(quantity),avg(quantity),count(quantity),max(quantity),min(quantity)
FROM customer_purchases;

SELECT *
FROM customer
WHERE customer_first_name IN ('Jane','Bob');

SELECT sum(quantity),avg(quantity),count(quantity),max(quantity),min(quantity)
FROM customer_purchases;

# NULL Values

SELECT *
FROM product;

SELECT *
FROM product
WHERE product_size ='';

SELECT *
FROM product
WHERE product_size =' ';


SELECT *
FROM product
WHERE product_size IS NULL;

SELECT *
FROM product
WHERE product_size IS NOT NULL;

SELECT *
FROM product
WHERE product_qty_type IS NULL;

# Find the smallest and largest first names of customers in alohabetical order

SELECT MIN(customer_first_name) AS `Minimum Value of First Name in Alphabetical Order`,max(customer_last_name) AS `Maximum Value of First Name in Alphabetical Order`,
count(customer_first_name) AS `Name Count`
FROM customer;

SELECT *
FROM customer_purchases;

SELECT *
FROM customer_purchases
ORDER BY quantity DESC
LIMIT 1;

SELECT *
FROM customer_purchases
HAVING quantity = max(quantity); # We cant use aggregated clause using Having pr Where

# Subqueries
# Any SQL Query can return 3 types of outputs

## Zero Dimensional - Point - single value
## one dimensional - line - 1 column values
## two dimensional - table - multi column values

SELECT *
FROM customer_purchases
WHERE quantity > (SELECT avg(quantity) FROM customer_purchases);