SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE VIEW [dbo].[eng_ECN_Loc_Unit_Contract_Concat_CO_pl] as 


WITH pd AS 
(
SELECT DISTINCT t1.ECN, t1.Loc, t1.Unit, t1.Contract
FROM inp_Picklist_CO p 
JOIN eng_ECN_Unit_Contract_Dist t1 ON p.ECN=t1.ECN 
)

SELECT DISTINCT f2.ECN, f2.Loc, Unit= 
    STUFF((SELECT ',' +' '+Unit+'-'+RTrim(Contract)
           FROM pd f1 
           WHERE f1.ECN = F2.ECN AND f1.Loc = f2.Loc
          FOR XML PATH('')), 1, 2, '')
FROM pd f2
GROUP BY f2.ECN, f2.Loc

GO
