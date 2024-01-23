USE farmers_market;

# Cross Join
# All possible combinations

# Self Join

# Union - append tables vertically


SELECT t.*
FROM (SELECT "IND" AS 'Team A' UNION DISTINCT
SELECT "ENG"  UNION DISTINCT
SELECT "NZ" UNION DISTINCT
SELECT "NZ") AS `t` ;


# Can we join more than 2 tables


