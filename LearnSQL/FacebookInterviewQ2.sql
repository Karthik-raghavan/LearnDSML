/*Q2.
Given two relations/tables:

fb_comments_count(
user_id VARCHAR,
date DATE,
post_id VARCHAR,
num_comments INT);

fb_active_users(
row_no INT,
user_id VARCHAR,
Country VARCHAR);

Which countries have risen in the rankings based on the number of comments between 
Dec 2021 vs Jan 2022?
*/


WITH `Dec21` AS

(
SELECT *, DENSE_RANK() OVER(ORDER BY `21Rank` DESC) AS `RankDec21`
FROM (
  SELECT DISTINCT u.Country, SUM(c.num_comments) OVER(PARTITION BY u.Country) AS `21Rank`
FROM `lucid-totality-409609.facebook.comments` AS `c`
JOIN `lucid-totality-409609.facebook.users` AS `u`
  ON u.user_id = c.user_id
WHERE EXTRACT(YEAR FROM `date`) = 2021 AND EXTRACT(MONTH FROM `date`) = 12
)
),

`Jan22` AS
(
SELECT *, DENSE_RANK() OVER(ORDER BY `22Rank` DESC) AS `RankJan22`
FROM (
SELECT DISTINCT u.Country, SUM(c.num_comments) OVER(PARTITION BY u.Country) AS`22Rank`
FROM `lucid-totality-409609.facebook.comments` AS `c`
JOIN `lucid-totality-409609.facebook.users` AS `u`
  ON u.user_id = c.user_id
WHERE EXTRACT(YEAR FROM `date`) = 2022 AND EXTRACT(MONTH FROM `date`) = 1
) 
)

SELECT *
FROM `Dec21` AS `T1`
JOIN `Jan22` AS `T2`
ON T2.Country = T1.Country