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
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Page"] = "LogIn";
        }
        
        protected void Button1_Click(object sender, EventArgs e)  
        {  
            try
            {
                string uid = TextBox1.Text;
                string pass = TextBox2.Text;

                DataTable dt = new DataTable();
                datos  datosInstance = new datos (); // Create an instance of the Datos class

                string res =  datosInstance.Login(ref dt, uid, pass);  
                
                if (res == "success") 
                {

                    if (dt.DefaultView.Count == 1)
                    {

                        string script1 = $"alert('Succesfull Login');";
                        ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script1, true);
                        //TRAIGO LOS DATOS

                        if (!Convert.IsDBNull(dt.DefaultView[0]["ID"]))
                        {
                            string ID= dt.DefaultView[0]["ID"].ToString();
                            Session["userID"] = ID;


                            Response.Redirect($"Tasks/TableData.aspx");
                            

                        }
            
                    }

                    else
                    {
                        string script1 = $"alert('Wrong Email or password');";
                        ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script1, true);

                    }
                    
                }
                else
                {
                    string script1 = $"alert('Something went wrong');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script1, true);

                    Response.Redirect($"Default.aspx");
                }
                                
            }
            catch (Exception ex)
            {
                string script1 = $"alert('Something went wrong + {ex.Message}');";
                ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script1, true);

            }  
            
        
        } 

        protected void Button2_Click(object sender, EventArgs e)  {
                Response.Redirect("SignUp.aspx");
        }
      
    }  

}