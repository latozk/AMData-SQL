SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE Function [dbo].[fn_UpdMasterLoad] (@TblName varchar(30)
, @Source_Lib varchar(30), @Source_Tbl varchar(30))
RETURNS nvarchar(25)
as
BEGIN 

Declare @Lib varchar(30)
Declare @Tbl varchar(30)
Declare @Source varchar(30)
Declare @iSQLStatement nVarchar(1000)
Declare @SrcCnt nvarchar(50)

Declare @SourceCnt nvarchar(25) 

Set @Lib = @Source_Lib
Set @Tbl = @Source_Tbl
Set @Source = Concat(@Lib, '.', @Tbl) --Combines Library.Table for iSQL_Statement

SET @iSQLStatement =  'SELECT * FROM OPENQUERY(AC4PROD_GDC, ''SELECT count(*) as SourceCnt FROM ' + @Source + ''')'

EXECUTE sp_executesql 
   @iSQLStatement
 ,N' @SourceCnt nvarchar(25) OUTPUT'
   , @SourceCnt = @SrcCnt OUTPUT
 -- ,@PID='ERBVCPP'
  
  Declare @Test nvarchar(25)
  set @test = @SrcCnt --OUTPUT 
   
   RETURN @test;
   END



----Works
--Declare @ProdNumber nvarchar(50)
--EXECUTE sp_executesql N' 
--   Select @ProdNumberOUT = DestRecCount 
--   FROM Master_Data_Load where Dest_Table = @Pid'
--   ,N'@PID NVarchar(50), @ProdNumberOUT nvarchar(25) OUTPUT'
--   , @PID = 'ERBVCPP'
--   , @ProdNumberOut = @ProdNumber OUTPUT

--   Select @ProdNumber as ProductNumber 

GO
