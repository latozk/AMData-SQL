IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'GLOBAL\apasmith')
CREATE LOGIN [GLOBAL\apasmith] FROM WINDOWS
GO
CREATE USER [GLOBAL\apasmith] FOR LOGIN [GLOBAL\apasmith]
GO
