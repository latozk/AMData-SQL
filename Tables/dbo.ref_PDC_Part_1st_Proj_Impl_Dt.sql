CREATE TABLE [dbo].[ref_PDC_Part_1st_Proj_Impl_Dt]
(
[SPN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AMPN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Proj] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ImplDt] [datetime] NULL,
[RelDt] [datetime] NULL,
[NewRplcng] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [ClusteredIndex-20210511-165635] ON [dbo].[ref_PDC_Part_1st_Proj_Impl_Dt] ([SPN], [AMPN], [Proj]) ON [PRIMARY]
GO
