SELECT DISTINCT dept.dept_name, COUNT(student_id) OVER(PARTITION BY dept.dept_name) AS `student_number`
FROM query_department AS `dept`
LEFT JOIN query_student AS `stud`
ON stud.dept_id = dept.dept_id
ORDER BY student_number DESC, dept.dept_name ASC