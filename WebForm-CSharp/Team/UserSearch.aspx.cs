using System;
using System.Data;

// ScriptManager
using System.Web.UI;
using System.Web.UI.WebControls; 

using WebForm_CSharp.Utils; // Import the namespace where 'datos' class is defined

namespace WebForm_CSharp
{
    public partial class UserSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetUser();

        }


        protected void GetUser(){
            

            
            
            datos  datosInstance = new datos (); // Create an instance of the Datos class
            string uid = txtNro.Text;

             string ID = Session["userID"] as string;

            if (ID != null)
            {

                try
                {
                    DataTable dt = new DataTable();

                    int number = int.Parse(ID);
                    string res= datosInstance.GetAllUsers(ref dt, uid, number);  

                    // Bind the DataTable to the GridView
                    gvTramites.DataSource = dt;
                    gvTramites.DataBind();


                }
                catch (FormatException)
                {
                    string script = $"alert('A surgido un error.');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script, true);
                    Response.Redirect("Team.aspx");
                }
                
            }


            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            GetUser();
                    
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            Button CompleteButton = (Button)sender;
            string userID = CompleteButton.CommandArgument;

            datos  datosInstance = new datos (); // Create an instance of the Datos class
            string ID = Session["userID"] as string;

            if (ID != null)
            {

                try
                {
                    int number = int.Parse(ID);
                    int iuserId = int.Parse(userID);
                    string res = datosInstance.AsignUser(number, iuserId);  
                    GetUser();

                }
                catch (FormatException)
                {
                    string script = $"alert('A surgido un error.');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script, true);
                }
                
            }
            
            
        }

    }
}