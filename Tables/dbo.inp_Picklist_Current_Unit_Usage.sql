CREATE TABLE [dbo].[inp_Picklist_Current_Unit_Usage]
(
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[inp_Picklist_Current_Unit_Usage] ADD CONSTRAINT [PK_inp_Picklist_Current_Usage] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[inp_Picklist_Current_Unit_Usage] TO [GLOBAL\AP PDC Users]
GO
GRANT INSERT ON  [dbo].[inp_Picklist_Current_Unit_Usage] TO [GLOBAL\AP PDC Users]
GO
GRANT SELECT ON  [dbo].[inp_Picklist_Current_Unit_Usage] TO [GLOBAL\AP PDC Users]
GO
GRANT UPDATE ON  [dbo].[inp_Picklist_Current_Unit_Usage] TO [GLOBAL\AP PDC Users]
GO
