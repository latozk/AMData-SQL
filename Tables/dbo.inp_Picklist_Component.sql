CREATE TABLE [dbo].[inp_Picklist_Component]
(
[PN] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Col] [numeric] (1, 0) NULL CONSTRAINT [DF_inp_Picklist_Component_Col] DEFAULT ((1)),
[ID] [nchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[inp_Picklist_Component] ADD CONSTRAINT [PK_inp_Picklist_Component] PRIMARY KEY CLUSTERED ([PN]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[inp_Picklist_Component] TO [GLOBAL\AP PDC Users]
GO
GRANT INSERT ON  [dbo].[inp_Picklist_Component] TO [GLOBAL\AP PDC Users]
GO
GRANT SELECT ON  [dbo].[inp_Picklist_Component] TO [GLOBAL\AP PDC Users]
GO
GRANT UPDATE ON  [dbo].[inp_Picklist_Component] TO [GLOBAL\AP PDC Users]
GO
