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
    public partial class PlatinumSponsorsGallery : System.Web.UI.UserControl
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
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetPlatinumSponsorsImages();
            ds = sp.GetDataSet();

            rptPlatinumSponsorsGallery.DataSource = ds;
            rptPlatinumSponsorsGallery.DataBind();
        }

        protected string ImagePath(object obj)
        {
            string path = obj.ToString();
            return path.Replace("~", ConfigurationManager.AppSettings["siteRoot"].ToString());
        }

        protected string GetURL(object obj)
        {
            string path = obj.ToString();

            //return path.Replace("http://localhost:3467/controls/content/", "");
            return path;
        }


        /*protected void rptPlatinumSponsorsGallery_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            ImageButton lnkImag = (ImageButton)e.Item.FindControl("");
            

            if (e.CommandName == "URLTitle")
            {
                string urlPath= Convert.ToString(e.CommandArgument);
                Type clientScriptType = this.GetType();
                String clientScriptName = "ButtonClickScript";

                // Get a ClientScriptManager reference from the Page class.
                ClientScriptManager clientScript = Page.ClientScript;

                StringBuilder sb = new StringBuilder();
                sb.Append("<script type='text/javascript'>");
                sb.Append("window.open(' " + urlPath + "')"); //URL = where you want to redirect.
                sb.Append("</script>");
                clientScript.RegisterClientScriptBlock(this.GetType(), clientScriptName, sb.ToString());
                //Response.Redirect(urlPath);

            }
        }*/


    }
}