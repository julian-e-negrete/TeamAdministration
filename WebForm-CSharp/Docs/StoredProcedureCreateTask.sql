use TeamAdministration
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.CreateTask
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
