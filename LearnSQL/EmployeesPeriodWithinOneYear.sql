SELECT e.employee_id, CONCAT(e.first_name, ' ', e.last_name) AS `full_name`, j.job_title
FROM query_employees2 AS `e`
JOIN query_job_history2 AS `jh`
    ON jh.employee_id = e.employee_id
JOIN query_jobs2 AS `j`
    ON j.job_id = jh.job_id
WHERE DATEDIFF(jh.end_date,jh.start_date) / 365 < 1
ORDER BY e.employee_id ASC, j.job_title ASC