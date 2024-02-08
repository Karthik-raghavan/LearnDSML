/*Write a query to retrieve the productLine, productName, and MSRP (i.e., Manufacturer's Suggested Retail Price) for all products, 
along with the third most expensive product and the fifth most expensive product within each product line, based on their MSRP.

Order the output by productLine in ascending order and by MSRP in descending order.*/

WITH `T1` AS
(
SELECT productCode, productLine,  productName, MSRP
FROM cte_products
),

`thirdValue` AS

(
SELECT productCode,NTH_VALUE(productName, 3) OVER(PARTITION BY productLine ORDER BY MSRP DESC) AS `thirdMostExpensive_Product`
FROM cte_products
),

`fifthValue` AS 
(
SELECT productCode,NTH_VALUE(productName, 5) OVER(PARTITION BY productLine ORDER BY MSRP DESC) AS `fifthMostExpensive_Product`
FROM cte_products
)
 
SELECT T1.productLine, T1.productName, T1.MSRP, TV.thirdMostExpensive_Product, FV.fifthMostExpensive_Product
FROM T1 AS `T1`
JOIN thirdValue AS `TV`
 ON TV.productCode = T1.productCode
JOIN fifthValue AS `FV`
 ON FV.productCode = TV.productCode