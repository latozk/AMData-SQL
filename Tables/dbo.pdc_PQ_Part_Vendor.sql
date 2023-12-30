CREATE TABLE [dbo].[pdc_PQ_Part_Vendor]
(
[Plt_Code] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vend_Code] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Part_No] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vend_Ref_No] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Brand] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [ClusteredIndex-20230612-203223] ON [dbo].[pdc_PQ_Part_Vendor] ([Part_No], [Vend_Code]) ON [PRIMARY]
GO
