SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[ref_CORE_PN_XRef_Legacy_Layout] as

--************************************************************************
--                            [0) CORE PN Misc Info (includes active crosses)]
--***********************************************************************
-- =============================================
--Author: Latoz, K
--Date: 2020-08-04
--Purpose: This is a legacy view to accomodate Access queries many people have linked to this table name with these field names
--   
--Last modified date: 
--Modification notes: 
-- =============================================


SELECT CORE_PN as [CORE PN]
      ,PN as PN
      ,XPN as XPN
      ,PNAS400Fmt as PNas400Fmt
      ,XPNas400Fmt as XPNas400Fmt
      ,Status as [Status]
      ,Type as TypeCd
      ,Desc_1 as Desc1
      ,Desc_2 as Desc2
      ,Desc_3 as Desc3
      ,HCE as HCE
      ,Kit_List as KitList
      ,Part_In_Use as PartInUse
      ,Comm as CommCd
      ,Rel_Proj as Proj
      ,Rel_ECN as RelECN
      ,Rel_Date as ECNRelDt
      ,Replacing_Part as ReplacingPN
      ,VASP_List as VASPLst
      ,VaSP_ECN_Date as VASPECNDt
      ,Chart as ChartNo
      ,CAD_Sys as CADType
      , Loc as Loc
      ,Rev as RevLvl
      ,Dwg_Size as DwgSz
      ,Shts as Shts
      ,UOM as UOM
      ,Tran_Status as TranStatus
      ,ECN as ECN
      ,Serviced as [ServiceY/N]
  FROM [AMData].[dbo].[ref_CORE_PN_XRef]
GO
