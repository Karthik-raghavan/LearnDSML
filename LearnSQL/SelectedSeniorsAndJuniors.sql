/*A company wants to hire new employees. The budget of the company for the salaries is $70000.*/

WITH `SeniorsEligible` AS 

(
SELECT *, SUM(salary) OVER(ORDER BY salary ASC) AS `Cummulative_Salary_Senior`
FROM cte_candidates
WHERE experience = 'Senior'
),

`JuniorsEligible` AS 
(
SELECT *, SUM(salary) OVER(ORDER BY salary ASC) AS `Cummulative_Salary_Junior`
FROM cte_candidates
WHERE experience = 'Junior'
)

(SELECT employee_id
FROM SeniorsEligible
WHERE Cummulative_Salary_Senior < 70000 )
UNION ALL
(SELECT employee_id
FROM JuniorsEligible
WHERE Cummulative_Salary_Junior < 70000 - (SELECT MAX(Cummulative_Salary_Senior) FROM SeniorsEligible WHERE Cummulative_Salary_Senior < 70000) )
ORDER BY employee_id ASC