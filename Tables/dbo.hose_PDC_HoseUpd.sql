CREATE TABLE [dbo].[hose_PDC_HoseUpd]
(
[Brand] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Alt_Build] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rev_Date] [nvarchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Assy_Length_Inches] [decimal] (7, 2) NULL,
[Comm1] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comm2] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comm3] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comm4] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comm5] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comm6] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comm7] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comm8] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp1] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp1_Comm] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp1_Qty] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp1_CutTo] [float] NULL,
[Comp2] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp2_Comm] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp2_Qty] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp3] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp3_Comm] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp3_Qty] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp4] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp4_Comm] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp4_Qty] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp4_CutTo] [float] NULL,
[Comp5] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp5_Comm] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp5_Qty] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp6] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp6_Comm] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp6_Qty] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp7] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp7_Comm] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp7_Qty] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp8] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp8_Comm] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp8_Qty] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[hose_PDC_HoseUpd] ADD CONSTRAINT [PK_hose_PDC_HoseUpd] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apchause]
GO
GRANT INSERT ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apchause]
GO
GRANT SELECT ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apchause]
GO
GRANT UPDATE ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apchause]
GO
GRANT DELETE ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apcsexto]
GO
GRANT INSERT ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apcsexto]
GO
GRANT SELECT ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apcsexto]
GO
GRANT UPDATE ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apcsexto]
GO
GRANT DELETE ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apjkelly]
GO
GRANT INSERT ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apjkelly]
GO
GRANT SELECT ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apjkelly]
GO
GRANT UPDATE ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apjkelly]
GO
GRANT DELETE ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apkroth]
GO
GRANT INSERT ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apkroth]
GO
GRANT SELECT ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apkroth]
GO
GRANT UPDATE ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apkroth]
GO
GRANT DELETE ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\aprlong]
GO
GRANT INSERT ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\aprlong]
GO
GRANT SELECT ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\aprlong]
GO
GRANT UPDATE ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\aprlong]
GO
GRANT DELETE ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\aprnewel]
GO
GRANT INSERT ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\aprnewel]
GO
GRANT SELECT ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\aprnewel]
GO
GRANT UPDATE ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\aprnewel]
GO
GRANT DELETE ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apwconne]
GO
GRANT INSERT ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apwconne]
GO
GRANT SELECT ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apwconne]
GO
GRANT UPDATE ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apwconne]
GO
GRANT DELETE ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apyoulha]
GO
GRANT INSERT ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apyoulha]
GO
GRANT SELECT ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apyoulha]
GO
GRANT UPDATE ON  [dbo].[hose_PDC_HoseUpd] TO [GLOBAL\apyoulha]
GO
