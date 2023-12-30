IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'GLOBAL\agtconbo')
CREATE LOGIN [GLOBAL\agtconbo] FROM WINDOWS
GO
CREATE USER [GLOBAL\agtconbo] FOR LOGIN [GLOBAL\agtconbo]
GO
