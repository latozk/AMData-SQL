IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'GLOBAL\gblarsad')
CREATE LOGIN [GLOBAL\gblarsad] FROM WINDOWS
GO
CREATE USER [GLOBAL\gblarsad] FOR LOGIN [GLOBAL\gblarsad]
GO
