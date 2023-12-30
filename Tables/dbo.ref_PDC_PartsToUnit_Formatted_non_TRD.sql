CREATE TABLE [dbo].[ref_PDC_PartsToUnit_Formatted_non_TRD]
(
[PartNumber] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HysterPartNumber] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YalePartNumber] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UnitCode] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PN] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[H_PN] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Y_PN] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Add_Dt] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ref_PDC_PartsToUnit_Formatted_non_TRD] ADD CONSTRAINT [PK_ref_PDC_PartsToUnit_VNA_BT_PreTRD_1] PRIMARY KEY CLUSTERED ([PartNumber], [UnitCode]) ON [PRIMARY]
GO
