CREATE TABLE [dbo].[ref_PDC_SPN_Non_Documented_Crosses]
(
[SPN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PN] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ref_PDC_SPN_Non_Documented_Crosses] ADD CONSTRAINT [PK_ref_PDC_SPN_Non_Documented_Crosses_2] PRIMARY KEY CLUSTERED ([SPN], [PN]) ON [PRIMARY]
GO
