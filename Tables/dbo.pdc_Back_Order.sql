CREATE TABLE [dbo].[pdc_Back_Order]
(
[Bo_Type] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sales_Order_No] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Ship_To_Dlr] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Bo_Qty] [int] NULL,
[Committed_Qty] [int] NULL,
[Avail_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Price_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Billed_Price] [numeric] (19, 2) NULL,
[Priority_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Priority_Type] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cancel_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Commit_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Ship_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Allocate_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Ship_Complete_Flag] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Part_No] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Order_Code_Type] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Dealer_PO] [varchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PO_Number] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Supplier_Code] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Supplier_Invoice] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[XREF_Part_No] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [ClusteredIndex-20210226-145935] ON [dbo].[pdc_Back_Order] ([Part_No]) ON [PRIMARY]
GO
