USE [master]
GO
/****** Object:  Database [TeamAdministration]    Script Date: 9/23/2023 2:22:09 PM ******/
CREATE DATABASE [TeamAdministration]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TeamAdministration', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\TeamAdministration.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TeamAdministration_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\TeamAdministration_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TeamAdministration] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TeamAdministration].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TeamAdministration] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TeamAdministration] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TeamAdministration] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TeamAdministration] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TeamAdministration] SET ARITHABORT OFF 
GO
ALTER DATABASE [TeamAdministration] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TeamAdministration] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TeamAdministration] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TeamAdministration] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TeamAdministration] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TeamAdministration] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TeamAdministration] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TeamAdministration] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TeamAdministration] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TeamAdministration] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TeamAdministration] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TeamAdministration] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TeamAdministration] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TeamAdministration] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TeamAdministration] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TeamAdministration] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TeamAdministration] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TeamAdministration] SET RECOVERY FULL 
GO
ALTER DATABASE [TeamAdministration] SET  MULTI_USER 
GO
ALTER DATABASE [TeamAdministration] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TeamAdministration] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TeamAdministration] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TeamAdministration] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TeamAdministration] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TeamAdministration] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TeamAdministration', N'ON'
GO
ALTER DATABASE [TeamAdministration] SET QUERY_STORE = ON
GO
ALTER DATABASE [TeamAdministration] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TeamAdministration]
GO
/****** Object:  Table [dbo].[Tarea_User]    Script Date: 9/23/2023 2:22:10 PM ******/
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
/****** Object:  Table [dbo].[Tareas]    Script Date: 9/23/2023 2:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tareas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
	[Created_Date] [date] NULL,
	[Finished_Date] [date] NULL,
	[Deleted_Date] [date] NULL,
	[state] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 9/23/2023 2:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_User] [int] NOT NULL,
	[Title] [varchar](50) NULL,
	[Description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_apo]    Script Date: 9/23/2023 2:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_apo](
	[ID_Usuario] [int] NOT NULL,
	[ID_Apoderado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Apoderado] ASC,
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 9/23/2023 2:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[email] [varchar](50) NOT NULL,
	[pass] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
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
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [ID_User] FOREIGN KEY([ID_User])
REFERENCES [dbo].[Usuarios] ([ID])
GO
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [ID_User]
GO
ALTER TABLE [dbo].[user_apo]  WITH CHECK ADD FOREIGN KEY([ID_Apoderado])
REFERENCES [dbo].[Usuarios] ([ID])
GO
ALTER TABLE [dbo].[user_apo]  WITH CHECK ADD FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuarios] ([ID])
GO
/****** Object:  StoredProcedure [dbo].[ASignUser]    Script Date: 9/23/2023 2:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ASignUser]
	-- Add the parameters for the stored procedure here
	@ID_User INT, 
	@ID_Apoderado INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO [dbo].[user_apo]([ID_Usuario],[ID_Apoderado]) VALUES(@ID_User, @ID_Apoderado)


	
END
GO
/****** Object:  StoredProcedure [dbo].[CreateTask]    Script Date: 9/23/2023 2:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateTask]
	-- Add the parameters for the stored procedure here
	@ID_User INT,
	@ID_Apoderado INT,
	@Title varchar(50),
	@Description varchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO dbo.Tareas ([Title], [Description], [Created_Date], [state] ) VALUES(@Title, @Description, GETDATE(), 1)

	DECLARE @var1 INT;
	SELECT @var1 = (SELECT SCOPE_IDENTITY());

	INSERT INTO [dbo].[Tarea_User]([ID_Tarea],[ID_Usuario],[ID_Apoderado]) VALUES(@var1,@ID_User, @ID_Apoderado)

END
GO
/****** Object:  StoredProcedure [dbo].[CreateTeam]    Script Date: 9/23/2023 2:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateTeam]
	-- Add the parameters for the stored procedure here
	@ID_User INT,
	@Title varchar(50),
	@Description varchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO dbo.Team ([ID_User], [Title], [Description]) VALUES(@ID_User, @Title, @Description)

END
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 9/23/2023 2:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateUser] 
	-- Add the parameters for the stored procedure here
	@username VARCHAR(50),
	@email VARCHAR(50),
	@password VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Usuarios]([username], [email], [pass])VALUES(@username,@email,@password)

END
GO
/****** Object:  StoredProcedure [dbo].[GetTareas]    Script Date: 9/23/2023 2:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTareas] 
	-- Add the parameters for the stored procedure here
	@state int,
	@userID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

     SELECT ID, Title, Description, Created_Date, Finished_Date
	 FROM Tareas 
	 LEFT JOIN dbo.Tarea_User pdj  ON pdj.ID_Tarea = ID WHERE (pdj.ID_Apoderado = @userID) AND ([state] =  @state)
END

GO
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 9/23/2023 2:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUsers] 
	-- Add the parameters for the stored procedure here
	@username varchar(50) = '',
	@ID_user INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT DISTINCT ID, username, email
	FROM [TeamAdministration].[dbo].[Usuarios] 
	WHERE ID NOT IN (
		SELECT DISTINCT ID
		FROM [TeamAdministration].[dbo].[Usuarios]
		LEFT JOIN dbo.user_apo usr ON usr.ID_Apoderado = ID 
		WHERE (usr.ID_Usuario = @ID_user ) AND (@username = '' or [username] = @username)
	);

     
END

GO
USE [master]
GO
ALTER DATABASE [TeamAdministration] SET  READ_WRITE 
GO
