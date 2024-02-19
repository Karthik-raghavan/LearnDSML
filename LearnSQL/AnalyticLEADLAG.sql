SELECT
  ProductID,
  Quantity,
  LEAD(Quantity, 1) OVER(PARTITION BY ProductID ORDER BY ProductID ASC),
  LAG(Quantity, 1) OVER(PARTITION BY ProductID ORDER BY ProductID ASC),
  LEAD(Quantity, 1) OVER(ORDER BY ProductID ASC),
  LAG(Quantity, 1) OVER( ORDER BY ProductID ASC)
FROM
  `learnhub-414701.practiceSQL.OrderDetails`
WHERE
  ProductID = 1
