CREATE TABLE [dbo].[ref_PDC_RYOS]
(
[PN] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RYOS] [numeric] (4, 1) NULL,
[Origin_Dt] [date] NULL,
[Cancelled_YN] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SupptReq_YN] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Support] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InCORE_YN] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comp_YN] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ref_PDC_RYOS] ADD CONSTRAINT [PK_ref_RYOS] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
