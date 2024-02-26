SELECT
  ROW_NUMBER() OVER() AS `RowNumber`,
  ProductID,
  Quantity,
  RANK() OVER(ORDER BY Quantity ASC) AS `RankQuantity`,
  DENSE_RANK() OVER(ORDER BY Quantity ASC) AS `DenseRankQuantity`,
  PERCENT_RANK() OVER(ORDER BY Quantity ASC) AS `PercentRankQuantity`
FROM
  `learnhub-414701.practiceSQL.OrderDetails`
WHERE
  ProductID IN (1,2)
ORDER BY `RowNumber` ASC
