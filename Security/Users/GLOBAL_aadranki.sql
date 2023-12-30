IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'GLOBAL\aadranki')
CREATE LOGIN [GLOBAL\aadranki] FROM WINDOWS
GO
CREATE USER [GLOBAL\aadranki] FOR LOGIN [GLOBAL\aadranki]
GO
