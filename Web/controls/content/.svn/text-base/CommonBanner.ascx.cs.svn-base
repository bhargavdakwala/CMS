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
using Etech.CMS.Store;
using Etech.CMS.Store.Caching;
using Etech.CMS.Store.Services.MessageService;

namespace Etech.CMS.Web.controls.content
{
    public partial class CommonBanner : System.Web.UI.UserControl
    {
        #region Member Variables
        DataSet ds;
        int id;
        bool flag = false;

        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                GetRecentImageGallary();
        }
        private void GetRecentImageGallary()
        {
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.FetchCommonBannerBySortOrder();
            ds = sp.GetDataSet();
            rptImageGallary.DataSource = ds;
            rptImageGallary.DataBind();
  
        }

        protected string ImagePath(object obj)
        {
            string path = obj.ToString();
            return path.Replace("~", ConfigurationManager.AppSettings["siteRoot"].ToString());
        }
    }
}