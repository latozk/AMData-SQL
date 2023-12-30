CREATE TABLE [dbo].[ref_PDC_DC_Test]
(
[PN] [nchar] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HostPartID] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HostLocID] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SKUCust17] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ref_PDC_DC_Test] ADD CONSTRAINT [PK_ref_PDC_Demand_Class_1] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
