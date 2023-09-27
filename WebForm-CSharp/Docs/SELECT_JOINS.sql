USE [TeamAdministration]
GO


-- Asignadas al usuario
SELECT [ID],[Title],[Description],[Created_Date],[Finished_Date],[Deleted_Date]
FROM [dbo].[Tareas]
LEFT JOIN dbo.Tarea_User pdj  ON pdj.ID_Tarea = ID
WHERE (pdj.ID_Apoderado = 1) AND ([state] =  1)


-- El usuario Asigno
SELECT [ID] as ID_Tarea,[Title],[Description],[Created_Date],[Finished_Date],[Deleted_Date]
FROM [dbo].[Tareas]
LEFT JOIN dbo.Tarea_User pdj  ON pdj.ID_Tarea = ID
WHERE pdj.ID_Usuario = 6


 SELECT [username],[email]
 FROM TeamAdministration.[dbo].[Usuarios]
 LEFT JOIN dbo.user_apo usr ON usr.ID_Apoderado= ID
 WHERE usr.ID_Usuario  = 6


 SELECT ID FROM Usuarios WHERE email = 'juliannegrete77@gmail.com' AND pass = '25744933'


 	SELECT DISTINCT ID, username, email
		FROM [TeamAdministration].[dbo].[Usuarios]
		WHERE ID NOT IN(
		SELECT DISTINCT ID
		FROM [TeamAdministration].[dbo].[Usuarios]
		LEFT JOIN dbo.user_apo usr ON usr.ID_Apoderado = ID 
		WHERE (usr.ID_Usuario = 1 )  )AND NOT(ID = 1)