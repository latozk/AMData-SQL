CREATE TABLE [dbo].[mdi_SS]
(
[PN] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Man_SS] [numeric] (18, 0) NOT NULL,
[Calc_SS] [numeric] (18, 2) NOT NULL,
[SS] [numeric] (18, 0) NOT NULL,
[SKUCUST34] [numeric] (18, 0) NOT NULL,
[CSL] [numeric] (18, 2) NOT NULL,
[OVRSL] [numeric] (18, 0) NOT NULL,
[SLMinSLQty] [numeric] (18, 2) NOT NULL,
[SLMaxSLQty] [numeric] (18, 2) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[mdi_SS] ADD CONSTRAINT [PK_mdi_SS] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
