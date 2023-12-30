SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [dbo].[eng_PDC_Part_Dist_CORE_CO_Dt_pl] as 



SELECT DISTINCT t.Key_1 AS PN, d.Loc
FROM dbo.inp_Picklist_CO_Dt p
LEFT JOIN dbo.eng_ECN e ON p.Dt=e.ADM_Appr_Dt
LEFT JOIN dbo.eng_ECN_Part_Tran t ON e.ECN=t.ECN
LEFT JOIN dbo.eng_PDC_Part_Dist_CORE d ON t.Key_1=d.PN 
WHERE Not d.Loc IS Null

GO
