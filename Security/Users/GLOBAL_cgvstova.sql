IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'GLOBAL\cgvstova')
CREATE LOGIN [GLOBAL\cgvstova] FROM WINDOWS
GO
CREATE USER [GLOBAL\cgvstova] FOR LOGIN [GLOBAL\cgvstova]
GO
