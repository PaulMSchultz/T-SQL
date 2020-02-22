
-- ASSIGNMENT 1 , PAUL SCHULTZ, 22 JANUARY 2020 --

SELECT firstname AS FirstName, lastname AS LastName,
-- SIMPLE CASE --
CASE region
		WHEN 'WA' THEN 'Washinton'
		ELSE 'England'
		END AS [RegionSpelledOut],
-- SEARCHED CASE --
CASE
		WHEN country = 'USA' THEN 'United States of America'
		WHEN country = 'UK' THEN 'England'
		ELSE 'Unknown'
		END AS CountrySpelledOut
FROM HR.Employees


