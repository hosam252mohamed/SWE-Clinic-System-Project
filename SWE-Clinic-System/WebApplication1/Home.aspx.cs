using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals("doctor"))
                {
                    Response.Redirect("/Doctor/doc-homepage.aspx");
                }
                else if (Session["role"].Equals("admin"))
                {
                    Response.Redirect("/Admin/admin-homepage.aspx");
                }
            }
            catch (Exception ex) { }
        }
    }
}