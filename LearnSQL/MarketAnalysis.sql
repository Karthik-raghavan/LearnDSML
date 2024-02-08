/*Write a query to find for each user as buyer_id, the join date as join_date and the number of orders they made as a buyer in 2019 as orders_in_2019.

Return the result table ordered by buyer_id in ascending order and in the format mentioned below.*/

SELECT DISTINCT o.buyer_id, DATE_FORMAT(u.join_date, '%Y-%m-%d') AS `join_date`,
	COUNT(o.buyer_id) OVER(PARTITION BY EXTRACT(YEAR FROM o.order_date) = 2019 ORDER BY o.buyer_id ASC) AS `orders_in_2019`
FROM query_order3 AS `o`
LEFT JOIN query_users3 AS `u`
	ON u.user_id = o.buyer_id
ORDER BY o.buyer_id ASC
