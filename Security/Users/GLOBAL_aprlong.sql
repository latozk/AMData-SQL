IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'GLOBAL\aprlong')
CREATE LOGIN [GLOBAL\aprlong] FROM WINDOWS
GO
CREATE USER [GLOBAL\aprlong] FOR LOGIN [GLOBAL\aprlong]
GO
GRANT DELETE TO [GLOBAL\aprlong]
GRANT INSERT TO [GLOBAL\aprlong]
GRANT SELECT TO [GLOBAL\aprlong]
GRANT UPDATE TO [GLOBAL\aprlong]
