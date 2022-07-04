USE [Project1_SuperStore]
GO

/****** Object:  View [dbo].[vw_DIM_SubCategory]    Script Date: 7/4/2022 9:10:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create view [dbo].[vw_DIM_SubCategory]
as

with subcategorycte1
as
(
select distinct Sub_Category
FROM [Project1_SuperStore].[dbo].[SuperStore]
),
 DIM_SubCategory
 as
(
select *,
ROW_NUMBER() over (order by sub_category) as SubCategory_key
from subcategorycte1
)
select * from DIM_SubCategory
GO


