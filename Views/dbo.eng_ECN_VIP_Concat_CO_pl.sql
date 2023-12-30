SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [dbo].[eng_ECN_VIP_Concat_CO_pl] as 



WITH t0 AS 
(
SELECT DISTINCT t1.ECN, t1.VIP
FROM dbo.inp_Picklist_CO p
JOIN dbo.eng_ECN_VIP t1 ON p.ECN=t1.ECN 
)


SELECT DISTINCT f2.ECN, VIP= 
    STUFF((SELECT  ', ' + ' '+VIP
           FROM t0 f1 
           WHERE f1.ECN = F2.ECN
		   ORDER BY f1.ECN, f1.VIP
          FOR XML PATH('')), 1, 2, '')
FROM t0 f2
GROUP BY f2.ECN

--The following works too, but can yield duplicates when T1 has duplicate records for ECN and VIP.  
--This table does not have notes, but the logic above is being used for consistency with those queries on tables which do have duplicates.
--SELECT DISTINCT T2.ECN
--      ,VIP=STUFF((SELECT ',' + VIP
--  FROM dbo.eng_ECN_VIP T1
--  WHERE T1.ECN=T2.ECN
--  ORDER BY ECN
--  FOR XML PATH('')),1,1,'')
--FROM dbo.eng_ECN_VIP T2 JOIN inp_Picklist_CO P ON T2.ECN=P.ECN
--GO


GO
