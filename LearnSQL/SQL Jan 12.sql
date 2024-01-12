# Subqueries and Grouping Continued

USE farmers_market;

SELECT max(customer_first_name)
FROM customer;

SELECT customer_first_name
FROM customer
ORDER BY customer_first_name DESC;

# What is the highest bill value recorded

SELECT max(quantity * cost_to_customer_per_qty) as `Max Bill Value`
FROM `customer_purchases`;

SELECT (quantity * cost_to_customer_per_qty) as `Max Bill Value`
FROM `customer_purchases`;

# Select all the transaction of the highest bill value

SELECT * 
FROM customer_purchases
WHERE (quantity * cost_to_customer_per_qty) = (SELECT max(quantity * cost_to_customer_per_qty) as `Max Bill Value` FROM `customer_purchases`);

# Display all the transactions where the quantity purchased was greater than the overall avg quantity

SELECT *
FROM customer_purchases
WHERE quantity > (SELECT avg(quantity) 
FROM customer_purchases);

# Get the names of all customers who purchased on 13th july 2019

SELECT *
FROM customer;

SELECT *
FROM customer
WHERE customer_id in (SELECT customer_id
FROM customer_purchases
WHERE extract(year FROM market_date) = 2019 and extract(month FROM market_date) = 7 and extract(day FROM market_date) = 13);


SELECT *
FROM customer
WHERE customer_id IN (SELECT DISTINCT customer_id
FROM customer_purchases
WHERE market_date = '2019-07-13');


# Grouping/Categorising

# Can we categorize transactions as First half and second half

SELECT *,if(extract(month FROM market_date) < 7, 'FH','SH') AS `FH/SH` 
FROM customer_purchases;

# Can we categorize transactions as Quarters

SELECT *,if(extract(month FROM market_date) < 4, 'Q1','SH') AS `Quarter` 
FROM customer_purchases;
/*(
CASE
	WHEN condition THEN Q1
    WHEN condition THEN Q2
    WHEN condition THEN Q3
    WHEN condition THEN Q4
END
)*/

# With Multiple options

# CASE

/*(
CASE
	WHEN condition THEN value
    WHEN condition THEN value
    WHEN condition THEN value
    WHEN condition THEN value
END
)*/

SELECT *,if(extract(month FROM market_date) < 7, 'FH','SH') AS `FH/SH`,(
CASE
	WHEN extract(month FROM market_date) BETWEEN 1 and 3 THEN 'Q1'
    WHEN extract(month FROM market_date) BETWEEN 4 and 6 THEN 'Q2'
    WHEN extract(month FROM market_date) BETWEEN 7 and 9 THEN 'Q3'
    WHEN extract(month FROM market_date) BETWEEN 10 and 12 THEN 'Q4'
END
) AS `Quarter`,
If(extract(month FROM market_date) BETWEEN 1 and 3, 'Q1',
	if(extract(month FROM market_date) BETWEEN 4 and 6,'Q2',
		if(extract(month FROM market_date) BETWEEN 7 and 9,'Q3','Q4'))) AS `Q-Confirm`
FROM customer_purchases;



