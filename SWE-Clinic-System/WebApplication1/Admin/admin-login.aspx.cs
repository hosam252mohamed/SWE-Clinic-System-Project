using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Admin
{
    public partial class admin_login1 : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connString);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from admin_login where username = '" + TextBox1.Text.Trim() + "' AND password = '" + TextBox2.Text + "'", conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    Session["role"] = "admin";
                    Response.Redirect("/Admin/admin-homepage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Credientials');</script>");

                }
            }
            catch (Exception ex) { }
        }
    }
}