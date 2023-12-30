CREATE TABLE [dbo].[inp_Picklist_DGCO]
(
[ECN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[inp_Picklist_DGCO] ADD CONSTRAINT [PK_inp_Picklist_DGCO] PRIMARY KEY CLUSTERED ([ECN]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[inp_Picklist_DGCO] TO [GLOBAL\AP PDC Users]
GO
GRANT INSERT ON  [dbo].[inp_Picklist_DGCO] TO [GLOBAL\AP PDC Users]
GO
GRANT SELECT ON  [dbo].[inp_Picklist_DGCO] TO [GLOBAL\AP PDC Users]
GO
GRANT UPDATE ON  [dbo].[inp_Picklist_DGCO] TO [GLOBAL\AP PDC Users]
GO
