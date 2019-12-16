using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

namespace BVaccine
{
    public partial class Main : System.Web.UI.MasterPage
    {
        //string connstring = "Data Source=F31322;Initial Catalog=Vaccine; User ID=sa; password=sa; Integrated Security=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["WebForm"]) == "home")
            {
                home.Attributes.Add("class", "active");
                FirstEntry.Attributes.Add("class", "");
                Session["WebForm"] = null;
            }
            else if (Convert.ToString(Session["WebForm"]) == "FirstEntry")
            {
                home.Attributes.Add("class", "");
                FirstEntry.Attributes.Add("class", "active");
                Session["WebForm"] = null;
            }
            else if (Convert.ToString(Session["WebForm"]) == "SecondEntry")
            {
                home.Attributes.Add("class", "");
                FirstEntry.Attributes.Add("class", "");
                SecondEntry.Attributes.Add("class", "active");
                Session["WebForm"] = null;
            }
        }
    }
}