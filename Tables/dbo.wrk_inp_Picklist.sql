CREATE TABLE [dbo].[wrk_inp_Picklist]
(
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[wrk_inp_Picklist] ADD CONSTRAINT [PK_wrk_inp_Picklist] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
