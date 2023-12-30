SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[sp_Upd_Current_ECN_Part_Master] as

--Updates eng_Part_Master with most current ECN number based on eng_Part_ECN_History
With t1 as (
select PN, MAX(Rel_Dt) as Max_Rel_Dt 
from eng_Part_ECN_History
--where pn = '8843136'
Group by PN
)
, t2 as (
Select eh.pn, eh.ECN
from eng_Part_ECN_History eh
Join t1 
on eh.PN = t1.PN
and t1.Max_Rel_Dt=eh.Rel_Dt
)

Update eng_Part_Master
Set ECN = t2.ecn
From t2 join eng_Part_Master pm
on t2.PN = pm.PN
Where pm.PN = t2.PN ;

--Update with releasing Project
Update eng_Part_Master
Set rel_proj = e.proj 
From eng_ECN e join eng_Part_Master pm
 on pm.rel_ECN = e.ECN

GO
