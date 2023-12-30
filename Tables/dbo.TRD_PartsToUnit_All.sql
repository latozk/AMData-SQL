CREATE TABLE [dbo].[TRD_PartsToUnit_All]
(
[PartNumber] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HysterPartNumber] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YalePartNumber] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UnitCode] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TRD_PartsToUnit_All] ADD CONSTRAINT [PK_TRD_PartsToUnit_All] PRIMARY KEY CLUSTERED ([PartNumber], [UnitCode]) ON [PRIMARY]
GO
