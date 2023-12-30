CREATE TABLE [dbo].[chain_Bulk]
(
[PN] [nchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HPN] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YPN] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Additional_Cross] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Type] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Standard] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Chart_Num] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Pitch_Inches] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lacing] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Spacer_Plate] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Punch] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Holder] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Additional_Info] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[chain_Bulk] ADD CONSTRAINT [PK_chain_Bulk_2] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[chain_Bulk] TO [GLOBAL\apchause]
GO
GRANT INSERT ON  [dbo].[chain_Bulk] TO [GLOBAL\apchause]
GO
GRANT SELECT ON  [dbo].[chain_Bulk] TO [GLOBAL\apchause]
GO
GRANT UPDATE ON  [dbo].[chain_Bulk] TO [GLOBAL\apchause]
GO
GRANT DELETE ON  [dbo].[chain_Bulk] TO [GLOBAL\apcsexto]
GO
GRANT INSERT ON  [dbo].[chain_Bulk] TO [GLOBAL\apcsexto]
GO
GRANT SELECT ON  [dbo].[chain_Bulk] TO [GLOBAL\apcsexto]
GO
GRANT UPDATE ON  [dbo].[chain_Bulk] TO [GLOBAL\apcsexto]
GO
GRANT DELETE ON  [dbo].[chain_Bulk] TO [GLOBAL\apkroth]
GO
GRANT INSERT ON  [dbo].[chain_Bulk] TO [GLOBAL\apkroth]
GO
GRANT SELECT ON  [dbo].[chain_Bulk] TO [GLOBAL\apkroth]
GO
GRANT UPDATE ON  [dbo].[chain_Bulk] TO [GLOBAL\apkroth]
GO
GRANT DELETE ON  [dbo].[chain_Bulk] TO [GLOBAL\aprlong]
GO
GRANT INSERT ON  [dbo].[chain_Bulk] TO [GLOBAL\aprlong]
GO
GRANT SELECT ON  [dbo].[chain_Bulk] TO [GLOBAL\aprlong]
GO
GRANT UPDATE ON  [dbo].[chain_Bulk] TO [GLOBAL\aprlong]
GO
GRANT DELETE ON  [dbo].[chain_Bulk] TO [GLOBAL\aprnewel]
GO
GRANT INSERT ON  [dbo].[chain_Bulk] TO [GLOBAL\aprnewel]
GO
GRANT SELECT ON  [dbo].[chain_Bulk] TO [GLOBAL\aprnewel]
GO
GRANT UPDATE ON  [dbo].[chain_Bulk] TO [GLOBAL\aprnewel]
GO
GRANT DELETE ON  [dbo].[chain_Bulk] TO [GLOBAL\apwconne]
GO
GRANT INSERT ON  [dbo].[chain_Bulk] TO [GLOBAL\apwconne]
GO
GRANT SELECT ON  [dbo].[chain_Bulk] TO [GLOBAL\apwconne]
GO
GRANT UPDATE ON  [dbo].[chain_Bulk] TO [GLOBAL\apwconne]
GO
GRANT DELETE ON  [dbo].[chain_Bulk] TO [GLOBAL\apyoulha]
GO
GRANT INSERT ON  [dbo].[chain_Bulk] TO [GLOBAL\apyoulha]
GO
GRANT SELECT ON  [dbo].[chain_Bulk] TO [GLOBAL\apyoulha]
GO
GRANT UPDATE ON  [dbo].[chain_Bulk] TO [GLOBAL\apyoulha]
GO
