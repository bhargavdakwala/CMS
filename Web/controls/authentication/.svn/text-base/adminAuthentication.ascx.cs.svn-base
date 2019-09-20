using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace Etech.CMS.Web.controls.authentication
{
    public partial class adminAuthentication : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Page.User.IsInRole("Administrator"))
            {
                //hlAdmin.Visible = true;
            }
            base.Page_Load(sender, e);
        }
        protected void lloginTitleText_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/default.aspx", true);
        }
    }
}