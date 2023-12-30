CREATE TABLE [dbo].[eng_PDC_Part_Dist_Agile]
(
[ID] [uniqueidentifier] NULL,
[Unit] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Contract] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Div] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[List] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PN] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Theater] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
