SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE View [dbo].[zchain_Detail_20221030] as

With c AS
(
SELECT [Man_Add_AS400]
      ,[Initials]
      ,[OEM]
      ,[HPN-YPN] AS PN
      ,[ProdPN] 
      ,[Bulk_PN]
      ,[Qty_Feet]
      ,[CutTo_Inches] AS Assy_Length_Inches
      ,[Qty_Links]
      ,[Chart]
      ,[Print/Chart_Req]
      ,bom.[Standard]
      ,[Origin_Date]
      ,[Maint_Date]
      ,[Memo]
      ,[PDC_Only_Comments]
      ,[Assy_Comments]
      ,[Chain_Type]
      ,[Original_Table]
      ,[Pin_Link_PN] 
      ,[Pin_Link_Qty]
      ,[Outer_Link_PN]
      ,[Outer_Link_Qty]
      ,[Inner_Link_PN]
      ,[Inner_Link_Qty]
      ,[Anchor_A_PN]
      ,[Anchor_A_Qty]
      ,[Anchor_B_PN]
      ,[Anchor_B_Qty]
	  ,CASE
			WHEN b1.Additional_Info Like '%Hand Press%'
			THEN b1.Additional_Info
			WHEN b2.Additional_Info Like '%Hand Press%'
			THEN b2.Additional_Info
			WHEN b1.Hyster_PN Is Null
			THEN b2.Spacer_Plate
			ELSE b1.Spacer_Plate
			END AS Spacer
	  ,CASE
			WHEN b1.Hyster_PN Is Null
			THEN b2.Punch
			ELSE b1.Punch
			END AS Punch
	  ,CASE
			WHEN b1.Hyster_PN Is Null
			THEN b2.Holder
			ELSE b1.Holder
			END AS Holder
	  ,[Date/Time_Stamp]
FROM [dbo].[chain_BOM] bom
LEFT JOIN dbo.chain_Bulk AS b1
ON Bulk_PN=b1.Hyster_PN
LEFT JOIN dbo.chain_Bulk As b2
ON Bulk_PN=b2.[Cross]
--WHERE [HPN-YPN]='2082832'
)
, d AS
(
SELECT [Man_Add_AS400]
	  ,CASE 
			WHEN c.[OEM]='HYS'
			THEN 'HYSTER'
			WHEN c.[OEM]='YAL'
			THEN 'YALE'
			ELSE Null
			END AS Brand
	  ,Null AS [Alt_Build]
	  ,YEAR(GETDATE())+ Right('0' + MONTH(GETDATE()),2) & Right('0' +DAY(GETDATE()),2) AS [Rev_Date]
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
	  ,Bulk_PN AS Comp1
	  ,'CUT TO ' + [Assy_Length_Inches] + ' IN  (' + [Qty_Links] + ' LINKS)' AS Comp1_Comm
	  ,Qty_Feet AS Comp1_Qty
	  ,Assy_Length_Inches AS Comp1_CutTo
	  ,Pin_Link_PN AS Comp2
	  ,Null AS Comp2_Comm
	  ,Pin_Link_Qty AS Comp2_Qty
	  ,Outer_Link_PN AS Comp3
	  ,Null AS Comp3_Comm
	  ,Outer_Link_Qty AS Comp3_Qty
	  ,Anchor_A_PN AS Comp4
	  ,Null AS Comp4_Comm
	  ,Anchor_A_Qty AS Comp4_Qty
	  ,Assy_Length_Inches AS Comp4_CutTo
	  ,Anchor_B_PN AS Comp5
	  ,Null AS Comp5_Comm
	  ,Anchor_B_Qty AS Comp5_Qty
	  ,Null AS Comp6
	  ,Null AS Comp6_Comm
	  ,Null AS Comp6_Qty
	  ,Null AS Comp7
	  ,Null AS Comp7_Comm
	  ,Null AS Comp7_Qty
	  ,Null AS Comp8
	  ,Null AS Comp8_Comm
	  ,Null AS Comp8_Qty
	  ,Inner_Link_PN
	  ,Inner_Link_Qty
	  ,[Print/Chart_Req]
FROM c
WHERE [Man_Add_AS400]='NO'
AND ([OEM] ='HYS' OR [OEM]='YAL')
AND c.PN Not Like '3______'
AND Bulk_PN >''
AND ([Qty_Feet] Not Like '%BULK%' And [Qty_Feet] Not Like '%AR%' And [Qty_Feet] Not Like '%NLA%')
AND [Print/Chart_Req]='NO'
)
SELECT *
FROM d
--WHERE PN='2082832'

GO
