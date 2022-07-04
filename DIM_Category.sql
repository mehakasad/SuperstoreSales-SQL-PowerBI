USE [Project1_SuperStore]
GO

/****** Object:  View [dbo].[vw_DIM_Customer]    Script Date: 7/4/2022 9:05:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create   view [dbo].[vw_DIM_Customer]
as
with DIM_Customer
as 
(
select distinct Customer_ID, Customer_Name
FROM [Project1_SuperStore].[dbo].[Superstore]
)
select * from DIM_Customer
GO



