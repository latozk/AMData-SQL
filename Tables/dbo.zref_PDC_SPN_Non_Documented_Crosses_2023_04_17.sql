CREATE TABLE [dbo].[zref_PDC_SPN_Non_Documented_Crosses_2023_04_17]
(
[ID] [int] NOT NULL,
[SPN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PN] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[zref_PDC_SPN_Non_Documented_Crosses_2023_04_17] ADD CONSTRAINT [PK_ref_PDC_SPN_Non_Documented_Crosses_1] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[zref_PDC_SPN_Non_Documented_Crosses_2023_04_17] TO [GLOBAL\apjdudle]
GO
GRANT INSERT ON  [dbo].[zref_PDC_SPN_Non_Documented_Crosses_2023_04_17] TO [GLOBAL\apjdudle]
GO
GRANT SELECT ON  [dbo].[zref_PDC_SPN_Non_Documented_Crosses_2023_04_17] TO [GLOBAL\apjdudle]
GO
GRANT UPDATE ON  [dbo].[zref_PDC_SPN_Non_Documented_Crosses_2023_04_17] TO [GLOBAL\apjdudle]
GO
