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
using System.Data;
using System.Web.Mail;
using SubSonic;

namespace Etech.CMS.Web
{
    public partial class site : SiteMasterPage
    {

        #region Member Variables

        DataSet ds;
        string sPageName = string.Empty;
        int count = 0;
        int pageId = 0;

        public int PageId
        {
            get { return pageId; }
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
            if (!this.IsPostBack)
            {
                //This fuctions is loading keywords,description from database according to given page.
                LoadSeoContent();
                
                //This function is getting current page content title
                GetPageTitle();

                //Get current pageID
                int PageID = Utility.GetIntParameter("pageId");

                //Gets page parentid for binding middle sub menu
                int pid = GetChildMenuByID();

                this.pageId = pid;

                //This function is getting no of child count for Parent page.
                int childCount = GetNoChildCount(pid);

                //Chechk if count is there so middle menu will be bound otherwise middle menu is not visible
                if (childCount > 0)
                {
                    BindMiddleMenu();
                    if (this.pageId != 198  && this.pageId != 228)
                    {
                        lnkNext.Visible = true;
                        lnkPrevious.Visible = true;
                    }
                }
                else
                {
                    divMiddleMenu.Visible = false;
                }

                DisplayNextPreviousButton();
            }


            //Get current pageID
            int pageID = Utility.GetIntParameter("pageId");

            //This is code for display Meeting and News banner on home page.
            //Banners will be displayed below mentioed id page.

            if(pageID == 287)
            {
                dvMeeting.Visible = true;
                dvRecentNews.Visible = true;
            }
            else if (pageID != 237 && pageID != 239)
            {
                dvMeeting.Visible = false;
                dvRecentNews.Visible = false;
            }
            //else if(pageID == 287)
            //{
            //    dvMeeting.Visible = false;
            //    dvRecentNews.Visible = false;
            //}
            
        }
        #endregion

        #region Private Methods

        //Set the absoluate path for url
        protected string Geturl(object obj)
        {
            return ConfigurationManager.AppSettings["siteRoot"].ToString() + "/" + obj + ".aspx";
        }

        private void BindMiddleMenu()
        {
            

            //Below mentioed page id is not displyed middle menu
            if (this.pageId != 198 && this.pageId != 228) 
            {
                int itemPageId = GetChildMenuByID();

                SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetSubChildMenuByPageID(itemPageId);
                ds = sp.GetDataSet();

                ds.Tables[0].Rows[0]["Title"].ToString();

                rptSubMenu.DataSource = ds;
                rptSubMenu.DataBind();
            }
        }

        private int GetChildMenuByID()
        {
            //Get current page id
            int id = Utility.GetIntParameter("pageId");
            int ParentID = 0;

            
                SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetChildMenuByPageID(id);
                ds = sp.GetDataSet();

                //If parentid is nothing, current page id should be parentid
                if (Convert.ToInt32(ds.Tables[0].Rows[0]["Parentid"]) == 0)
                {
                    ParentID = id;
                }
                else
                {
                    ParentID = Convert.ToInt32(ds.Tables[0].Rows[0]["Parentid"]);
                }

            
            return ParentID;
        }

        private int GetNoChildCount(int id)
        {

            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.CountNoOfChild(id);
            count = Convert.ToInt32(sp.ExecuteScalar());
            return count;
        }

        private void GetPageTitle()
        {
            int pageID = Utility.GetIntParameter("pageId");


            if (pageID > 0)
            {
                SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetRegionTitleByPageID(pageID);
                ds = sp.GetDataSet();

                if (ds.Tables[0].Rows.Count > 0)
                {
                    hPageContentTitle.InnerHtml = ds.Tables[0].Rows[0]["Title"].ToString();
                }

            }
        }


