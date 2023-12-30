IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'GLOBAL\apdteagu')
CREATE LOGIN [GLOBAL\apdteagu] FROM WINDOWS
GO
CREATE USER [GLOBAL\apdteagu] FOR LOGIN [GLOBAL\apdteagu]
GO
