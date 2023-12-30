CREATE TABLE [dbo].[cable_Comp]
(
[PN] [nchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HPN] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YPN] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Desc] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Type] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Gauge] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Gland_PN] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Chart_Num] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Additional_Info] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[F1] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[F2] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[F3] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cable_Comp] ADD CONSTRAINT [PK_chain_Components] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
GRANT ALTER ON  [dbo].[cable_Comp] TO [GLOBAL\apcsexto]
GO
GRANT DELETE ON  [dbo].[cable_Comp] TO [GLOBAL\apcsexto]
GO
GRANT INSERT ON  [dbo].[cable_Comp] TO [GLOBAL\apcsexto]
GO
GRANT SELECT ON  [dbo].[cable_Comp] TO [GLOBAL\apcsexto]
GO
GRANT UPDATE ON  [dbo].[cable_Comp] TO [GLOBAL\apcsexto]
GO
GRANT DELETE ON  [dbo].[cable_Comp] TO [GLOBAL\apdteagu]
GO
GRANT INSERT ON  [dbo].[cable_Comp] TO [GLOBAL\apdteagu]
GO
GRANT SELECT ON  [dbo].[cable_Comp] TO [GLOBAL\apdteagu]
GO
GRANT UPDATE ON  [dbo].[cable_Comp] TO [GLOBAL\apdteagu]
GO
GRANT DELETE ON  [dbo].[cable_Comp] TO [GLOBAL\apjkelly]
GO
GRANT INSERT ON  [dbo].[cable_Comp] TO [GLOBAL\apjkelly]
GO
GRANT SELECT ON  [dbo].[cable_Comp] TO [GLOBAL\apjkelly]
GO
GRANT UPDATE ON  [dbo].[cable_Comp] TO [GLOBAL\apjkelly]
GO
GRANT DELETE ON  [dbo].[cable_Comp] TO [GLOBAL\aprlong]
GO
GRANT INSERT ON  [dbo].[cable_Comp] TO [GLOBAL\aprlong]
GO
GRANT SELECT ON  [dbo].[cable_Comp] TO [GLOBAL\aprlong]
GO
GRANT UPDATE ON  [dbo].[cable_Comp] TO [GLOBAL\aprlong]
GO
GRANT DELETE ON  [dbo].[cable_Comp] TO [GLOBAL\apwconne]
GO
GRANT INSERT ON  [dbo].[cable_Comp] TO [GLOBAL\apwconne]
GO
GRANT SELECT ON  [dbo].[cable_Comp] TO [GLOBAL\apwconne]
GO
GRANT UPDATE ON  [dbo].[cable_Comp] TO [GLOBAL\apwconne]
GO
GRANT DELETE ON  [dbo].[cable_Comp] TO [GLOBAL\apyoulha]
GO
GRANT INSERT ON  [dbo].[cable_Comp] TO [GLOBAL\apyoulha]
GO
GRANT SELECT ON  [dbo].[cable_Comp] TO [GLOBAL\apyoulha]
GO
GRANT UPDATE ON  [dbo].[cable_Comp] TO [GLOBAL\apyoulha]
GO
