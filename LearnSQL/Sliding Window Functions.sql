USE marks;

SELECT *
FROM marks;

SELECT *, SUM(Marks) OVER(PARTITION BY Subject) AS `T_Marks`
FROM marks; 

SELECT *, SUM(Marks) OVER(PARTITION BY Subject) AS `T_Marks`
FROM marks; 

# Sliding Window Functions is like Cumulative within the group
# Top is fixed for the partitioned group and Bottom is below current row

# Which Market date had the most number of transactions

SELECT market_date, COUNT(*)
FROM customer_purchases
GROUP BY market_date
ORDER BY COUNT(*) DESC;

USE farmers_market;

SELECT *
FROM customer_purchases
WHERE market_date = '2020-08-05';

SELECT customer_id, quantity, transaction_time
FROM customer_purchases
WHERE market_date = '2020-08-05';


SELECT customer_id, 
	quantity, 
	transaction_time,
	SUM(quantity) OVER(ORDER BY transaction_time ASC
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS `Cumulative_QTY_Sold`
FROM customer_purchases
WHERE market_date = '2020-08-05'
ORDER BY transaction_time ASC;


SELECT customer_id, 
	quantity, 
	transaction_time,
	SUM(quantity) OVER(ORDER BY transaction_time ASC
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS `Cumulative_QTY_Sold`
FROM customer_purchases
WHERE market_date = '2020-08-05'
ORDER BY transaction_time ASC;

# For every transaction, give the change over the previous transaction

SELECT T.customer_id, 
	T.quantity, 
	T.transaction_time,
    T.Cumulative_QTY_Sold,
    T.Nw_col,
    T.quantity - T.Nw_col AS `Difference`
FROM (
SELECT customer_id, 
	quantity, 
	transaction_time,
	SUM(quantity) OVER(ORDER BY transaction_time ASC
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS `Cumulative_QTY_Sold`,
    SUM(quantity) OVER(ORDER BY transaction_time ASC
    ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING ) AS `Nw_col`
FROM customer_purchases
WHERE market_date = '2020-08-05'
ORDER BY transaction_time ASC) AS `T`;

# For every transaction, give the average of the last 3 transactions

SELECT customer_id, 
	quantity, 
	transaction_time,
    AVG(transaction_time) OVER(
    ORDER BY transaction_time
    ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) AS `3-rows-average`
FROM customer_purchases
WHERE market_date = '2020-08-05';

SELECT T.customer_id, 
	T.quantity, 
	T.transaction_time,
    T.Cumulative_QTY_Sold,
    T.Nw_col,
    T.quantity - T.Nw_col AS `Difference`,
	AVG(T.quantity) OVER(
    ORDER BY T.transaction_time
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS `3-rows-average`
FROM (
SELECT customer_id, 
	quantity, 
	transaction_time,
	SUM(quantity) OVER(ORDER BY transaction_time ASC
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS `Cumulative_QTY_Sold`,
    SUM(quantity) OVER(ORDER BY transaction_time ASC
    ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING ) AS `Nw_col`
FROM customer_purchases
WHERE market_date = '2020-08-05'
ORDER BY transaction_time ASC) AS `T`;