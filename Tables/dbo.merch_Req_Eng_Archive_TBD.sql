CREATE TABLE [dbo].[merch_Req_Eng_Archive_TBD]
(
[Record_Number] [int] NOT NULL IDENTITY(1, 1),
[Date] [datetime2] NULL,
[Requested_By] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vendor] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vendor_Code] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vendor_PN] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Non_Returnable] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Commodity_Code] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DS_Code] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Product_Type] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lead_Time] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CNVPN] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PQ_Cost] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Dlr_Net] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Hyster_CL] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Yale_CL] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Core_Charge] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[New_SPN_Eq] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[New_Hyster_Eq] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[New_Yale_Eq] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[New_Utilev_Eq] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[New_Nuvera_Eq] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reman] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Initials] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rev] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SPN] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HPN] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YPN] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Hyster_PN] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Yale_PN] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Utilev_PN] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Nuvera_PN] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[merch_Req_Eng_Archive_TBD] ADD CONSTRAINT [PK_merch_Req_Eng_Archive] PRIMARY KEY CLUSTERED ([Record_Number]) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[merch_Req_Eng_Archive_TBD] TO [GLOBAL\AP Parts Readiness]
GO
GRANT DELETE ON  [dbo].[merch_Req_Eng_Archive_TBD] TO [GLOBAL\PDC_AMData_AMDC]
GO
GRANT INSERT ON  [dbo].[merch_Req_Eng_Archive_TBD] TO [GLOBAL\PDC_AMData_AMDC]
GO
GRANT SELECT ON  [dbo].[merch_Req_Eng_Archive_TBD] TO [GLOBAL\PDC_AMData_AMDC]
GO
GRANT UPDATE ON  [dbo].[merch_Req_Eng_Archive_TBD] TO [GLOBAL\PDC_AMData_AMDC]
GO
GRANT SELECT ON  [dbo].[merch_Req_Eng_Archive_TBD] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
