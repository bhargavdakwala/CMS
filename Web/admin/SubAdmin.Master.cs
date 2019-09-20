using System;
using System.Web;
using System.Web.UI.WebControls;

using Etech.CMS.Localization;
using Etech.CMS.Store.Web;
using Etech.CMS.Web.controls;
using Etech.CMS.Content.Caching;
using Etech.CMS.Store.Caching;
using Etech.CMS.Content;
using Etech.CMS.Core;

namespace Etech.CMS.Web.admin
{
    public partial class SubAdmin : AdminMasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                base.MessageCenter.Title = LocalizationUtility.GetText("pnlMessageCenter");
                divMessageCenter.Controls.Add(base.MessageCenter);
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(submenuNavigation).Name + "Page_Load", ex);
            }
        }
    }
}
