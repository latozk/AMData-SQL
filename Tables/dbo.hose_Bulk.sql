CREATE TABLE [dbo].[hose_Bulk]
(
[PN] [nvarchar] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HPN] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[YPN] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Desc] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HCE] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Spec_No] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ID] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Vendor] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VPN] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Series] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Crimp_FTG_Series] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reuse_FTG_Series] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Die_Req] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VPN_Die] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Ring_Req] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VPN_Ring] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Initials] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Date] [datetime2] NULL,
[Stocked] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opt_Vendor] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[hose_Bulk] ADD CONSTRAINT [PK_hose_Bulk_Material_1] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[hose_Bulk] TO [GLOBAL\apchause]
GO
GRANT INSERT ON  [dbo].[hose_Bulk] TO [GLOBAL\apchause]
GO
GRANT SELECT ON  [dbo].[hose_Bulk] TO [GLOBAL\apchause]
GO
GRANT UPDATE ON  [dbo].[hose_Bulk] TO [GLOBAL\apchause]
GO
GRANT DELETE ON  [dbo].[hose_Bulk] TO [GLOBAL\apcsexto]
GO
GRANT INSERT ON  [dbo].[hose_Bulk] TO [GLOBAL\apcsexto]
GO
GRANT SELECT ON  [dbo].[hose_Bulk] TO [GLOBAL\apcsexto]
GO
GRANT UPDATE ON  [dbo].[hose_Bulk] TO [GLOBAL\apcsexto]
GO
GRANT DELETE ON  [dbo].[hose_Bulk] TO [GLOBAL\apjkelly]
GO
GRANT INSERT ON  [dbo].[hose_Bulk] TO [GLOBAL\apjkelly]
GO
GRANT SELECT ON  [dbo].[hose_Bulk] TO [GLOBAL\apjkelly]
GO
GRANT UPDATE ON  [dbo].[hose_Bulk] TO [GLOBAL\apjkelly]
GO
GRANT DELETE ON  [dbo].[hose_Bulk] TO [GLOBAL\apkroth]
GO
GRANT INSERT ON  [dbo].[hose_Bulk] TO [GLOBAL\apkroth]
GO
GRANT SELECT ON  [dbo].[hose_Bulk] TO [GLOBAL\apkroth]
GO
GRANT UPDATE ON  [dbo].[hose_Bulk] TO [GLOBAL\apkroth]
GO
GRANT DELETE ON  [dbo].[hose_Bulk] TO [GLOBAL\aprlong]
GO
GRANT INSERT ON  [dbo].[hose_Bulk] TO [GLOBAL\aprlong]
GO
GRANT SELECT ON  [dbo].[hose_Bulk] TO [GLOBAL\aprlong]
GO
GRANT UPDATE ON  [dbo].[hose_Bulk] TO [GLOBAL\aprlong]
GO
GRANT DELETE ON  [dbo].[hose_Bulk] TO [GLOBAL\aprnewel]
GO
GRANT INSERT ON  [dbo].[hose_Bulk] TO [GLOBAL\aprnewel]
GO
GRANT SELECT ON  [dbo].[hose_Bulk] TO [GLOBAL\aprnewel]
GO
GRANT UPDATE ON  [dbo].[hose_Bulk] TO [GLOBAL\aprnewel]
GO
GRANT DELETE ON  [dbo].[hose_Bulk] TO [GLOBAL\apwconne]
GO
GRANT INSERT ON  [dbo].[hose_Bulk] TO [GLOBAL\apwconne]
GO
GRANT SELECT ON  [dbo].[hose_Bulk] TO [GLOBAL\apwconne]
GO
GRANT UPDATE ON  [dbo].[hose_Bulk] TO [GLOBAL\apwconne]
GO
GRANT DELETE ON  [dbo].[hose_Bulk] TO [GLOBAL\apyoulha]
GO
GRANT INSERT ON  [dbo].[hose_Bulk] TO [GLOBAL\apyoulha]
GO
GRANT SELECT ON  [dbo].[hose_Bulk] TO [GLOBAL\apyoulha]
GO
GRANT UPDATE ON  [dbo].[hose_Bulk] TO [GLOBAL\apyoulha]
GO
