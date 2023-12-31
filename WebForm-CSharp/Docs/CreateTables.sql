USE TeamAdministration
/*
   Monday, August 28, 20231:32:34 PM
   User: 
   Server: (localdb)\MSSQLLocalDB
   Database: WebFormsCSharp
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/

BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE [dbo].[Usuarios](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50)  NULL,
	[email] [varchar](50) NOT NULL,
	[pass] [varchar](50) NOT NULL,
	[ID_Apoderado] [int]  NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE dbo.Usuarios SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

SET QUOTED_IDENTIFIER ON
GO
BEGIN TRANSACTION
CREATE TABLE [dbo].[Tareas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_User][int] NOT NULL,
	[Title][varchar](50) NOT NULL,
	[Description] [varchar](MAX) NULL,
	[Created_Date] DATE  NULL,
	[Finished_Date] DATE  NULL,
	[Deleted_Date] DATE NULL,
	[state] int NOT NULL
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Tareas]
ADD CONSTRAINT ID_User FOREIGN KEY (ID_User) REFERENCES [dbo].[Usuarios](ID);

ALTER TABLE [dbo].[Tareas]
ALTER COLUMN [Created_Date] DATE;

ALTER TABLE [dbo].[Tareas]
ALTER COLUMN [Finished_Date] DATE;

ALTER TABLE [dbo].[Tareas]
ALTER COLUMN [Deleted_Date] DATE;


COMMIT


USE TeamAdministration
/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/

BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE [dbo].[Team](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_User] [int] NOT NULL,
	[Title] [varchar](50)  NULL,
	[Description] [varchar](100) NOT NULL
	
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE dbo.[Team] SET (LOCK_ESCALATION = TABLE)
ALTER TABLE [dbo].[Team]
ADD CONSTRAINT ID_User FOREIGN KEY (ID_User) REFERENCES [dbo].[Usuarios](ID);
GO
COMMIT

