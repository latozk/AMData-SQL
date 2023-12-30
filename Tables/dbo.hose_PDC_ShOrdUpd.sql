CREATE TABLE [dbo].[hose_PDC_ShOrdUpd]
(
[PN] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Type] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[hose_PDC_ShOrdUpd] ADD CONSTRAINT [PK_hose_PDC_ShOrdUpd] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apchause]
GO
GRANT INSERT ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apchause]
GO
GRANT SELECT ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apchause]
GO
GRANT UPDATE ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apchause]
GO
GRANT DELETE ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apcsexto]
GO
GRANT INSERT ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apcsexto]
GO
GRANT SELECT ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apcsexto]
GO
GRANT UPDATE ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apcsexto]
GO
GRANT DELETE ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apjkelly]
GO
GRANT INSERT ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apjkelly]
GO
GRANT SELECT ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apjkelly]
GO
GRANT UPDATE ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apjkelly]
GO
GRANT DELETE ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apkroth]
GO
GRANT INSERT ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apkroth]
GO
GRANT SELECT ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apkroth]
GO
GRANT UPDATE ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apkroth]
GO
GRANT DELETE ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\aprlong]
GO
GRANT INSERT ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\aprlong]
GO
GRANT SELECT ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\aprlong]
GO
GRANT UPDATE ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\aprlong]
GO
GRANT DELETE ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\aprnewel]
GO
GRANT INSERT ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\aprnewel]
GO
GRANT SELECT ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\aprnewel]
GO
GRANT UPDATE ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\aprnewel]
GO
GRANT DELETE ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apwconne]
GO
GRANT INSERT ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apwconne]
GO
GRANT SELECT ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apwconne]
GO
GRANT UPDATE ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apwconne]
GO
GRANT DELETE ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apyoulha]
GO
GRANT INSERT ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apyoulha]
GO
GRANT SELECT ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apyoulha]
GO
GRANT UPDATE ON  [dbo].[hose_PDC_ShOrdUpd] TO [GLOBAL\apyoulha]
GO
