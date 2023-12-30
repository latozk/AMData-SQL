SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE procedure [dbo].[sp_UTIL_Table_Where_Used] @ObjectName varchar(50)
as 

-- =============================================
--Author: Latoz, K
--Date: 2020-06-27
--Purpose:Return list of places an object is used
--
--Last modified date: 
--Modification notes:
-- =============================================

select schema_name(o.schema_id) + '.' + o.name as [table],
       'is used by' as ref,
       schema_name(ref_o.schema_id) + '.' + ref_o.name as [object],
       ref_o.type_desc as object_type
from sys.objects o
join sys.sql_expression_dependencies dep
     on o.object_id = dep.referenced_id
join sys.objects ref_o
     on dep.referencing_id = ref_o.object_id
where o.type in ('V', 'U')
     -- and schema_name(o.schema_id) = 'eng_Part_Unit_Div_Contract' 
      and o.name = @ObjectName 
order by [object]


--exec sp_sys_Object_Where_Used 'eng_Part_Unit_Div_Contract'
GO
