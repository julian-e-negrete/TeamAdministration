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
    public partial class SiteMaster : MasterPage
    {    
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["userID"] != null)
            {   
                ALogIn.Visible = false;                
                Tareas.Visible = true;
                Team.Visible = true;
                

                ALogOut.Visible = true;
                A1.Visible = true;
                
                
            }
            else{
                Tareas.Visible = false;
                Team.Visible = false;

                ALogIn.Visible = true;                
                ALogOut.Visible = false;
                A1.Visible = false;
            }
            
            if ((string)Session["Page"] == "LogIn")
            {
                ALogIn.Visible = false;
            }
        }
        protected void ALogOut_Click(object sender, EventArgs e)
        {
            Session["userID"] = null;
            Response.Redirect("~/Default");
        }

    }
}