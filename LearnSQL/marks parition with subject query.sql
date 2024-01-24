USE marks;

SELECT *, sum(marks) over(partition by Subject) AS `Sum of Diff Subject` 
FROM marks;