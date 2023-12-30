CREATE TABLE [dbo].[inp_Picklist_Unit]
(
[Unit] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[inp_Picklist_Unit] ADD CONSTRAINT [PK_x_inp_Unit] PRIMARY KEY CLUSTERED ([Unit]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[inp_Picklist_Unit] TO [GLOBAL\AP PDC Users]
GO
GRANT INSERT ON  [dbo].[inp_Picklist_Unit] TO [GLOBAL\AP PDC Users]
GO
GRANT SELECT ON  [dbo].[inp_Picklist_Unit] TO [GLOBAL\AP PDC Users]
GO
GRANT UPDATE ON  [dbo].[inp_Picklist_Unit] TO [GLOBAL\AP PDC Users]
GO
