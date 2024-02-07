USE ordersmarket;

SELECT *
FROM ordersdates;

SELECT orderNumber, orderDate, ADDDATE(orderDate,INTERVAL 30 DAY) AS `order_date_plus_30_days`
FROM ordersdates
ORDER BY orderNumber ASC;