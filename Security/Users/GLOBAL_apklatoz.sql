IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'GLOBAL\apklatoz')
CREATE LOGIN [GLOBAL\apklatoz] FROM WINDOWS
GO
CREATE USER [GLOBAL\apklatoz] FOR LOGIN [GLOBAL\apklatoz]
GO
