USE marks;

SELECT *, FIRST_VALUE(`Roll No`) OVER(PARTITION BY `Subject` ORDER BY `Time Stamp` ASC) AS `New_Col`
FROM marks;