using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace BVaccine
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string connstring = "Data Source=F48604;Initial Catalog=BaselineVaccine; User ID=sa; password=123; Integrated Security=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["WebForm"] = "SecondEntry";
            //txtDSSID.Focus();

            //if (Session["User"] != null)
            //{
            //    Label user = (Label)Master.FindControl("lbl");
            //    user.Text = Convert.ToString(Session["User"]).ToUpper();
            //}
            //else
            //    Response.Redirect("loginform.aspx");

            if (!Page.IsPostBack)
            {
                string CurrentDate = DateTime.Today.ToShortDateString();
                CompareDOV1.ValueToCompare = CurrentDate;
                CompareDOV2.ValueToCompare = CurrentDate;
                CompareFD.ValueToCompare = CurrentDate;
                //IDCheck();
            }
        }

        public bool IDCheck2()
        {
            string abc = string.Join("-", txtStudyID.Text, txtChildID.Text);
            SqlConnection con = new SqlConnection(connstring);
            SqlCommand cmd2 = new SqlCommand("Select * from VaccineData_2 where dssid='" + txtDSSID.Text + "' AND study_id='" + abc + "'", con);
            con.Open();
            SqlDataReader drd = cmd2.ExecuteReader();

            if (drd.Read() == true)
                return true;
            else
                return false;
        }

        public bool IDCheck()
        {
            string abc = string.Join("-", txtStudyID.Text, txtChildID.Text);
            SqlConnection con = new SqlConnection(connstring);
            SqlCommand cmd = new SqlCommand("Select * from VaccineData where dssid='" + txtDSSID.Text + "' AND study_id='" + abc + "'", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read() == true)
            {
                IDCheck2();
                if (IDCheck2())
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('2nd Entry of this ID has already done!')", true);
                    return false;
                }
                else
                    return true;
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('First Entry of this ID does not exist!')", true);
                return false;
            }
        }

        protected void checkButton_Click(object sender, EventArgs e)
        {
            IDCheck();
            if (IDCheck() == true)
            {
                formPanel.Visible = true;
                txtDSSID.Enabled = false;
                txtStudyID.Enabled = false;
                txtChildID.Enabled = false;
            }
            else
            {
                txtDSSID.Text = "";
                txtStudyID.Text = "";
                txtChildID.Text = "";
            }
        }
        //protected void txtDSSID_TextChanged1(object sender, EventArgs e)
        //{
        //    if (txtDSSID.Text == "")
        //        formPanel.Visible = false;
        //    else
        //    IDCheck();
        //    //Server.Transfer("WebForm2.aspx");
        //}

        //protected void txtStudyID_TextChanged(object sender, EventArgs e)
        //{
        //    IDCheck();
        //    if (IDCheck())
        //        txtStudyID.Text = "";
        //    else if (IDCheck() == false)
        //    {
        //        formPanel.Visible = true;
        //        txtDSSID.Enabled = false;
        //        txtStudyID.Enabled = false;
        //    }
        //}

        public void SubmitData()
        {
            string abc = string.Join("-", txtStudyID.Text, txtChildID.Text);
            SqlConnection conn = new SqlConnection(connstring);
            conn.Open();

            try
            {
                string insertSt = "INSERT INTO VaccineData_2(dssid,study_id,bla01_nm,bla01_cd,bla02_dt,bla02_tm,bla03_dt,bla03_tm,bla04,bla05,bla06_dt,bla06_age,bla07,bla08,bla09,bla09x,bla10,bla11,bla12,bla13,bla14,bla14x,blb01,blb02,blb02x," +
                    "imbcg,imbcg_dt,imbcg_prf,imbcg_src,imopv0,imopv0_dt,imopv0_prf,imopv0_src,imopv1,imopv1_dt,imopv1_prf,imopv1_src,imp1,imp1_dt,imp1_prf,imp1_src,impcv1,impcv1_dt,impcv1_prf,impcv1_src,imopv2,imopv2_dt,imopv2_prf,imopv2_src,imp2,imp2_dt,imp2_prf,imp2_src,impcv2,impcv2_dt,impcv2_prf,impcv2_src,imopv3,imopv3_dt,imopv3_prf,imopv3_src,imp3,imp3_dt,imp3_prf,imp3_src,impcv3,impcv3_dt,impcv3_prf,impcv3_src,imipv,imipv_dt,imipv_prf,imipv_src,imm1,imm1_dt,imm1_prf,imm1_src,imm2,imm2_dt,imm2_prf,imm2_src," +
                    "blb04,blb05,blb06_1,blb06_2,blb06_3,blb06_4,blb06_5,blb06_6,blb06_7,blb06_8,blb06_9,blb06_10,blb06_11,blb06_12,blb06_13,blb06_14,blb06_15,blb06_16,blb06_17,blb06_18,blb06_19,blb06_20,blb06_21,blb06_22,blb06_23,blb06_24,blb06_24_cd,blb06_25,blb07,blb08,blb09,dio_name,entry_date)" +
                    "VALUES (@dssid,@study_id,@bla01_nm,@bla01_cd,@bla02_dt,@bla02_tm,@bla03_dt,@bla03_tm,@bla04,@bla05,@bla06_dt,@bla06_age,@bla07,@bla08,@bla09,@bla09x,@bla10,@bla11,@bla12,@bla13,@bla14,@bla14x,@blb01,@blb02,@blb02x," +
                    "@imbcg,@imbcg_dt,@imbcg_prf,@imbcg_src,@imopv0,@imopv0_dt,@imopv0_prf,@imopv0_src,@imopv1,@imopv1_dt,@imopv1_prf,@imopv1_src,@imp1,@imp1_dt,@imp1_prf,@imp1_src,@impcv1,@impcv1_dt,@impcv1_prf,@impcv1_src,@imopv2,@imopv2_dt,@imopv2_prf,@imopv2_src,@imp2,@imp2_dt,@imp2_prf,@imp2_src,@impcv2,@impcv2_dt,@impcv2_prf,@impcv2_src,@imopv3,@imopv3_dt,@imopv3_prf,@imopv3_src,@imp3,@imp3_dt,@imp3_prf,@imp3_src,@impcv3,@impcv3_dt,@impcv3_prf,@impcv3_src,@imipv,@imipv_dt,@imipv_prf,@imipv_src,@imm1,@imm1_dt,@imm1_prf,@imm1_src,@imm2,@imm2_dt,@imm2_prf,@imm2_src," +
                    "@blb04,@blb05,@blb06_1,@blb06_2,@blb06_3,@blb06_4,@blb06_5,@blb06_6,@blb06_7,@blb06_8,@blb06_9,@blb06_10,@blb06_11,@blb06_12,@blb06_13,@blb06_14,@blb06_15,@blb06_16,@blb06_17,@blb06_18,@blb06_19,@blb06_20,@blb06_21,@blb06_22,@blb06_23,@blb06_24,@blb06_24_cd,@blb06_25,@blb07,@blb08,@blb09,@dio_name,CURRENT_TIMESTAMP)";

                SqlCommand cmd = new SqlCommand(insertSt, conn);

                cmd.Parameters.AddWithValue("@dssid", txtDSSID.Text);
                cmd.Parameters.AddWithValue("@study_id", abc);
                cmd.Parameters.AddWithValue("@bla01_nm", txtName.Text);
                cmd.Parameters.AddWithValue("@bla01_cd", txtICode.Text);
                cmd.Parameters.AddWithValue("@bla02_dt", (txtDOV1.Text));
                cmd.Parameters.AddWithValue("@bla02_tm", txtTOV1.Text);
                cmd.Parameters.AddWithValue("@bla03_dt", (txtDOV2.Text));
                cmd.Parameters.AddWithValue("@bla03_tm", txtTOV2.Text);
                cmd.Parameters.AddWithValue("@bla04", txtStatus.Text);
                cmd.Parameters.AddWithValue("@bla05", txtGender.Text);
                cmd.Parameters.AddWithValue("@bla06_dt", (txtDOB.Text));
                cmd.Parameters.AddWithValue("@bla06_age", LblAge.Text);
                cmd.Parameters.AddWithValue("@bla07", txtQ7.Text);
                cmd.Parameters.AddWithValue("@bla08", txtQ8.Text);
                cmd.Parameters.AddWithValue("@bla09", txtQ9.Text);
                cmd.Parameters.AddWithValue("@bla09x", txtQ9_x.Text);
                cmd.Parameters.AddWithValue("@bla10", txtQ10_code.Text);
                cmd.Parameters.AddWithValue("@bla11", txtQ11.Text);
                cmd.Parameters.AddWithValue("@bla12", txtQ12_code.Text);
                cmd.Parameters.AddWithValue("@bla13", txtQ13.Text);
                cmd.Parameters.AddWithValue("@bla14", txtQ14.Text);
                cmd.Parameters.AddWithValue("@bla14x", txtQ14_x.Text);
                cmd.Parameters.AddWithValue("@blb01", txtQ15.Text);
                cmd.Parameters.AddWithValue("@blb02", txtQ16.Text);
                cmd.Parameters.AddWithValue("@blb02x", txtQ16_x.Text);
                cmd.Parameters.AddWithValue("@imbcg", txtimbcg.Text);
                cmd.Parameters.AddWithValue("@imbcg_dt", txtimbcg_dt.Text);
                cmd.Parameters.AddWithValue("@imbcg_prf", txtimbcg_prf.Text);
                cmd.Parameters.AddWithValue("@imbcg_src", txtimbcg_src.Text);
                cmd.Parameters.AddWithValue("@imopv0", txtopv0.Text);
                cmd.Parameters.AddWithValue("@imopv0_dt", txtopv0_dt.Text);
                cmd.Parameters.AddWithValue("@imopv0_prf", txtopv0_prf.Text);
                cmd.Parameters.AddWithValue("@imopv0_src", txtopv0_src.Text);
                cmd.Parameters.AddWithValue("@imopv1", txtopv1.Text);
                cmd.Parameters.AddWithValue("@imopv1_dt", txtopv1_dt.Text);
                cmd.Parameters.AddWithValue("@imopv1_prf", txtopv1_prf.Text);
                cmd.Parameters.AddWithValue("@imopv1_src", txtopv1_src.Text);
                cmd.Parameters.AddWithValue("@imp1", txtp1.Text);
                cmd.Parameters.AddWithValue("@imp1_dt", txtp1_dt.Text);
                cmd.Parameters.AddWithValue("@imp1_prf", txtp1_prf.Text);
                cmd.Parameters.AddWithValue("@imp1_src", txtp1_src.Text);
                cmd.Parameters.AddWithValue("@impcv1", txtpcv1.Text);
                cmd.Parameters.AddWithValue("@impcv1_dt", txtpcv1_dt.Text);
                cmd.Parameters.AddWithValue("@impcv1_prf", txtpcv1_prf.Text);
                cmd.Parameters.AddWithValue("@impcv1_src", txtpcv1_src.Text);
                cmd.Parameters.AddWithValue("@imopv2", txtopv2.Text);
                cmd.Parameters.AddWithValue("@imopv2_dt", txtopv2_dt.Text);
                cmd.Parameters.AddWithValue("@imopv2_prf", txtopv2_prf.Text);
                cmd.Parameters.AddWithValue("@imopv2_src", txtopv2_src.Text);
                cmd.Parameters.AddWithValue("@imp2", txtp2.Text);
                cmd.Parameters.AddWithValue("@imp2_dt", txtp2_dt.Text);
                cmd.Parameters.AddWithValue("@imp2_prf", txtp2_prf.Text);
                cmd.Parameters.AddWithValue("@imp2_src", txtp2_src.Text);
                cmd.Parameters.AddWithValue("@impcv2", txtpcv2.Text);
                cmd.Parameters.AddWithValue("@impcv2_dt", txtpcv2_dt.Text);
                cmd.Parameters.AddWithValue("@impcv2_prf", txtpcv2_prf.Text);
                cmd.Parameters.AddWithValue("@impcv2_src", txtpcv2_src.Text);
                cmd.Parameters.AddWithValue("@imopv3", txtopv3.Text);
                cmd.Parameters.AddWithValue("@imopv3_dt", txtopv3_dt.Text);
                cmd.Parameters.AddWithValue("@imopv3_prf", txtopv3_prf.Text);
                cmd.Parameters.AddWithValue("@imopv3_src", txtopv3_src.Text);
                cmd.Parameters.AddWithValue("@imp3", txtp3.Text);
                cmd.Parameters.AddWithValue("@imp3_dt", txtp3_dt.Text);
                cmd.Parameters.AddWithValue("@imp3_prf", txtp3_prf.Text);
                cmd.Parameters.AddWithValue("@imp3_src", txtp3_src.Text);
                cmd.Parameters.AddWithValue("@impcv3", txtpcv3.Text);
                cmd.Parameters.AddWithValue("@impcv3_dt", txtpcv3_dt.Text);
                cmd.Parameters.AddWithValue("@impcv3_prf", txtpcv3_prf.Text);
                cmd.Parameters.AddWithValue("@impcv3_src", txtpcv3_src.Text);
                cmd.Parameters.AddWithValue("@imipv", txtipv.Text);
                cmd.Parameters.AddWithValue("@imipv_dt", txtipv_dt.Text);
                cmd.Parameters.AddWithValue("@imipv_prf", txtipv_prf.Text);
                cmd.Parameters.AddWithValue("@imipv_src", txtipv_src.Text);
                cmd.Parameters.AddWithValue("@imm1", txtm1.Text);
                cmd.Parameters.AddWithValue("@imm1_dt", txtm1_dt.Text);
                cmd.Parameters.AddWithValue("@imm1_prf", txtm1_prf.Text);
                cmd.Parameters.AddWithValue("@imm1_src", txtm1_src.Text);
                cmd.Parameters.AddWithValue("@imm2", txtm2.Text);
                cmd.Parameters.AddWithValue("@imm2_dt", txtm2_dt.Text);
                cmd.Parameters.AddWithValue("@imm2_prf", txtm2_prf.Text);
                cmd.Parameters.AddWithValue("@imm2_src", txtm2_src.Text);
                cmd.Parameters.AddWithValue("@blb04", txtQ18.Text);
                cmd.Parameters.AddWithValue("@blb05", txtQ19.Text);
                cmd.Parameters.AddWithValue("@blb06_1", txtQ20_1.Text);
                cmd.Parameters.AddWithValue("@blb06_2", txtQ20_2.Text);
                cmd.Parameters.AddWithValue("@blb06_3", txtQ20_3.Text);
                cmd.Parameters.AddWithValue("@blb06_4", txtQ20_4.Text);
                cmd.Parameters.AddWithValue("@blb06_5", txtQ20_5.Text);
                cmd.Parameters.AddWithValue("@blb06_6", txtQ20_6.Text);
                cmd.Parameters.AddWithValue("@blb06_7", txtQ20_7.Text);
                cmd.Parameters.AddWithValue("@blb06_8", txtQ20_8.Text);
                cmd.Parameters.AddWithValue("@blb06_9", txtQ20_9.Text);
                cmd.Parameters.AddWithValue("@blb06_10", txtQ20_10.Text);
                cmd.Parameters.AddWithValue("@blb06_11", txtQ20_11.Text);
                cmd.Parameters.AddWithValue("@blb06_12", txtQ20_12.Text);
                cmd.Parameters.AddWithValue("@blb06_13", txtQ20_13.Text);
                cmd.Parameters.AddWithValue("@blb06_14", txtQ20_14.Text);
                cmd.Parameters.AddWithValue("@blb06_15", txtQ20_15.Text);
                cmd.Parameters.AddWithValue("@blb06_16", txtQ20_16.Text);
                cmd.Parameters.AddWithValue("@blb06_17", txtQ20_17.Text);
                cmd.Parameters.AddWithValue("@blb06_18", txtQ20_18.Text);
                cmd.Parameters.AddWithValue("@blb06_19", txtQ20_19.Text);
                cmd.Parameters.AddWithValue("@blb06_20", txtQ20_20.Text);
                cmd.Parameters.AddWithValue("@blb06_21", txtQ20_21.Text);
                cmd.Parameters.AddWithValue("@blb06_22", txtQ20_22.Text);
                cmd.Parameters.AddWithValue("@blb06_23", txtQ20_23.Text);
                cmd.Parameters.AddWithValue("@blb06_24", txtQ20_24.Text);
                cmd.Parameters.AddWithValue("@blb06_24_cd", txtQ20_24x.Text);
                cmd.Parameters.AddWithValue("@blb06_25", txtQ20_25.Text);
                cmd.Parameters.AddWithValue("@blb07", txtET.Text);
                cmd.Parameters.AddWithValue("@blb08", txtFD.Text);
                cmd.Parameters.AddWithValue("@blb09", txtQC.Text);
                //cmd.Parameters.AddWithValue("@blb10", txtED.Text);
                cmd.Parameters.AddWithValue("@dio_name", Convert.ToString(Session["User"]));
                cmd.ExecuteNonQuery();
            }

            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }

            finally
            {
                conn.Close();
            }
        }

        protected void Btnsbmt_Click(object sender, EventArgs e)
        {
            SubmitData();
            Response.Write("<script type=\"text/javascript\">alert('Form Submitted successfully!')</script>");
            //Response.Redirect("SecondEntry.aspx");
            Server.Transfer("SecondEntry.aspx");
        }
    }
}