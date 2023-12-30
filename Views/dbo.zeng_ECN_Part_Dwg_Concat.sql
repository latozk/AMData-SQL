SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create view [dbo].[zeng_ECN_Part_Dwg_Concat] as 
With e0 as
(Select ECN, PN, rtrim(Dwg_Chg) as Dwg_Chg
from eng_Part_Dwg_Chg
)
,
e1 as (
  SELECT Row_Number() OVER(Order By ECN, PN ASC) as Row#
  ,ECN, PN, Dwg_Chg
    FROM e0
	)

SELECT ECN, PN, Dwg_Chg  = 
    STUFF((SELECT  ', ' + Dwg_Chg
           FROM e1 b 
           WHERE b.Ecn = a.Ecn
		   and b.PN = a.PN
          FOR XML PATH('')), 1, 2, '')
FROM e1 a
GROUP BY ECN, PN
GO
