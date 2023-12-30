CREATE TABLE [dbo].[eng_AM_Abbr]
(
[Abbr] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HY_Fmt] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[eng_AM_Abbr] ADD CONSTRAINT [PK_eng_AM_Abbr] PRIMARY KEY CLUSTERED ([Abbr]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[eng_AM_Abbr] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT INSERT ON  [dbo].[eng_AM_Abbr] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT SELECT ON  [dbo].[eng_AM_Abbr] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT UPDATE ON  [dbo].[eng_AM_Abbr] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
