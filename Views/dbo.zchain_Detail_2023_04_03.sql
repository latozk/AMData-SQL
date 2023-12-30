SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--When SPN is implemented, uncomment lines 232 to 294 and 304 to 305.

CREATE View [dbo].[zchain_Detail_2023_04_03] As

With c AS
(
Select bom.[Man_Add_AS400]
      ,bom.[Initials]
      ,bom.[OEM]
      ,bom.[PN]
	  ,bom.HPN
	  ,bom.YPN
      ,bom.[Bulk_PN]
	  ,b1.HPN As Bulk_HPN
	  ,b1.YPN As Bulk_YPN
	  ,b1.Additional_Cross As Bulk_Additional_Cross
      ,bom.[Qty_Feet]
      ,bom.[CutTo_Inches] AS Assy_Length_Inches
      ,bom.[Qty_Links]
      ,bom.[Chart]
      ,bom.[Print/Chart_Req]
      ,bom.[Standard]
      ,bom.[Origin_Date]
      ,bom.[Maint_Date]
      ,bom.[Memo]
      ,bom.[PDC_Only_Comments]
      ,bom.[Assy_Comments]
      ,bom.[Chain_Type]
      ,bom.[Original_Table]
      ,bom.[Pin_Link_PN] 
	  ,m1.[HPN] As [Pin_Link_HPN]
	  ,m1.[YPN] As [Pin_Link_YPN]
      ,bom.[Pin_Link_Qty]
      ,bom.[Outer_Link_PN]
	  ,m2.[HPN] As [Outer_Link_HPN]
	  ,m2.[YPN] As [Outer_Link_YPN]
	  ,bom.[Outer_Link_Qty]
      ,bom.[Inner_Link_PN]
	  ,m3.[HPN] As [Inner_Link_HPN]
	  ,m3.[YPN] As [Inner_Link_YPN]
      ,bom.[Inner_Link_Qty]
      ,bom.[Anchor_A_PN]
	  ,m4.[HPN] As [Anchor_A_HPN]
	  ,m4.[YPN] As [Anchor_A_YPN]
      ,bom.[Anchor_A_Qty]
      ,bom.[Anchor_B_PN]
	  ,m5.[HPN] As [Anchor_B_HPN]
	  ,m5.[YPN] As [Anchor_B_YPN]
      ,bom.[Anchor_B_Qty]
	  ,CASE
			WHEN b1.Additional_Info Like '%Hand Press%'
			THEN b1.Additional_Info
			WHEN b2.Additional_Info Like '%Hand Press%'
			THEN b2.Additional_Info
			WHEN b1.PN Is Null
			THEN b2.Spacer_Plate
			ELSE b1.Spacer_Plate
			END AS Spacer
	  ,CASE
			WHEN b1.HPN Is Null
			THEN b2.Punch
			ELSE b1.Punch
			END AS Punch
	  ,CASE
			WHEN b1.HPN Is Null
			THEN b2.Holder
			ELSE b1.Holder
			END AS Holder
	  ,[Date/Time_Stamp]
FROM [dbo].[chain_BOM] bom
LEFT JOIN dbo.chain_Bulk AS b1
ON bom.Bulk_PN=b1.PN
LEFT JOIN dbo.chain_Bulk As b2
ON bom.Bulk_PN=b2.Additional_Cross
Left Join dbo.chain_Misc_Comp m1
On bom.Pin_Link_PN=m1.PN
Left Join dbo.chain_Misc_Comp m2
On bom.Outer_Link_PN=m2.PN
Left Join dbo.chain_Misc_Comp m3
On bom.Inner_Link_PN=m3.PN
Left Join dbo.chain_Misc_Comp m4
On bom.Anchor_A_PN=m4.PN
Left Join dbo.chain_Misc_Comp m5
On bom.Anchor_B_PN=m5.PN
)

--Gets BOMs for HPNs

