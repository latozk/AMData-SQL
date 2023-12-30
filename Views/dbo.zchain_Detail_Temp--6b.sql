SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




--When SPN is implemented, uncomment lines 232 to 294 and 304 to 305.

CREATE View [dbo].[zchain_Detail_Temp--6b] As

With c AS
(
Select bom.[Man_Add_AS400]
      ,bom.[Initials]
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
	  ,bom.Original_Table
	  ,bom.[Date/Time_Stamp]
FROM [dbo].[chain_Detail_6b] bom
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

--View contains field names used for HoseUpd table creation and for O'Neil file creation.  Fields are duplicated in some
--cases but have different aliases for the two different exports.

SELECT [Man_Add_AS400]
	  ,Initials
	  ,Null AS [Alt_Build]
	  ,[Maint_Date] AS [Rev_Date]
	  ,c.PN
	  ,c.HPN
	  ,c.YPN
	  ,c.Assy_Length_Inches
	  ,[Standard]
	  ,[Standard] AS Comm1
	  ,Chain_Type
      ,c.[Chain_Type] AS Comm2
	  ,Assy_Comments
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
	  ,Bulk_PN
	  ,Bulk_HPN
	  ,Bulk_YPN
	  ,Bulk_PN AS Comp1
      ,Bulk_HPN AS Comp1_HPN
	  ,Bulk_YPN AS Comp1_YPN
	  ,'CUT TO ' + [Assy_Length_Inches] + ' IN  (' + [Qty_Links] + ' LINKS)' AS Comp1_Comm
	  ,Qty_Links
	  ,Qty_Feet
	  ,Qty_Feet AS Comp1_Qty
	  ,Assy_Length_Inches As CutTo_Inches
	  ,Assy_Length_Inches AS Comp1_CutTo
	  ,Pin_Link_PN
	  ,Pin_Link_PN AS Comp2
	  ,Pin_Link_HPN
	  ,Pin_Link_HPN AS Comp2_HPN
	  ,Pin_Link_YPN
	  ,Pin_Link_YPN AS Comp2_YPN
	  ,Null AS Comp2_Comm
	  ,Pin_Link_Qty
	  ,Pin_Link_Qty AS Comp2_Qty
	  ,Outer_Link_PN
	  ,Outer_Link_PN AS Comp3
	  ,Outer_Link_HPN
	  ,Outer_Link_HPN AS Comp3_HPN
	  ,Outer_Link_YPN
	  ,Outer_Link_YPN AS Comp3_YPN
	  ,Null AS Comp3_Comm
	  ,Outer_Link_Qty
	  ,Outer_Link_Qty AS Comp3_Qty
	  ,Anchor_A_PN
	  ,Anchor_A_PN AS Comp4
	  ,Anchor_A_HPN
	  ,Anchor_A_HPN AS Comp4_HPN
	  ,Anchor_A_YPN
	  ,Anchor_A_YPN AS Comp4_YPN
	  ,Null AS Comp4_Comm
	  ,Anchor_A_Qty
	  ,Anchor_A_Qty AS Comp4_Qty
	  ,Assy_Length_Inches AS Comp4_CutTo
	  ,Anchor_B_PN
	  ,Anchor_B_PN AS Comp5
	  ,Anchor_B_HPN
	  ,Anchor_B_HPN AS Comp5_HPN
	  ,Anchor_B_YPN
	  ,Anchor_B_YPN AS Comp5_YPN
	  ,Null AS Comp5_Comm
	  ,Anchor_B_Qty
	  ,Anchor_B_Qty AS Comp5_Qty
	  ,Inner_Link_PN
	  ,Inner_Link_PN AS Comp6
	  ,Inner_Link_HPN
	  ,Inner_Link_HPN AS Comp6_HPN
	  ,Inner_Link_YPN
	  ,Inner_Link_YPN AS Comp6_YPN
	  ,Null AS Comp6_Comm
	  ,Inner_Link_Qty
	  ,Inner_Link_Qty AS Comp6_Qty
	  ,Null AS Comp7
	  ,Null AS Comp7_HPN
	  ,Null AS Comp7_YPN
	  ,Null AS Comp7_Comm
	  ,Null AS Comp7_Qty
	  ,Null AS Comp8
	  ,Null AS Comp8_HPN
	  ,Null AS Comp8_YPN
	  ,Null AS Comp8_Comm
	  ,Null AS Comp8_Qty
	  ,Origin_Date
      ,Maint_Date
      ,Memo
      ,PDC_Only_Comments
	  ,Chart
	  ,[Print/Chart_Req]
	  ,Original_Table
	  ,[Date/Time_Stamp]
FROM c


GO
