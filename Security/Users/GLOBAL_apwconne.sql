IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'GLOBAL\apwconne')
CREATE LOGIN [GLOBAL\apwconne] FROM WINDOWS
GO
CREATE USER [GLOBAL\apwconne] FOR LOGIN [GLOBAL\apwconne]
GO
GRANT EXECUTE TO [GLOBAL\apwconne]
GRANT REFERENCES TO [GLOBAL\apwconne]
GRANT SHOWPLAN TO [GLOBAL\apwconne]
GRANT UPDATE TO [GLOBAL\apwconne]