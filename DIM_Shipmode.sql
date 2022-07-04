USE [Project1_SuperStore]
GO

/****** Object:  View [dbo].[vw_DIM_Shipmode]    Script Date: 7/4/2022 9:14:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vw_DIM_Shipmode]
as
with Ship_Mode1
as
(select distinct Ship_Mode
from [SuperStore]
),
DIM_Ship_mode
as
(
select *,
ROW_NUMBER() over(order by ship_mode) as Ship_mode_key

from Ship_Mode1
)
select * from DIM_Ship_mode
GO


