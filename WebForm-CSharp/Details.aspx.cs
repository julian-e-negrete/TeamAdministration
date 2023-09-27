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
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ID"] != null)
                {
                    string taskId = Request.QueryString["ID"];
                    inicialTable(taskId);
                }
            }
            // inicialTable();
        }

        protected void inicialTable(string ID){
            // string script = "alert('Funciona esto?.');";
            // ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script, true);

            DataTable dt = new DataTable();
            datos  datosInstance = new datos (); // Create an instance of the Datos class

            datosInstance.DetailsTask(ref dt, ID);  

            // Bind the DataTable to the GridView
            DetailsGridView.DataSource = dt;
            DetailsGridView.DataBind();
        }
        
    }
}