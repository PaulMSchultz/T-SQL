USE TSQL;

GO

SELECT COUNT(DISTINCT mgrid) AS 'Distinct Manager IDs' 
FROM HR.Employees;

GO

SELECT companyname AS CompanyName, freight AS Freight, sc.custid AS 'Customer ID'
FROM Sales.Customers AS sc JOIN Sales.Orders as so ON sc.custid = so.custid
WHERE freight IN (
     SELECT freight
	 FROM Sales.Orders
	 Where freight > 800);

GO

SELECT *
From Sales.Customers as sc JOIN Sales.Orders as so ON sc.custid = so.custid
Where sc.custid IN (
	  SELECT custid
	  FROM Sales.Customers
	  WHERE city = N'Boise' AND freight > 800); 