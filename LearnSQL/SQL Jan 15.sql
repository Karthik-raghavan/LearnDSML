USE farmers_market;

SELECT *
FROM customer;

SELECT COUNT(DISTINCT customer_zip) AS `# of zip codes`
FROM customer;

SELECT DISTINCT customer_zip AS `# of zip codes`
FROM customer;

SELECT *
FROM customer
WHERE customer_zip = 22802;

SELECT COUNT(*) AS `Count of customer with zip 22802`
FROM customer
WHERE customer_zip = 22802;

SELECT *,(quantity * cost_to_customer_per_qty) AS `Total Price`
FROM customer_purchases
WHERE (quantity * cost_to_customer_per_qty) = (
	SELECT max(quantity * cost_to_customer_per_qty) 
    FROM customer_purchases);
    
SELECT *,(quantity * cost_to_customer_per_qty) AS `Total Price`, extract(month FROM market_date) AS `Month`
FROM customer_purchases
WHERE (quantity * cost_to_customer_per_qty) = (
	SELECT max(quantity * cost_to_customer_per_qty) 
    FROM customer_purchases);
    
SELECT DISTINCT(extract(year FROM market_date)) AS `Year`
FROM customer_purchases;

SELECT year
FROM customer_purchases 
WHERE year IN (
	SELECT DISTINCT extract(year FROM market_date) AS `Year`
	FROM customer_purchases 
	WHERE extract(year FROM market_date));

SELECT avg(quantity), extract(year FROM market_date)
FROM customer_purchases
WHERE extract(year FROM market_date) IN (
	SELECT DISTINCT extract(year FROM market_date)
	FROM customer_purchases 
	WHERE extract(year FROM market_date));
    
SELECT avg(quantity) AS `2019 Average Quanity`
FROM customer_purchases 
WHERE extract(year FROM market_date) = 2019;

# '2.9102338129496403'

SELECT avg(quantity) AS `2020 Average Quanity`
FROM customer_purchases 
WHERE extract(year FROM market_date) = 2020;

# '2.9977628635346742'


SELECT avg(quantity) AS `Average Quanity`
FROM customer_purchases ;

# '2.9492422731804577'

# GROUP BY

SELECT *
FROM customer;

SELECT customer_zip
FROM customer
GROUP BY customer_zip;

SELECT customer_zip, COUNT(*) AS `Customer under the zipcode`
FROM customer
GROUP BY customer_zip;

SELECT customer_zip, COUNT(*) AS `Customer under the zipcode`, max(length(customer_first_name)) AS `Length of Longest FN in group`
FROM customer
GROUP BY customer_zip;

# Grouped Tables
	# Columns displayed can be of two types
		# Column listed in group by 
        # Aggregation functions

SELECT customer_id, max(customer_id)
FROM customer
GROUP BY customer_id;

SELECT extract(year FROM market_date) AS `Year`, avg(quantity) AS `Average quantity for Year`
FROM customer_purchases
GROUP BY extract(year FROM market_date);

SELECT extract(year FROM market_date) AS `Year`, max(quantity) AS `Max quantity for Year`
FROM customer_purchases
GROUP BY extract(year FROM market_date);

SELECT extract(year FROM market_date) AS `Year`, avg(quantity) AS `Average quantity for Year`
FROM customer_purchases
GROUP BY extract(year FROM market_date)
ORDER BY `Average quantity for Year` DESC;

SELECT extract(year FROM market_date) AS `Year`, avg(quantity) AS `Average quantity for Year`
FROM customer_purchases
GROUP BY extract(year FROM market_date)
ORDER BY 2 DESC;


SELECT extract(year FROM market_date) AS `Year`, avg(quantity) AS `Average quantity for Year`
FROM customer_purchases
GROUP BY extract(year FROM market_date)
ORDER BY 1 ASC;

# using sub queries as table

SELECT Year, avg(quantity) AS `Quantity Avg`
FROM (
SELECT extract(year FROM market_date) AS `Year`, quantity
FROM customer_purchases
) AS `t`
GROUP BY Year
ORDER BY Year;

SELECT *
FROM (
SELECT extract(year FROM market_date) AS `Year`, quantity
FROM customer_purchases
) AS `t`
ORDER BY quantity;


SELECT 	extract(month FROM market_date) AS `Transaction Month`, 
		extract(year FROM market_date) AS `Transaction Year`, 
		round(avg(quantity),4 ) AS `Average Quantity per month`,
        count(*) AS `Count of Bills`
FROM customer_purchases
GROUP BY `Transaction Month`,`Transaction Year`
HAVING `Count of Bills` > 100
ORDER BY `Transaction Year`,`Transaction Month`;


SELECT 	extract(month FROM market_date) AS `Transaction Month`, 
		extract(year FROM market_date) AS `Transaction Year`, 
		round(avg(quantity),4 ) AS `Average Quantity per month`,
        count(*) AS `Count of Bills`
FROM customer_purchases
GROUP BY `Transaction Month`,`Transaction Year`
HAVING count(*) > 100
ORDER BY `Transaction Year`,`Transaction Month`;

# Having works on grouped tables
# Where does not work on grouped tables

SELECT customer_zip,count(customer_id)
FROM customer
GROUP BY customer_zip;

SELECT customer_zip,count(*)
FROM customer
GROUP BY customer_zip;