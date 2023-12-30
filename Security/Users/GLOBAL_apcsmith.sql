IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'GLOBAL\apcsmith')
CREATE LOGIN [GLOBAL\apcsmith] FROM WINDOWS
GO
CREATE USER [GLOBAL\apcsmith] FOR LOGIN [GLOBAL\apcsmith]
GO
