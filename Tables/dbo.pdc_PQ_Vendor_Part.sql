CREATE TABLE [dbo].[pdc_PQ_Vendor_Part]
(
[Vend_Ref_Desc] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Setup_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Setup_ID] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Maint_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Maint_ID] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Revision] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PQ_LT] [float] NULL,
[Vend_Pkg] [float] NULL,
[Unit_Meas] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Prime_Tag] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last_PO_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RFEA_No] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RFEA_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Review_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Contract_Qty] [float] NULL,
[Contract_Ord_Qty] [float] NULL,
[Contract_Ord_Cnt] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Prc_Cnt] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Contract_No] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Plt_Code] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vend_Code] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vend_Ref_No] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Contract_Type] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Contract_Eff_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Contract_Exp_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
