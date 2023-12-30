IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'GLOBAL\apteells')
CREATE LOGIN [GLOBAL\apteells] FROM WINDOWS
GO
CREATE USER [GLOBAL\apteells] FOR LOGIN [GLOBAL\apteells]
GO
