SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


create view [dbo].[zeng_ECN_Loc_Unit_Contract_Concat] as 
With e0 as
(Select ECN, Loc,Rtrim(Unit) Unit, Rtrim([Contract]) [Contract] from 
eng_ECN_Unit_Contract_Dist
)
,
e1 as (
  SELECT Row_Number() OVER(Order By ECN, Loc ASC) as Row#
  ,ECN, Loc, Unit, [Contract]
    FROM e0
	)

SELECT ECN,ECN + ' ' + Loc as ECN_Loc, Unit_Contract = 
    STUFF((SELECT  ', ' + Unit + '- ' + [Contract]
           FROM e1 b 
           WHERE b.Ecn = a.Ecn
		   and b.loc = a.loc
          FOR XML PATH('')), 1, 2, '')
FROM e1 a
GROUP BY ECN, Loc
GO
