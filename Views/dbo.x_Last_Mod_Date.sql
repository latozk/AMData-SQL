SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create view [dbo].[x_Last_Mod_Date] as 
SELECT [name], create_date, modify_date
FROM sys.procedures
--ORDER BY 3 DESC;
GO
