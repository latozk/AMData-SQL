SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
Create View [dbo].[vw_UTIL_Active_Stored_Prcedures] as
SELECT
  object_name(st.objectid) as ProcName
FROM
  sys.dm_exec_connections as qs 
CROSS APPLY sys.dm_exec_sql_text(qs.most_recent_sql_handle) st 
WHERE
  object_name(st.objectid) is not null
GO
