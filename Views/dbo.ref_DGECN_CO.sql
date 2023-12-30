SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



/* =============================================
Author: Newell, R
Date: 2020-05-05
Purpose:	This view displays the ECN information sent to depots in the 
			nightly batch.  This information can also be used to load 
			CORE ECN information to NPRS (New Parts Readiness System).
Last modified date:
Modification notes:
 =============================================
*/


CREATE VIEW [dbo].[ref_DGECN_CO]


AS
SELECT 'ECN' AS TRNTYP
, 'ADD' AS TRNCDE
, e.Proj AS PRJNUM
, e.ECN AS ECNNUM
, r.Seq AS SEQNUM
, NULL AS HYLFMT
, e.Desc_1 AS ECNTYP
, e.User_ID AS DSNNME
, e.ADM_Appr_Date AS RLSDTE
, e.Serv_Prob AS SRVPRB
, v.VIP AS VIPNUM
, r.Reason AS COMMEN
, x.Eff_Date AS EFFDTE
FROM dbo.inp_Picklist_DGCO pl 
LEFT JOIN dbo.eng_ECN AS e ON pl.ECN=e.ECN
LEFT JOIN dbo.eng_ECN_Reason AS r ON e.ECN = r.ECN 
LEFT JOIN dbo.eng_ECN_Ext AS x ON e.ECN = x.ECN 
LEFT JOIN dbo.eng_ECN_VIP AS v ON e.ECN = v.ECN

GO
GRANT DELETE ON  [dbo].[ref_DGECN_CO] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT INSERT ON  [dbo].[ref_DGECN_CO] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT SELECT ON  [dbo].[ref_DGECN_CO] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT UPDATE ON  [dbo].[ref_DGECN_CO] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "r"
            Begin Extent = 
               Top = 6
               Left = 272
               Bottom = 136
               Right = 442
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "x"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v"
            Begin Extent = 
               Top = 138
               Left = 282
               Bottom = 234
               Right = 452
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'ref_DGECN_CO', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'ref_DGECN_CO', NULL, NULL
GO
