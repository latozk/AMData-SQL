SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[export_ref_PDC_DC_to_file]
AS
BEGIN
    DECLARE @outfile VARCHAR(200);
    DECLARE @cmd VARCHAR(500);
    DECLARE @username VARCHAR(50) = 'PDC_Extract';
    DECLARE @password VARCHAR(50) = 'PDC_@md_2K12';
    DECLARE @shareUsername VARCHAR(50) = 'gdcrepor';
    DECLARE @sharePassword VARCHAR(50) = 'dropshot';
    DECLARE @table VARCHAR(100) = 'AMData.dbo.ref_PDC_DC_OPENDB';
    DECLARE @datafile VARCHAR(200) = '\\ap4pdc\qdls\DMDCLASS.txt';

    -- Build the command to export data to the output file
    SET @cmd = 'EXEC xp_cmdshell ''NET USE \\ap4pdc\qdls /USER:' + @shareUsername + ' ' + @sharePassword + ' & bcp "' + @table + '" format nul -f "' + @datafile + '.fmt" -x -t "" -S ' + @@SERVERNAME + ' -U ' + @username + ' -P ' + @password + ' & bcp "' + @table + '" out "' + @datafile + '" -f "' + @datafile + '.fmt" -S ' + @@SERVERNAME + ' -U ' + @username + ' -P ' + @password + ' & NET USE \\ap4pdc\qdls /DELETE''';

    -- Execute the command to export data to the output file
    EXEC (@cmd);
END
GO
