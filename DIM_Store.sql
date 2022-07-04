USE [Project1_SuperStore]
GO

/****** Object:  View [dbo].[vw_DIM_Store]    Script Date: 7/4/2022 9:15:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_DIM_Store]
as
with DIM_Store
as
(
select distinct Country,
city,
State,
Region,
Postal_Code,
SUBSTRING(Country, 1, 1)+ SUBSTRING(State, 1, 2) +SUBSTRING(city, 1, 3) + cast(Postal_Code as nvarchar(10)) as 'Postal_Key'

FROM [Project1_SuperStore].[dbo].[Superstore]
)
select * from DIM_Store
GO


