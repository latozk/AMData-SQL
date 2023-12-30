CREATE TABLE [dbo].[ref_Unit_to_Mast]
(
[UNIT CODE] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DESCRIPTION] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MAST (UNIT LINKAGE)] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MAST (UNIT LINKAGE DESCRIPTION)] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CLASS] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CLASS DESCRIPTION] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SOURCE] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UC] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MC] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[In O'Neils XRef?] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[INVESTIGATE] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Agile Record Status] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Append Dt] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ref_Unit_to_Mast] ADD CONSTRAINT [PK_ref_Unit_to_Mast_New] PRIMARY KEY CLUSTERED ([UNIT CODE], [MAST (UNIT LINKAGE)]) ON [PRIMARY]
GO
