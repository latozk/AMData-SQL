CREATE TABLE [dbo].[ref_PDC_SPN_Replacing_PNs]
(
[SPN] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PN] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[OC] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SC] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Set_SOH] [float] NULL,
[Set_OO] [float] NULL,
[Set_BO] [float] NULL,
[Pkg_Cd] [nchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Contact_Vend] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Category] [varchar] (45) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Level] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ref_PDC_SPN_Replacing_PNs] ADD CONSTRAINT [PK_ref_PDC_SPN_Replacing_PNs] PRIMARY KEY CLUSTERED ([SPN], [PN]) ON [PRIMARY]
GO
