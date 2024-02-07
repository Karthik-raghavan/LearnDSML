SELECT  employee_id, first_name, department_id, job_id, salary, NTILE(4) OVER(ORDER BY salary) AS `Quartile`
FROM query_employees
ORDER BY Quartile ASC, salary ASC, employee_id ASC