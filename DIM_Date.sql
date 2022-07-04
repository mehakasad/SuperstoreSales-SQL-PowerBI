USE [Project1_SuperStore]
GO

/****** Object:  View [dbo].[vw_DIMDate]    Script Date: 7/4/2022 9:20:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vw_DIMDate] as
select * from dbo.DIM_Date()
GO


