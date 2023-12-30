SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[sp_Refresh] @AccessDB nvarchar(50), @RemoteTbl nvarchar(50)
as

--Author: Latoz, K
--Date: 2020-03-01
--Purpose: Stored Procedure is used to set the RefreshLink field in sys_Access_Linked. 
--There are certain Access Databases that have Autoexec code in them to automatically link SQL tables 
--  based on the RefreshLink field in tblAccess_Linked being set to Y.  The last step of that code
--  calls this Stored Procedure to set the flag back to N
--Last modified date:
--Modification notes:

--
--
Update sys_Access_Linked
Set RefreshLink='N'
Where AccDBName=@AccessDB
and RemoteTblName=@RemoteTbl

GO
