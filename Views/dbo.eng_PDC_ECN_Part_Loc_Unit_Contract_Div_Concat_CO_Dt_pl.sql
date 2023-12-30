SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE view [dbo].[eng_PDC_ECN_Part_Loc_Unit_Contract_Div_Concat_CO_Dt_pl] as 

WITH t0 AS 
(
SELECT DISTINCT t1.ECN, t1.Key_1 AS PN, t1.Unit, t1.Contract, t1.Div, t2.Loc
FROM dbo.inp_Picklist_CO_Dt p
JOIN dbo.eng_ECN e ON p.Dt=e.ADM_Appr_Dt
JOIN eng_ECN_Tran_Usage t1 ON e.ECN=t1.ECN 
JOIN eng_Unit_Dist t2 ON t1.Unit=t2.Unit AND t1.Contract=t2.Contract AND t1.Div=t2.Div
WHERE t2.Loc='PDC'
)


SELECT DISTINCT f2.ECN, f2.PN, f2.Loc, Unit= 
    STUFF((SELECT  ', ' + ' '+Unit+'-'+RTrim(Contract)+'-'+Div
           FROM t0 f1 
           WHERE f1.ECN = F2.ECN AND f1.PN = f2.PN AND f1.Loc = f2.Loc AND f1.Loc='PDC'
          FOR XML PATH('')), 1, 2, '')
FROM t0 f2
GROUP BY f2.ECN, f2.PN, f2.Loc
GO
