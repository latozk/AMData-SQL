CREATE TABLE [dbo].[hose_BOM_ONeil]
(
[TRUCK BRAND] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HOSE BRAND] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PART #] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TOT LENGTH] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMM1] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMM2] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMM3] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMM4] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMM5] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMM6] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMM7] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BULK #] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BULK COMM] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FTG1] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FTG1 COMM] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FTG1 QTY] [int] NULL,
[FTG2] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FTG2 COMM] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FTG2 QTY] [int] NULL,
[GUARD #] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GUARD COMM] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GUARD QTY] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[hose_BOM_ONeil] ADD CONSTRAINT [PK_hose_BOM_ONeil] PRIMARY KEY CLUSTERED ([TRUCK BRAND], [PART #]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\apchause]
GO
GRANT INSERT ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\apchause]
GO
GRANT SELECT ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\apchause]
GO
GRANT UPDATE ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\apchause]
GO
GRANT DELETE ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\apcsexto]
GO
GRANT INSERT ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\apcsexto]
GO
GRANT SELECT ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\apcsexto]
GO
GRANT UPDATE ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\apcsexto]
GO
GRANT DELETE ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\apkroth]
GO
GRANT INSERT ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\apkroth]
GO
GRANT SELECT ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\apkroth]
GO
GRANT UPDATE ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\apkroth]
GO
GRANT DELETE ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\aprlong]
GO
GRANT INSERT ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\aprlong]
GO
GRANT SELECT ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\aprlong]
GO
GRANT UPDATE ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\aprlong]
GO
GRANT DELETE ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\apwconne]
GO
GRANT INSERT ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\apwconne]
GO
GRANT SELECT ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\apwconne]
GO
GRANT UPDATE ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\apwconne]
GO
GRANT DELETE ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\apyoulha]
GO
GRANT INSERT ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\apyoulha]
GO
GRANT SELECT ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\apyoulha]
GO
GRANT UPDATE ON  [dbo].[hose_BOM_ONeil] TO [GLOBAL\apyoulha]
GO
