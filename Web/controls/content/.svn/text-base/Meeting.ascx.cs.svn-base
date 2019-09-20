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

namespace Etech.CMS.Web.controls.content
{
    public partial class Meeting : ProviderControl
    {
        #region Member Variables
        DataSet ds;
        
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindMonthlyMeeting();
            }
        }

        private void BindMonthlyMeeting()
        {
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetMonthlyMeeting();
            ds = sp.GetDataSet();
            rptMeeting.DataSource = ds;
            rptMeeting.DataBind();
        }
    }
}