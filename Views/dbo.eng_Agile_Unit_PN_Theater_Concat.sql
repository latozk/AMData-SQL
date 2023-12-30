SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [dbo].[eng_Agile_Unit_PN_Theater_Concat] as 



WITH t0 AS 
(
SELECT DISTINCT [PN]
      ,a.[Unit]
      ,[Theater]
  FROM [dbo].[eng_PDC_Part_Dist_Agile] a JOIN dbo.ref_Unit u ON a.Unit=u.Unit
  --WHERE PN='0014603' or PN='0016571'
)


SELECT DISTINCT f2.PN, f2.Unit, Theater= 
    STUFF((SELECT  ', ' + ' '+Theater
           FROM t0 f1 
           WHERE f1.PN = F2.PN AND f1.Unit = f2.Unit
		   		   ORDER BY f1.PN, f1.Unit, f1.Theater
          FOR XML PATH('')), 1, 2, '')
FROM t0 f2
  --WHERE PN='0014603' or PN='0016571'
GROUP BY f2.PN, f2.Unit
GO
