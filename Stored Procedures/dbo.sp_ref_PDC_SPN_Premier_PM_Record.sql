SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[sp_ref_PDC_SPN_Premier_PM_Record]  AS


Truncate Table ref_PDC_SPN_Premier_PM_Record;

With p As
(
SELECT Left('Y'+RTrim(LTrim(Oem_Part_No)),12) As PN
	  ,Hys_Part_No As Mimic_PN
	  ,d.PN As dPN
	  ,'Allmakes System - Uses PDC HPN as SPN if crossed to PRE PN' As Category
      ,[Desc]
      ,[Comm]
      ,[Combi]
      ,[Alpha]
      ,[DS]
      ,[NsCd]
      ,[PrdCls]
      ,[PrdTyp]
      ,[PrtType]
      ,[OC]
      ,[SC]
      ,[PkgCd]
      ,[PkgQty]
  FROM dbo.ref_PDC_SPN_PRE_YAL_to_HYS_X_Ref am
  Left Join dbo.ref_PDC_SPN_X_Ref x
  On Left('Y'+RTrim(LTrim(Oem_Part_No)),12)=x.PN
  Join dbo.ref_PDC_Part_Set_Detail d
  On Hys_Part_No=d.PN
  --Where x.PN Is Null 
Where OEM_Code='PRE' And Hys_Part_No<>' $'  And Hys_Part_No>' '
)

Insert Into ref_PDC_SPN_Premier_PM_Record
Select * 
--Into ref_PDC_SPN_Premier_PM_Record
From p

GO
