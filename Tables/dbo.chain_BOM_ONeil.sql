CREATE TABLE [dbo].[chain_BOM_ONeil]
(
[OEM] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PART #] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BULK #] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CUT TO - # IN] [nvarchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[# OF LINKS] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STANDARD] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ASSEMBLY COMMENTS] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHAIN TYPE] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PIN LINK #] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QTY - PIN LINK] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OUTER LINK #] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OTY - OUTER LINK] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ANCHOR A #] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QTY - ANCHOR A] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ANCHOR B #] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QTY - ANCHOR B] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[chain_BOM_ONeil] ADD CONSTRAINT [PK_chain_BOM_ONeil] PRIMARY KEY CLUSTERED ([PART #]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\apchause]
GO
GRANT INSERT ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\apchause]
GO
GRANT SELECT ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\apchause]
GO
GRANT UPDATE ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\apchause]
GO
GRANT DELETE ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\apcsexto]
GO
GRANT INSERT ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\apcsexto]
GO
GRANT SELECT ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\apcsexto]
GO
GRANT UPDATE ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\apcsexto]
GO
GRANT DELETE ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\apkroth]
GO
GRANT INSERT ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\apkroth]
GO
GRANT SELECT ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\apkroth]
GO
GRANT UPDATE ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\apkroth]
GO
GRANT DELETE ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\aprlong]
GO
GRANT INSERT ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\aprlong]
GO
GRANT SELECT ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\aprlong]
GO
GRANT UPDATE ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\aprlong]
GO
GRANT DELETE ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\apwconne]
GO
GRANT INSERT ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\apwconne]
GO
GRANT SELECT ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\apwconne]
GO
GRANT UPDATE ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\apwconne]
GO
GRANT DELETE ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\apyoulha]
GO
GRANT INSERT ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\apyoulha]
GO
GRANT SELECT ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\apyoulha]
GO
GRANT UPDATE ON  [dbo].[chain_BOM_ONeil] TO [GLOBAL\apyoulha]
GO
