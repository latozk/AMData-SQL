CREATE TABLE [dbo].[chain_Misc_Comp]
(
[PN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HPN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[YPN] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Desc] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Desc1wg] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[chain_Misc_Comp] ADD CONSTRAINT [PK_chain_Misc_Comp] PRIMARY KEY CLUSTERED ([PN], [HPN], [YPN]) ON [PRIMARY]
GO
