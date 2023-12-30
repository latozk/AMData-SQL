SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE view [dbo].[eng_NPO_Part_Dist_Agile_Concat_CO_Dt_pl] as 



WITH t0 AS 
(
SELECT DISTINCT t.Key_1 AS PN, d.Theater
FROM dbo.inp_Picklist_CO_Dt p
LEFT JOIN dbo.eng_ECN e ON p.Dt=e.ADM_Appr_Dt
LEFT JOIN dbo.eng_ECN_Part_Tran t ON e.ECN=t.ECN
LEFT JOIN dbo.eng_NPO_Part_Dist_Agile d ON t.Key_1=d.PN 
WHERE d.Theater='AM' or d.Theater='LAM'
)


SELECT DISTINCT f2.PN, Theater= 
    STUFF((SELECT  ', ' + ' '+Theater
           FROM t0 f1 
           WHERE f1.PN = F2.PN
		   		   ORDER BY f1.PN, f1.Theater
          FOR XML PATH('')), 1, 2, '')
FROM t0 f2
GROUP BY f2.PN, f2.Theater
GO
