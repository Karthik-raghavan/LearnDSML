# Refer to the customer_purchases table
# For every year, month combination
# display the top 3 transactions by quantity

# sort by year, month, quantity

USE farmers_market;

SELECT T2.* 
FROM (
SELECT T1.*,    
	ROW_NUMBER() OVER(PARTITION BY T1.Year, T1.Month
    ORDER BY T1.quantity DESC) AS `Row_Number`
    /*RANK() OVER(PARTITION BY T.Year, T.Month
    ORDER BY T.quantity DESC) AS `Rank`,
    DENSE_RANK() OVER(PARTITION BY T.Year, T.Month
    ORDER BY T.quantity DESC) AS `Dense_Rank`*/
FROM (SELECT 
    *,
    EXTRACT(YEAR FROM market_date) AS `Year`, 
	EXTRACT(MONTH FROM market_date) AS `Month`
FROM customer_purchases) AS `T1`) AS `T2`
WHERE T2.Row_Number < 4 
ORDER BY T2.Year ASC,T2.Month ASC ;