SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
Create PROCEDURE [dbo].[export_ref_PDC_DC_to_file_fixed_width]
--exec export_ref_PDC_DC_to_file_fixed_width

AS
BEGIN
  DECLARE @outfile VARCHAR(200);
  DECLARE @cmd VARCHAR(500);
  DECLARE @username VARCHAR(50) = 'PDC_Extract';
  DECLARE @password VARCHAR(50) = 'PDC_@md_2K12';
  DECLARE @shareUsername VARCHAR(50) = 'gdcrepor';
  DECLARE @sharePassword VARCHAR(50) = 'dropshot';
  DECLARE @columns VARCHAR(MAX);
  DECLARE @column_names VARCHAR(MAX);
  DECLARE @column_widths VARCHAR(MAX);

  -- Set the output file path
  SET @outfile = '\\ap4pdc\qdls\DMDCLASS.txt';

  -- Get column information from the view
  SELECT @columns = COALESCE(@columns + ', ', '') + '[' + COLUMN_NAME + ']'
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME = 'ref_PDC_DC_OPENDB'
  ORDER BY ORDINAL_POSITION;

  SELECT @column_names = COALESCE(@column_names + '  ', '') + COLUMN_NAME
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME = 'ref_PDC_DC_OPENDB'
  ORDER BY ORDINAL_POSITION;

  SELECT @column_widths = COALESCE(@column_widths + '  ', '') + CAST(CHARACTER_MAXIMUM_LENGTH AS VARCHAR)
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME = 'ref_PDC_DC_OPENDB'
  ORDER BY ORDINAL_POSITION;

  -- Build the command to export data to the output file
  SET @cmd = 'EXEC xp_cmdshell ''NET USE \\ap4pdc\qdls /USER:' + @shareUsername + ' ' + @sharePassword + ' & bcp "SELECT ' + @columns + ' FROM AMData.dbo.ref_PDC_DC_OPENDB" queryout "' + @outfile + '" -c -t "" -r "" -S ' + @@SERVERNAME + ' -U ' + @username + ' -P ' + @password + ' -T -f c:\temp\fmt.fmt & NET USE \\ap4pdc\qdls /DELETE''';

  -- Create format file
  EXEC ('bcp "SELECT * FROM AMData.dbo.ref_PDC_DC_OPENDB" format nul -T -f c:\temp\fmt.fmt -x');

  -- Insert column widths into format file
  DECLARE @i INT = 1;
  DECLARE @num_columns INT = (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ref_PDC_DC_OPENDB');

  WHILE @i <= @num_columns
  BEGIN
    DECLARE @width INT = (SELECT CAST(CHARACTER_MAXIMUM_LENGTH AS INT) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ref_PDC_DC_OPENDB' AND ORDINAL_POSITION = @i);
    SET @cmd = 'EXEC xp_cmdshell ''echo ' + CAST(@width AS VARCHAR) + ' >> c:\temp\fmt.fmt''';
    EXEC (@cmd);
    SET @i = @i + 1;
  END

  -- Execute the command to export data to the output file
  EXEC (@cmd);
END
GO
