SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

	CREATE Procedure [dbo].[sp_proc_etl_Monitor] as 
    DECLARE @tbl_Key VARCHAR(50)
    DECLARE @Package NVARCHAR(50)
    DECLARE @Max_Job INT
    DECLARE @Active_Jobs INT
    DECLARE @Available_Slots INT 
    DECLARE @sql NVARCHAR(MAX)

    SET @Max_Job = (SELECT Parm_Value FROM dbo.ref_Parameters WHERE Parm_Name = 'Max_etl_Jobs')
    SET @Active_Jobs = (SELECT COUNT(*) FROM vw_UTIL_SSIS_Active_Summary WHERE package_name LIKE 'etl_%')
    SET @Available_Slots = @Max_Job - @Active_Jobs 

    -- Create a temporary table
    CREATE TABLE #tempTable 
    (
        tbl_Key VARCHAR(50), 
        etl_Pkg NVARCHAR(50)
    )

    SET @sql = N'INSERT INTO #tempTable
    SELECT TOP (' + CAST(@Available_Slots AS NVARCHAR(10)) + N') tbl_Key, etl_Pkg
    FROM ref_Table_Dictionary 
    WHERE etl_Flag = ''R''
    AND Active = ''Y''
    AND NOT CONCAT(etl_Pkg, ''.dtsx'') IN 
        (SELECT Package_Name FROM vw_UTIL_SSIS_Active_Summary)
    ORDER BY Priority DESC'

    EXEC sp_executesql @sql

    DECLARE Cursor_Pkgs CURSOR FOR 
    SELECT tbl_Key, etl_Pkg FROM #tempTable

    OPEN Cursor_Pkgs

    FETCH NEXT FROM Cursor_Pkgs INTO @tbl_Key, @Package;

    PRINT @tbl_Key
    PRINT @Package 

    WHILE @@FETCH_STATUS = 0
    BEGIN
        EXEC sp_Exec_Pkg @Package
        FETCH NEXT FROM Cursor_Pkgs INTO @tbl_Key, @Package 
    END;

    CLOSE Cursor_Pkgs;
    DEALLOCATE Cursor_Pkgs;

    -- Drop the temporary table
    DROP TABLE #tempTable;


/*	Declare @tbl_Key varchar(50)
	Declare @Package nvarchar(50)
	Declare @Max_Job INT

	Declare Cursor_Pkgs cursor
	
	For Select Top 10 tbl_Key
	, etl_Pkg
	From ref_Table_Dictionary 
	Where etl_Flag = 'R'
	and Active = 'Y'
	and (not Concat(etl_Pkg, '.dtsx') in 
		(Select Package_Name from vw_UTIL_SSIS_Active_Summary)
		OR not Concat(dwn_Pkg, '.dtsx') in 
		(Select Package_Name from vw_UTIL_SSIS_Active_Summary))
	Order by Priority Desc

	Open Cursor_Pkgs

	Fetch next From Cursor_Pkgs INTO
	@tbl_Key
	, @Package 
	;
	Print @tbl_Key
	Print @Package 

	While @@FETCH_STATUS = 0
	
	Begin

	Exec sp_Exec_Pkg @Package 
		
		Fetch next from Cursor_Pkgs INTO
		@tbl_Key
		, @Package 
	End;

	CLOSE Cursor_Pkgs;
	Deallocate Cursor_Pkgs;
	*/
GO
