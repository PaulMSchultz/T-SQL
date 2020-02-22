USE TSQL;

GO

CREATE OR ALTER PROCEDURE USP_Get_Order_Info (@orderid INT = NULL, @custid INT = NULL, @productid INT = NULL)
AS
BEGIN
IF @orderid IS NULL AND @custid IS NULL AND @productid IS NULL -- ALL THREE PARAMETERS ARE NULL
    SELECT * FROM Sales.Orders AS so LEFT OUTER JOIN Sales.OrderDetails AS od ON so.orderid = od.orderid
ELSE IF @custid IS NULL AND @productid IS NULL -- ONLY ORDERID
    SELECT * FROM Sales.Orders AS so JOIN Sales.OrderDetails AS od ON so.orderid = od.orderid
	WHERE so.orderid = @orderid;
ELSE IF @orderid IS NULL AND @productid IS NULL -- ONLY CUSTID
    SELECT * FROM Sales.Orders AS so JOIN Sales.OrderDetails AS od ON so.orderid = od.orderid
	WHERE custid = @custid;
ELSE IF @orderid IS NULL AND @custid IS NULL -- ONLY PRODUCTID
    SELECT * FROM Sales.Orders AS so LEFT OUTER JOIN Sales.OrderDetails AS od ON so.orderid = od.orderid
	WHERE productid = @productid;
ELSE
	SELECT 'Too many parameters have been entered...'
END

GO

EXEC USP_Get_Order_Info;
EXEC USP_Get_Order_Info @orderid = 10250;
EXEC USP_Get_Order_Info @custid = 25;
EXEC USP_Get_Order_INfo @productid = 10;
EXEC USP_Get_Order_Info @orderid = 10250, @custid = 25, @productid = 10;
EXEC USP_Get_Order_Info @orderid = 10250, @custid = 25;
EXEC USP_Get_Order_Info @orderid = 10250, @productid = 10;
EXEC USP_Get_Order_Info @custid = 25, @productid = 10; 

GO
