using System;
using System.Data;

// ScriptManager
using System.Web.UI;
using System.Web.UI.WebControls;

using WebForm_CSharp.Utils; // Import the namespace where 'datos' class is defined



namespace WebForm_CSharp
{
    public partial class Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userID"] != null)
                {

                    string ID = Session["userID"] as string;

                    if (ID != null)
                    {

                        try
                        {
                            DataTable dt = new DataTable();
                            datos datosInstance = new datos(); // Create an instance of the Datos class

                            datosInstance.DetailsUser(ref dt, ID);

                            if (dt.DefaultView.Count == 1)
                            {
                                //TRAIGO LOS DATOS

                                if (!Convert.IsDBNull(dt.DefaultView[0]["username"]))
                                {
                                    txtUsername.Text = dt.DefaultView[0]["username"].ToString();

                                }
                                if (!Convert.IsDBNull(dt.DefaultView[0]["email"]))
                                    txtEmail.Text = dt.DefaultView[0]["email"].ToString();

                            }
                        }
                        catch (Exception ex)
                        {

                        }

                    }
                }
            }
        }
        protected void EditButton_Click(object sender, EventArgs e) 
        {
            string script = $"alert('Editar usuario');";
            ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script, true);
        }
    }
}