IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'GLOBAL\AP PDC Users')
CREATE LOGIN [GLOBAL\AP PDC Users] FROM WINDOWS
GO
CREATE USER [GLOBAL\AP PDC Users] FOR LOGIN [GLOBAL\AP PDC Users]
GO
GRANT DELETE TO [GLOBAL\AP PDC Users]
GRANT EXECUTE TO [GLOBAL\AP PDC Users]
GRANT INSERT TO [GLOBAL\AP PDC Users]
GRANT SELECT TO [GLOBAL\AP PDC Users]
GRANT UPDATE TO [GLOBAL\AP PDC Users]
