CREATE TABLE [dbo].[cable_BOM]
(
[PN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Bulk_PN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Terminal_PN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Rev] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Bulk_L1] [decimal] (7, 2) NULL,
[Bulk_L2] [decimal] (7, 2) NULL,
[Shield_L1] [decimal] (7, 2) NULL,
[Heat_Shrink_PN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Gland_PN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L4] [decimal] (7, 2) NULL,
[Terminal_Strip_L4] [decimal] (7, 2) NULL,
[Terminal_Angle] [decimal] (7, 2) NULL,
[Label1_PN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Label2_PN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Desc] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Initials] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rev_Date] [nvarchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cable_BOM] ADD CONSTRAINT [PK_cable_PDC_BOM] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[cable_BOM] TO [GLOBAL\apchause]
GO
GRANT INSERT ON  [dbo].[cable_BOM] TO [GLOBAL\apchause]
GO
GRANT SELECT ON  [dbo].[cable_BOM] TO [GLOBAL\apchause]
GO
GRANT UPDATE ON  [dbo].[cable_BOM] TO [GLOBAL\apchause]
GO
GRANT ALTER ON  [dbo].[cable_BOM] TO [GLOBAL\apcsexto]
GO
GRANT DELETE ON  [dbo].[cable_BOM] TO [GLOBAL\apcsexto]
GO
GRANT INSERT ON  [dbo].[cable_BOM] TO [GLOBAL\apcsexto]
GO
GRANT SELECT ON  [dbo].[cable_BOM] TO [GLOBAL\apcsexto]
GO
GRANT UPDATE ON  [dbo].[cable_BOM] TO [GLOBAL\apcsexto]
GO
GRANT DELETE ON  [dbo].[cable_BOM] TO [GLOBAL\apdteagu]
GO
GRANT INSERT ON  [dbo].[cable_BOM] TO [GLOBAL\apdteagu]
GO
GRANT SELECT ON  [dbo].[cable_BOM] TO [GLOBAL\apdteagu]
GO
GRANT UPDATE ON  [dbo].[cable_BOM] TO [GLOBAL\apdteagu]
GO
GRANT DELETE ON  [dbo].[cable_BOM] TO [GLOBAL\apjkelly]
GO
GRANT INSERT ON  [dbo].[cable_BOM] TO [GLOBAL\apjkelly]
GO
GRANT SELECT ON  [dbo].[cable_BOM] TO [GLOBAL\apjkelly]
GO
GRANT UPDATE ON  [dbo].[cable_BOM] TO [GLOBAL\apjkelly]
GO
GRANT DELETE ON  [dbo].[cable_BOM] TO [GLOBAL\aprlong]
GO
GRANT INSERT ON  [dbo].[cable_BOM] TO [GLOBAL\aprlong]
GO
GRANT SELECT ON  [dbo].[cable_BOM] TO [GLOBAL\aprlong]
GO
GRANT UPDATE ON  [dbo].[cable_BOM] TO [GLOBAL\aprlong]
GO
GRANT DELETE ON  [dbo].[cable_BOM] TO [GLOBAL\apwconne]
GO
GRANT INSERT ON  [dbo].[cable_BOM] TO [GLOBAL\apwconne]
GO
GRANT SELECT ON  [dbo].[cable_BOM] TO [GLOBAL\apwconne]
GO
GRANT UPDATE ON  [dbo].[cable_BOM] TO [GLOBAL\apwconne]
GO
GRANT DELETE ON  [dbo].[cable_BOM] TO [GLOBAL\apyoulha]
GO
GRANT INSERT ON  [dbo].[cable_BOM] TO [GLOBAL\apyoulha]
GO
GRANT SELECT ON  [dbo].[cable_BOM] TO [GLOBAL\apyoulha]
GO
GRANT UPDATE ON  [dbo].[cable_BOM] TO [GLOBAL\apyoulha]
GO
