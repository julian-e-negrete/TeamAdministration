using System;
using System.Data;

// ScriptManager
using System.Web.UI;
using System.Web.UI.WebControls; 

using WebForm_CSharp.Utils; // Import the namespace where 'datos' class is defined


namespace WebForm_CSharp
{
    public partial class TableData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnTab1.Attributes["onclick"] = ClientScript.GetPostBackEventReference(btnTab1, null);
            btnTab2.Attributes["onclick"] = ClientScript.GetPostBackEventReference(btnTab2, null);

           string ID = Session["userID"] as string;

           inicialTable();
            
            // Initial page load setup
            if (!IsPostBack)
            { 
                
                
            }
        }
        protected void inicialTable(){
            tab2Content.Visible = false;
            tab2.Visible= false;

            tab1Content.Visible = true;
            dataTableGridView.Visible=true;

            


            if (!(btnTab1.CssClass.Contains("active")))
            {
                btnTab1.CssClass += " active";
                btnTab2.CssClass = btnTab2.CssClass.Replace("active", "").Trim();
            }
            
            DataTable dt = new DataTable();
            datos  datosInstance = new datos (); // Create an instance of the Datos class
            string ID = Session["userID"] as string;

            if (ID != null)
            {

                try
                {
                    int number = int.Parse(ID);
                    string res= datosInstance.indexGet(ref dt, number);  

                    tab2.DataSource = dt;
                    tab2.DataBind();
                    // Bind the DataTable to the GridView
                    dataTableGridView.DataSource = dt;
                    dataTableGridView.DataBind();
                }
                catch (FormatException)
                {
                    string script = $"alert('A surgido un error.');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script, true);
                }
                
            }

            
            
            
        }

        protected void TableCompletadas(){

            DataTable dt = new DataTable();
            datos  datosInstance = new datos (); // Create an instance of the Datos class
            tab2Content.Visible = true;
            tab2.Visible = true;
            
            tab1Content.Visible=false;
            dataTableGridView.Visible=false;
            

            // sos un puto genio
            if (!(btnTab2.CssClass.Contains("active")))
                {
                    btnTab2.CssClass += " active";
                    btnTab1.CssClass = btnTab1.CssClass.Replace("active", "").Trim();
                }
                
            string ID = Session["userID"] as string;

            if (ID != null)
            {

                try
                {
                    int number = int.Parse(ID);
                    string res = datosInstance.TareasCompletadas(ref dt, number);  

                    tab2.DataSource = dt;
                    tab2.DataBind();
                }
                catch (FormatException)
                {
                    string script = $"alert('A surgido un error.');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script, true);
                }
                
            }
            
        }
            
        

        private void BindGridView()
        {
            // Replace this with your actual data retrieval logic
            DataTable dt = new DataTable();
            datos  datosInstance = new datos (); // Create an instance of the Datos class
           
            
            string ID = Session["userID"] as string;

            if (ID != null)
            {

                try
                {
                    int number = int.Parse(ID);
                    string res= datosInstance.indexGet(ref dt, number);  

                    tab2.DataSource = dt;
                    tab2.DataBind();
                    // Bind the DataTable to the GridView
                }
                catch (FormatException)
                {
                    string script = $"alert('A surgido un error.');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script, true);
                }
                
            }
            
            
            dataTableGridView.DataSource = dt;
            
            // dataTableGridView.DataBind();
            string ssortdirection = (string)ViewState["SortDirection"];
            string script1 = ssortdirection;
            ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script1, true);
            if (ViewState["SortDirection"] != null && ViewState["SortExpression"] != null)
            {
                string sortExpression = ViewState["SortExpression"].ToString();
                string sortDirection = ViewState["SortDirection"].ToString();

                dt.DefaultView.Sort = sortExpression + " " + sortDirection;
            }

            dataTableGridView.DataSource = dt;
            dataTableGridView.DataBind();
        }

        protected void dataTableGridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression;
            ViewState["SortExpression"] = sortExpression;

            if (ViewState["SortDirection"] == null || ViewState["SortDirection"].ToString() == "DESC")
            {
                ViewState["SortDirection"] = "ASC";
            }
            else
            {
                ViewState["SortDirection"] = "DESC";
            }

            BindGridView();
        }
        // Buttons
        // Tabs
        protected void btnTab1_Click(object sender, EventArgs e)
        {
             
                inicialTable();
        }

        protected void btnTab2_Click(object sender, EventArgs e)
        {
            
            TableCompletadas();
            
        }

        protected void CreTask_Click(object sender, EventArgs e)
        {
            string ID = Session["userID"] as string;

            if (ID != null)
            {

                try
                {
                    int number = int.Parse(ID);
                    Response.Redirect($"CreateTask.aspx?ID={number}");  
                }
                catch (FormatException)
                {
                    string script = $"alert('A surgido un error.');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script, true);
                    Response.Redirect($"Default.aspx");  
                }
                
            }
            
            
            
        }
        

        // Table Rows
        protected void viewButton_Click(object sender, EventArgs e)
        {
            Button viewButton = (Button)sender;
            string taskId = viewButton.CommandArgument;
            Response.Redirect($"Details.aspx?ID={ID}");
        }
        protected void EditButton_Click(object sender, EventArgs e)
        {
            Button EditButton = (Button)sender;
            string taskId = EditButton.CommandArgument;
            /*
            // Now you can use the taskId to perform any desired action
            // For example, you can redirect to a task details page using Response.Redirect
            
            */
            Response.Redirect($"Edit.aspx?ID={ID}");
            // Response.Redirect($"default.aspx");
        }
        // Complete button
        protected void CompleteButton_Click(object sender, EventArgs e)
        {
            Button CompleteButton = (Button)sender;
            string taskId = CompleteButton.CommandArgument;

            DataTable dt = new DataTable();
            datos  datosInstance = new datos (); // Create an instance of the Datos class

            datosInstance.CompleteTask(taskId);  
            string ID = Session["userID"] as string;

            if (ID != null)
            {

                try
                {
                    int number = int.Parse(ID);               
                    Response.Redirect($"TableData.aspx?ID={number}");  
                }
                catch (FormatException)
                {
                    string script = $"alert('A surgido un error.');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script, true);
                    Response.Redirect($"Default.aspx");  
                }
                
            }
            
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            

            DataTable dt = new DataTable();
            datos  datosInstance = new datos (); // Create an instance of the Datos class

            Button CompleteButton = (Button)sender;
            string taskId = CompleteButton.CommandArgument;

            datosInstance.DeleteTask(taskId);  


            string ID = Session["userID"] as string;

            if (ID != null)
            {

                try
                {
                    int number = int.Parse(ID);               
                    Response.Redirect($"TableData.aspx?ID={number}");  
                }
                catch (FormatException)
                {
                    string script = $"alert('A surgido un error.');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script, true);
                    Response.Redirect($"Default.aspx");  
                }
                
            }
            
        }
       
    }
}
