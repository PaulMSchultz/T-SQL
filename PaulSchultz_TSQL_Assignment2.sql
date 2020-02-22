USE TSQL;
/* CSC 305 - Homework Assignment 2 in .tsql form and NOTES:

DEMO [filter data int the select clause using the top and fetch options] --

SELECT TOP 10 | TOP 10 Percent

ORDER BY <order_by_list>
OFFSET <offset_value> ROW | ROWS (use offset 0 if you dont want to skip any rows)
FETCH FIRST | NEXT <fetch_value> ROW(S) ONLY (Fetch 5 rows starting at your offset)

SELECT <select list>
FROM <table source>
ORDER BY <column1_name>, <column2_name>; ------- or <column1_name | column2_name>;

DESC is descending value, ascending ASC or is default

-- END NOTES --


-- CSC 305 - Homework Assignment 2 in .tsql form --

-- WebApp that shows customers on a screen --
-- screen supports ONLY 10 customers --
-- build a set of 3 queries that will display the first 30 customers base on custid and in sorted order --
-- first query should show first 10 customers based on custid --
-- second query shows the next 10 customers --
-- last query shows the next 10 customers --
-- each output should only show 10 customers and no customer should be duplicated between each of the 3 query results --
-- solution needs to use the FETCH and OFFSET options of the ORDER BY clause --

*/

SELECT TOP (10) [custid] AS [Customer ID], [contactname] AS [Contact Name]
FROM Sales.Customers
ORDER BY [Customer ID] ASC;

GO

SELECT [custid] AS [Customer ID], [contactname] AS [Contact Name]
FROM Sales.Customers
ORDER BY [Customer ID] ASC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

GO

SELECT [custid] AS [Customer ID], [contactname] AS [Contact Name]
FROM Sales.Customers
ORDER BY [Customer ID] ASC
  
GO

