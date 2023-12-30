SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--exec sp_Exec_Pkg 'dwn_ECN_Part_Tran'

Create  Procedure [dbo].[sp_Exec_Pkg] 
@Package nvarchar(50)
as

Declare @Pkg_Name varchar(50)
Declare @execution_id bigint

Begin try

Set @Pkg_Name = @Package + '.dtsx'

--Added 2022-11-11 kll
Update ref_Table_Dictionary set dwn_Flag='Q'
where dwn_Pkg = @Package 

EXEC [SSISDB].[catalog].[create_execution] @package_name=@Pkg_Name,
    @execution_id=@execution_id OUTPUT,
    @folder_name=N'AMData_New',
	@project_name=N'AMData_New',
  	@use32bitruntime=False--,
	--@reference_id=1
Select @execution_id
DECLARE @var0 smallint = 1
EXEC [SSISDB].[catalog].[set_execution_parameter_value] @execution_id,
    @object_type=50,
	  @parameter_name=N'LOGGING_LEVEL',
	  @parameter_value=@var0
EXEC [SSISDB].[catalog].[start_execution] @execution_id

end try

begin catch
Update ref_Table_Dictionary set dwn_Flag='X'
where dwn_Pkg = @Package 
select 
        ERROR_NUMBER() AS ErrorNumber  
       ,ERROR_MESSAGE() AS ErrorMessage; 
end catch


/*
--Use to get reference_ID for environment
---- get the folder_id
SELECT *
FROM [SSISDB].[catalog].[folders]
WHERE [name] = 'AMData_New';
-- [folder_id] = 7
 
-- get the project_id
SELECT *
FROM [SSISDB].[catalog].[projects]
WHERE [folder_id] = 7;
-- [project_id] = 12
 
-- get the environment reference id
SELECT *
FROM [SSISDB].[catalog].[environment_references]
WHERE [project_id] = 12;
-- [reference_id] = ''
*/



GO
