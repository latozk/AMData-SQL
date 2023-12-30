SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ExportDataToFlatFile] @FilePath NVARCHAR(1000)
, @Query NVARCHAR(MAX)
, @UserName NVARCHAR(100)
, @Password NVARCHAR(100)
AS
BEGIN
    DECLARE @SqlCmd NVARCHAR(MAX)
    SET @SqlCmd = 'NET USE Z: \\ap4pdc\qdls /USER:gdcrepor dropshot && sqlcmd -S ' + @@SERVERNAME + ' -U ' + @UserName + ' -P ' + @Password + ' -Q "' + @Query + '" -s "," -o "' + @FilePath + '"'
   EXEC xp_cmdshell @SqlCmd
   --Print @sqlcmd
END

/*
EXEC ExportDataToFlatFile '\\ap4pdc\qdls\dmdclass.txt'
, 'SELECT * FROM ref_PDC_DC_OPENDB'
, 'pdc_extract'
, 'PDC_@md_2K12'
*/
GO
