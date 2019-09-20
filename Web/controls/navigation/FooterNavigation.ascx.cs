using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data;
using SubSonic.Utilities;
using Etech.CMS.Core;
using Etech.CMS.Content;
using Etech.CMS.Content.Caching;
using Etech.CMS.Store.Caching;
using System.Configuration;

namespace Etech.CMS.Web.controls.navigation
{
    public partial class FooterNavigation : System.Web.UI.UserControl
    {
        #region Member Variables

        private int pageId;
        private int navigationId;
        private int menuId;
        DataSet ds;
        HtmlGenericControl contactUL;
        HtmlGenericControl contactLI;
        HtmlGenericControl profileDiv;

        int count = 0;

        public int PageId
        {
            get { return pageId; }
            set { pageId = value; }
        }

        public int NavigationId
        {
            get { return navigationId; }
            set { navigationId = value; }
        }
        public int MenuId
        {
            get { return menuId; }
            set { menuId = value; }
        }

        #endregion

        #region Page Events

        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="T:System.EventArgs"/> instance containing the event data.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                this.NavigationId = this.pageId;
                this.menuId = Utility.GetIntParameter("pageId");

                LoadTopMenu();
                LoadSubmenus();


            }
            catch (Exception ex)
            {
                Logger.Error(typeof(submenuNavigation).Name + "Page_Load", ex);
            }
        }

        #endregion

        #region Methods

        #region Private

        /// <summary>
        /// Loads the categories.
        /// </summary>
        private void LoadSubmenus()
        {
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetFooterMenu();
            ds = sp.GetDataSet();
            rptSubMenu.DataSource = ds;
            rptSubMenu.DataBind();
        }
        protected string Geturl(object obj)
        {
            return ConfigurationManager.AppSettings["siteRoot"].ToString() + "/" + obj + ".aspx";
        }


        private void LoadTopMenu()
        {
            GetTopPage();

            RewriteService.AddRewriteNameSpaceForXslt(xmlDataSource);
            xmlDataSource.EnableCaching = false;
            xmlDataSource.CacheDuration = 0;

            xmlDataSource.Data = MenuCache.GetTopMenuById(this.NavigationId);

            rptTopMenu.DataSource = xmlDataSource;
            rptTopMenu.DataBind();
        }

        private void GetTopPage()
        {
            Content.Page page = new Content.Page(this.NavigationId);
            if (page.ParentId != 0)
            {
                this.NavigationId = page.ParentId;
                GetTopPage();
            }
        }


        #endregion


        private int GetNoChildCount(int id)
        {

            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.CountNoOfChild(id);
            count = Convert.ToInt32(sp.ExecuteScalar());
            return count;
        }

        protected string ImaePath(object obj)
        {
            string path = obj.ToString();
            return path.Replace("~", ConfigurationManager.AppSettings["siteRoot"].ToString());
        }

        protected void rptSubMenu_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int itemPageId = Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "PageId").ToString());

                HyperLink lnkPage;
                lnkPage = (HyperLink)e.Item.FindControl("lnkPage");

                Repeater dlSubMenu = (Repeater)e.Item.FindControl("rptChildMenu");

                int childCount = GetNoChildCount(itemPageId);

                if (itemPageId != 227)
                {
                    if (childCount > 0)
                    {
                        SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetLeftChildMenu(itemPageId);
                        ds = sp.GetDataSet();

                        dlSubMenu.DataSource = ds;
                        dlSubMenu.DataBind();


                    }
                }

                foreach (RepeaterItem item in dlSubMenu.Items)
                {

                    Label lblPageID = (Label)item.FindControl("lblPageID");

                    //if (lblPageID.Text == "262" || lblPageID.Text == "258" || lblPageID.Text == "259" || lblPageID.Text == "260" || lblPageID.Text == "261")
                    if (lblPageID.Text == "262" || lblPageID.Text == "284" || lblPageID.Text == "282" || lblPageID.Text == "285" || lblPageID.Text == "286")
                    {
                        HtmlGenericControl li = new HtmlGenericControl();
                        li = (HtmlGenericControl)item.FindControl("liSubMenu");
                        li.Style["display"] = "none";
                    }
                    
                }

                HtmlGenericControl ul = (HtmlGenericControl)e.Item.FindControl("lblTitle");
                if(itemPageId == 193)
                {
                    ul.Attributes.Add("class", "floatLeft");
                    ul.Style["width"] = "200px";
                }

                

                if (itemPageId == 191)
                {
                    ul.Attributes.Add("class", "floatLeft");
                    ul.Style["width"] = "140px";
                }
                if (itemPageId == 212)
                {
                    ul.Attributes.Add("class", "floatRight");
                    ul.Style["width"] = "140px";
                }
                if (itemPageId == 207)
                {
                    ul.Attributes.Add("class", "floatLeft");
                    ul.Style["width"] = "140px";
                }

                if (itemPageId == 198)
                {
                    ul.Attributes.Add("class", "floatLeft");
                    ul.Style["width"] = "200px";
                    ul.Style["margin-top"] = "-34px";
                }

                if (itemPageId == 211)
                {
                    ul.Attributes.Add("class", "floatLeft");
                    ul.Style["width"] = "140px";
                    
                }

                if (itemPageId == 213)
                {
                    ul.Attributes.Add("class", "floatRight");
                    ul.Style["width"] = "140px";
                    ul.Style["margin-top"] = "-60px";
                }

                if (itemPageId == 192)
                {
                    ul.Attributes.Add("class", "floatRight");
                    ul.Style["width"] = "140px";
                    
                }

                if (itemPageId == 226)
                {
                    ul.Attributes.Add("class", "floatRight");
                    ul.Style["width"] = "140px";

                }

                if (itemPageId == 227)
                {
                    ul.Attributes.Add("class", "floatRight");
                    ul.Style["width"] = "140px";
                    lnkPage.Style["border-bottom"] = "none";

                }
            }
           
            
        }




        protected void rptTopMenu_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                HtmlGenericControl li = new HtmlGenericControl();
                li = (HtmlGenericControl)e.Item.FindControl("liPage");

                Label lblPageID = (Label)e.Item.FindControl("lblPageID");

                if (Convert.ToInt32(lblPageID.Text) == 190)
                {
                    contactUL = new HtmlGenericControl("ul");
                    contactUL.Style["font-size"] = "14px";
                    li.Controls.Add(contactUL);

                    contactLI = new HtmlGenericControl("li");
                    contactLI.InnerHtml = "PO Box 335<br/>Mt Hawthorn<br/>WA 6915<br/>Australia";
                    contactUL.Controls.Add(contactLI);
                }





            }
        }
        #endregion
    }
}