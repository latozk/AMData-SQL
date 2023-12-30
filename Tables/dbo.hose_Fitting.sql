CREATE TABLE [dbo].[hose_Fitting]
(
[PN] [nvarchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HPN] [nvarchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[YPN] [nvarchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Vendor] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VPN] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Series] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VPN_Pusher] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Desc] [nvarchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Thread/Flange] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Hose_ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Hose_Type] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COA] [decimal] (18, 4) NULL,
[Base_PN] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Perm/Reuse] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Ref] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Initials] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Date] [date] NULL,
[Date/Time_Stamp] [datetime] NULL,
[Opt_Vendor_PN] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Ferrule_PN] [nvarchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Ferrule_HPN] [nvarchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Ferrule_YPN] [nvarchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comment] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[hose_Fitting] ADD CONSTRAINT [PK_hose_Bulk_Fittings_1] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[hose_Fitting] TO [GLOBAL\apchause]
GO
GRANT INSERT ON  [dbo].[hose_Fitting] TO [GLOBAL\apchause]
GO
GRANT SELECT ON  [dbo].[hose_Fitting] TO [GLOBAL\apchause]
GO
GRANT UPDATE ON  [dbo].[hose_Fitting] TO [GLOBAL\apchause]
GO
GRANT DELETE ON  [dbo].[hose_Fitting] TO [GLOBAL\apcsexto]
GO
GRANT INSERT ON  [dbo].[hose_Fitting] TO [GLOBAL\apcsexto]
GO
GRANT SELECT ON  [dbo].[hose_Fitting] TO [GLOBAL\apcsexto]
GO
GRANT UPDATE ON  [dbo].[hose_Fitting] TO [GLOBAL\apcsexto]
GO
GRANT DELETE ON  [dbo].[hose_Fitting] TO [GLOBAL\apjkelly]
GO
GRANT INSERT ON  [dbo].[hose_Fitting] TO [GLOBAL\apjkelly]
GO
GRANT SELECT ON  [dbo].[hose_Fitting] TO [GLOBAL\apjkelly]
GO
GRANT UPDATE ON  [dbo].[hose_Fitting] TO [GLOBAL\apjkelly]
GO
GRANT DELETE ON  [dbo].[hose_Fitting] TO [GLOBAL\apkroth]
GO
GRANT INSERT ON  [dbo].[hose_Fitting] TO [GLOBAL\apkroth]
GO
GRANT SELECT ON  [dbo].[hose_Fitting] TO [GLOBAL\apkroth]
GO
GRANT UPDATE ON  [dbo].[hose_Fitting] TO [GLOBAL\apkroth]
GO
GRANT DELETE ON  [dbo].[hose_Fitting] TO [GLOBAL\aprlong]
GO
GRANT INSERT ON  [dbo].[hose_Fitting] TO [GLOBAL\aprlong]
GO
GRANT SELECT ON  [dbo].[hose_Fitting] TO [GLOBAL\aprlong]
GO
GRANT UPDATE ON  [dbo].[hose_Fitting] TO [GLOBAL\aprlong]
GO
GRANT DELETE ON  [dbo].[hose_Fitting] TO [GLOBAL\aprnewel]
GO
GRANT INSERT ON  [dbo].[hose_Fitting] TO [GLOBAL\aprnewel]
GO
GRANT SELECT ON  [dbo].[hose_Fitting] TO [GLOBAL\aprnewel]
GO
GRANT UPDATE ON  [dbo].[hose_Fitting] TO [GLOBAL\aprnewel]
GO
GRANT DELETE ON  [dbo].[hose_Fitting] TO [GLOBAL\apwconne]
GO
GRANT INSERT ON  [dbo].[hose_Fitting] TO [GLOBAL\apwconne]
GO
GRANT SELECT ON  [dbo].[hose_Fitting] TO [GLOBAL\apwconne]
GO
GRANT UPDATE ON  [dbo].[hose_Fitting] TO [GLOBAL\apwconne]
GO
GRANT DELETE ON  [dbo].[hose_Fitting] TO [GLOBAL\apyoulha]
GO
GRANT INSERT ON  [dbo].[hose_Fitting] TO [GLOBAL\apyoulha]
GO
GRANT SELECT ON  [dbo].[hose_Fitting] TO [GLOBAL\apyoulha]
GO
GRANT UPDATE ON  [dbo].[hose_Fitting] TO [GLOBAL\apyoulha]
GO
