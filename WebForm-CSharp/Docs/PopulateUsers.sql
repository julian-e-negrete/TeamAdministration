USE [TeamAdministration]
GO

INSERT INTO [dbo].[Usuarios]([username], [email], [pass])
     VALUES('Julian Negrete','juliannegrete77@gmail.com','25744933')
GO

-- WITHOUT apoderado
INSERT INTO [dbo].[Usuarios]([username], [email], [pass])
     VALUES('Julian','juliannegrete77@gmail.com','4523734844')
GO

INSERT INTO [dbo].[Usuarios]([username], [email], [pass])
     VALUES('luciana','juliannegrete77@gmail.com','4523734844')
GO

INSERT INTO [dbo].[Usuarios]([username], [email], [pass])
     VALUES('Diego','juliannegrete77@gmail.com','4523734844')
GO
INSERT INTO [dbo].[Usuarios]([username], [email], [pass])
     VALUES('ZOE','juliannegrete77@gmail.com','4523734844')
GO


INSERT INTO [dbo].[Usuarios]([username], [email], [pass])
     VALUES('matias','juliannegrete77@gmail.com','4523734844')
GO



-- add them to a team

INSERT INTO [dbo].[user_apo]([ID_Usuario],[ID_Apoderado]) VALUES(6, 2)
INSERT INTO [dbo].[user_apo]([ID_Usuario],[ID_Apoderado]) VALUES(6, 3)
INSERT INTO [dbo].[user_apo]([ID_Usuario],[ID_Apoderado]) VALUES(6, 4)
INSERT INTO [dbo].[user_apo]([ID_Usuario],[ID_Apoderado]) VALUES(6, 5)
           
           
GO





