USE [Project1_SuperStore]
GO

/****** Object:  View [dbo].[vw_DIM_Discount]    Script Date: 7/4/2022 9:07:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vw_DIM_Discount]
as
with discountcte2
as
(select 
distinct Discount
FROM [Project1_SuperStore].[dbo].[SuperStore]
)
,
DIM_Discount
as
(
select *,
ROW_NUMBER() over(order by Discount) as Discount_Key
from discountcte2
)
select * from DIM_Discount
GO


