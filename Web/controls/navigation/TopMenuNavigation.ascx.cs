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


namespace Etech.CMS.Web.controls.navigation
{
    public partial class TopMenuNavigation : System.Web.UI.UserControl
    {
        #region Member Variables

        private int pageId;
        private int navigationId;
        private int menuId;
       

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
                this.menuId = Utility.GetIntParameter("pageId"); ;

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
            GetTopPage();

            RewriteService.AddRewriteNameSpaceForXslt(xmlDataSource);
            xmlDataSource.EnableCaching = false;
            xmlDataSource.CacheDuration = 0;

            xmlDataSource.Data = MenuCache.GetTopMenuById(this.NavigationId);

            rptSubMenu.DataSource = xmlDataSource;
            rptSubMenu.DataBind();

           /* for (int i = 0; i < rptSubMenu.Items.Count; i++)
            {
                Label lblPageID = (Label)rptSubMenu.Items[i].FindControl("lblPageID");
                if (lblPageID.Text.ToString() == menuId.ToString())
                {
                    if (i == rptSubMenu.Items.Count - 2)
                    {
                        HyperLink lnkPage = (HyperLink)rptSubMenu.Items[i - 1].FindControl("lnkPage");
                        lnkPage.Attributes.Add("class", "active");
                    }
                    else if (i == rptSubMenu.Items.Count - 1)
                    {
                        HyperLink lnkPage = (HyperLink)rptSubMenu.Items[i - 3].FindControl("lnkPage");
                        lnkPage.Attributes.Add("class", "active");
                    }
                }
            }*/


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

        protected void rptSubMenu_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int itemPageId = Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "PageId").ToString());
                string itemPageName = DataBinder.Eval(e.Item.DataItem, "Text").ToString();
                HyperLink lnkPage;
                lnkPage = (HyperLink)e.Item.FindControl("lnkPage");

               /* if (this.menuId == itemPageId)
                {
                    lnkPage.Attributes.Add("class", "active");
                }*/

                

                if (itemPageName == "Online Quotation Request")
                {
                    HtmlGenericControl li = new HtmlGenericControl();
                    li = (HtmlGenericControl)e.Item.FindControl("liPage");
                    li.Visible = false;
                }

                if (itemPageName == "News")
                {
                    HtmlGenericControl li = new HtmlGenericControl();
                    li = (HtmlGenericControl)e.Item.FindControl("liPage");
                    li.Visible = false;
                }

                if (itemPageName == "SiteMap")
                {
                    HtmlGenericControl li = new HtmlGenericControl();
                    li = (HtmlGenericControl)e.Item.FindControl("liPage");
                    li.Visible = false;
                }

               
                //Get current pageID
                int id = Utility.GetIntParameter("pageId");

                DataSet ds;
                SubSonic.StoredProcedure spParent = Etech.CMS.Content.SPs.GetMenuTitleByPageID(id);
                ds = spParent.GetDataSet();

                if (Convert.ToString(ds.Tables[0].Rows[0]["MenuTitle"]).ToLower() == itemPageName.ToLower())
                {
                    lnkPage.Attributes.Add("class", "active");
                }
                else if (Convert.ToString(ds.Tables[0].Rows[0]["MenuTitle"]).ToLower() == "platinum sponsors" && itemPageId==189)
                {
                    lnkPage.Attributes.Add("class", "active");
                }

                
            }

        }

        #endregion
    }
}