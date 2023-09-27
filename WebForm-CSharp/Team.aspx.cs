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
            // Response.Redirect($"Details.aspx?ID={ID}");
        }
    }
}