using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Admin
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Session["role"].Equals("admin"))
                {
                    Response.Redirect("/Admin/admin-login.aspx");
                }
            }
            catch (Exception ex) 
            {
                Response.Redirect("/Admin/admin-login.aspx");
            }
        }
    }
}