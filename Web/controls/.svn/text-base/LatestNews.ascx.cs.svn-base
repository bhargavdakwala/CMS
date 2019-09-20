using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using SubSonic.Utilities;
using Etech.CMS.Core;
using Etech.CMS.Content;
using Etech.CMS.Content.Caching;
using Etech.CMS.Store.Caching;


namespace Etech.CMS.Web.controls
{
    public partial class LatestNews : System.Web.UI.UserControl
    {
        #region Member Variables
        DataSet ds;
        int id;
        string BlogID;
        bool flag = false;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindNews();
            }
        }

        private void BindNews()
        {
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetLatestNews();
            ds = sp.GetDataSet();
            rptRecentNews.DataSource = ds;
            rptRecentNews.DataBind();
        }
    }
}