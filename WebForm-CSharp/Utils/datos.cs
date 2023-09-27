using System;
using System.Collections.Generic;
using System.Linq;

using System.Web;
using System.Web.UI.WebControls; // sortDirection

using System.Data; // Add this line for DataTable
using System.Data.SqlClient;
using System.Configuration; // Add this line for ConfigurationManager
using System.Text; // Add this using directive for StringBuilder

namespace WebForm_CSharp.Utils
{
    public class datos
    {


        #region Tareas
        public string indexGet(ref DataTable dt,  int ID)
        {
            try
            {
                using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString))
                {
                    MyConnection.Open();

                    using (SqlCommand MyCommand = MyConnection.CreateCommand())
                    {
                        MyCommand.CommandType = CommandType.StoredProcedure; // Set command type to stored procedure
                        MyCommand.CommandText = "getTareas"; // Name of your stored procedure

                        MyCommand.Parameters.AddWithValue("@state", 1); // Assuming ID is a parameter for the stored procedure
                        MyCommand.Parameters.AddWithValue("@userID", ID); // Assuming ID is a parameter for the stored procedure
                        using (SqlDataAdapter adapter = new SqlDataAdapter(MyCommand))
                        {
                            adapter.Fill(dt);
                        }
                    }
                }
                return "success";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string  TareasCompletadas(ref DataTable dt, int ID)
        {
            // DataTable dt = new DataTable();
            // Show an alert after fetching data
            

             try
            {
                using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString))
                {
                    MyConnection.Open();

                    using (SqlCommand MyCommand = MyConnection.CreateCommand())
                    {
                        MyCommand.CommandType = CommandType.StoredProcedure; // Set command type to stored procedure
                        MyCommand.CommandText = "getTareas"; // Name of your stored procedure

                        MyCommand.Parameters.AddWithValue("@state", 2); // Assuming ID is a parameter for the stored procedure
                        MyCommand.Parameters.AddWithValue("@userID", ID); // Assuming ID is a parameter for the stored procedure

                        using (SqlDataAdapter adapter = new SqlDataAdapter(MyCommand))
                        {
                            adapter.Fill(dt);
                        }
                    }
                }
                return "success";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string DetailsTask(ref DataTable dt, string ID)
        {
            try
                {
                using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString))
                    {
                        MyConnection.Open();

                        using (SqlCommand MyCommand = MyConnection.CreateCommand())
                        {
                            MyCommand.CommandText = $"SELECT Title, Description, Created_Date, Finished_Date FROM dbo.Tareas WHERE ID = {ID} ;";

                            using (SqlDataAdapter adapter = new SqlDataAdapter(MyCommand))
                            {
                                adapter.Fill(dt);
                            }
                        }
                    }
                return "";
                }
                catch (Exception es)
                {
                    Console.WriteLine(es.Message);
                    Console.Read();
                    return "a";
                }  

        }


        public string  CreateTask(string Title, string Description, int ID_User, int ID_Apoderado)
        {
        try
            {
            using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString))
                {
                MyConnection.Open();
                
                    using (SqlCommand MyCommand = MyConnection.CreateCommand()){
                        MyCommand.CommandType = CommandType.StoredProcedure; // Set command type to stored procedure
                        MyCommand.CommandText = "CreateTask"; // Name of your stored procedure

                        MyCommand.Parameters.AddWithValue("@ID_User", ID_User); 
                        MyCommand.Parameters.AddWithValue("@ID_Apoderado", ID_Apoderado); 
                        MyCommand.Parameters.AddWithValue("@Title", Title); 
                        MyCommand.Parameters.AddWithValue("@Description", Description); 
                        MyCommand.ExecuteNonQuery();
                    }                  

                    return "success";
                }
            }
            catch (Exception ex)
            {
                 return "Error creating task: " + ex.Message;
                    
            }           
        }

        public string  EditTask( string ID, string Title, string Description)
        {
            var sql = $"UPDATE dbo.Tareas SET  Title = @Ttile, Description = @Description WHERE ID = {ID} ;";
            using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString))
            {
                try
                {
                    

                    using (SqlCommand MyCommand =  new SqlCommand(sql, MyConnection))
                    {
                        MyCommand.Parameters.Add("@Ttile", SqlDbType.NVarChar).Value = Title;
                        MyCommand.Parameters.Add("@Description", SqlDbType.NVarChar).Value = Description;
                        MyConnection.Open();
                        MyCommand.ExecuteNonQuery();
                        // MyCommand.CommandText = $"UPDATE dbo.Tareas SET  Title = {Ttile}, Description{Description} WHERE ID = {ID} ;";

                    }
                    return "";
                }
                catch (Exception es)
                {
                    return es.Message;
                    
                }           
            }
        }

        public string  CompleteTask( string ID)
        {
            var sql = $"UPDATE dbo.Tareas SET Finished_Date = SYSDATETIME(), state = 2 WHERE ID = {ID} ;";
            using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString))
            {
                try
                {
                    

                    using (SqlCommand MyCommand =  new SqlCommand(sql, MyConnection))
                    {
                        MyConnection.Open();
                        MyCommand.ExecuteNonQuery();
                        // MyCommand.CommandText = $"UPDATE dbo.Tareas SET  Title = {Ttile}, Description{Description} WHERE ID = {ID} ;";

                    }
                    return "";
                }
                catch (Exception es)
                {
                    return es.Message;
                    
                }           
            }
        }

        public string  DeleteTask( string ID)
        {
            var sql = $"DELETE FROM  [dbo].[Tarea_User] WHERE ID_Tarea = {ID}  DELETE FROM  [dbo].[Tareas] WHERE ID = {ID} ;  ";
            using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString))
            {
                try
                {
                    

                    using (SqlCommand MyCommand =  new SqlCommand(sql, MyConnection))
                    {
                        MyConnection.Open();
                        MyCommand.ExecuteNonQuery();
                        // MyCommand.CommandText = $"UPDATE dbo.Tareas SET  Title = {Ttile}, Description{Description} WHERE ID = {ID} ;";

                    }
                    return "";
                }
                catch (Exception es)
                {
                    return es.Message;
                    
                }           
            }
        }

        #endregion


        #region Team
        // TEAMS

        public string  GetTeam(ref DataTable dt, int ID)
        {
            try
            {
                using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString))
                {
                    MyConnection.Open();

                    using (SqlCommand MyCommand = MyConnection.CreateCommand())
                    {
                        MyCommand.CommandText = $" SELECT [ID], [username],[email] FROM [TeamAdministration].[dbo].[Usuarios] LEFT JOIN dbo.user_apo usr ON usr.ID_Apoderado= ID WHERE usr.ID_Usuario  = {ID} ";

                        //MyCommand.CommandText = $" SELECT [ID], [Title], [Description] FROM [TeamAdministration].[dbo].[Team]  WHERE ID_User  = {ID} ";

                        using (SqlDataAdapter adapter = new SqlDataAdapter(MyCommand))
                        {
                            adapter.Fill(dt);
                        }
                    }
                }
                return "succes";
            }
            catch (Exception ex)
            {
                
                return "exploto todo " + ex.Message;
            }
        }

        public string DetailsUser(ref DataTable dt, string ID)
        {
            try
                {
                using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString))
                    {
                        MyConnection.Open();

                        using (SqlCommand MyCommand = MyConnection.CreateCommand())
                        {
                            MyCommand.CommandText = $"SELECT username, email FROM dbo.Usuarios WHERE ID = {ID} ;";

                            using (SqlDataAdapter adapter = new SqlDataAdapter(MyCommand))
                            {
                                adapter.Fill(dt);
                            }
                        }
                    }
                return "";
                }
                catch (Exception es)
                {
                    Console.WriteLine(es.Message);
                    Console.Read();
                    return "a";
                }  

        }


        public string GetAllUsers(ref DataTable dt, string username, int ID)
        {
           try
            {
                using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString))
                {
                    MyConnection.Open();

                    using (SqlCommand MyCommand = MyConnection.CreateCommand())
                    {
                        MyCommand.CommandType = CommandType.StoredProcedure; // Set command type to stored procedure
                        MyCommand.CommandText = "GetUsers"; // Name of your stored procedure

                        MyCommand.Parameters.AddWithValue("@username", username); // Assuming ID is a parameter for the stored procedure
                        MyCommand.Parameters.AddWithValue("@ID_user", ID); // Assuming ID is a parameter for the stored procedure
                        
                        using (SqlDataAdapter adapter = new SqlDataAdapter(MyCommand))
                        {
                            adapter.Fill(dt);
                        }
                    }
                }
                return "success";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
        

        public string  AsignUser(int ID_User, int ID_Apoderado)
        {
        try
            {
            using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString))
                {
                MyConnection.Open();
                
                    using (SqlCommand MyCommand = MyConnection.CreateCommand()){
                        MyCommand.CommandType = CommandType.StoredProcedure; // Set command type to stored procedure
                        MyCommand.CommandText = "ASignUser"; // Name of your stored procedure

                        MyCommand.Parameters.AddWithValue("@ID_User", ID_User); 
                        MyCommand.Parameters.AddWithValue("@ID_Apoderado", ID_Apoderado); 
                        MyCommand.ExecuteNonQuery();
                    }                  

                    return "success";
                }
            }
            catch (Exception ex)
            {
                 return "Error creating task: " + ex.Message;
                    
            }           
        }

        public string  DeleteUser( string ID)
        {
            var sql = $"DELETE FROM  [dbo].[user_apo] WHERE [ID_Apoderado] = {ID}  ";
            using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString))
            {
                try
                {
                    

                    using (SqlCommand MyCommand =  new SqlCommand(sql, MyConnection))
                    {
                        MyConnection.Open();
                        MyCommand.ExecuteNonQuery();
                        // MyCommand.CommandText = $"UPDATE dbo.Tareas SET  Title = {Ttile}, Description{Description} WHERE ID = {ID} ;";

                    }
                    return "";
                }
                catch (Exception es)
                {
                    return es.Message;
                    
                }           
            }
        }


        public string  CreateTeam(string Title, string Description, int ID_User)
        {
        try
            {
            using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString))
                {
                MyConnection.Open();
                
                    using (SqlCommand MyCommand = MyConnection.CreateCommand()){
                        MyCommand.CommandType = CommandType.StoredProcedure; // Set command type to stored procedure
                        MyCommand.CommandText = "CreateTeam"; // Name of your stored procedure

                        MyCommand.Parameters.AddWithValue("@ID_User", ID_User); 
                        MyCommand.Parameters.AddWithValue("@Title", Title); 
                        MyCommand.Parameters.AddWithValue("@Description", Description); 
                        MyCommand.ExecuteNonQuery();
                    }                  

                    return "success";
                }
            }
            catch (Exception ex)
            {
                 return "Error creating task: " + ex.Message;
                    
            }           
        }


        #endregion


        #region Account

        public string GetAccount(ref DataTable dt, string ID)
        {
            try
            {
                using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString))
                {
                    MyConnection.Open();

                    using (SqlCommand MyCommand = MyConnection.CreateCommand())
                    {
                        MyCommand.CommandText = $"SELECT username, email , pass FROM dbo.Usuarios WHERE ID = {ID} ;";

                        using (SqlDataAdapter adapter = new SqlDataAdapter(MyCommand))
                        {
                            adapter.Fill(dt);
                        }
                    }
                }
                return "";
            }
            catch (Exception es)
            {
                Console.WriteLine(es.Message);
                Console.Read();
                return "a";
            }

        }
        // Log in and Sign UP
        public string Login(ref DataTable dt, string email, string password)
        {
            try
            {
                using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString))
                {
                    MyConnection.Open();

                    using (SqlCommand MyCommand = MyConnection.CreateCommand())
                    {

                        MyCommand.CommandText = $"SELECT ID FROM Usuarios WHERE email = '{email}' AND pass = '{password}' ";

                        using (SqlDataAdapter adapter = new SqlDataAdapter(MyCommand))
                        {
                            adapter.Fill(dt);
                        }
                       
                    }
                }


                return "success";
            }
            catch (Exception ex)
            {
                return "Exploto todo";
                // return ex.Message;
            }
        }


        public string  SignUp(string username, string email, string password)
        {
        try
            {
            using (SqlConnection MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString))
                {
                MyConnection.Open();
                
                    using (SqlCommand MyCommand = MyConnection.CreateCommand()){
                        MyCommand.CommandType = CommandType.StoredProcedure; // Set command type to stored procedure
                        MyCommand.CommandText = "CreateUser"; // Name of your stored procedure

                        MyCommand.Parameters.AddWithValue("@username", username); 
                        MyCommand.Parameters.AddWithValue("@email", email); 
                        MyCommand.Parameters.AddWithValue("@password", password); 
                        MyCommand.ExecuteNonQuery();
                    }                  

                    return "success";
                }
            }
            catch (Exception ex)
            {
                 return "Error creating User: " + ex.Message;
                    
            }           
        }


        #endregion
    }
}
