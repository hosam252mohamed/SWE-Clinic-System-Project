using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Patient
{
    public partial class pat_login : System.Web.UI.Page
    {
        string ConnStr = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConnStr);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM patient where username = '" + TextBox1.Text.Trim() + "' AND password = '" + TextBox2.Text + "'", conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        if (dr.GetValue(4).ToString().Trim().Equals("Pending")) Response.Write("<script>alert('Account is Pending For Review')</script>");
                        else if (dr.GetValue(4).ToString().Trim().Equals("Deactive")) Response.Write("<script>alert('Account is Deactive, Contact us to Reactive it')</script>");
                        else
                        {
                            Session["patient_name"] = dr.GetValue(1);
                            Session["patientid"] = dr.GetValue(0);
                            Session["role"] = "patient";
                            // Redirecting
                            Response.Redirect("/Patient/pat-homepage.aspx");
                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Username Or Password');</script>");

                }
            }
            catch (Exception ex) { }
        }
    }
}