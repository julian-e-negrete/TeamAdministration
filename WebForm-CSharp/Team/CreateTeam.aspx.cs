using System;
using System.Data;

// ScriptManager
using System.Web.UI;
using System.Web.UI.WebControls; 

using WebForm_CSharp.Utils; // Import the namespace where 'datos' class is defined

namespace WebForm_CSharp
{
    public partial class CreateTeam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreTask_Click(object sender, EventArgs e)
        {
            
            datos  datosInstance = new datos (); // Create an instance of the Datos class
            string ID = Session["userID"] as string;

            if (ID != null)
            {

                try
                {
                    int number = int.Parse(ID);                    
                    
                    string res = datosInstance.CreateTeam(txtTitulo.Text.Trim(), txtDescripcion.Text.Trim() , number);  
                    string script = $"alert('{res}');";
            
                    ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script, true);
                    if (res != "success"){
                        Response.Redirect($"~/Default.aspx");  
                    }
                    else{
                        Response.Redirect($"~/Tasks/TableData");  
                    }
                    
                }
                catch (FormatException)
                {
                    string script = $"alert('Something went wrong');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script, true);
                    Response.Redirect($"~/Default.aspx");  
                }
                
            }            

            
        }
    }
}