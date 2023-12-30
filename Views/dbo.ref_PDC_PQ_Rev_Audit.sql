SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- =============================================
--Author: Newell, R
--Date: 2021-05-25
--Purpose:	This view is an identifies which PDC P&Q Revisions are not in sync with the CORE Parts Revisions.
--This audit replaces a similar audit which relied on New Parts Readiness table revisions.  
--The previous audit was only as accurate as the information in NPRS and since in some cases NPRS information
--was/is incomplete and/or incorrect, revisions were not always up do date and often times contained erroneous 
--revision values.
--This audit compares CORE Revisions to PDC P&Q Revision.  The initial run revealed a backlog to large
--for PUrchasing to procesds at once.
----To reduce the number of records, the audit excludes:
------Parts cancelled at the PDC
------P&Q Parts which do not currently have a Revision
--Last modified date:
--Modification notes:
--2022-01-14 Added epm.Rev=ept.Rev to table join between engineering part master and ecn transaction tables
--2023-06-07 Made changes to pull the most recent ECN fro the ECN history table as the ECN in the Part Master table isn't always correct
-- =============================================



CREATE VIEW [dbo].[ref_PDC_PQ_Rev_Audit] AS

With r As
(
Select PN
      ,Max([Rev]) As Rev
From dbo.eng_Part_ECN_History
Group By PN
)

, e As
(
Select r.PN	
	  ,r.Rev
	  ,h.ECN
From dbo.eng_Part_ECN_History h
Join r
On h.PN=r.PN And h.Rev=r.Rev
)
--06/07/2023 Added the above code

,pqvp AS
(
SELECT xrf.[CORE_PN]
	  ,pq.Part_No
	  ,d.Combi
      ,pq.Plant_Code
      ,pq.Vend_Code
	  ,pq.Vendor_Ref_No
	  ,Max(Revision) AS PQ_Rev
	  ,Right('00'+e.Rev,3) AS CORE_Rev
	  ,e.ECN
	  ,epm.[Desc_1]
	  ,ept.[Stock_Disp]
      ,epm.[Chart]
      ,epm.[Dwg_Size]
      ,epm.[Rel_Dt]
	  ,epm.[Type]
	  ,epm.[Test_Status]
	  ,d.[Status]
	FROM dbo.pdc_PQ_Vendor_Part r
	JOIN dbo.ref_PDC_Prime_PQ pq
	ON r.Plt_Code=pq.Plant_Code AND r.Vend_Code=pq.Vend_Code AND  r.Vend_Ref_No=pq.Vendor_Ref_No 
	LEFT JOIN dbo.ref_CORE_PN_XRef xrf 
	ON pq.Part_No=xrf.PNAS400Fmt
    LEFT JOIN dbo.eng_Part_Master epm
	ON xrf.CORE_PN=epm.PN
	LEFT JOIN e
	ON xrf.CORE_PN=e.PN
	LEFT JOIN eng_ECN_Part_Tran ept
--- ON epm.PN=ept.Key_1 AND epm.ECN=ept.ECN replaced by the following on 2022-01-14
--- ON epm.PN=ept.Key_1 AND epm.ECN=ept.ECN AND epm.Rev=ept.Rev
--- 06/06/2023 Replaced the above line with the line below
	ON e.PN=ept.Key_1 AND e.ECN=ept.ECN AND e.Rev=ept.Rev
	LEFT JOIN ref_PDC_Part_Detail d
	ON pq.Part_No = d.PN
	WHERE pq.Plant_Code='014' AND d.[Status] IS Null
	GROUP BY xrf.[CORE_PN]
	  ,pq.Part_No
	  ,pq.Part_No
	  ,d.Combi
	  ,pq.Plant_Code
      ,pq.Vend_Code
	  ,pq.Vendor_Ref_No
	  ,e.Rev
 	  ,e.ECN
	  ,epm.[Desc_1]
	  ,ept.[Stock_Disp]
      ,epm.[Chart]
      ,epm.[Dwg_Size]
      ,epm.[Rel_Dt]
	  ,epm.[Type]
	  ,epm.[Test_Status]
	  ,d.[Status]
)
Select *
FROM pqvp
--The filter 
WHERE (PQ_Rev < CORE_Rev AND PQ_Rev >' ' AND ((CORE_Rev >'000' AND CORE_Rev <'079') OR (CORE_Rev >'099' AND CORE_Rev <'300')))

GO
