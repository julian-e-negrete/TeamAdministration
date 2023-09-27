using System;
using System.Data;

// ScriptManager
using System.Web.UI;
using System.Web.UI.WebControls; 

using WebForm_CSharp.Utils; // Import the namespace where 'datos' class is defined



namespace WebForm_CSharp
{
    public partial class Team : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ID = Session["userID"] as string;

            if (ID != null)
            {

                try
                {
                    int number = int.Parse(ID);
                    GetTeamAll(number);

                }
                catch (FormatException)
                {
                    string script = $"alert('A surgido un error.');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script, true);
                    Response.Redirect($"Default.aspx");
                }

            }
        }


         protected void GetTeamAll(int ID){
        
            DataTable dt = new DataTable();
            datos  datosInstance = new datos (); // Create an instance of the Datos class

            string res= datosInstance.GetTeam(ref dt, ID);
            

            // Bind the DataTable to the GridView
            dataTableGridView.DataSource = dt;
            dataTableGridView.DataBind();

         
        }

        protected void viewButton_Click(object sender, EventArgs e)
        {
            Button viewButton = (Button)sender;
            string taskId = viewButton.CommandArgument;
            string script = $"alert('{ID}');";
            ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script, true);
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect($"UserSearch.aspx");
            
            
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            Response.Redirect($"CreateTeam.aspx");
            
            
        }


        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            Button CompleteButton = (Button)sender;
            string userID = CompleteButton.CommandArgument;

            datos  datosInstance = new datos (); // Create an instance of the Datos class
            string res = datosInstance.DeleteUser(userID);  
            Response.Redirect("Team.aspx");
            
            
        }

        protected void AsignButton_Click(object sender, EventArgs e)
        {
            Button CompleteButton = (Button)sender;

            string Id_apoderado = CompleteButton.CommandArgument;

            if (Id_apoderado != null)
            {

                try
                {
                    int number = int.Parse(Id_apoderado);
                    Response.Redirect($"/Tasks/CreateTask?Id_user={number}");
                }
                catch (Exception ex)
                {
                    string script = $"alert('A surgido un error.{ex}');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script, true);
                }

            }
            else 
            {
                Response.Redirect("Team.aspx");
            }
            //datos datosInstance = new datos(); // Create an instance of the Datos class
            //string res = datosInstance.DeleteUser(userID);
            


        }
    }
}