using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            try
            {
                Session["doctor_name"] = "";
                Session["docID"] = "";
                Session["specialist"] = "";
                Session["role"] = "";
                Response.Redirect("~/Doctor/doc-login.aspx");
            }
            catch(Exception ex) { }
        }
    }
}