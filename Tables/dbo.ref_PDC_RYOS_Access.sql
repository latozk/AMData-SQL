CREATE TABLE [dbo].[ref_PDC_RYOS_Access]
(
[PN] [nvarchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RYOS] [float] NULL,
[Curr US Usage?] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SRK-MRK?] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp to Supported Parent?] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OriginDt] [datetime2] NULL,
[Level ID] [float] NULL,
[Support Level] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[In CORE?] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cancelled at PDC?] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
