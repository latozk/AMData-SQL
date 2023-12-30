IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'GLOBAL\aptricha')
CREATE LOGIN [GLOBAL\aptricha] FROM WINDOWS
GO
CREATE USER [GLOBAL\aptricha] FOR LOGIN [GLOBAL\aptricha]
GO
