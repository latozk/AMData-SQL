SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE view [dbo].[eng_ECN_Part_Dwg_Concat_CO_pl] as 



WITH t0 AS 
(
SELECT DISTINCT t1.ECN, t1.PN, t1.Dwg_Chg, t1.Seq
FROM dbo.inp_Picklist_CO p
JOIN dbo.eng_Part_Dwg_Chg t1 ON p.ECN=t1.ECN 
)


SELECT DISTINCT f2.ECN, f2.PN, Dwg_Chg= 
    STUFF((SELECT  ', ' + ' '+Dwg_Chg
           FROM t0 f1 
           WHERE f1.ECN = F2.ECN AND f1.PN = f2.PN
		   		   ORDER BY f1.ECN, f1.PN, f1.Seq
          FOR XML PATH('')), 1, 2, '')
FROM t0 f2
GROUP BY f2.ECN, f2.PN
GO
