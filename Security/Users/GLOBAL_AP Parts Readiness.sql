IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'GLOBAL\AP Parts Readiness')
CREATE LOGIN [GLOBAL\AP Parts Readiness] FROM WINDOWS
GO
CREATE USER [GLOBAL\AP Parts Readiness] FOR LOGIN [GLOBAL\AP Parts Readiness]
GO
GRANT DELETE TO [GLOBAL\AP Parts Readiness]
GRANT EXECUTE TO [GLOBAL\AP Parts Readiness]
GRANT INSERT TO [GLOBAL\AP Parts Readiness]
GRANT SELECT TO [GLOBAL\AP Parts Readiness]
GRANT UPDATE TO [GLOBAL\AP Parts Readiness]
