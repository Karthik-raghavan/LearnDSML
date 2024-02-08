WITH `T1` AS

(
    SELECT employee_id, salary, LEAD(salary) OVER() AS `next_higher_salary`,
        LEAD(salary) OVER() - salary AS `salary_difference`
    FROM cte_employees
    ORDER BY salary ASC
)

SELECT *
FROM T1 
ORDER BY salary ASC, salary_difference ASC