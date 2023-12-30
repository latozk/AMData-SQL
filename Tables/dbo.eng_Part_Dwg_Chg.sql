CREATE TABLE [dbo].[eng_Part_Dwg_Chg]
(
[ECN] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Seq] [int] NOT NULL,
[Dwg_Chg] [varchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[eng_Part_Dwg_Chg] ADD CONSTRAINT [PK_eng_Part_Dwg_Chg] PRIMARY KEY CLUSTERED ([ECN], [PN], [Seq]) ON [PRIMARY]
GO