, dh AS
(
SELECT [Man_Add_AS400]
	  ,'HYS' AS Brand
	  ,Null AS [Alt_Build]
	  ,[Maint_Date] AS [Rev_Date]
	  ,c.PN
	  ,c.Assy_Length_Inches
	  ,[Standard] AS Comm1
      ,c.[Chain_Type] AS Comm2
	  ,c.[Assy_Comments] AS Comm3
	  	  ,CASE
			WHEN c.Spacer Is Null Or c.Spacer Like '%Hand Press%'
			THEN c.Spacer
			ELSE 'SPACER PLATE:  '+c.Spacer
			END AS Comm4
	  ,CASE
			WHEN c.Punch Is Null
			THEN c.Punch
			ELSE 'PUNCH: '+c.Punch
			END AS Comm5
	  ,Null AS Comm6
	  ,Null AS Comm7
	  ,CASE
		WHEN c.Holder Is Null
		THEN c.Holder
		ELSE 'HOLDER: ' + c.Holder
		END AS Comm8
	  ,Bulk_HPN AS Comp1
	  ,'CUT TO ' + [Assy_Length_Inches] + ' IN  (' + [Qty_Links] + ' LINKS)' AS Comp1_Comm
	  ,Qty_Feet AS Comp1_Qty
	  ,Assy_Length_Inches AS Comp1_CutTo
	  ,Pin_Link_HPN AS Comp2
	  ,Null AS Comp2_Comm
	  ,Pin_Link_Qty AS Comp2_Qty
	  ,Outer_Link_HPN AS Comp3
	  ,Null AS Comp3_Comm
	  ,Outer_Link_Qty AS Comp3_Qty
	  ,Anchor_A_HPN AS Comp4
	  ,Null AS Comp4_Comm
	  ,Anchor_A_Qty AS Comp4_Qty
	  ,Assy_Length_Inches AS Comp4_CutTo
	  ,Anchor_B_HPN AS Comp5
	  ,Null AS Comp5_Comm
	  ,Anchor_B_Qty AS Comp5_Qty
	  ,Inner_Link_HPN AS Comp6
	  ,Null AS Comp6_Comm
	  ,Inner_Link_Qty AS Comp6_Qty
	  ,Null AS Comp7
	  ,Null AS Comp7_Comm
	  ,Null AS Comp7_Qty
	  ,Null AS Comp8
	  ,Null AS Comp8_Comm
	  ,Null AS Comp8_Qty
	  ,[Print/Chart_Req]
FROM c
WHERE [Man_Add_AS400]='NO'
AND c.HPN >''
AND c.HPN Not Like '3______'
AND Bulk_HPN >''
AND ([Qty_Feet] Not Like '%BULK%' And [Qty_Feet] Not Like '%AR%' And [Qty_Feet] Not Like '%NLA%')
AND [Print/Chart_Req]='NO'
)

--Gets BOMs for YPNs

, dy AS
(
SELECT [Man_Add_AS400]
	  ,'YAL' AS Brand
	  ,Null AS [Alt_Build]
	  ,[Maint_Date] AS [Rev_Date]
	  ,c.YPN
	  ,c.Assy_Length_Inches
	  ,[Standard] AS Comm1
      ,c.[Chain_Type] AS Comm2
	  ,c.[Assy_Comments] AS Comm3
	  	  ,CASE
			WHEN c.Spacer Is Null Or c.Spacer Like '%Hand Press%'
			THEN c.Spacer
			ELSE 'SPACER PLATE:  '+c.Spacer
			END AS Comm4
	  ,CASE
			WHEN c.Punch Is Null
			THEN c.Punch
			ELSE 'PUNCH: '+c.Punch
			END AS Comm5
	  ,Null AS Comm6
	  ,Null AS Comm7
	  ,CASE
		WHEN c.Holder Is Null
		THEN c.Holder
		ELSE 'HOLDER: ' + c.Holder
		END AS Comm8
	  ,Bulk_YPN AS Comp1
	  ,'CUT TO ' + [Assy_Length_Inches] + ' IN  (' + [Qty_Links] + ' LINKS)' AS Comp1_Comm
	  ,Qty_Feet AS Comp1_Qty
	  ,Assy_Length_Inches AS Comp1_CutTo
	  ,Pin_Link_YPN AS Comp2
	  ,Null AS Comp2_Comm
	  ,Pin_Link_Qty AS Comp2_Qty
	  ,Outer_Link_YPN AS Comp3
	  ,Null AS Comp3_Comm
	  ,Outer_Link_Qty AS Comp3_Qty
	  ,Anchor_A_YPN AS Comp4
	  ,Null AS Comp4_Comm
	  ,Anchor_A_Qty AS Comp4_Qty
	  ,Assy_Length_Inches AS Comp4_CutTo
	  ,Anchor_B_YPN AS Comp5
	  ,Null AS Comp5_Comm
	  ,Anchor_B_Qty AS Comp5_Qty
	  ,Inner_Link_YPN AS Comp6
	  ,Null AS Comp6_Comm
	  ,Inner_Link_Qty AS Comp6_Qty
	  ,Null AS Comp7
	  ,Null AS Comp7_Comm
	  ,Null AS Comp7_Qty
	  ,Null AS Comp8
	  ,Null AS Comp8_Comm
	  ,Null AS Comp8_Qty
	  ,[Print/Chart_Req]
FROM c
WHERE [Man_Add_AS400]='NO'
AND c.YPN >''
AND Bulk_YPN >''
AND ([Qty_Feet] Not Like '%BULK%' And [Qty_Feet] Not Like '%AR%' And [Qty_Feet] Not Like '%NLA%')
AND [Print/Chart_Req]='NO'
)

