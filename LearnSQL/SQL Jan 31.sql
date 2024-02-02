# Windows Function Continued

# Window Function
	## Aggregation -> SUM,COUNT,MIN,MAX,AVG
    ## Ranking (Analytic) -> RANK,DENSE_RANK,ROW_NUMBER,NTILE
    ## Value Extraction -> FIRST_VALUE,NTH_VALUE,LEAD,LAG
    
# NTILE -> (GeneratesGroup Number for every row)

USE farmers_market;

SELECT *
FROM customer;

SELECT *, NTILE(4) OVER() AS `GroupNumber`
FROM customer
ORDER BY customer_id ASC;


SELECT *, NTILE(4) OVER(ORDER BY customer_id ASC) AS `GroupNumber`
FROM customer
;

SELECT *, NTILE(28) OVER(ORDER BY customer_id ASC) AS `GroupNumber`
FROM customer
;

SELECT *, NTILE(100) OVER(ORDER BY customer_id ASC) AS `GroupNumber`
FROM customer
;

SELECT *, NTILE(5) OVER(ORDER BY customer_id ASC) AS `GroupNumber`
FROM customer
;

SELECT *, NTILE(5) OVER() AS `GroupNumber`
FROM customer
;


# When does NTILE Become Percentile --> Percentile --> 100 Groups

# SLIDING WINDOW FRAMES 
# Sliding Window Functions is like Cumulative within the group

USE farmers_market;

SELECT customer_id,
SUM(customer_id) OVER() AS `OA_SUM`
FROM customer;


SELECT customer_id,
SUM(customer_id) OVER(ORDER BY customer_id) AS `OA_SUM`
FROM customer
ORDER BY customer_id;


SELECT customer_id,
SUM(customer_id) OVER(ORDER BY customer_id
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS `OA_SUM`
FROM customer
ORDER BY customer_id;


SELECT customer_id,
SUM(customer_id) OVER(ORDER BY customer_id
ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS `Reverse_Cumulative_Sum`
FROM customer
ORDER BY customer_id;


SELECT customer_id,
SUM(customer_id) OVER(ORDER BY customer_id
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS `Cumulative_Sum`
FROM customer
ORDER BY customer_id;


SELECT customer_id,
SUM(customer_id) OVER(ORDER BY customer_id
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS `Cumulative_Sum`,
SUM(customer_id) OVER(ORDER BY customer_id
ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS `Reverse_Cumulative_Sum`
FROM customer
ORDER BY customer_id;


SELECT customer_id,
SUM(customer_id) OVER(ORDER BY customer_id
ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING ) AS `Cumulative_Sum`
FROM customer
ORDER BY customer_id;