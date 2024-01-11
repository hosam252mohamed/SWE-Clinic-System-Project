using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Doctor
{
    public partial class patientManage : System.Web.UI.Page
    {
        string ConnStr = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (CheckUserExist())
                {
                    ShowUserDetails();
                }
            }
            catch (Exception ex) { }
        }
        protected void Button5_Click(object sender, EventArgs e)
        {
            TextBox4.Text = "Active";
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            TextBox4.Text = "Suspend";
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            TextBox4.Text = "Deactive";
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (CheckUserExist())
            {
                Response.Write("<script>alert('Patient Details Updated Successfully')</script>");
                UpdateUser();
                ResetInputs();
            }
            else
            {
                Response.Write("<script>alert('Patient is Not Exist')</script>");
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (CheckUserExist())
            {
                DeleteUser();
                ResetInputs();
            }
            else
            {
                Response.Write("<script>alert('Patient is Not Exist')</script>");
            }
        }

        bool CheckUserExist()
        {
            SqlConnection conn = new SqlConnection(ConnStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM patient where patientid = '" + TextBox1.Text.Trim() + "'", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows) { return true; }
            else { return false; }
        }
        void ShowUserDetails()
        {
            SqlConnection conn = new SqlConnection(ConnStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM patient where patientid = '" + TextBox1.Text.Trim() + "'", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                TextBox4.Text = dr.GetValue(4).ToString();
                TextBox3.Text = dr.GetValue(1).ToString();
            }
        }
        void UpdateUser()
        {
            SqlConnection conn = new SqlConnection(ConnStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE patient SET [patientname] = @pname, [status] = @status WHERE patientid = '" + TextBox1.Text.Trim() + "'", conn);
            cmd.Parameters.AddWithValue("@pname", TextBox3.Text.Trim());
            cmd.Parameters.AddWithValue("@status", TextBox4.Text.Trim());
            cmd.ExecuteNonQuery();
            conn.Close();
            GridView1.DataBind();
        }
        void DeleteUser()
        {
            SqlConnection conn = new SqlConnection(ConnStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("Delete from patient WHERE patientid = '" + TextBox1.Text + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            GridView1.DataBind();
        }
        void ResetInputs()
        {
            TextBox1.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
        }
    }
}