IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'GLOBAL\aprnewel')
CREATE LOGIN [GLOBAL\aprnewel] FROM WINDOWS
GO
CREATE USER [GLOBAL\aprnewel] FOR LOGIN [GLOBAL\aprnewel]
GO
