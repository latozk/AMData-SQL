CREATE TABLE [dbo].[pdc_NP_Vendor_Part_Number]
(
[Vendor_Name] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vendor_Override] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vend_Abbreviation] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Action_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Part_Number] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ECN_Number] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Project_Number] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vendor_Part_Number] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vendor_Code] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Buyer_Code] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Price] [float] NULL,
[Currency_Code] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vendor_Lead_Time] [int] NULL,
[Minimum_Quantity] [int] NULL,
[Minimum_Dollars] [float] NULL,
[Prime_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Discount] [int] NULL,
[Status] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NPR_Mstr_Rel_Date] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[No_Process_Date] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[No_Process_ID] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Create_Date] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Creation_ID] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Maintenance_Date] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Maintenance_ID] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[No_Process_Message] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Maintenance_Program] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vend_Date] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20210517-201200] ON [dbo].[pdc_NP_Vendor_Part_Number] ([Part_Number], [Vend_Date], [Currency_Code]) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [ClusteredIndex-20210517-201030] ON [dbo].[pdc_NP_Vendor_Part_Number] ([Vendor_Code], [Part_Number]) ON [PRIMARY]
GO
