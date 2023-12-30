CREATE TABLE [dbo].[eng_ECN_Tran_Usage]
(
[ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TYPE] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TRAN] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[KEY_1] [varchar] (48) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[KEY_2] [varchar] (48) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[KEY_3] [varchar] (66) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UNIT] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CONTRACT] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DIV] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[USG_GRP] [float] NOT NULL,
[NO_USG] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TEST_DIV] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TRAN_TYPE] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DIST_DIV] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_eng_Part_Unit_Div_Contract_ECN_Key_1_Unit_Contract_Div_1] ON [dbo].[eng_ECN_Tran_Usage] ([ECN], [UNIT], [CONTRACT], [DIV], [KEY_1]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [eng_part_unit_div_Contract_Key_1_1] ON [dbo].[eng_ECN_Tran_Usage] ([KEY_1]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_eng_part_unit_div_Contract_PN_1] ON [dbo].[eng_ECN_Tran_Usage] ([PN]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20210211-090025] ON [dbo].[eng_ECN_Tran_Usage] ([UNIT]) ON [PRIMARY]
GO
