SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO







CREATE VIEW [dbo].[eng_PDC_Part_ADD_Need_Dt_CO_Dt_pl] AS

SELECT x.[PN]
      ,x.[Proj]
	  ,Min(i.[Impl_Dt]) AS Need_Dt
  FROM [dbo].[eng_PN_Proj_Xref] x join [dbo].[ref_PDC_Proj_Master] i
  ON x.Proj=i.Proj
  WHERE NOT i.[Impl_Dt] IS NULL AND PN IN (SELECT PN FROM ref_eng_PDC_ECN_Action_CO_Dt_pl)
  GROUP BY x.PN, x.[Proj]

GO
