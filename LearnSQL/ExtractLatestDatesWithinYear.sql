SELECT DISTINCT user_id, MAX(time_stamp) OVER(PARTITION BY user_id) AS `time_stamp` 
FROM logins
WHERE EXTRACT(YEAR FROM time_stamp) = '2020'
ORDER BY user_id ASC;