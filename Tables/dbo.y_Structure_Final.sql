CREATE TABLE [dbo].[y_Structure_Final]
(
[Component_PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Num_PN] [decimal] (18, 0) NULL,
[Seq] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Trans] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ECN_Add_Dt] [date] NULL,
[ECN_Rem_Dt] [date] NULL,
[Input_PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_Dt] [date] NULL,
[PN_Brand] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PNAS400Fmt] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[xpn_Brand] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[XPNas400Fmt] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vendor_Abbreviation] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vendor_PN] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Hyster_PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Yale_PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Set_SOH] [float] NULL,
[Set_PreRcpt] [float] NULL,
[Set_OO] [float] NULL,
[RSTag] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Standard_Cost] [float] NULL
) ON [PRIMARY]
GO
