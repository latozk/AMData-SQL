IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'GLOBAL\apcsexto')
CREATE LOGIN [GLOBAL\apcsexto] FROM WINDOWS
GO
CREATE USER [GLOBAL\apcsexto] FOR LOGIN [GLOBAL\apcsexto]
GO
GRANT DELETE TO [GLOBAL\apcsexto]
GRANT INSERT TO [GLOBAL\apcsexto]
GRANT SELECT TO [GLOBAL\apcsexto]
GRANT UPDATE TO [GLOBAL\apcsexto]