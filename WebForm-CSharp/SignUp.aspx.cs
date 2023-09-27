using System;
using System.Collections.Generic;
using System.Linq;

using System.Data;

// ScriptManager
using System.Web.UI;
using System.Web.UI.WebControls; 
using System.Web.UI.HtmlControls;

using WebForm_CSharp.Utils; // Import the namespace where 'datos' class is defined

namespace WebForm_CSharp
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Page"] = "Sign Up";

        }
        protected void Button1_Click(object sender, EventArgs e)  
        {   string username = TextBox0.Text;
            string email = TextBox1.Text;
            string pass = TextBox2.Text;

                
            datos  datosInstance = new datos (); // Create an instance of the Datos class

            try
            {
                string res =  datosInstance.SignUp(username, email, pass);  
                Response.Redirect("Default.aspx");
            }
            
                
            catch (Exception ex)
            {
                string script1 = $"alert('Something went wrong + {ex.Message}');";
                ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script1, true);
                Response.Redirect("Default.aspx");

            }    
        }
    }
}