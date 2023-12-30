SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE view [dbo].[eng_NPO_Part_Dist_CORE_Concat_CO_pl] as 



WITH t0 AS 
(
SELECT DISTINCT t.Key_1 AS PN, d.Loc
FROM dbo.inp_Picklist_CO p
LEFT JOIN dbo.eng_ECN_Part_Tran t ON p.ECN=t.ECN
LEFT JOIN dbo.eng_NPO_Part_Dist_CORE d ON t.Key_1=d.PN 
)


SELECT DISTINCT f2.PN, Loc= 
    STUFF((SELECT  ', ' + ' '+Loc
           FROM t0 f1 
           WHERE f1.PN = F2.PN
		   		   ORDER BY f1.PN, f1.Loc
          FOR XML PATH('')), 1, 2, '')
FROM t0 f2
GROUP BY f2.PN, f2.Loc
GO
