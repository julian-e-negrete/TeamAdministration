using System;
using System.Collections.Generic;
using System.Linq;

using System.Data;

// ScriptManager
using System.Web.UI;
using System.Web.UI.WebControls; 

using WebForm_CSharp.Utils; // Import the namespace where 'datos' class is defined

namespace WebForm_CSharp
{
    public partial class CreateTask : System.Web.UI.Page
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
                    if (Request.QueryString["Id_user"] != null)
                    {
                        string strId_apoderado = Request.QueryString["Id_user"];
                        int Id_apoderado = int.Parse(strId_apoderado);

                        string res = datosInstance.CreateTask(txtTitulo.Text.Trim(), txtDescripcion.Text.Trim(), number, Id_apoderado);

                        
                        Response.Redirect($"TableData");
                    }
                    else 
                    {
                        string script = $"alert('Something went wrong, Id_user is null ');";
                        ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script, true);
                        //string res = datosInstance.CreateTask(txtTitulo.Text.Trim(), txtDescripcion.Text.Trim(), number, number);
                    }

                    
                    

                    
                    
                }
                catch (Exception ex)
                {
                    string script = $"alert('Something went wrong {ex}');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script, true);
                    //Response.Redirect($"/Default.aspx");  
                }
                
            }            

            
        }   
    }
}