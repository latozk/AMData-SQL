SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




  CREATE view [dbo].[eng_PN_Proj_XRef_Unique] as 

  -- =============================================
--Author: Latoz, K
--Date: 2020-05-11
--Purpose: Returns unique results from ref_PN_Proj_Xref for Project and PN
--Modification notes:
-- =============================================



Select distinct Proj, PN 
from eng_PN_Proj_Xref 


GO
