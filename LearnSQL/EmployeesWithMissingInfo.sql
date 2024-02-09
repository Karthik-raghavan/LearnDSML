WITH `T1` AS

((
SELECT T1.employee_id
FROM cte_employees2 AS `T1`
LEFT JOIN cte_salaries2 AS `T2`
    ON T2.employee_id = T1.employee_id
WHERE T2.employee_id IS NULL
)

UNION ALL
(
SELECT T2.employee_id
FROM cte_employees2 AS `T1`
RIGHT JOIN cte_salaries2 AS `T2`
    ON T2.employee_id = T1.employee_id
WHERE T1.employee_id IS NULL))

SELECT *
FROM T1
ORDER BY employee_id ASC