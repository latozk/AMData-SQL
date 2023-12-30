CREATE TABLE [dbo].[hose_Die]
(
[PN] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HPN] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YPN] [nvarchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vendor] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VPN] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Xld_Uni_PN] [nvarchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[hose_Die] ADD CONSTRAINT [PK_hose_Die] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[hose_Die] TO [GLOBAL\apchause]
GO
GRANT INSERT ON  [dbo].[hose_Die] TO [GLOBAL\apchause]
GO
GRANT SELECT ON  [dbo].[hose_Die] TO [GLOBAL\apchause]
GO
GRANT UPDATE ON  [dbo].[hose_Die] TO [GLOBAL\apchause]
GO
GRANT DELETE ON  [dbo].[hose_Die] TO [GLOBAL\apcsexto]
GO
GRANT INSERT ON  [dbo].[hose_Die] TO [GLOBAL\apcsexto]
GO
GRANT SELECT ON  [dbo].[hose_Die] TO [GLOBAL\apcsexto]
GO
GRANT UPDATE ON  [dbo].[hose_Die] TO [GLOBAL\apcsexto]
GO
GRANT DELETE ON  [dbo].[hose_Die] TO [GLOBAL\apjkelly]
GO
GRANT INSERT ON  [dbo].[hose_Die] TO [GLOBAL\apjkelly]
GO
GRANT SELECT ON  [dbo].[hose_Die] TO [GLOBAL\apjkelly]
GO
GRANT UPDATE ON  [dbo].[hose_Die] TO [GLOBAL\apjkelly]
GO
GRANT DELETE ON  [dbo].[hose_Die] TO [GLOBAL\apkroth]
GO
GRANT INSERT ON  [dbo].[hose_Die] TO [GLOBAL\apkroth]
GO
GRANT SELECT ON  [dbo].[hose_Die] TO [GLOBAL\apkroth]
GO
GRANT UPDATE ON  [dbo].[hose_Die] TO [GLOBAL\apkroth]
GO
GRANT DELETE ON  [dbo].[hose_Die] TO [GLOBAL\aprlong]
GO
GRANT INSERT ON  [dbo].[hose_Die] TO [GLOBAL\aprlong]
GO
GRANT SELECT ON  [dbo].[hose_Die] TO [GLOBAL\aprlong]
GO
GRANT UPDATE ON  [dbo].[hose_Die] TO [GLOBAL\aprlong]
GO
GRANT DELETE ON  [dbo].[hose_Die] TO [GLOBAL\aprnewel]
GO
GRANT INSERT ON  [dbo].[hose_Die] TO [GLOBAL\aprnewel]
GO
GRANT SELECT ON  [dbo].[hose_Die] TO [GLOBAL\aprnewel]
GO
GRANT UPDATE ON  [dbo].[hose_Die] TO [GLOBAL\aprnewel]
GO
GRANT DELETE ON  [dbo].[hose_Die] TO [GLOBAL\apwconne]
GO
GRANT INSERT ON  [dbo].[hose_Die] TO [GLOBAL\apwconne]
GO
GRANT SELECT ON  [dbo].[hose_Die] TO [GLOBAL\apwconne]
GO
GRANT UPDATE ON  [dbo].[hose_Die] TO [GLOBAL\apwconne]
GO
GRANT DELETE ON  [dbo].[hose_Die] TO [GLOBAL\apyoulha]
GO
GRANT INSERT ON  [dbo].[hose_Die] TO [GLOBAL\apyoulha]
GO
GRANT SELECT ON  [dbo].[hose_Die] TO [GLOBAL\apyoulha]
GO
GRANT UPDATE ON  [dbo].[hose_Die] TO [GLOBAL\apyoulha]
GO
