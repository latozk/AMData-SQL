IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'GLOBAL\aamparam')
CREATE LOGIN [GLOBAL\aamparam] FROM WINDOWS
GO
CREATE USER [GLOBAL\aamparam] FOR LOGIN [GLOBAL\aamparam]
GO
