-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.GetTareas 
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

	INSERT INTO dbo.Tareas ([Title], [Description], [Created_Date], [state] ) VALUES(@Title, @Description, SYSDATETIME(), 1)

	DECLARE @var1 INT;
	SELECT @var1 = (SELECT SCOPE_IDENTITY());

	INSERT INTO [dbo].[Tarea_User]([ID_Tarea],[ID_Usuario],[ID_Apoderado]) VALUES(@var1,@ID_User, @ID_Apoderado)

END

GO
/****** Object:  StoredProcedure [dbo].[ASignUser]    Script Date: 9/6/2023 7:14:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.[ASignUser]
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

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE CreateUser 
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

GO
/****** Object:  StoredProcedure [dbo].[GetTareas]    Script Date: 9/6/2023 11:26:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].GetUsers 
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
		WHERE (usr.ID_Usuario = @ID_user ) AND (@username = '' or [username] = @username) ) AND NOT(ID = @ID_user);

     
END

GO
/****** Object:  StoredProcedure [dbo].[CreateTask]    Script Date: 9/11/2023 12:52:07 PM ******/
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
