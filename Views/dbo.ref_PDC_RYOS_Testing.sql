SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO








-- =============================================
--Author: Sexton, C
--Date: 2022-03-07
--Purpose:	This view displays RYOS old/new delta for testing.
--			
--Last modified date:
--Modification notes:

-- =============================================



CREATE VIEW [dbo].[ref_PDC_RYOS_Testing] AS

With d as
(
Select n.PN
	  ,n.RYOS as New_RYOS
	  ,o.RYOS as Old_RYOS
	  ,Abs(n.RYOS-o.RYOS) as Delta
	  From ref_PDC_RYOS n
	  Join ref_PDC_RYOS_Access o
	  On n.PN=o.PN
	  Where Abs(n.RYOS-o.RYOS)>2 and o.RYOS<>200 and n.RYOS<>200
)

Select PN
	  ,New_RYOS
	  ,Old_RYOS
	  ,Delta

From d
--Order by Delta DESC
GO
