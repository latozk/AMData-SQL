CREATE TABLE [dbo].[ref_PDC_PartsToUnit_Formatted]
(
[PartNumber] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UnitCode] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Brand] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HysterPartNumber] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YalePartNumber] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PN] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[H_PN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Y_PN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IB_Series] [int] NULL,
[IB_Total] [int] NULL,
[Ratio] [decimal] (4, 3) NULL,
[LF] [float] NULL,
[LE] [float] NULL,
[LF_Total] [float] NULL,
[LE_Total] [float] NULL,
[LF_Series] [float] NULL,
[LE_Series] [float] NULL,
[Series_Fill] [float] NULL,
[MTD_LF] [float] NULL,
[MTD_LE] [float] NULL,
[MTD_LF_Total] [float] NULL,
[MTD_LE_Total] [float] NULL,
[MTD_LF_Series] [float] NULL,
[MTD_LE_Series] [float] NULL,
[MTD_Series_Fill] [float] NULL,
[12_Mo_LF] [float] NULL,
[12_Mo_LE] [float] NULL,
[12_Mo_LF_Total] [float] NULL,
[12_Mo_LE_Total] [float] NULL,
[12_Mo_LF_Series] [float] NULL,
[12_Mo_LE_Series] [float] NULL,
[12_Mo_Series_Fill] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ref_PDC_PartsToUnit_Formatted] ADD CONSTRAINT [PK_ref_PDC_PartsToUnit_Formatted_3] PRIMARY KEY CLUSTERED ([PartNumber], [UnitCode]) ON [PRIMARY]
GO
