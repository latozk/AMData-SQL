SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE view [dbo].[eng_ECN_Key_1_Loc_Concat] as 
with pd as 
(select distinct ecn, Key_1, Unit, Contract, Div 
from eng_Part_Unit_Contract_Div
)
--, ud as
--(
--select distinct unit, contract, div, loc
--from eng_unit_Dist 
--)

, e0 as
(select  Distinct ecn, Key_1, loc
from pd left outer join eng_Unit_Dist ud
on pd.unit = ud.unit
and pd.contract = ud.contract
and pd.div = ud.div 
)
, e1 as (
  SELECT Row_Number() OVER(Order By ECN, Key_1 ASC) as Row#
  ,ECN, Key_1, Loc 
    FROM  e0
--Left Join ud
--on pd.unit = ud.unit
--and pd.contract = ud.contract
--and pd.div = ud.div  
	)

SELECT ECN, Key_1, ECN + ' ' + Key_1 as ECN_Key_1, Loc  = 
    STUFF((SELECT  ', ' + Loc
           FROM e1 b 
           WHERE b.Ecn = a.Ecn
		   and b.Key_1 = a.Key_1
          FOR XML PATH('')), 1, 2, '')
FROM e1 a
GROUP BY ECN, Key_1
GO
