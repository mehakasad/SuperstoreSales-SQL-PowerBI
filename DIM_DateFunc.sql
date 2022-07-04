USE [Project1_SuperStore]
GO

/****** Object:  UserDefinedFunction [dbo].[DIM_Date]    Script Date: 7/4/2022 9:18:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[DIM_Date]()
	RETURNS @finalTable TABLE
	(
		date_column date
	
	)

	AS

BEGIN

DECLARE @startdate_1 VARCHAR(20) = '01-01-'; 
DECLARE @startdate_2 VARCHAR(20);
DECLARE @startdate VARCHAR(20);
DECLARE @enddate_1 VARCHAR(20)='12-31-';
DECLARE @enddate_2 VARCHAR(20);
Declare @enddate varchar(20);
SELECT @startdate_2 = CONVERT(VARCHAR(4),YEAR(min(order_date))) from [Superstore]
SELECT @enddate_2= convert(varchar(4),year (max(Ship_date))) from [Superstore]
SET @startdate = cast ((@startdate_1 + @startdate_2) as date);
SET @enddate= cast ((@enddate_1+ @enddate_2) as date);
--select @startdate,@enddate


;
WITH CTE_DatesTable
AS
  
  (
  
  SELECT cast (@startdate as date) AS [date]
  UNION ALL
  SELECT DATEADD(dd, 1, [date])
  FROM CTE_DatesTable
  WHERE DATEADD(dd, 1, [date]) <= cast (@enddate as date)
)
INSERT INTO @finalTable
SELECT [date] FROM CTE_DatesTable
OPTION (MAXRECURSION 0);


	RETURN;
END
GO


