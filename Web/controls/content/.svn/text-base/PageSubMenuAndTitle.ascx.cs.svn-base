using System;
using System.IO;
using System.Web;
using System.Web.UI;
using Etech.CMS.Content.Caching;
using Etech.CMS.Core;
using Etech.CMS.Localization;
using Etech.CMS.Store;
using Etech.CMS.Store.Web;
using Etech.CMS.Web.controls;
using SubSonic.Utilities;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.UI.HtmlControls;
using Etech.CMS.Content;
using Etech.CMS.Store.Caching;
using Etech.CMS.Store.Services.MessageService;
using System.Data;

namespace Etech.CMS.Web.controls.content
{
    public partial class PageSubMenuAndTitle : ProviderControl
    {
        DataSet ds;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }
        protected override void OnInit(EventArgs e)
        {
            
            int pageID = Utility.GetIntParameter("pageId");


            if (pageID > 0)
            {
                SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetRegionTitleByPageID(pageID);
                ds = sp.GetDataSet();
                hPageContentTitle.InnerHtml = ds.Tables[0].Rows[0]["Title"].ToString();

            }

            base.OnInit(e);
        }
    }
}