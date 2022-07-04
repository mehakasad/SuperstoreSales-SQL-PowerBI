USE [Project1_SuperStore]
GO

/****** Object:  View [dbo].[vw_FACT_Sales]    Script Date: 7/4/2022 9:12:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE view [dbo].[vw_FACT_Sales]
as

select 
a.Row_ID,
a.Order_ID,
a.Order_Date,
a.Ship_Date,
a.Customer_ID,
a.Sales,
a.Profit,
a.Quantity,

SUBSTRING(Country, 1, 1)+ SUBSTRING(State, 1, 2) +SUBSTRING(city, 1, 3) + cast(Postal_Code as nvarchar(10)) as 'Postal_Key'
,
b.category_key,
c.SubCategory_key,
d.Discount_key,
e.Segment_key,
f.Ship_Mode_key
from Superstore a
inner join vw_DIM_Category b
on a.Category=b.Category
inner join vw_DIM_SubCategory c
on a.Sub_Category=c.Sub_Category
inner join vw_DIM_Discount d
on a.Discount=d.Discount
inner join vw_DIM_Segment e
on a.Segment=e.segment
inner join vw_DIM_Shipmode as f
on a.Ship_Mode= f.Ship_mode


GO


