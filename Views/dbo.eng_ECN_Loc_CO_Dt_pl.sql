SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE VIEW [dbo].[eng_ECN_Loc_CO_Dt_pl] as 


WITH pd AS 
(
SELECT DISTINCT t1.ECN, t1.Loc
FROM dbo.inp_Picklist_CO_Dt p
JOIN dbo.eng_ECN e ON p.Dt=e.ADM_Appr_Dt
JOIN eng_ECN_Unit_Contract_Dist t1 ON e.ECN=t1.ECN 
)


SELECT DISTINCT f2.ECN, Loc= 
    STUFF((SELECT ',' +' '+Loc
           FROM pd f1 
           WHERE f1.ECN = F2.ECN
          FOR XML PATH('')), 1, 2, '')
FROM pd f2
GROUP BY f2.ECN, f2.Loc

GO
