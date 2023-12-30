CREATE TABLE [dbo].[inp_Picklist_CO_Part]
(
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[inp_Picklist_CO_Part] ADD CONSTRAINT [PK_inp_Picklist_CO_Part] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[inp_Picklist_CO_Part] TO [GLOBAL\AP PDC Users]
GO
GRANT INSERT ON  [dbo].[inp_Picklist_CO_Part] TO [GLOBAL\AP PDC Users]
GO
GRANT SELECT ON  [dbo].[inp_Picklist_CO_Part] TO [GLOBAL\AP PDC Users]
GO
GRANT UPDATE ON  [dbo].[inp_Picklist_CO_Part] TO [GLOBAL\AP PDC Users]
GO
