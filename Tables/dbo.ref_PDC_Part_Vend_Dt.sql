CREATE TABLE [dbo].[ref_PDC_Part_Vend_Dt]
(
[PN] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Vend_Dt] [date] NULL,
[Vend_Date] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ref_PDC_Part_Vend_Dt] ADD CONSTRAINT [PK_ref_PDC_Part_Vend_Dt_1] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
