using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace BVaccine
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        string connstring = "Data Source=F48604;Initial Catalog=BaselineVaccine; User ID=sa; password=123; Integrated Security=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("loginform.aspx");
            }               
        }

        protected void button_Click(object sender, EventArgs e)
        {
            if (Textpass.Text == Textconfirm.Text)
            {
                SqlConnection conn = new SqlConnection(connstring);
                conn.Open();
                try
                {
                    string insertStatement = "INSERT INTO userRegistration(username, password) VALUES (@username, @password)";
                    SqlCommand cmd = new SqlCommand(insertStatement, conn);
                    cmd.Parameters.AddWithValue("@username", Textuname.Text);
                    cmd.Parameters.AddWithValue("@password", Textpass.Text);
                    cmd.ExecuteNonQuery();
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    string msg = "Insert Error:";
                    msg += ex.Message;
                    throw new Exception(msg);
                }
                finally
                {                    
                    conn.Close();
                    
                }
            }
            Response.Write("<script type=\"text/javascript\">alert('Form Submitted successfully!')</script>");
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('User created successfully!')", true);
            Response.Redirect("RegistrationForm.aspx");    
        }
    }
}