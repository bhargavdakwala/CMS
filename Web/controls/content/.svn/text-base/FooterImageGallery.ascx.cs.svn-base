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
    public partial class FooterImageGallery : System.Web.UI.UserControl
    {
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindPlatinumSponsorsGallery();
            }
        }


        private void BindPlatinumSponsorsGallery()
        {
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetFooterImages();
            ds = sp.GetDataSet();

            rptFooterImageGallery.DataSource = ds;
            rptFooterImageGallery.DataBind();
        }

        protected string ImagePath(object obj)
        {
            string path = obj.ToString();
            return path.Replace("~", ConfigurationManager.AppSettings["siteRoot"].ToString());
        }

        protected string Geturl(object obj)
        {
            return ConfigurationManager.AppSettings["siteRoot"].ToString() + "/" + obj + ".aspx";
        }
    }
}