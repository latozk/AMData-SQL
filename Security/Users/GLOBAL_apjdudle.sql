IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'GLOBAL\apjdudle')
CREATE LOGIN [GLOBAL\apjdudle] FROM WINDOWS
GO
CREATE USER [GLOBAL\apjdudle] FOR LOGIN [GLOBAL\apjdudle]
GO
