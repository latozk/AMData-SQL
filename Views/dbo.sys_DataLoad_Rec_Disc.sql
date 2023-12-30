SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
--Author: Latoz, K
--Date: 2020-03-01
--Description: Show tables where the Source and Destination record counts are different
--Last modified date:
--Modification notes:
-- =============================================

 CREATE view [dbo].[sys_DataLoad_Rec_Disc] as 
 Select * from sys_Table_Load_Info 
 Where RecDiff <>0
 and not RecDiff is null


GO
