using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Web.Services;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using Etech.CMS.Content;
using System.Collections.Generic;
using System.Linq;
using Etech.CMS.Store;
using Etech.CMS.Store.Caching;
using Etech.CMS.Store.Services.MessageService;
using Etech.CMS.Core;
using Etech.CMS.Localization;
using SubSonic;

namespace Etech.CMS.Web
{
    public partial class ReadMoreNews : System.Web.UI.Page
    {

        #region Member Variables
        DataSet ds;
        int id;
        bool flag = false;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Request.QueryString["ID"] != null)
                {
                    string test = Request.QueryString["ID"].ToString();
                    ds = new BlogEditController().FetchNewsByID(Convert.ToInt32(test));
                    //dgRecentPostHeader.DataSource = ds;
                    //dgRecentPostHeader.DataBind();
                }
            }
        }
    }
}
