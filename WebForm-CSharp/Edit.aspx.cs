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
    public partial class Edit : System.Web.UI.Page
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

            
            DataTable dt = new DataTable();
            datos  datosInstance = new datos (); // Create an instance of the Datos class

            string sret = datosInstance.DetailsTask(ref dt, ID);

            if (sret == "") {

                if (dt.DefaultView.Count == 1)
                {
                    //TRAIGO LOS DATOS

                    if (!Convert.IsDBNull(dt.DefaultView[0]["Title"]))
                     {
                        txtTitulo.Text = dt.DefaultView[0]["Title"].ToString();
           
                    }
                    if (!Convert.IsDBNull(dt.DefaultView[0]["Description"]))
                        txtDescripcion.Text = dt.DefaultView[0]["Description"].ToString();
           
                    }
                }
            }
                    

        protected void EditButton_Click(object sender, EventArgs e)
        {
            
            datos  datosInstance = new datos (); // Create an instance of the Datos class
            string taskId = Request.QueryString["ID"];
            datosInstance.EditTask(taskId, txtTitulo.Text.Trim(), txtDescripcion.Text.Trim() );  

            Response.Redirect($"TableData.aspx");            
        }   

        
        
        
    
    }
}