SELECT
  ProductID,
  Quantity,
  FIRST_VALUE(Quantity) OVER(ORDER BY ProductID) AS `FVPID`,
  NTH_VALUE(Quantity,2) OVER(ORDER BY ProductID) AS `NVPID`,
  LAST_VALUE(Quantity) OVER(ORDER BY ProductID) AS `LVPID`,
  FIRST_VALUE(Quantity) OVER(ORDER BY Quantity) AS `FVQ`,
  NTH_VALUE(Quantity,2) OVER(ORDER BY Quantity) AS `NVQ`,
  LAST_VALUE(Quantity) OVER(ORDER BY Quantity) AS `LVQ`
FROM
  `learnhub-414701.practiceSQL.OrderDetails`
WHERE
  ProductID = 1
