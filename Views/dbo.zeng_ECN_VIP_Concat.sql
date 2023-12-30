SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create view [dbo].[zeng_ECN_VIP_Concat] as 
With e1 as (
  SELECT Row_Number() OVER(Order By ECN ASC) as Row#
  ,ECN, VIP 
    FROM eng_ECN_VIP 
    --WHERE ECN = '155139' --@key_value -- in ('154074', '100051')
	)
SELECT ECN, VIP = 
    STUFF((SELECT  ', ' + VIP
           FROM e1 b 
           WHERE b.Ecn = a.Ecn
          FOR XML PATH('')), 1, 2, '')
FROM e1 a
GROUP BY ECN

--Execute sp_executesql @SQLStr 





--select count(p.ecn), p.ecn
----, v.vip
--from eng_ecn p
--Left Join eng_ecn_Vip v
--on p.ecn = v.ecn
--Group by p.ecn
--having count(p.ecn) > 3



----104231 (10)
----104347(19)
-----10448(11)
----104295((5)
----104773(8)
GO
