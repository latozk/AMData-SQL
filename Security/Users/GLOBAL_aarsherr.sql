IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'GLOBAL\aarsherr')
CREATE LOGIN [GLOBAL\aarsherr] FROM WINDOWS
GO
CREATE USER [GLOBAL\aarsherr] FOR LOGIN [GLOBAL\aarsherr]
GO
