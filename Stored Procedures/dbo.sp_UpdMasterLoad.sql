SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		K.Latoz
-- Create date: 02/27/2020
-- Description:	This Stored Procedure is used to support the code in the SSIS package that loads data into 
--              the SQL server.  It's purpose is to update Master_Data_Load Table with Record Counts and Date
--              Base on parameter it can be ran both PRE and POST load within the SSIS package
-- 
--Parameters: @PrePost = Is it being called before or after the execution of the data load
--            @SourceSys = Name of server/iSeries where data is coming from (i.e. AC4PROD / AP4PDC / APMDTA01\PRODDB)
--            @TblName = SQL Table Name
--            @Source_Lib = Library on iSeries
 --           @Source_Tbl = Table name on iSeries
 --
--Last modified date:
--Modification notes:
-- =============================================
--exec sp_UpdMasterLoad POST, AC4PROD, eng_ECN, ERPRODGEN, ERABREP
CREATE PROCEDURE [dbo].[sp_UpdMasterLoad] (@PrePost varchar(5)
, @SourceSys varchar(25) 
, @TblName varchar(30)
, @Source_Lib varchar(30)
, @Source_Tbl varchar(30))

as
BEGIN

Declare @PP varchar(5)
Declare @SrcSys as varchar(25)
Declare @SQLTable varchar(30) 
Declare @Lib varchar(30)
Declare @Tbl varchar(30)
Declare @Source varchar(30)
Declare @iSQLStatement nVarchar(1000)
Declare @SQLStatement nVarchar(1000)

Set @PP = @PrePost
Set @SrcSys = @SourceSys
Set @SQLTable = @TblName 
Set @Lib =@Source_Lib
Set @Tbl =@Source_Tbl
Set @Source = Concat(@Lib, '.', @Tbl) --Combines Library.Table for iSQL_Statement

If @SrcSys = 'AC4PROD'
	 Set @SrcSys = 'AC4PROD_GDC'
Else
		Set @SrcSys = @SrcSys


If (@PP = 'PRE')
Begin 
	Update sys_Master_Table_Load
	Set StartLoad=Getdate()
	Where Destination_Table=@SQLTable
End

	Else --If (@PP = 'POST')
		Begin 
			SET @iSQLStatement =  'SELECT * FROM OPENQUERY('+@SrcSys+', ''SELECT count(*) as SourceCnt FROM ' + @Source + ''')'
			SET @SQLStatement = 'Select count(*) as DestCnt from ' +  @SQLTable + ''
			---
		--Routine to create a temp table to hold the value returned by sp_executesql @iSQLStatement.  
			Create Table #TempTable(Column1 INT)
			Insert into #TempTable(Column1)
			EXECUTE sp_executesql 
			@iSQLStatement 


--Routine to update the record in Master_Data_Load
			Update sys_Master_Table_Load
				Set LastLoadDate=Getdate()
				, SourceRecCount=(Select * from #TempTable)
				Where Destination_Table=@SQLTable

			Truncate Table #TempTable
			Insert into #TempTable(Column1)
				EXECUTE sp_executesql 
				  @SQLStatement 

			Update sys_Master_Table_Load
			Set DestRecCount=(select * from #TempTable)
			Where Destination_Table=@SQLTable

			Drop Table #TempTable 

		END 
		--Else goto ENDSP

ENDSP:
END

GO
