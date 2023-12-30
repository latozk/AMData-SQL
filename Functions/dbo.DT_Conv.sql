SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		K.Latoz
-- Create date: 02/20/2020
-- Description:	Function to convert date from CYYMMDD to MM/DD/YYYY
-- =============================================
CREATE FUNCTION [dbo].[DT_Conv] (@DT_Input nvarchar(10))
RETURNS nvarchar(50) 
AS
BEGIN
	-- Declare the return variable here
	DECLARE @DT_Conv as nvarchar(50) 
	DECLARE @DT_Temp as nvarchar(10)

	Set @DT_Temp = @DT_Input+19000000
	SET @DT_Conv = 	
CASE	
   When @DT_Input = '0' Then Null
   When @DT_Input  > '0'  and isdate(convert(varchar(8), @DT_Temp))=1 
   --Then Convert(date, Convert(varchar(50), @DT_Input+19000000),126) 
    Then concat(substring(@DT_Temp, 1,4), '-' , substring(@DT_Temp, 5,2), '-', Substring(@DT_Temp, 7,2))
	--Convert(varchar(50), @DT_Input+19000000)
	--Then Convert(DateTime, Convert(VarChar(8), @DT_Input + 19000000))
	--Then Convert(date, Convert(varchar(50), @DT_Temp), 126)
Else Null
END


	-- Return the result of the function
RETURN @DT_Conv;

END

GO
