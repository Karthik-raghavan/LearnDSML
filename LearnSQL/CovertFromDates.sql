WITH `days` AS 
(
(SELECT '2022-04-12' AS `day`)
UNION ALL
(SELECT '2021-08-09')
UNION ALL
(SELECT '2020-06-26')
)

/*SELECT *
FROM days;*/

# day_name, month_name day, year # Friday, June 26, 2020

SELECT day, date_format(day, '%W, %M %e, %Y')
FROM days;