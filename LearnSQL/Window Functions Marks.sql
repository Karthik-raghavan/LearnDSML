USE marks;

SELECT *
FROM marks
;
SELECT `Subject`, sum(marks), count(`Roll No`), min(marks), max(marks)
FROM marks
GROUP BY Subject;

SELECT *
FROM marks;

