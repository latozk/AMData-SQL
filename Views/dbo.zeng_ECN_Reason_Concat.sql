SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE view [dbo].[zeng_ECN_Reason_Concat] as 
SELECT ECN, Reason = 
    STUFF((SELECT  ', ' + Reason
           FROM eng_ECN_Reason b 
           WHERE b.Ecn = a.Ecn
		   ORDER BY ECN, Seq 
          FOR XML PATH('')), 1, 2, '')
FROM eng_ECN_Reason a
GROUP BY ECN


GO
