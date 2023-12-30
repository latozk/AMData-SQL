CREATE TABLE [dbo].[eng_ECN_Ext]
(
[ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Urgent] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Reason] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reason_Desc] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OMS_Affected] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[First_Trk_Review_Rqd] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FSC_Rqd] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Unit_SN_Rqd] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comp_SN_Rqd] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Hold_ECN] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Des_Cons_DB_Consult] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Agile_CO] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Eff_Date] [nvarchar] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Eff_Dt] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[eng_ECN_Ext] ADD CONSTRAINT [PK_eng_ECN_Ext] PRIMARY KEY CLUSTERED ([ECN]) ON [PRIMARY]
GO