--SPN Change
--Uncomment this section when SPN becomes effective.
--Gets BOMs for SPNs

--,dspn AS
--(
--SELECT [Man_Add_AS400]
--	  ,'HYG' AS Brand
--	  ,Null AS [Alt_Build]
--	  ,[Maint_Date] AS [Rev_Date]
--	  ,c.PN
--	  ,c.Assy_Length_Inches
--	  ,[Standard] AS Comm1
--      ,c.[Chain_Type] AS Comm2
--	  ,c.[Assy_Comments] AS Comm3
--	  	  ,CASE
--			WHEN c.Spacer Is Null Or c.Spacer Like '%Hand Press%'
--			THEN c.Spacer
--			ELSE 'SPACER PLATE:  '+c.Spacer
--			END AS Comm4
--	  ,CASE
--			WHEN c.Punch Is Null
--			THEN c.Punch
--			ELSE 'PUNCH: '+c.Punch
--			END AS Comm5
--	  ,Null AS Comm6
--	  ,Null AS Comm7
--	  ,CASE
--		WHEN c.Holder Is Null
--		THEN c.Holder
--		ELSE 'HOLDER: ' + c.Holder
--		END AS Comm8
--	  ,Bulk_PN AS Comp1
--	  ,'CUT TO ' + [Assy_Length_Inches] + ' IN  (' + [Qty_Links] + ' LINKS)' AS Comp1_Comm
--	  ,Qty_Feet AS Comp1_Qty
--	  ,Assy_Length_Inches AS Comp1_CutTo
--	  ,Pin_Link_PN AS Comp2
--	  ,Null AS Comp2_Comm
--	  ,Pin_Link_Qty AS Comp2_Qty
--	  ,Outer_Link_PN AS Comp3
--	  ,Null AS Comp3_Comm
--	  ,Outer_Link_Qty AS Comp3_Qty
--	  ,Anchor_A_PN AS Comp4
--	  ,Null AS Comp4_Comm
--	  ,Anchor_A_Qty AS Comp4_Qty
--	  ,Assy_Length_Inches AS Comp4_CutTo
--	  ,Anchor_B_PN AS Comp5
--	  ,Null AS Comp5_Comm
--	  ,Anchor_B_Qty AS Comp5_Qty
--	  ,Inner_Link_PN AS Comp6
--	  ,Null AS Comp6_Comm
--	  ,Inner_Link_Qty AS Comp6_Qty
--	  ,Null AS Comp7
--	  ,Null AS Comp7_Comm
--	  ,Null AS Comp7_Qty
--	  ,Null AS Comp8
--	  ,Null AS Comp8_Comm
--	  ,Null AS Comp8_Qty
--	  ,[Print/Chart_Req]
--FROM c
--WHERE [Man_Add_AS400]='NO'
--AND c.PN >''
--AND c.PN Not Like '3______'
--AND Bulk_PN >''
--AND ([Qty_Feet] Not Like '%BULK%' And [Qty_Feet] Not Like '%AR%' And [Qty_Feet] Not Like '%NLA%')
--AND [Print/Chart_Req]='NO'
--)

(
Select * From dh
Union
Select * From dy

--SPN Change
--Uncomment this section when SPN becomes effective.
--Union
--Select * From dspn
)

GO
