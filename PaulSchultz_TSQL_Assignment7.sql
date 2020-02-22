USE TSQL;

GO

SELECT orderid AS 'Order ID', productid AS 'Product ID', unitprice AS 'Unit Price', qty AS 'Quantity',
    SUM(unitprice * qty) OVER (PARTITION BY productid) 
	AS 'Line Total',
    SUM(unitprice * qty) OVER
	(PARTITION BY orderid ORDER BY productid ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
	AS 'Running Total'
FROM Sales.OrderDetails AS od
WHERE orderid = '10312';

GO

SELECT *
FROM Sales.Orders
WHERE orderid = '10312';

GO

SELECT od.orderid AS 'Order ID', od.productid AS 'Product ID', od.unitprice AS 'Unit Price', od.qty AS 'Quantity',
    SUM(od.unitprice * od.qty) OVER (PARTITION BY od.productid) 
	AS 'Line Total',
    SUM(od.unitprice * od.qty) OVER
	(PARTITION BY od.orderid ORDER BY od.productid ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
	AS 'Running Total'
FROM Sales.OrderDetails AS od
JOIN Sales.Orders AS so ON od.orderid = so.orderid
WHERE od.orderid = '10312';

