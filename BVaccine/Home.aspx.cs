using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BVaccine
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["WebForm"] = "home";
            if (Session["User"] != null)
            {
                Label user = (Label)Master.FindControl("lbl");
                user.Text = Convert.ToString(Session["User"]).ToUpper();
            }
            else
                Response.Redirect("loginform.aspx");
        }
    }
}