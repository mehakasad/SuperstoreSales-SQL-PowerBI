USE [Project1_SuperStore]
GO

/****** Object:  View [dbo].[vw_DIM_Segment]    Script Date: 7/4/2022 9:13:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vw_DIM_Segment]
as
with segementcte
as
(
select distinct segment 
from [SuperStore]
),
DIM_Segment
as
(
select *,
ROW_NUMBER () over( order by segment)as Segment_key
 from segementcte
 )
 select * from DIM_Segment
GO


