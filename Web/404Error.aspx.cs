using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Etech.CMS.Web
{
    public partial class _04Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Status = "404 Not Found";
            //Response.StatusCode = 404;
            this.Response.StatusCode = 404;
            this.Response.StatusDescription = "Not Found";
            this.Response.TrySkipIisCustomErrors = true;

        }
    }
}
