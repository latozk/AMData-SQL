CREATE TABLE [dbo].[y_Structure_kll]
(
[ID] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Col] [int] NULL,
[Parent_PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Component_PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Qty] [decimal] (18, 0) NULL,
[Seq] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Trans] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ECN_Add_Dt] [date] NULL,
[ECN_Rem_Dt] [date] NULL,
[Input_PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Input_Dt] [date] NULL
) ON [PRIMARY]
GO
