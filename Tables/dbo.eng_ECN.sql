CREATE TABLE [dbo].[eng_ECN]
(
[ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Init_Date] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Model_1] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Model_2] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Urgent] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Serv_Prob_Ref] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Cst_Red] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Eff_SN] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Serv_Prob] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EEC_Affected] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UL_FM_Affected] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Origin] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[T_PN_Proj] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IC] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EL] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Drive_Line] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Mast_Attch] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SN_Rqd_Unit] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SN_Rqd_Engine] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SN_Rqd_Xmsn] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SN_Rqd_Mast] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SN_Rqd_Attch] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SN_Rqd_None] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Sales_Lit_Affected] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PFI_SFI_Affected] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Tech_Pubs_Affected] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Dwgs_Affected] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Impl_Reporting] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comp_Common] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[New_Rel] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Status] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Spl_Proc_None] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Released] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Attch] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Serv_Part_Affected] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Desc_1] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Desc_2] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VIP_Cat] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DSN_Appr_ID] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RVW_Appr_ID] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MFG_Appr_ID] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ADM_Appr_ID] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DSN_Appr_Date] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RVW_Appr_Date] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MFG_Appr_Date] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ADM_Appr_Date] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Cat] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cat_Desc] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[User_ID] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Proj_Prefix] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Proj] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Init_Dt] [date] NULL,
[DSN_Appr_Dt] [date] NULL,
[RVW_Appr_Dt] [date] NULL,
[MFG_Appr_Dt] [date] NULL,
[ADM_Appr_Dt] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[eng_ECN] ADD CONSTRAINT [PK_eng_ECN] PRIMARY KEY CLUSTERED ([ECN]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ADM_dt ECN] ON [dbo].[eng_ECN] ([ADM_Appr_Dt], [ECN]) ON [PRIMARY]
GO
