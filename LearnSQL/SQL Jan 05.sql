SELECT *
FROM `customer`; # Backticks - when using alias SQL gets confsed so we use back ticks

SELECT *, length(customer_first_name) AS `First Name Length`
FROM customer;

SELECT customer_first_name AS `First Name`, length(customer_first_name) AS `First Name Length`
FROM customer;

SELECT customer_first_name AS `First Name`, length(customer_first_name) AS `First Name Length`
FROM customer;

# After the output is ready only, SQL ads the Alias so we cant replace Alias for columns but we can use Order by

SELECT customer_first_name AS `First Name`, length(customer_first_name) AS `First Name Length`
FROM customer
ORDER BY `First Name` DESC;

SELECT *, length(customer_last_name) AS `Last Name Length`
FROM customer
WHERE length(customer_last_name) > 5;

SELECT *,concat(customer_first_name,' ',customer_last_name) AS `Name`
FROM customer;

SELECT "GREAT", LENGTH("GREAT"); # Testing Functions

SELECT "GREAT",concat("GREAT",' ',"BRITAIN");

SELECT "GREAT",concat("GREAT",' ',"BRITAIN"), lower("GREAT");

# Display for every customer full name and lenth of of customers full name in caps

SELECT upper(concat(customer_first_name,' ',customer_last_name)) AS `Name`, 
length(concat(customer_first_name,' ',customer_last_name)) AS `Length of Name`
FROM customer;

SELECT *,upper(concat(customer_first_name,' ',customer_last_name)) AS `Name`, 
length(concat(customer_first_name,' ',customer_last_name)) AS `Length of Name`
FROM customer;

SELECT upper(concat(customer_first_name,' ',customer_last_name)) AS `Name`, 
length(concat(customer_first_name,customer_last_name)) AS `Length of Name`
FROM customer;

SELECT concat(customer_first_name,' ',customer_last_name) AS `Name`,
upper(concat(customer_first_name,' ',customer_last_name)) AS `Upper Case Name`, 
length(concat(customer_first_name,customer_last_name)) AS `Name Length`
FROM `customer`;

SELECT substr(customer_first_name,1,3), #column name ,start, number of characters
customer_first_name
FROM customer;

SELECT substr("ENCAPSULATION",3,3);

SELECT concat(LOWER(substr("ENCAPSULATION",1,1)),substr("ENCAPSULATION",2));

SELECT concat(upper(substr("encapsulation",1,1)),substr("encapsulation",2));

# From customers table, Display like jANE cONNOR

SELECT
concat(lower(substr(customer_first_name,1,1)),
upper(substr(customer_first_name,2)),' ',
lower(substr(customer_last_name,1,1)),
upper(substr(customer_last_name,2))) AS `Name`
FROM customer;


SELECT *
FROM customer_purchases;

## yyyy-mm-dd - only format with date
## hh:mm:ss - only format with time

## Functions on numeric values

SELECT *,
round((quantity * cost_to_customer_per_qty),2) AS `Total Bill Value`
FROM customer_purchases;

# top 5 transaction in terms of bill value

SELECT *,
round((quantity * cost_to_customer_per_qty),2) AS `Total Bill Value`
FROM customer_purchases
ORDER BY `Total Bill Value` DESC
LIMIT 5;

## Functions that work on date values

# extract
# extract(__Day/Month/Year____ FROM date_value) --> From is differnt from Table FROM
# Get converted to nueric value

SELECT *,
extract(year FROM market_date) AS `Transaction Year`
FROM customer_purchases;


SELECT *,
extract(year FROM market_date) AS `Transaction Year`
FROM customer_purchases
WHERE extract(month FROM market_date) = 7;

# Q1 - Find all transaction that happened in the second half of 2019
SELECT *,
extract(year FROM market_date) AS `Transaction Year`,
extract(month FROM market_date) AS `Transaction Month`
FROM customer_purchases
WHERE extract(month FROM market_date) > 6 AND
extract(year FROM market_date) = 2019;

#Q2 - Find all the transactions that happened between midnight and noon

SELECT *
FROM customer_purchases 
WHERE extract(hour FROM transaction_time) <12;

#Q3 - Find all the transactions by customer id 7 in the year 2020

SELECT *
FROM customer_purchases
WHERE customer_id = 7 AND extract(year FROM market_date) = 2020;

# IF Function

# For each transaction categorize whether it happened in first half or second half of the year 
#IF(BOOLEAN CONDITION,VALUE IF PASSED, VALUE IF FAILED)

SELECT *,
if(extract(month FROM market_date) <7,"first half","second half") AS `Which Half`
FROM customer_purchases;