CREATE TABLE [dbo].[hose_BOM]
(
[Origin_Date] [date] NULL,
[Maint_Date] [date] NULL,
[Initials] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Type] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PN] [nvarchar] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HPN] [nvarchar] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YPN] [nvarchar] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Assy_Length_IN] [decimal] (7, 2) NULL,
[Bulk_PN] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Left_Ftg_PN] [nvarchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Left_Ftg_Qty] [int] NULL,
[Right_Ftg_PN] [nvarchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Right_Ftg_Qty] [int] NULL,
[Guard_PN] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Guard_Qty] [int] NULL,
[Tot_Guard_CutTo_Inches] [float] NULL,
[Guard_Cut_Comments] [nvarchar] (26) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Guard_Placement_Inches] [nvarchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Print/Chart] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Print/Chart_Req_Yes/No] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Split_Info] [nvarchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Other_Req] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Restrictions] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Eng_Notes] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Date/Time_Stamp] [datetime] NULL,
[Field1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Field2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Field3] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Field4] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Field5] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Field6] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Field7] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Field8] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Field9] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Field10] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Field11] [float] NULL,
[Field12] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[hose_BOM] ADD CONSTRAINT [PK_hose_BOMs_1] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[hose_BOM] TO [GLOBAL\apchause]
GO
GRANT INSERT ON  [dbo].[hose_BOM] TO [GLOBAL\apchause]
GO
GRANT SELECT ON  [dbo].[hose_BOM] TO [GLOBAL\apchause]
GO
GRANT UPDATE ON  [dbo].[hose_BOM] TO [GLOBAL\apchause]
GO
GRANT DELETE ON  [dbo].[hose_BOM] TO [GLOBAL\apcsexto]
GO
GRANT INSERT ON  [dbo].[hose_BOM] TO [GLOBAL\apcsexto]
GO
GRANT SELECT ON  [dbo].[hose_BOM] TO [GLOBAL\apcsexto]
GO
GRANT UPDATE ON  [dbo].[hose_BOM] TO [GLOBAL\apcsexto]
GO
GRANT DELETE ON  [dbo].[hose_BOM] TO [GLOBAL\apjkelly]
GO
GRANT INSERT ON  [dbo].[hose_BOM] TO [GLOBAL\apjkelly]
GO
GRANT SELECT ON  [dbo].[hose_BOM] TO [GLOBAL\apjkelly]
GO
GRANT UPDATE ON  [dbo].[hose_BOM] TO [GLOBAL\apjkelly]
GO
GRANT DELETE ON  [dbo].[hose_BOM] TO [GLOBAL\apkroth]
GO
GRANT INSERT ON  [dbo].[hose_BOM] TO [GLOBAL\apkroth]
GO
GRANT SELECT ON  [dbo].[hose_BOM] TO [GLOBAL\apkroth]
GO
GRANT UPDATE ON  [dbo].[hose_BOM] TO [GLOBAL\apkroth]
GO
GRANT DELETE ON  [dbo].[hose_BOM] TO [GLOBAL\aprlong]
GO
GRANT INSERT ON  [dbo].[hose_BOM] TO [GLOBAL\aprlong]
GO
GRANT SELECT ON  [dbo].[hose_BOM] TO [GLOBAL\aprlong]
GO
GRANT UPDATE ON  [dbo].[hose_BOM] TO [GLOBAL\aprlong]
GO
GRANT DELETE ON  [dbo].[hose_BOM] TO [GLOBAL\aprnewel]
GO
GRANT INSERT ON  [dbo].[hose_BOM] TO [GLOBAL\aprnewel]
GO
GRANT SELECT ON  [dbo].[hose_BOM] TO [GLOBAL\aprnewel]
GO
GRANT UPDATE ON  [dbo].[hose_BOM] TO [GLOBAL\aprnewel]
GO
GRANT DELETE ON  [dbo].[hose_BOM] TO [GLOBAL\apwconne]
GO
GRANT INSERT ON  [dbo].[hose_BOM] TO [GLOBAL\apwconne]
GO
GRANT SELECT ON  [dbo].[hose_BOM] TO [GLOBAL\apwconne]
GO
GRANT UPDATE ON  [dbo].[hose_BOM] TO [GLOBAL\apwconne]
GO
GRANT DELETE ON  [dbo].[hose_BOM] TO [GLOBAL\apyoulha]
GO
GRANT REFERENCES ON  [dbo].[hose_BOM] TO [GLOBAL\apyoulha]
GO
GRANT SELECT ON  [dbo].[hose_BOM] TO [GLOBAL\apyoulha]
GO
GRANT UPDATE ON  [dbo].[hose_BOM] TO [GLOBAL\apyoulha]
GO
