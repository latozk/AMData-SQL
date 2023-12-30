SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE view [dbo].[zeng_ECN_Note_Concat] as 
SELECT ECN, Note = 
    STUFF((SELECT  ', ' + Note
           FROM eng_ECN_Note b 
           WHERE b.Ecn = a.Ecn
		   ORDER BY ECN, Seq 
          FOR XML PATH('')), 1, 2, '')
FROM eng_ECN_Note a
GROUP BY ECN
GO
