SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[sp_PDC_Part_Final_Replacement] AS

TRUNCATE TABLE dbo.ref_PDC_Part_Final_Replacement;


---- =============================================
----Author: Newell, R
----Date: 2020-04-13
----Purpose: Empty and populate a table containing PDC PNs with their final replacing PNs and Quantities. 
----Last modified date:
----Modification notes: 
---- =============================================



WITH [1st] AS
(
SELECT [PN] AS [Cancelled_PN]
      ,[OC]
	  ,[SC]
	  ,[RP_Part_No]
      ,[RP_Replacing_Part_No] AS [Repl1]
      ,[RP_Replacing_Qty] AS [Repl1_Qty]
  FROM [dbo].[ref_PDC_Part_Detail] d
  JOIN [dbo].[pdc_Parts_Master_Replacing_Parts] r0
  ON d.PN=r0.[RP_Part_No]
  WHERE  [OC]='8' AND ([SC]='1' OR [SC]='6')
)
,[2nd] AS
(
SELECT [Cancelled_PN]
      ,[Repl1]
      ,[Repl1_Qty]
	  ,[RP_Replacing_Part_No] AS [Repl2]
	  ,[RP_Replacing_Qty]*[Repl1_Qty] AS [Repl2_Qty]
  FROM [1st]
  LEFT JOIN [dbo].[pdc_Parts_Master_Replacing_Parts] r1
  ON [1st].[Repl1]=r1.[RP_Part_No]
)
,[3rd] AS
(
SELECT [Cancelled_PN]
      ,[Repl1]
      ,[Repl1_Qty]
	  ,[Repl2]
      ,[Repl2_Qty]
	  ,[RP_Replacing_Part_No] AS [Repl3]
	  ,[RP_Replacing_Qty]*[Repl2_Qty] AS [Repl3_Qty]
  FROM [2nd]
  LEFT JOIN [dbo].[pdc_Parts_Master_Replacing_Parts] r1
  ON [2nd].[Repl2]=r1.[RP_Part_No]
)
,[4th] AS
(
SELECT [Cancelled_PN]
      ,[Repl1]
      ,[Repl1_Qty]
	  ,[Repl2]
      ,[Repl2_Qty]
	  ,[Repl3]
      ,[Repl3_Qty]
	  ,[RP_Replacing_Part_No] AS [Repl4]
	  ,[RP_Replacing_Qty]*[Repl3_Qty] AS [Repl4_Qty]
  FROM [3rd]
  LEFT JOIN [dbo].[pdc_Parts_Master_Replacing_Parts] r1
  ON [3rd].[Repl3]=r1.[RP_Part_No]
)
,[5th] AS
(
SELECT [Cancelled_PN]
      ,[Repl1]
      ,[Repl1_Qty]
	  ,[Repl2]
      ,[Repl2_Qty]
	  ,[Repl3]
      ,[Repl3_Qty]
	  ,[Repl4]
      ,[Repl4_Qty]
	  ,[RP_Replacing_Part_No] AS [Repl5]
	  ,[RP_Replacing_Qty]*[Repl4_Qty] AS [Repl5_Qty]
  FROM [4th]
  LEFT JOIN [dbo].[pdc_Parts_Master_Replacing_Parts] r1
  ON [4th].[Repl4]=r1.[RP_Part_No]
)
,[6th] AS
(
SELECT [Cancelled_PN]
      ,[Repl1]
      ,[Repl1_Qty]
	  ,[Repl2]
      ,[Repl2_Qty]
	  ,[Repl3]
      ,[Repl3_Qty]
	  ,[Repl4]
      ,[Repl4_Qty]
	  ,[Repl5]
      ,[Repl5_Qty]
	  ,[RP_Replacing_Part_No] AS [Repl6]
	  ,[RP_Replacing_Qty]*[Repl5_Qty] AS [Repl6_Qty]
  FROM [5th]
  LEFT JOIN [dbo].[pdc_Parts_Master_Replacing_Parts] r1
  ON [5th].[Repl5]=r1.[RP_Part_No]
)
,[7th] AS
(
SELECT [Cancelled_PN]
      ,[Repl1]
      ,[Repl1_Qty]
	  ,[Repl2]
      ,[Repl2_Qty]
	  ,[Repl3]
      ,[Repl3_Qty]
	  ,[Repl4]
      ,[Repl4_Qty]
	  ,[Repl5]
      ,[Repl5_Qty]
	  ,[Repl6]
      ,[Repl6_Qty]
	  ,[RP_Replacing_Part_No] AS [Repl7]
	  ,[RP_Replacing_Qty]*[Repl6_Qty] AS [Repl7_Qty]
  FROM [6th]
  LEFT JOIN [dbo].[pdc_Parts_Master_Replacing_Parts] r1
  ON [6th].[Repl6]=r1.[RP_Part_No]
)
,[8th] AS
(
SELECT [Cancelled_PN]
      ,[Repl1]
      ,[Repl1_Qty]
	  ,[Repl2]
      ,[Repl2_Qty]
	  ,[Repl3]
      ,[Repl3_Qty]
	  ,[Repl4]
      ,[Repl4_Qty]
	  ,[Repl5]
      ,[Repl5_Qty]
	  ,[Repl6]
      ,[Repl6_Qty]
	  ,[Repl7]
      ,[Repl7_Qty]
	  ,[RP_Replacing_Part_No] AS [Repl8]
	  ,[RP_Replacing_Qty]*[Repl7_Qty] AS [Repl8_Qty]
  FROM [7th]
  LEFT JOIN [dbo].[pdc_Parts_Master_Replacing_Parts] r1
  ON [7th].[Repl7]=r1.[RP_Part_No]
)
,[9th] AS
(
SELECT [Cancelled_PN]
      ,[Repl1]
      ,[Repl1_Qty]
	  ,[Repl2]
      ,[Repl2_Qty]
	  ,[Repl3]
      ,[Repl3_Qty]
	  ,[Repl4]
      ,[Repl4_Qty]
	  ,[Repl5]
      ,[Repl5_Qty]
	  ,[Repl6]
      ,[Repl6_Qty]
	  ,[Repl7]
      ,[Repl7_Qty]
	  ,[Repl8]
      ,[Repl8_Qty]
	  ,[RP_Replacing_Part_No] AS [Repl9]
	  ,[RP_Replacing_Qty]*[Repl8_Qty] AS [Repl9_Qty]
  FROM [8th]
  LEFT JOIN [dbo].[pdc_Parts_Master_Replacing_Parts] r1
  ON [8th].[Repl8]=r1.[RP_Part_No]
)
,[10th] AS
(
  SELECT [Cancelled_PN]
      ,[Repl1]
      ,[Repl1_Qty]
	  ,[Repl2]
      ,[Repl2_Qty]
	  ,[Repl3]
      ,[Repl3_Qty]
	  ,[Repl4]
      ,[Repl4_Qty]
	  ,[Repl5]
      ,[Repl5_Qty]
	  ,[Repl6]
      ,[Repl6_Qty]
	  ,[Repl7]
      ,[Repl7_Qty]
	  ,[Repl8]
      ,[Repl8_Qty]
	  ,[Repl9]
      ,[Repl9_Qty]
	  ,[RP_Replacing_Part_No] AS [Repl10] 
	  ,[RP_Replacing_Qty]*[Repl9_Qty] AS [Repl10_Qty]
  FROM [9th]
  LEFT JOIN [dbo].[pdc_Parts_Master_Replacing_Parts] r1
  ON [9th].[Repl9]=r1.[RP_Part_No]
    --WHERE [Cancelled_PN]=' 0287110'
  )
