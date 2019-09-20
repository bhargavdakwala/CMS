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

namespace Etech.CMS.Web
{
    public partial class TherapiststList : Etech.CMS.Store.Web.SitePage
    {
        int id;
        DataSet ds;
        HtmlGenericControl regionControl;
        HtmlGenericControl regionTitleControl;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Utility.GetIntParameter("mid");

            if (!IsPostBack)
            {
                if (id != 0)
                {
                   
                    SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetAllCategoryImagesDetail(id);
                    ds = sp.GetDataSet();
                    rptDetail.DataSource = ds;
                    rptDetail.DataBind();
                }
            }
        }

        protected override void OnInit(EventArgs e)
        {

            string regionTitle = string.Empty;
            int pageID = 142;
            string pageTitleImage = string.Empty;

            if (pageID > 0)
            {
                SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetRegionTitleByPageID(pageID);
                ds = sp.GetDataSet();
                regionTitle = ds.Tables[0].Rows[0]["Title"].ToString();
                pageTitleImage = ds.Tables[0].Rows[0]["PageTitleImage"].ToString();
                imgPageTitleImage.Src = pageTitleImage.Replace("~", ConfigurationManager.AppSettings["siteRoot"].ToString());

                

            }

            if (pageTitleImage == "")
            {
                divPageTitleImage.Visible = false;
            }


            h1BreadCums.InnerHtml = regionTitle;

            regionTitleControl = new HtmlGenericControl("span");
            regionTitleControl.Attributes.Add("class", "floatRight breadCrumbs");

            h1BreadCums.Controls.Add(regionTitleControl);


            SiteMapPath SiteMapPath1 = new SiteMapPath();
            SiteMapPath1.ID = "SiteMapPath1";
            SiteMapPath1.PathSeparator = " > ";
            SiteMapPath1.SiteMapProvider = "XmlSiteMapProvider";
            regionTitleControl.Controls.Add(SiteMapPath1);

            base.OnInit(e);


        }
        private void AddControls()
        {

            string regionTitle = string.Empty;
            int pageID = Utility.GetIntParameter("pageId");
            HtmlGenericControl titleControl;
            if (pageID > 0)
            {
                SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetRegionTitleByPageID(pageID);
                regionTitle = Convert.ToString(sp.ExecuteScalar());
                //h1RegionCrums.InnerHtml = regionTitle;
            }

            foreach (Control control in this.Page.Controls)
            {
                if (control is System.Web.UI.HtmlControls.HtmlGenericControl)
                {
                    System.Web.UI.HtmlControls.HtmlGenericControl div = (System.Web.UI.HtmlControls.HtmlGenericControl)control;
                    if (div.TagName.ToLower() == "div")
                    {
                        div.InnerHtml = regionTitle;
                    }
                }
            }

        }

    }
}