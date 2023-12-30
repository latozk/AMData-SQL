CREATE TABLE [dbo].[merch_Req_Eng_Queue]
(
[Recordnumber] [int] NOT NULL IDENTITY(1, 1),
[Date] [datetime] NULL CONSTRAINT [DF_merch_Req_Eng_Queue_Date] DEFAULT (getdate()),
[Requestedby] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vendor] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vendorcode] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VendorPN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NonReturnable] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Commoditycode] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DScode] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Product_Type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Leadtime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CNVPN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PQcost] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DlrNet] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HysterCL] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YaleCL] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CoreCharge] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NewHysterEq] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NewYaleEq] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NewUtilevEq] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NewNuveraEq] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reman] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Initials] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rev#] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HPN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YPN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Hyster_PN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Yale_PN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Utilev_PN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Nuvera_PN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[merch_Req_Eng_Queue] ADD CONSTRAINT [PK_merch_Req_Eng_Queue] PRIMARY KEY CLUSTERED ([Recordnumber]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[merch_Req_Eng_Queue] TO [GLOBAL\PDC_AMData_AMDC]
GO
GRANT INSERT ON  [dbo].[merch_Req_Eng_Queue] TO [GLOBAL\PDC_AMData_AMDC]
GO
GRANT SELECT ON  [dbo].[merch_Req_Eng_Queue] TO [GLOBAL\PDC_AMData_AMDC]
GO
GRANT UPDATE ON  [dbo].[merch_Req_Eng_Queue] TO [GLOBAL\PDC_AMData_AMDC]
GO
GRANT DELETE ON  [dbo].[merch_Req_Eng_Queue] TO [GLOBAL\PDC_AMData_Marketing]
GO
GRANT INSERT ON  [dbo].[merch_Req_Eng_Queue] TO [GLOBAL\PDC_AMData_Marketing]
GO
GRANT SELECT ON  [dbo].[merch_Req_Eng_Queue] TO [GLOBAL\PDC_AMData_Marketing]
GO
GRANT UPDATE ON  [dbo].[merch_Req_Eng_Queue] TO [GLOBAL\PDC_AMData_Marketing]
GO
