CREATE TABLE [dbo].[inp_Picklist_DGPRT]
(
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[inp_Picklist_DGPRT] ADD CONSTRAINT [PK_inp_Picklist_DGPRT] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[inp_Picklist_DGPRT] TO [GLOBAL\AP PDC Users]
GO
GRANT INSERT ON  [dbo].[inp_Picklist_DGPRT] TO [GLOBAL\AP PDC Users]
GO
GRANT SELECT ON  [dbo].[inp_Picklist_DGPRT] TO [GLOBAL\AP PDC Users]
GO
GRANT UPDATE ON  [dbo].[inp_Picklist_DGPRT] TO [GLOBAL\AP PDC Users]
GO
GRANT DELETE ON  [dbo].[inp_Picklist_DGPRT] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT INSERT ON  [dbo].[inp_Picklist_DGPRT] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT SELECT ON  [dbo].[inp_Picklist_DGPRT] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
GRANT UPDATE ON  [dbo].[inp_Picklist_DGPRT] TO [GLOBAL\PDC_AMData_Pune_Readiness]
GO
