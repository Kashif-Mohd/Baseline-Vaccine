using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace BVaccine
{
    public partial class loginform : System.Web.UI.Page
    {
        string ConDataBase = System.Configuration.ConfigurationManager.ConnectionStrings["Test"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["User"] = null;
            Login1.Focus();            
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
          //  Boolean blnresult = false;
          //  blnresult = Authentication(Login1.UserName, Login1.Password);

            if (FindUserRole() == true)
            {
                e.Authenticated = true;
                Session["User"] = Login1.UserName;
                Response.Redirect("Home.aspx");                
            }
            else
                e.Authenticated = false;
        }



        public bool FindUserRole()
        {
            SqlConnection con = new SqlConnection(ConDataBase);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select username, password from login where username='" + txtUserName.Text + "' and password ='" + txtP + "'", con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                con.Close();
                return true;
            }
            con.Close();
            return false;
        }

    

    }
}