INSERT INTO dbo.ref_PDC_Part_Final_Replacement 
SELECT [Cancelled_PN]
	 , CASE 
 	     WHEN [Repl10] IS NOT NULL
		 THEN [Repl10]
		 WHEN [Repl9] IS NOT NULL
		 THEN [Repl9]
		 WHEN [Repl8] IS NOT NULL
		 THEN [Repl8]
		 WHEN [Repl7] IS NOT NULL
		 THEN [Repl7]
		 WHEN [Repl6] IS NOT NULL
		 THEN [Repl6]
		 WHEN [Repl5] IS NOT NULL
		 THEN [Repl5]
		 WHEN [Repl4] IS NOT NULL
		 THEN [Repl4]
		 WHEN [Repl3] IS NOT NULL
		 THEN [Repl3]
		 WHEN [Repl2] IS NOT NULL
		 THEN [Repl2]
		 WHEN [Repl1] IS NOT NULL
		 THEN [Repl1]
         END AS [Final_Replacement_PN]
	 , CASE
 	     WHEN [Repl10_Qty] IS NOT NULL
		 THEN [Repl10_Qty]
		 WHEN [Repl9_Qty] IS NOT NULL
		 THEN [Repl9_Qty]
		 WHEN [Repl8_Qty] IS NOT NULL
		 THEN [Repl8_Qty]
		 WHEN [Repl7_Qty] IS NOT NULL
		 THEN [Repl7_Qty]
		 WHEN [Repl6_Qty] IS NOT NULL
		 THEN [Repl6_Qty]
		 WHEN [Repl5_Qty] IS NOT NULL
		 THEN [Repl5_Qty]
		 WHEN [Repl4_Qty] IS NOT NULL
		 THEN [Repl4_Qty]
		 WHEN [Repl3_Qty] IS NOT NULL
		 THEN [Repl3_Qty]
		 WHEN [Repl2_Qty] IS NOT NULL
		 THEN [Repl2_Qty]
		 WHEN [Repl1_Qty] IS NOT NULL
		 THEN [Repl1_Qty]
         END AS [Final_Replacement_Qty]
	 ,CASE
	     WHEN [Repl1] IS NOT NULL AND [Repl10] IS NULL AND [Repl9] IS NULL AND [Repl8] IS NULL AND [Repl7] IS NULL AND [Repl6] IS NULL AND [Repl5] IS NULL AND [Repl4] IS NULL AND [Repl3] IS NULL AND [Repl2] IS NULL
	     THEN 'Yes'
	     ELSE 'No'
	     END AS [1st_Replacing_PN]
	  ,[Repl1]
      ,[Repl1_Qty]
	  ,[Repl2]
      ,[Repl2_Qty]
	  ,[Repl3]
      ,[Repl3_Qty]
	  ,[Repl4]
      ,[Repl4_Qty]
	  ,[Repl5]
      ,[Repl5_Qty]
	  ,[Repl6]
      ,[Repl6_Qty]
	  ,[Repl7]
      ,[Repl7_Qty]
	  ,[Repl8]
      ,[Repl8_Qty]
	  ,[Repl9]
      ,[Repl9_Qty]
	  ,[Repl10] 
	  ,[Repl10_Qty]
	  FROM [10th]
GO
