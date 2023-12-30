SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[sp_UTIL_export_table_to_file]
  @tableName NVARCHAR(100),
  @fileName NVARCHAR(200),
  @databaseName NVARCHAR(100) = 'AMData',
  @databaseCredentialName NVARCHAR(50) = 'CRED_Extract_PDC_Extract',
  @shareCredentialName NVARCHAR(50) = 'CRED_AS400_GDCRepor'
AS
BEGIN
  DECLARE @cmd VARCHAR(500);

  -- Build the command to export data to the output file
  SET @cmd = 'EXEC xp_cmdshell ''NET USE \\ap4pdc\qdls /USER:' + @shareCredentialName + ' /SAVECRED & bcp "SELECT * FROM ' + QUOTENAME(@databaseName) + '.dbo.' + QUOTENAME(@tableName) + '" queryout "' + @fileName + '" -c -t, -S ' + @@SERVERNAME + ' -T -C ' + @databaseCredentialName + ' & NET USE \\ap4pdc\qdls /DELETE''';

  -- Execute the command to export data to the output file
  EXEC (@cmd);
END


--EXEC sp_UTIL_Export_Table_to_File 'ref_PDC_DC', '\\ap4pdc\qdls\DMDCLASS.txt';


GO
