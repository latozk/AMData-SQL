SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




-- =============================================
--Author: Newell, R
--Date: 2020-04-27
--Purpose:	This view displays the contents of the eng_ECN_Part_Tran table and also includes
--			additonal transaction related information from other views and tables.
--			
--			This view will be used in the compilation of ECN information for
--			Aftermarket ECN processing.
--Last modified date:
--Modification notes:
-- =============================================



CREATE VIEW [dbo].[ref_eng_PDC_ECN_Action_CO_pl] AS 



SELECT DISTINCT t1.ECN, 
t1.[Type] AS Tran_Type, 
t1.[Tran], 
t1.Key_1 AS PN, 
pm.Type,
pm.Comm,
pm.Desc_1,
pm.Desc_2,
pm.Desc_3,
pm.Rev,
pm.Status,
t1.PN AS Replacing_PN,
pm.Serviced AS Curr_Serv_Status,
t1.Serviced AS ECN_Serv_Status, 
--t1.Key_2, 
--t1.Key_3,
t1.CSW_Comm,
c.Dwg_Chg AS Change,
t1.Stock_Disp, 
t2.Reason,
u.Unit,
cd.Loc,
ad.Theater
FROM dbo.inp_Picklist_CO p
LEFT JOIN dbo.eng_ECN e ON p.ECN=e.ECN
LEFT JOIN dbo.eng_ECN_Part_Tran t1 ON e.ECN=t1.ECN 
LEFT JOIN dbo.eng_ECN_Tran AS t2 ON t1.ECN = t2.ECN AND t1.[Type] = t2.[Type] AND t1.[Tran] = t2.[Tran] AND t1.Key_1 = t2.Key_1 AND t1.Key_2 = t2.Key_2
LEFT JOIN dbo.ref_eng_Part_Master pm ON t1.Key_1=pm.PN
LEFT JOIN dbo.eng_PDC_ECN_Part_Loc_Unit_Contract_Div_Concat_CO_pl u ON t1.ECN=u.ECN AND t1.Key_1=u.PN
LEFT JOIN dbo.eng_ECN_Part_Dwg_Concat_CO_pl c ON t1.ECN=c.ECN AND t1.Key_1=c.PN
LEFT JOIN dbo.eng_PDC_Part_Dist_CORE_CO_pl cd ON t1.Key_1=cd.PN
LEFT JOIN dbo.eng_PDC_Part_Dist_Agile_Concat_CO_pl ad ON t1.Key_1=ad.PN
--WHERE T1.ECN='85802-56'
GO
