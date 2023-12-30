SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[export_ref_PDC_DC_to_file_fixed]
--exec export_ref_PDC_DC_to_file_fixed
AS
BEGIN
  DECLARE @outfile VARCHAR(200);
  DECLARE @formatfile VARCHAR(200);
  DECLARE @cmd VARCHAR(500);
  DECLARE @username VARCHAR(50) = 'PDC_Extract';
  DECLARE @password VARCHAR(50) = 'PDC_@md_2K12';
  DECLARE @shareUsername VARCHAR(50) = 'gdcrepor';
  DECLARE @sharePassword VARCHAR(50) = 'dropshot';

  -- Set the output file path
  SET @outfile = '\\ap4pdc\qdls\DMDCLASS_fixed.txt';
  SET @formatfile = 'E:\DMDCLASS.fmt';

  -- Create the format file
  DECLARE @column_list NVARCHAR(MAX) = '';
  SELECT @column_list = @column_list + 
    '[' + COLUMN_NAME + ']' + 
    REPLICATE(' ', COLUMNPROPERTY(OBJECT_ID(TABLE_SCHEMA + '.' + TABLE_NAME), COLUMN_NAME, 'PRECISION')) + ',' 
  FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_NAME = 'ref_PDC_DC_OPENDB' AND TABLE_SCHEMA = 'dbo';

  -- Remove the trailing comma from the column list
  SET @column_list = LEFT(@column_list, LEN(@column_list) - 1);

  DECLARE @fmt_script NVARCHAR(MAX) = 'bcp "SELECT ' + @column_list + ' FROM AMData.dbo.ref_PDC_DC_OPENDB" format nul -x -f ' + @formatfile + ' -t "" -S ' + @@SERVERNAME + ' -U ' + @username + ' -P ' + @password;

  EXEC sp_executesql @fmt_script;

  -- Build the command to export data to the output file
  SET @cmd = 'EXEC xp_cmdshell ''NET USE E: /USER:' + @shareUsername + ' ' + @sharePassword + ' & bcp "SELECT * FROM AMData.dbo.ref_PDC_DC_OPENDB" queryout "' + @outfile + '" -f ' + @formatfile + ' -S ' + @@SERVERNAME + ' -U ' + @username + ' -P ' + @password + ' & NET USE E: /DELETE''';

  -- Execute the command to export data to the output file
  EXEC (@cmd);
END
GO
