CREATE TABLE [dbo].[eng_VIP]
(
[VIP] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Loc_Entity_Abbr] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Type] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Priority] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[From_Dept] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Init_Date] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Pre] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Model_Cat] [varchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Loc_Act_Taken] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Loc_Act_Date] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Loc_Act_App_ID] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Loc_Act_App_Title] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Gvmnt_Apprv] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Gvmnt_Cont_No] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Gvmnt_Sales_App_ID] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Mfg_Action] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Mfg_ID] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Mfg_Date] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Eng_Action] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Eng_ID] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Eng_Date] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Loc_IE_Apprv] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Loc_QC_Apprv] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Loc_RE_Apprv] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Loc_ECN_Apprv] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Attch] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Curr_Phase] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ECN_Rqd] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Cmpl] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Cmpl_Date] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Svc_Dept_Ntfyd] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Cat] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Cat_Desc] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Emp_User_ID] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Init_Dt] [date] NULL,
[Mfg_Dt] [date] NULL,
[Eng_Dt] [date] NULL,
[Cmpl_Dt] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[eng_VIP] ADD CONSTRAINT [PK_eng_VIP] PRIMARY KEY CLUSTERED ([VIP]) ON [PRIMARY]
GO