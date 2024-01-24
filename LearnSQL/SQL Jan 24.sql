# Window functions

USE farmers_market;

SELECT *
FROM customer;

SELECT *, concat(customer_first_name,' ',customer_last_name) AS `Full_Name`, (SELECT MAX(customer_id) FROM customer) AS `Max Length`
FROM customer; # As Agg does not work


SELECT *
FROM (
SELECT *, max(customer_id) over() AS `Max Cust ID`, sum(customer_id) over() AS `SUM Cust ID`,
	length(concat(customer_first_name,' ',customer_last_name)) AS `Max Customer Name`,
    avg(length(concat(customer_first_name,' ',customer_last_name))) over() AS `Avg`
FROM customer) AS `t`
WHERE `Max Customer Name` > `Avg`;

# instead of sub query, we can use window functions

/*over() - Creates buckets or groups*/

SELECT customer_zip, max(customer_id)
FROM customer
GROUP BY customer_zip;

SELECT *, max(customer_id) over(GROUP BY customer_zip) AS `Max CID`
FROM customer;

# Replace Group BY with Partition

SELECT *, max(customer_id) over(partition BY customer_zip) AS `Max CID`
FROM customer
ORDER BY customer_zip ASC, customer_id ASC;

# For every row, display the market date, cust id, quantity, avg quantity in full table
SELECT market_date, customer_id, quantity, avg(quantity) over() AS `Avg Q`
FROM customer_purchases
;

# Next to each row, can we display the avg quantity for that customer

SELECT market_date, customer_id, quantity, round(avg(quantity) over(partition by customer_id),2) AS `Avg Q for customer`
FROM customer_purchases
;

# Categories of window function
	# Aggregation function - MAX, MIN, AVG, COUNT, SUM
    # Ranking Function(Row level) - RANK, DENSE RANK, ROW NUMBER
    # Functions that pick a value from a column - FIRST VALUE, LEAD, LAG


# Ranking Functions

# no gaps in ranking - Dense rank
# gap in ranks - Ranks

SELECT *, length(customer_first_name) AS `FN Length` ,
RANK() OVER(ORDER BY length(customer_first_name) DESC) AS `Rank`,
DENSE_RANK() OVER(ORDER BY length(customer_first_name) DESC) AS `Dense Rank`,
ROW_NUMBER() OVER(ORDER BY length(customer_first_name) DESC) AS `Row Number`
FROM farmers_market.customer
ORDER BY `FN Length` DESC;