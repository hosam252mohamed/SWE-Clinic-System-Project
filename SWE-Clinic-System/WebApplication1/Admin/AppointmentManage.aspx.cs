using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Admin
{
    public partial class AppointmentManage : System.Web.UI.Page
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
                if (CheckAppointExist())
                {
                    ShowAppointDetails();
                }
            }
            catch (Exception ex) { }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            TextBox4.Text = "Accepted";
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            TextBox4.Text = "Declined";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (CheckAppointExist())
            {
                Response.Write("<script>alert('Appoint Details Updated Successfully')</script>");
                UpdateAppoint();
                ResetInputs();
            }
            else
            {
                Response.Write("<script>alert('Appointment is Not Exist')</script>");
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
        }
        protected void Button6_Click(object sender, EventArgs e)
        {
            if (CheckAppointExist())
            {
                DeleteAppoint();
                ResetInputs();
            }
            else
            {
                Response.Write("<script>alert('Appointment is Not Exist')</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckAppointExist())
            {
                Response.Write("<script>alert('Appointment is Already Exist')</script>");
            }
            else
            {
                AddAppoint();
                ResetInputs();
            }
        }

        bool CheckAppointExist()
        {
            SqlConnection conn = new SqlConnection(ConnStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM appointment where appointmentid = '" + TextBox1.Text.Trim() + "'", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows) { return true; }
            else { return false; }
        }
        void ShowAppointDetails()
        {
            SqlConnection conn = new SqlConnection(ConnStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM appointment where appointmentid = '" + TextBox1.Text.Trim() + "'", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                TextBox4.Text = dr.GetValue(2).ToString();
                TextBox6.Text = dr.GetValue(4).ToString();
                TextBox5.Text = dr.GetValue(3).ToString();
                TextBox7.Text = Convert.ToDateTime(dr.GetString(1)).ToString("yyyy-MM-dd");
            }
        }
        void UpdateAppoint()
        {
            SqlConnection conn = new SqlConnection(ConnStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE appointment SET [appointmentdate] = @appoint_date, [status] = @status WHERE appointmentid = '" + TextBox1.Text.Trim() + "'", conn);
            cmd.Parameters.AddWithValue("@appoint_date", TextBox7.Text);
            cmd.Parameters.AddWithValue("@status", TextBox4.Text.Trim());
            cmd.ExecuteNonQuery();
            conn.Close();
            GridView1.DataBind();
        }
        void DeleteAppoint()
        {
            SqlConnection conn = new SqlConnection(ConnStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("Delete from appointment WHERE appointmentid = '" + TextBox1.Text + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            GridView1.DataBind();
        }
        void AddAppoint()
        {
            SqlConnection conn = new SqlConnection(ConnStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO appointment ([appointmentdate],[status],[doctorid],[patientid]) VALUES (@app_date,@status,@doc_id,@pat_id)", conn);
            cmd.Parameters.AddWithValue("@app_date", TextBox7.Text);
            cmd.Parameters.AddWithValue("@status", TextBox4.Text.Trim());
            cmd.Parameters.AddWithValue("@doc_id", TextBox5.Text.Trim());
            cmd.Parameters.AddWithValue("@pat_id", TextBox6.Text.Trim());
            cmd.ExecuteNonQuery();
            conn.Close();
            GridView1.DataBind();
        }

        void ResetInputs()
        {
            TextBox1.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
        }
    }
}