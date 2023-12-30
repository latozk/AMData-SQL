SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [dbo].[eng_ECN_Reason_Concat_CO_pl] as 



WITH t0 AS 
(
SELECT DISTINCT t1.ECN, t1.Seq, t1.Reason
FROM dbo.inp_Picklist_CO p
JOIN dbo.eng_ECN_Reason t1 ON p.ECN=t1.ECN 
)


SELECT DISTINCT f2.ECN, Reason= 
    STUFF((SELECT  ', ' + ' '+Reason
           FROM t0 f1 
           WHERE f1.ECN = F2.ECN
		   ORDER BY f1.ECN, f1.Seq
          FOR XML PATH('')), 1, 2, '')
FROM t0 f2
GROUP BY f2.ECN



--The following works too, but can yield duplicates when T1 has duplicate records for ECN and Reason.  
--This table does not have notes, but the logic above is being used for consistency with those queries on tables which do have duplicates.
--ALTER VIEW [dbo].[eng_ECN_Reason_Concat_CO_Dt_pl] as 


--SELECT DISTINCT T2.ECN
--      ,Reason=STUFF((SELECT ',' + Reason
--  FROM dbo.eng_ECN_Reason T1
--  WHERE T1.ECN=T2.ECN
--  ORDER BY ECN, Seq
--  FOR XML PATH('')),1,1,'')
--FROM dbo.eng_ECN_Reason T2 JOIN dbo.eng_ECN e ON T2.ECN=e.ECN JOIN dbo.inp_Picklist_CO_Dt p ON p.Dt=e.ADM_Appr_Dt
--GO


GO
