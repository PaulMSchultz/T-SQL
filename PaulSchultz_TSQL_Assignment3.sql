CREATE TABLE MyData  

(C1 varchar(max)); 

GO 

INSERT INTO MyData VALUES ( 
'Four score and seven years ago our ' + 
'fathers brought forth on this continent, ' + 
'a new nation, conceived in Liberty, and ' + 
'dedicated to the proposition that ' + 
'all men are created equal.');

GO
--START RUNNING HERE FOR FIRST PROBLEM--
GO

SELECT DISTINCT LEFT (C1, 2) +
SUBSTRING (C1, CHARINDEX ('r', C1), 1) + SPACE(1) +
SUBSTRING (C1, CHARINDEX ('dedicat', C1), 7) +
SUBSTRING (C1, CHARINDEX ('ion', C1), 3) + SPACE(1) +
SUBSTRING (C1, CHARINDEX ('to', C1), 2) + SPACE(1) + 
SUBSTRING (C1, CHARINDEX ('all', C1), 3) + SPACE(1) + 
SUBSTRING (C1, CHARINDEX ('nation', C1), 6) + 
SUBSTRING (C1, CHARINDEX ('s', C1), 1) + 
right (C1, 1) AS [Getty's Using dbo.MyData]
FROM dbo.MyData

--STOP RUNNING HERE FOR FIRST PROBLEM--

/*

"For dedication to all nations"
SUBSTRING, CHARINDEX, LEFT, RIGHT

--notes--

SUBSTING(expression, start, length) Returns part of an expression
LEFT (expression, integar_value) LEFT('The......') = 1 (Would count over to the T)
RIGHT (expression, integar_value) RIGHT('ABC.') = 1 (would count over to the .)

DECLARE@V1 CHAR(20) = 'ABC' (ABC.................) Stores 20 spaces
LEN @ v1 (string_expression) = 3
DATALENGTH @ v1(expression) = 20 (if its a varchar itll still say 3 for datalength)

CHARINDEX(expressiontofind, expressiontosearch) CHARINDEX('B', 'ABC') = 2 or CHARINDEX('D', 'ABC') = 0

DECLARE @TInt as TINYINT = 101;
DECLARE @Int AS INT = 31231;
SELECT @TInt + @Int;

SELECT '101' + '31231'

DECLARE @VC AS VARCHAR(20) = 'MY';
DECLARE @C as CHAR(100) = 'Data is here.';
SELECT @VC + @C, DATALENGTH(@VC + @C + 'x'), LEN (@VC + @C);

*/
GO

--START RUNNING HERE FOR PROBLEM 2 QUESTIONS--

/*DECLARE @D1 varchar(100) = '2019-10-09 09:10:10.123'; 
DECLARE @D2 varchar(100) = '09-10-19 09:10:10.123'; 
DECLARE @D3 varchar(100) = 'Wednesday, 09 October 2019';*/

-- Display @D1 in yyyy-mm-dd format
DECLARE @D1 varchar(100) = '2019-10-09 09:10:10.123'
SELECT @D1 AS [D1], CAST (@D1 AS DATE) AS [yyyy-mm-dd]
GO
-- Display @D1 in mm/dd/yyyy format
DECLARE @D1 varchar(100) = '2019-10-09 09:10:10.123'
SELECT @D1 AS [D1], CONVERT(varchar(100), CAST(@D1 AS DATE), 101) AS [mm/dd/yyy];
GO
-- Display @D2 in mon dd yyyy hh:mmAM
DECLARE @D2 varchar(100) = '09-10-19 09:10:10.123'
SELECT @D2 AS [D2], CONVERT(varchar(100), CAST(@D2 AS DATETIME), 0) AS [mon dd yyyy hh:mmAM];
GO
-- Display @D2 in hh:mi:ss:mmmmmmmAM  format 
DECLARE @D2 varchar(100) = '09-10-19 09:10:10.123'
SELECT @D2 AS [D2], CONVERT(varchar(100), CAST(@D2 AS TIME), 109) AS [hh:mi:ss:mmmmmmmAM]; 
GO
-- Display @D3 in YYYYMMDD format
DECLARE @D3 varchar(100) = 'Wednesday, 09 October 2019'
SELECT @D3 AS [D3], CONVERT(varchar(100), PARSE(@D3 AS DATE), 112) AS [YYYYMMDD];  
GO
-- Display @D3 in hh:mmAM
DECLARE @D3 varchar(100) = 'Wednesday, 09 October 2019'
SELECT @D3 AS [D3], CONVERT(varchar(100), PARSE(@D3 AS TIME), 0) AS [hh:mmAM];
GO