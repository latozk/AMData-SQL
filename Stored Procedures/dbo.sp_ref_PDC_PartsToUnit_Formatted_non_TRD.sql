SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



Create Procedure [dbo].[sp_ref_PDC_PartsToUnit_Formatted_non_TRD] As

---- =============================================
---- Author: Newell, R
---- Date: 2021-12-02
---- Purpose: Add supported SPED PNs to the ref_PDC_PartsToUnit_Formatted_non_TRD table which is used along with TRD tables to populate ref_PDC_PartsToUnit_Formatted.
---- Last modified date:
---- Modification notes: 
---- =============================================

Truncate Table wrk_PN_Structure_Row;

-------------------------
--Part 1 Get SPED lists for PDC supported units and divisions
-------------------------

With p As
(
Select Distinct mls.PN 
  From dbo.eng_Unit_Div_ML_GL mls
  Join dbo.ref_unit u
  On mls.Unit=u.unit
  Join dbo.eng_Part_Master pm
  On mls.PN=pm.PN
  Join dbo.eng_Unit_Dist d
  On mls.Unit=d.unit and mls.[Contract]=d.[Contract] and mls.Div=d.Div
  Where mls.[Status] = 'ADD' 
  And pm.PN<>'CAN'
  And (mls.PN Like 'S%' or mls.PN Like 'U%') 
  And (u.[Group]='BT' or u.[Group] = 'Jumbo')
  And (Support Is Not Null and Support <> 'Not Supported')
  And d.Loc='PDC'
  And mls.Div in ('SER1', 'SER2', 'SER7', 'SERV', 'SNIJ', 'SCRA', 'SPED')
)

-------------------------
--Part 2 Get product Structure for the SPED lists
-------------------------

Insert Into wrk_PN_Structure_Row 
select
ROW_NUMBER() OVER ( ORDER BY p.PN) AS RowNum
, p.PN
From p;


-------------------------
--Part 3 Execute Product Structure procedure
-------------------------

Execute sp_wrk_Product_Structure;

-------------------------
--Part 4 Get SPED PNs from the SPED list structures
-------------------------

With s As
( 
Select Distinct Init_PN List
	  ,Component_PN As PN
From wrk_Part_Structure
Join dbo.eng_Part_Master pm
On Component_PN=pm.PN
Where (Component_PN Like 'S%' or Component_PN Like 'U%') And (pm.Status <>'CAN' Or pm.Status Is Null) And (pm.Type='P')
)

-------------------------
--Part 5 Add SPED Parts to PartsToUnit_non_TRD for all appropriate units and divisions
-------------------------

, p As
( 
Select Distinct  mls.PN 
	  ,mls.Unit
      ,mls.[Contract]
      ,mls.Div
  From dbo.eng_Unit_Div_ML_GL mls
  Join dbo.ref_unit u
  On mls.Unit=u.unit
  Join dbo.eng_Part_Master pm
  On mls.PN=pm.PN
  Join dbo.eng_Unit_Dist d
  On mls.Unit=d.unit and mls.[Contract]=d.[Contract] and mls.Div=d.Div
  Where mls.[Status] = 'ADD' 
  And pm.PN<>'CAN'
  And (mls.PN Like 'S%' or mls.PN Like 'U%') 
  And (u.[Group]='BT' or u.[Group] = 'Jumbo')
  And (Support Is Not Null and Support <> 'Not Supported')
  And d.Loc='PDC'
  And mls.Div In ('SER1', 'SER2', 'SER7', 'SERV', 'SNIJ', 'SCRA', 'SPED')
)

Insert Into ref_PDC_PartsToUnit_Formatted_non_TRD
Select Distinct s.PN As PartNumber
	,s.PN As HysterPartNumber
	,'Y'+Right(Left(s.PN,12),11) As YalePartNumber
	,p.Unit As UnitCode
	,s.PN As PN
	,s.PN As H_PN
	,'Y'+Right(Left(s.PN,12),11) As Y_PN
	,CAST(GETDATE() AS DATE) As Add_Dt
--Into ref_PDC_PartsToUnit_Formatted_non_TRD_1
From s
Join p
On s.List=p.PN
Left Join ref_PDC_PartsToUnit_Formatted_non_TRD t
On s.PN=t.PartNumber And p.Unit=t.UnitCode
Where t.PartNumber Is Null



GO
