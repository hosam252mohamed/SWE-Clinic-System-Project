using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Patient
{
    public partial class patient_reg : System.Web.UI.Page
    {
        string ConnStr = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["patientid"].Equals("") || !Session["role"].Equals("patient"))
                {
                    Response.Redirect("~/Patient/pat-login.aspx");
                }
                else
                {
                    Label1.Text = Session["patient_name"].ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("~/Patient/pat-login.aspx");
            }
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
                else
                {
                    Response.Write("<script>alert('Appointment is Not Exist')</script>");
                }
            }
            catch (Exception ex) { }
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
            SqlCommand cmd = new SqlCommand("SELECT * FROM appointment where appointmentid = '" + TextBox1.Text.Trim() + "' AND patientid = '" + Session["patientid"] +"'", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows) { return true; }
            else { return false; }
        }
        void ShowAppointDetails()
        {
            SqlConnection conn = new SqlConnection(ConnStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM appointment where appointmentid = '" + TextBox1.Text.Trim() + "' AND patientid = '" + Session["patientid"] + "'", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows) 
            { 
                while(dr.Read())
                {
                    TextBox7.Text = Convert.ToDateTime(dr.GetString(1)).ToString("yyyy-MM-dd");
                }
            }
        }
        void UpdateAppoint()
        {
            SqlConnection conn = new SqlConnection(ConnStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE appointment SET [appointmentdate] = @appoint_date, [doctorid] = @doc_id WHERE appointmentid = '" + TextBox1.Text.Trim() + "' AND patientid = '" + Session["patientid"] +"'", conn);
            cmd.Parameters.AddWithValue("@appoint_date", TextBox7.Text);
            cmd.Parameters.AddWithValue("@doc_id", DropDownList1.SelectedValue);
            cmd.ExecuteNonQuery();
            conn.Close();
            GridView1.DataBind();
        }
        void DeleteAppoint()
        {
            SqlConnection conn = new SqlConnection(ConnStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("Delete from appointment WHERE appointmentid = '" + TextBox1.Text + "' AND patientid = '" + Session["patientid"] +"'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            GridView1.DataBind();
        }
        void AddAppoint()
        {
            SqlConnection conn = new SqlConnection(ConnStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO appointment ([appointmentdate],[patientid],[doctorid],[status]) VALUES (@app_date,@pat_id,@doc_id,'Pending')", conn);
            cmd.Parameters.AddWithValue("@app_date", TextBox7.Text);
            cmd.Parameters.AddWithValue("@doc_id", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@pat_id", Session["patientid"].ToString());
            cmd.ExecuteNonQuery();
            conn.Close();
            GridView1.DataBind();
        }

        void ResetInputs()
        {
            TextBox1.Text = "";
            TextBox7.Text = "";
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            try
            {
                Session["patient_name"] = "";
                Session["patientid"] = "";
                Session["role"] = "";
                Response.Redirect("/Patient/pat-login.aspx");
            }
            catch (Exception ex) { }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    string status = e.Row.Cells[3].Text;
                    if (status == "Pending")
                    {
                        e.Row.BackColor = System.Drawing.Color.LightYellow;
                    }
                    else if (status == "Accepted")
                    {
                        e.Row.BackColor = System.Drawing.Color.LightGreen;
                    }
                    else
                    {
                        e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#ff5959");
                    }
                }
            }
            catch (Exception ex) { }
        }
    }

}