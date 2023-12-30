SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




-- =============================================
--Author: Newell, R
--Date: 2021-10-20
--Purpose:	This view displays the data which needs exported to OPENDB each day.
--Last modified date:
--Modification notes:

-- =============================================



CREATE VIEW [dbo].[ref_PDC_DC_OPENDB] AS

SELECT HostPartID
      ,HostLocID
      ,SKUCust17
  FROM dbo.ref_PDC_DC


GO
