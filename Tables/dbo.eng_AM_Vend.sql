CREATE TABLE [dbo].[eng_AM_Vend]
(
[Abbr] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Name] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Reference] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[eng_AM_Vend] ADD CONSTRAINT [PK_eng_AM_Vendor_Name] PRIMARY KEY CLUSTERED ([Abbr]) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[eng_AM_Vend] TO [GLOBAL\PDC_AMData_AMDC]
GO
GRANT SELECT ON  [dbo].[eng_AM_Vend] TO [GLOBAL\PDC_AMData_Marketing]
GO
