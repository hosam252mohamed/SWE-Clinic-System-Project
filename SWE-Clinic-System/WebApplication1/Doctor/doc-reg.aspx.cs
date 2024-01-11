using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class doc_reg1 : System.Web.UI.Page
    {
        string ConnStr = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckUserExist())
            {
                Response.Write("<script>alert('Account is Already Registered')</script>");
            }
            else
            {
                addAccount();
            }
        }

        bool CheckUserExist()
        {
            SqlConnection conn = new SqlConnection(ConnStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM doctor where username = '" + TextBox2.Text.Trim() + "'", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows) { return true; }
            else { return false; }
        }
        void addAccount()
        {
            SqlConnection conn = new SqlConnection(ConnStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO doctor ([doctorname],[username],[password],[specialist],[status]) VALUES ('" + TextBox1.Text.Trim() + "','" + TextBox2.Text.Trim() + "','" + TextBox3.Text.Trim() + "','" + DropDownList1.SelectedItem.Value + "', 'Pending')", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("~/Doctor/doc-login.aspx");
        }
    }
}