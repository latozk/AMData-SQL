SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--EXEC dbo.sp_UTIL_Kill_Active_Processes
CREATE PROCEDURE [dbo].[sp_UTIL_Kill_Active_Processes] AS
/*This will end all process threads for AMData

Change the @dbName for the database you want to use*/
DECLARE @DbName nvarchar(60)='AMData'  
Declare @SPID int  

--get all processes  
DECLARE @Table TABLE(  
    SPID INT,  
    Status VARCHAR(MAX),  
    LOGIN VARCHAR(MAX),  
    HostName VARCHAR(MAX),  
    BlkBy VARCHAR(MAX),  
    DBName VARCHAR(MAX),  
    Command VARCHAR(MAX),  
    CPUTime INT,  
    DiskIO INT,  
    LastBatch VARCHAR(MAX),  
    ProgramName VARCHAR(MAX),  
    SPID_1 INT,  
    REQUESTID INT  
)  

EXEC sp_who2
INSERT INTO @Table EXEC sp_who2  
--using cursor to kill all processes  
DECLARE cur_KillAllProcesses CURSOR FAST_FORWARD FOR  
SELECT   
SPID  
FROM @Table  
WHERE DBName=@DbName  
OPEN cur_KillAllProcesses  

FETCH NEXT FROM cur_KillAllProcesses INTO   
@SPID  



WHILE @@FETCH_STATUS=0  
BEGIN  

--add kill process command  

Exec('KILL '+ @SPID)  


FETCH NEXT FROM cur_KillAllProcesses INTO @SPID  

END  

CLOSE cur_KillAllProcesses  
DEALLOCATE cur_KillAllProcesses  
GO
