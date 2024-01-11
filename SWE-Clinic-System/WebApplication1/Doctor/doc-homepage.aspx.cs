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
    public partial class WebForm2 : System.Web.UI.Page
    {
        public int appInProg = 0;
        public int appDelined = 0;

        string ConnStr = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["docID"].Equals("") || !Session["role"].Equals("doctor"))
                {
                    Response.Redirect("~/Doctor/doc-login.aspx");
                }
                else { 
                    AppointmentCalender();
                    Label1.Text = Session["doctor_name"].ToString();
                    Label2.Text = appInProg + "";
                    Label3.Text = appDelined + "";
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("~/Doctor/doc-login.aspx");
            }

        }

        void AppointmentCalender()
        {
            SqlConnection conn = new SqlConnection(ConnStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM appointment where DoctorID = '" + Session["docID"] + "'", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows) 
            { 
            
                while (dr.Read())
                {
                    if (dr.GetValue(2).ToString() == "Pending" || dr.GetValue(2).ToString() == "Accepted") appInProg += 1;
                    
                    else appDelined += 1;
                }
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    string status = e.Row.Cells[2].Text;
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