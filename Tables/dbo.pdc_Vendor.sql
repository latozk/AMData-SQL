CREATE TABLE [dbo].[pdc_Vendor]
(
[Vend_Code] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Vend_Name] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Addr1] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Addr2] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Addr3] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Tax_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Site_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FOB] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Zip_Code] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Buyer_Code] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last_Acc_Date] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Ship_to_Vend] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vend_Min] [int] NULL,
[Terms_Code] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Pay_to_Vend] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Pkg_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Overseas_Tag] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone_No] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MMS_Tag] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DS_Tag] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Curr_Code] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Max_Prc_Chg] [float] NULL,
[Transit_Days] [float] NULL,
[Exp_Transit_Days] [float] NULL,
[High_Vol_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Corp_Vend] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IA_Code] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PO_Trans_Type] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PO_Forms_Type] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PO_Nbr_Lines] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[In_Active_Date] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Payable] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Minority_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PO_Print] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[pdc_Vendor] ADD CONSTRAINT [PK_pdc_Vendor] PRIMARY KEY CLUSTERED ([Vend_Code]) ON [PRIMARY]
GO
