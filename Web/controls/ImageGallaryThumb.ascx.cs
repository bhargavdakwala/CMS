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
namespace Etech.CMS.Web.controls
{
    public partial class ImageGallaryThumb : ProviderControl
    {
        #region Member Variables
        DataSet ds;
        int id;
        bool flag = false;

        #endregion

        int img = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            GetRecentImageGallary();
           
            
        }
        protected void DataPager1_PreRender(object sender, EventArgs e)
        {
            DataSet ds = (DataSet)ViewState["data"];
            lvPhotos.DataSource = ds;
            lvPhotos.DataBind();
        }

        private void GetRecentImageGallary()
        {
            ds = new DataSet();
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.FetchAllImageGallary(0);
            ds = (DataSet)sp.GetDataSet();

            
            ViewState["data"] = ds;
            lvPhotos.DataSource = ds;
            lvPhotos.DataBind();

        }

        
      

        

        
       

       

       
    }
}