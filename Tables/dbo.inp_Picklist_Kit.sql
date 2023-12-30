CREATE TABLE [dbo].[inp_Picklist_Kit]
(
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[inp_Picklist_Kit] ADD CONSTRAINT [PK_x_inp_Picklist] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[inp_Picklist_Kit] TO [GLOBAL\AP PDC Users]
GO
GRANT INSERT ON  [dbo].[inp_Picklist_Kit] TO [GLOBAL\AP PDC Users]
GO
GRANT SELECT ON  [dbo].[inp_Picklist_Kit] TO [GLOBAL\AP PDC Users]
GO
GRANT UPDATE ON  [dbo].[inp_Picklist_Kit] TO [GLOBAL\AP PDC Users]
GO
