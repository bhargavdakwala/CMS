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
    public partial class ImageGallaryOTSD : ProviderControl
    {
        #region Member Variables
        DataSet ds;
        int id;
        bool flag = false;

        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            //GetRecentImageGallary();
        }
        /*private void GetRecentImageGallary()
        {
            ds = new ImageEditController().FetchAllImageGallary();
            rptImageGallary.DataSource = ds;
            rptImageGallary.DataBind();

        }*/

    }
}