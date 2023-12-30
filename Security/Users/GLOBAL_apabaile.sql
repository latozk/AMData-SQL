IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'GLOBAL\apabaile')
CREATE LOGIN [GLOBAL\apabaile] FROM WINDOWS
GO
CREATE USER [GLOBAL\apabaile] FOR LOGIN [GLOBAL\apabaile]
GO
