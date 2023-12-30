CREATE TABLE [dbo].[eng_Unit_Dist]
(
[Unit] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Contract] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Div] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Loc] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Final_Assy] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[eng_Unit_Dist] ADD CONSTRAINT [PK_eng_Unit_Dist] PRIMARY KEY CLUSTERED ([Unit], [Contract], [Div], [Loc]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20200707-143901] ON [dbo].[eng_Unit_Dist] ([Loc]) ON [PRIMARY]
GO
