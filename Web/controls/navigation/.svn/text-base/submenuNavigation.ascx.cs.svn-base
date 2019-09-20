#region CMS License
/*
The MIT License

Copyright (c) 2008 - 2010 Mettle Systems LLC, P.O. Box 181192 Cleveland Heights, Ohio 44118, United States

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/
#endregion
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

namespace Etech.CMS.Web.controls
{
    public partial class submenuNavigation : System.Web.UI.UserControl
    {

        #region Member Variables

        private int pageId;
        private int navigationId;
        private int menuId;
        DataSet ds;
        DataSet dsParent;
        DataSet dsGrandChild;
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


            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetLeftMenu();
            ds = sp.GetDataSet();
            rptSubMenu.DataSource = ds;
            rptSubMenu.DataBind();

            /*for (int i = 0; i < rptSubMenu.Items.Count; i++)
            {
                Label lblPageID = (Label)rptSubMenu.Items[i].FindControl("lblPageID");

                Label lblRedirectID = (Label)rptSubMenu.Items[i].FindControl("lblRedirectID");

                if (lblRedirectID.Text.ToString() == menuId.ToString())
                {
                    if (i == rptSubMenu.Items.Count - 5)
                    {
                        HyperLink lnkPage = (HyperLink)rptSubMenu.Items[i].FindControl("lnkPage");
                        lnkPage.Attributes.Add("class", "active");
                    }
                    else if (i == rptSubMenu.Items.Count - 4)
                    {
                        HyperLink lnkPage = (HyperLink)rptSubMenu.Items[i].FindControl("lnkPage");
                        lnkPage.Attributes.Add("class", "active");
                    }
                    else if (i == rptSubMenu.Items.Count - 3)
                    {
                        HyperLink lnkPage = (HyperLink)rptSubMenu.Items[i].FindControl("lnkPage");
                        lnkPage.Attributes.Add("class", "active");
                    }
                    else if (i == rptSubMenu.Items.Count - 2)
                    {
                        HyperLink lnkPage = (HyperLink)rptSubMenu.Items[i].FindControl("lnkPage");
                        lnkPage.Attributes.Add("class", "active");
                    }
                    else if (i == rptSubMenu.Items.Count - 1)
                    {
                        HyperLink lnkPage = (HyperLink)rptSubMenu.Items[i].FindControl("lnkPage");
                        lnkPage.Attributes.Add("class", "active");
                    }
                }
            }*/


        }
        protected string Geturl(object obj)
        {
            return ConfigurationManager.AppSettings["siteRoot"].ToString() + "/" + obj + ".aspx";
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
                bool idFlag = false;
                HyperLink lnkPage;
                lnkPage = (HyperLink)e.Item.FindControl("lnkPage");

                Repeater dlSubMenu = (Repeater)e.Item.FindControl("rptChildMenu");

                //Get current pageID
                int id = Utility.GetIntParameter("pageId");

                

                if (itemPageId == id)
                {
                    idFlag = true;
                }

                

                int childCount = GetNoChildCount(itemPageId);

                if (itemPageId == 198 /*|| itemPageId==227*/)
                {
                    HyperLink leftMenuChild = (HyperLink)e.Item.FindControl("lnkPage");
                    leftMenuChild.Attributes.Add("class", "BGImage");
                }
                else
                {
                    if (childCount > 0)
                    {
                        //This sp is binding child repeater base on item id
                        SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetLeftChildMenu(itemPageId);
                        ds = sp.GetDataSet();
                        dlSubMenu.DataSource = ds;
                        dlSubMenu.DataBind();



                        HtmlGenericControl li1 = new HtmlGenericControl();
                        li1 = (HtmlGenericControl)e.Item.FindControl("divSubmenu");
                        li1.Attributes.Add("class", "subMenu");

                        //Get the currant page id.
                        int parentID = Utility.GetIntParameter("pageId");

                        //This sp is given parentid of current page.
                        SubSonic.StoredProcedure spParent = Etech.CMS.Content.SPs.GetChildMenuByPageID(parentID);
                        dsParent = spParent.GetDataSet();

                        if (Convert.ToInt32(dsParent.Tables[0].Rows[0]["Parentid"]) == itemPageId)
                        {
                            lnkPage.Attributes.Add("class", "active");
                        }
                        
                        //This sp is given parentid of child and grandchild base on current pageid 
                        //So that we can active parent title in left menu
                        SubSonic.StoredProcedure spParentByGrandChild = Etech.CMS.Content.SPs.GetParentIDByChildIDOrGrandChildID(parentID);
                        dsGrandChild  = spParentByGrandChild.GetDataSet();
                        if (Convert.ToInt32(dsGrandChild.Tables[0].Rows[0]["pid"]) == itemPageId)
                        {
                            lnkPage.Attributes.Add("class", "active");
                        }
                    }
                    else
                    {
                        if (idFlag == true)
                        {
                            HyperLink leftMenuChild = (HyperLink)e.Item.FindControl("lnkPage");
                            leftMenuChild.Attributes.Add("class", "active BGImage");
                            idFlag = false;
                        }
                        else
                        {
                            HyperLink leftMenuChild = (HyperLink)e.Item.FindControl("lnkPage");
                            leftMenuChild.Attributes.Add("class", "BGImage");
                        }
                    }
                }

                if (idFlag == true)
                {
                    HyperLink leftMenuChild = (HyperLink)e.Item.FindControl("lnkPage");
                    leftMenuChild.Attributes.Add("class", "active");
                    idFlag = false;
                }


                //Supporting us
                /*if (id == 246 && itemPageId==227)
                {
                    HyperLink leftMenuChild = (HyperLink)e.Item.FindControl("lnkPage");
                    leftMenuChild.Attributes.Add("class", "active BGImage");
                }*/

                /*if (itemPageName.ToLower() == "services")
                {
                    xmlDataSource.EnableCaching = false;
                    xmlDataSource.CacheDuration = 0;

                    xmlDataSource.Data = MenuCache.GetSubmenuById(137);

                    dlSubMenu.DataSource = xmlDataSource;

                    dlSubMenu.DataBind();

                    HtmlGenericControl li = new HtmlGenericControl();
                    li = (HtmlGenericControl)e.Item.FindControl("liPage");

                    li.Attributes.Add("class", "pMenu");
                }*/

                /*if (itemPageName.ToLower() == "about")
                {
                    lnkPage.Attributes.Add("class", "test");

                }*/



                /*foreach (RepeaterItem item in dlSubMenu.Items)
                {

                    Label lnkText = (Label)item.FindControl("linkText");

                    if (lnkText.Text.ToLower() == "physiotherapy")
                    {
                        HtmlGenericControl li = new HtmlGenericControl();
                        li = (HtmlGenericControl)item.FindControl("liSubMenu");
                        li.Attributes.Add("class", "Physiotherapy");
                    }
                    if (lnkText.Text.ToLower() == "back pain")
                    {
                        HtmlGenericControl li = new HtmlGenericControl();
                        li = (HtmlGenericControl)item.FindControl("liSubMenu");
                        li.Attributes.Add("class", "BackPain");
                    }

                    if (lnkText.Text.ToLower() == "neck pain")
                    {
                        HtmlGenericControl li = new HtmlGenericControl();
                        li = (HtmlGenericControl)item.FindControl("liSubMenu");
                        li.Attributes.Add("class", "NeckPain");
                    }

                    if (lnkText.Text.ToLower() == "clinical pilates")
                    {
                        HtmlGenericControl li = new HtmlGenericControl();
                        li = (HtmlGenericControl)item.FindControl("liSubMenu");
                        li.Attributes.Add("class", "ClinicalPilates");
                    }

                    if (lnkText.Text.ToLower() == "sports injuries")
                    {
                        HtmlGenericControl li = new HtmlGenericControl();
                        li = (HtmlGenericControl)item.FindControl("liSubMenu");
                        li.Attributes.Add("class", "SportsInjuries");
                    }

                    if (lnkText.Text.ToLower() == "posture")
                    {
                        HtmlGenericControl li = new HtmlGenericControl();
                        li = (HtmlGenericControl)item.FindControl("liSubMenu");
                        li.Attributes.Add("class", "Posture");
                    }

                    if (lnkText.Text.ToLower() == "womens health")
                    {
                        HtmlGenericControl li = new HtmlGenericControl();
                        li = (HtmlGenericControl)item.FindControl("liSubMenu");
                        li.Attributes.Add("class", "WomensHealth");
                    }

                    if (lnkText.Text.ToLower() == "rehabilitation gym")
                    {
                        HtmlGenericControl li = new HtmlGenericControl();
                        li = (HtmlGenericControl)item.FindControl("liSubMenu");
                        li.Attributes.Add("class", "RehabGym");
                    }




                }*/



            }

        }

        protected void rptChildMenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblPageID = (Label)e.Item.FindControl("lblPageID");
                int itemPageId = Convert.ToInt32(lblPageID.Text);

                HyperLink lnkPage;
                lnkPage = (HyperLink)e.Item.FindControl("lnkPage");


                //Get current pageID
                int id = Utility.GetIntParameter("pageId");

                if (itemPageId == id)
                {
                    HyperLink leftMenuChild = (HyperLink)e.Item.FindControl("lnkSubMenu");
                    leftMenuChild.Attributes.Add("class", "active");

                    
                }

                if (itemPageId == 229 && id == 251)
                {
                    HyperLink leftMenuChild = (HyperLink)e.Item.FindControl("lnkSubMenu");
                    leftMenuChild.Attributes.Add("class", "active");
                }

                if (itemPageId == 230 && id == 254)
                {
                    HyperLink leftMenuChild = (HyperLink)e.Item.FindControl("lnkSubMenu");
                    leftMenuChild.Attributes.Add("class", "active");
                }


                Repeater rptGrandChildPages = (Repeater)e.Item.FindControl("rptGrandChildPages");

                int childCount = GetNoChildCount(itemPageId);

                if (itemPageId != 229 && itemPageId != 230 && itemPageId != 222)
                {
                    if (childCount > 0)
                    {
                        //This sp binds grandchild base on childid
                        SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetLeftChildMenu(itemPageId);
                        ds = sp.GetDataSet();

                        rptGrandChildPages.DataSource = ds;
                        rptGrandChildPages.DataBind();                        
                    }
                }
                if (childCount > 0)
                {
                    //This sp is given parentid of current page.
                    //So that we can applay active class.
                    SubSonic.StoredProcedure spParent = Etech.CMS.Content.SPs.GetChildMenuByPageID(id);
                    dsParent = spParent.GetDataSet();

                    if (Convert.ToInt32(dsParent.Tables[0].Rows[0]["Parentid"]) == itemPageId)
                    {
                        HyperLink leftMenuChild = (HyperLink)e.Item.FindControl("lnkSubMenu");
                        leftMenuChild.Attributes.Add("class", "active");
                    }
                }
            }
        }

        #endregion


    }
}
