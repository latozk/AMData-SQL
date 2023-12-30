IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'GLOBAL\apjkelly')
CREATE LOGIN [GLOBAL\apjkelly] FROM WINDOWS
GO
CREATE USER [GLOBAL\apjkelly] FOR LOGIN [GLOBAL\apjkelly]
GO
