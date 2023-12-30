CREATE TABLE [dbo].[inp_Picklist_CO_Dt]
(
[Dt] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[inp_Picklist_CO_Dt] ADD CONSTRAINT [PK_inp_Picklist_CO_Dt] PRIMARY KEY CLUSTERED ([Dt]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[inp_Picklist_CO_Dt] TO [GLOBAL\AP PDC Users]
GO
GRANT INSERT ON  [dbo].[inp_Picklist_CO_Dt] TO [GLOBAL\AP PDC Users]
GO
GRANT SELECT ON  [dbo].[inp_Picklist_CO_Dt] TO [GLOBAL\AP PDC Users]
GO
GRANT UPDATE ON  [dbo].[inp_Picklist_CO_Dt] TO [GLOBAL\AP PDC Users]
GO
