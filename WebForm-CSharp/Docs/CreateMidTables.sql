USE TeamAdministration
GO


-- if table already exist 
/*
ALTER TABLE [dbo].[Tarea_User] DROP CONSTRAINT [FK__Tarea_Use__ID_Us__59FA5E80]
GO

ALTER TABLE [dbo].[Tarea_User] DROP CONSTRAINT [FK__Tarea_Use__ID_Ta__59063A47]
GO

ALTER TABLE [dbo].[Tarea_User] DROP CONSTRAINT [FK__Tarea_Use__ID_Ap__5AEE82B9]
GO
*/
/****** Object:  Table [dbo].[Tarea_User]    Script Date: 9/4/2023 10:46:44 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tarea_User]') AND type in (N'U'))
DROP TABLE [dbo].[Tarea_User]
GO

/****** Object:  Table [dbo].[Tarea_User]    Script Date: 9/4/2023 10:46:44 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tarea_User](
	[ID_Tarea] [int] NOT NULL,
	[ID_Usuario] [int] NOT NULL,
	[ID_Apoderado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Tarea] ASC,
	[ID_Usuario] ASC,
	[ID_Apoderado] ASC 
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Tarea_User]  WITH CHECK ADD FOREIGN KEY([ID_Apoderado])
REFERENCES [dbo].[Usuarios] ([ID])
GO

ALTER TABLE [dbo].[Tarea_User]  WITH CHECK ADD FOREIGN KEY([ID_Tarea])
REFERENCES [dbo].[Tareas] ([ID])
GO

ALTER TABLE [dbo].[Tarea_User]  WITH CHECK ADD FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuarios] ([ID])
GO






-- Mid table to reference the user and his team
CREATE TABLE [dbo].[user_apo](
	[ID_Usuario] INT,
	[ID_Apoderado] INT,
	FOREIGN KEY (ID_Usuario) REFERENCES Usuarios (ID),
	FOREIGN KEY (ID_Apoderado) REFERENCES Usuarios (ID),
PRIMARY KEY CLUSTERED 
(
	ID_Apoderado, ID_Usuario
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) 
GO



/*

-- Mid table between Tareas y usuarios
CREATE TABLE [dbo].[Tarea_User](
	[ID_Tarea] INT,
	[ID_Usuario] INT,
	[ID_Apoderado] INT,
	FOREIGN KEY (ID_Tarea) REFERENCES Tareas (ID),
	FOREIGN KEY (ID_Usuario) REFERENCES Usuarios (ID),
	FOREIGN KEY (ID_Apoderado) REFERENCES Usuarios (ID),
PRIMARY KEY CLUSTERED 
(
	ID_Tarea, ID_Usuario
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) 
GO
*/