        /// <summary>
        /// Loads the SEO Meta Tags.
        /// </summary>
        private void LoadSeoContent()
        {
            try
            {
                GeneratorTag.Content = "CMS";
                if (SiteSettings.SeoSetting.SiteKeywords != null)
                {
                    KeyWords.InsertRange(0, SiteSettings.SeoSetting.SiteKeywords.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries));
                    KeyWords.Add("CMS");
                    KeyWords.Add("dC");
                }

                string text = LocalizationUtility.GetText("CopyrightTemplate");
                //CopyrightTag.Content = string.Format(string.IsNullOrEmpty(text) ? "Copyright (c) {0} by {1}" : text, DateTime.Now.Year, string.IsNullOrEmpty(SiteSettings.SeoSetting.CopyrightText)? SiteSettings.SiteName : SiteSettings.SeoSetting.CopyrightText);

                if (HideSeoInformation)
                {
                    DescriptionTag.Visible = false;
                    KeywordsTag.Visible = false;
                    return;
                }

                if (string.IsNullOrEmpty(Description))
                    Description = SiteSettings.SeoSetting.SiteDescription;
                DescriptionTag.Content = string.Concat(SiteSettings.SeoSetting.SiteDescription, " ", Description);
                //if there is no description then hide the meta tag.
                DescriptionTag.Visible = !string.IsNullOrEmpty(Description);

                if (KeyWords.Count > 0)
                {
                    KeywordsTag.Content = string.Join(",", KeyWords.ToArray()).Replace(",,", ",");
                    if (KeywordsTag.Content.StartsWith(",", StringComparison.InvariantCulture))
                        KeywordsTag.Content = KeywordsTag.Content.Remove(0, 1);
                }
                //if there is no keywords then hide the meta tag.
                KeywordsTag.Visible = !string.IsNullOrEmpty(KeywordsTag.Content.Trim());
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(site).Name + ".LoadSeoContent", ex);
                throw;
            }
        }


        

       

        #endregion Private Methods

        #region Properties

        /// <summary>
        /// Gets the script manager.
        /// </summary>
        /// <value>The script manager.</value>
        public ScriptManager ScriptManager
        {
            get
            {
                return scriptManager;
            }
        }

        #endregion

        protected void rptSubMenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //Get current pageID
                int id = Utility.GetIntParameter("pageId");
                Label lblPageID = (Label)e.Item.FindControl("lblPageID");
                

                    

                    if (lblPageID.Text == id.ToString())
                    {
                        HtmlTableCell td = (HtmlTableCell)e.Item.FindControl("tdActive");
                        td.Attributes.Add("class", "active");
                    }
               
            }
        }

        protected void lnkNext_Click(object sender, EventArgs e)
        {
            DataTable dtNextMenu = new DataTable();
            
            
            //Get current pageID
            int id = Utility.GetIntParameter("pageId");

            int nextID = 0;
            string menuURL = string.Empty;
            string nextMenuUrl = string.Empty;

            if (this.pageId != 198 &&  this.pageId != 228)
            {
                int itemPageId = GetChildMenuByID();

                SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetSubChildMenuByPageID(itemPageId);
                ds = sp.GetDataSet();
                dtNextMenu = ds.Tables[0];

                

                for (int i = 0; i < dtNextMenu.Rows.Count; i++)
                {
                    if (Convert.ToString(dtNextMenu.Rows[i]["PageID"]) == id.ToString())
                    {
                        nextID = Convert.ToInt32(dtNextMenu.Rows[i]["RowNumber"]);
                        nextID = nextID + 1;
                        break;
                    }
                    else
                    {
                        nextID = 1;
                    }
                }


                if (nextID > dtNextMenu.Rows.Count)
                {
                    nextID = 1;

                    for (int i = 0; i < dtNextMenu.Rows.Count; i++)
                    {
                        if (Convert.ToString(dtNextMenu.Rows[i]["RowNumber"]) == nextID.ToString())
                        {
                            menuURL = Convert.ToString(dtNextMenu.Rows[i]["URLTitle"]);
                            break;
                        }
                    }
                }
                else
                {
                    for (int i = 0; i < dtNextMenu.Rows.Count; i++)
                    {
                        if (Convert.ToString(dtNextMenu.Rows[i]["RowNumber"]) == nextID.ToString())
                        {
                            menuURL = Convert.ToString(dtNextMenu.Rows[i]["URLTitle"]);
                            break;
                        }
                    }
                }
                

                nextMenuUrl = ConfigurationManager.AppSettings["siteRoot"].ToString() + "/" + menuURL +".aspx";

                Response.Redirect(nextMenuUrl);
            }
        }

        protected void lnkPrevious_Click(object sender, EventArgs e)
        {
            DataTable dtNextMenu = new DataTable();


            //Get current pageID
            int id = Utility.GetIntParameter("pageId");

            int prevID = 0;
            string menuURL = string.Empty;
            string prevMenuUrl = string.Empty;

            if (this.pageId != 198 &&  this.pageId != 228)
            {
                int itemPageId = GetChildMenuByID();

                SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetSubChildMenuByPageID(itemPageId);
                ds = sp.GetDataSet();
                dtNextMenu = ds.Tables[0];



                for (int i = 0; i < dtNextMenu.Rows.Count; i++)
                {
                    if (Convert.ToString(dtNextMenu.Rows[i]["PageID"]) == id.ToString())
                    {
                        prevID = Convert.ToInt32(dtNextMenu.Rows[i]["RowNumber"]);
                        prevID = prevID - 1;
                        break;
                    }
                    else
                    {
                        prevID = 1;
                    }
                }


                if (prevID == 0)
                {
                    prevID = 1;

                    for (int i = 0; i < dtNextMenu.Rows.Count; i++)
                    {
                        if (Convert.ToString(dtNextMenu.Rows[i]["RowNumber"]) == prevID.ToString())
                        {
                            menuURL = Convert.ToString(dtNextMenu.Rows[i]["URLTitle"]);
                            break;
                        }
                    }
                }
                else
                {
                    for (int i = 0; i < dtNextMenu.Rows.Count; i++)
                    {
                        if (Convert.ToString(dtNextMenu.Rows[i]["RowNumber"]) == prevID.ToString())
                        {
                            menuURL = Convert.ToString(dtNextMenu.Rows[i]["URLTitle"]);
                            break;
                        }
                    }
                }


                prevMenuUrl = ConfigurationManager.AppSettings["siteRoot"].ToString() + "/" + menuURL + ".aspx";

                Response.Redirect(prevMenuUrl);
            }
        }

        private void DisplayNextPreviousButton()
        {
            DataTable dtNextMenu = new DataTable();


            //Get current pageID
            int id = Utility.GetIntParameter("pageId");

            int prevID = 0;
            int count = 0;
            string menuURL = string.Empty;
            string prevMenuUrl = string.Empty;

            if (this.pageId != 198 && this.pageId != 228)
            {
                int itemPageId = GetChildMenuByID();

                SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetSubChildMenuByPageID(itemPageId);
                ds = sp.GetDataSet();
                dtNextMenu = ds.Tables[0];



                for (int i = 0; i < dtNextMenu.Rows.Count; i++)
                {
                    if (Convert.ToString(dtNextMenu.Rows[i]["PageID"]) == id.ToString())
                    {
                        prevID = Convert.ToInt32(dtNextMenu.Rows[i]["RowNumber"]);
                        if (prevID == 1)
                        {
                            lnkPrevious.Visible = false;
                            lnkNext.Visible = true;
                        }
                        else if (prevID == dtNextMenu.Rows.Count)
                        {
                            lnkNext.Visible = false;
                            lnkPrevious.Visible = true;
                        }
                        else if(prevID!=1 && prevID!=dtNextMenu.Rows.Count)
                        {
                            lnkNext.Visible = true;
                            lnkPrevious.Visible = true;
                        }
                      
                        break;
                    }
                    count = count + 1;
                }

                if (count == dtNextMenu.Rows.Count && count!=0)
                {
                    lnkPrevious.Visible = false;
                    lnkNext.Visible = true;
                }


                


                
            }
        }

    }
}
