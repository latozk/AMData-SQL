SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






-- =============================================
--Author: Newell, R
--Date: 2020-04-27
--Purpose:	This view displays the contents of the eng_ECN table and also includes
--			various corresponding information only available in the eng_ECN_Ext 
--			table.
--			This view will be used in the compilation of ECN information for
--			Aftermarket ECN processing.
--Last modified date:
--Modification notes:
-- =============================================



CREATE VIEW [dbo].[ref_eng_ECN_Header_CO_Dt_pl] AS

SELECT DISTINCT e.[ECN]
  --    ,e.[Init_Date]
  --    ,e.[Model_1]
  --    ,e.[Model_2]
      --,e.[Urgent]
  --    ,e.[Serv_Prob_Ref]
  --    ,e.[Cst_Red]
  --    ,e.[Eff_SN]
  --    ,e.[Serv_Prob]
  --    ,e.[EEC_Affected]
  --    ,e.[UL_FM_Affected]
      ,e.[Origin]
  --    ,e.[T_PN_Proj]
  --    ,e.[IC]
  --    ,e.[EL]
      ,e.[Drive_Line]
      ,e.[Mast_Attch]
      ,e.[SN_Rqd_Unit]
      ,e.[SN_Rqd_Engine]
      ,e.[SN_Rqd_Xmsn]
      ,e.[SN_Rqd_Mast]
      ,e.[SN_Rqd_Attch]
      ,e.[SN_Rqd_None]
  --    ,e.[Sales_Lit_Affected]
  --    ,e.[PFI_SFI_Affected]
  --    ,e.[Tech_Pubs_Affected]
  --    ,e.[Dwgs_Affected]
  --    ,e.[Impl_Reporting]
  --    ,e.[Comp_Common]
  --    ,e.[New_Rel]
      ,e.[Status]
  --    ,e.[Spl_Proc_None]
  --    ,e.[Released]
  --    ,e.[Attch]
      ,e.[Serv_Part_Affected]
  --    ,e.[Desc_1]
  --    ,e.[Desc_2]
  	    ,e.[Desc_1]+ Space(1)+ e.[Desc_2] AS [Desc]
  --    ,e.[VIP]
  --    ,e.[DSN_Appr_ID]
  --    ,e.[RVW_Appr_ID]
  --    ,e.[MFG_Appr_ID]
  --    ,e.[ADM_Appr_ID]
  --    ,e.[DSN_Appr_Date]
  --    ,e.[RVW_Appr_Date]
  --    ,e.[MFG_Appr_Date]
  --    ,e.[ADM_Appr_Date]
      ,e.[Cat_Desc]
      ,e.[User_ID] AS Originator
  --    ,e.[Proj_Prefix]
      ,e.[Proj]
  --    ,e.[Init_Dt]
  --    ,e.[DSN_Appr_Dt]
  --    ,e.[RVW_Appr_Dt]
  --    ,e.[MFG_Appr_Dt]
        ,e.[ADM_Appr_Dt] AS ECN_Rel_Dt
	  ,ex.[Urgent]
      ,ex.[Reason_Desc] AS Reason_for_Work
      --,ex.[OMS_Affected]
      --,ex.[First_Trk_Rev_Rqd]
      --,ex.[FSC_Rqd]
      ,ex.[Unit_SN_Rqd]
      ,ex.[Comp_SN_Rqd]
      --,ex.[Hold_ECN]
      --,ex.[Des_Cons_DB_Consult]
      --,ex.[Agile_CO]
      --,ex.[Eff_Date]
      ,ex.[Eff_Dt]
	  ,l.Loc
	  ,r.Reason
	  ,n.Note
	  ,v.VIP
  FROM dbo.inp_Picklist_CO_Dt p
  LEFT JOIN dbo.eng_ECN e ON p.Dt=e.ADM_Appr_Dt
  LEFT JOIN dbo.eng_ECN_Ext ex ON e.ECN=ex.ECN
  LEFT JOIN dbo.eng_ECN_Loc_CO_Dt_pl l ON e.ECN=l.ECN
  LEFT JOIN dbo.eng_ECN_Reason_Concat_CO_Dt_pl r ON e.ECN=r.ECN
  LEFT JOIN dbo.eng_ECN_Note_Concat_CO_Dt_pl n ON e.ECN=n.ECN
  LEFT JOIN dbo.eng_ECN_VIP_Concat_CO_Dt_pl v ON e.ECN=v.ECN
--WHERE e.[ECN]='16098-01' 
--or e.[ECN]='98704-33'
--or e.[ECN]='70448'
--or e.[ECN]='70473-01'
--or e.[ECN]='59401-17'
--or e.[ECN]='70491'
--or e.[ECN]='70046'
--or e.[ECN]='72111'
--or e.[ECN]='72115-01'
--or e.[ECN]='70215'
--or e.[ECN]='99520'
--or e.[ECN]='70427'
GO
