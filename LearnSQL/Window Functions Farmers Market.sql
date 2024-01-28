USE farmers_market;

SELECT *, concat(customer_first_name,' ', customer_last_name) AS `Full_Name`, max(customer_id) OVER(PARTITION BY customer_zip) AS `Max_Zip`,
sum(customer_id) OVER() AS `Total`, max(length(customer_first_name)) OVER() AS `Max Len of C F N`,
avg(length(customer_first_name)) OVER() AS `Avg Len of C F N`,
max(length(customer_last_name)) OVER() AS `Max Len of C L N`
FROM customer;

SELECT *, concat(customer_first_name,' ', customer_last_name) AS `Full_Name`, max(customer_id) OVER(PARTITION BY customer_zip) AS `Max_Zip`,
sum(customer_id) OVER() AS `Total`, max(length(customer_first_name)) OVER() AS `Max Len of C F N`,
length(customer_first_name) AS `Len of C F N`,
avg(length(customer_first_name)) OVER() AS `Avg Len of C F N`,
max(length(customer_last_name)) OVER() AS `Max Len of C L N`
FROM customer
;


SELECT *
FROM (
SELECT *, concat(customer_first_name,' ', customer_last_name) AS `Full_Name`, max(customer_id) OVER(PARTITION BY customer_zip) AS `Max_Zip`,
sum(customer_id) OVER() AS `Total`, max(length(customer_first_name)) OVER() AS `Max Len of C F N`,
length(customer_first_name) AS `Len of C F N`,
avg(length(customer_first_name)) OVER() AS `Avg Len of C F N`,
max(length(customer_last_name)) OVER() AS `Max Len of C L N`
FROM customer) AS `t`
WHERE `Len of C F N` > `Avg Len of C F N`
;