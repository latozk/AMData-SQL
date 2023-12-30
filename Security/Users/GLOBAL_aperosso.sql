IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'GLOBAL\aperosso')
CREATE LOGIN [GLOBAL\aperosso] FROM WINDOWS
GO
CREATE USER [GLOBAL\aperosso] FOR LOGIN [GLOBAL\aperosso]
GO
