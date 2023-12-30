CREATE TABLE [dbo].[eng_ECN_Unit_Contract_Dist]
(
[Loc] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ID] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Unit] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Contract] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ELU_Cmpl] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ELU_Cmpl_Date] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ELU_Arr_Chg] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ELU_Test] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ELU_Cmpl_DT] [date] NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_eng_ECN_Unit_Contract_Dist_ECN_Loc] ON [dbo].[eng_ECN_Unit_Contract_Dist] ([ECN], [Loc]) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [idx_eng_Ecn_Unit_Contract_Dist_ECN_Loc_Unit_Contract] ON [dbo].[eng_ECN_Unit_Contract_Dist] ([ECN], [Loc], [Unit], [Contract]) ON [PRIMARY]
GO
