using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using Etech.CMS.Content;
using Etech.CMS.Content.Caching;
using Etech.CMS.Core;
using Etech.CMS.Localization;
using SubSonic;
using System.Web.UI.HtmlControls;
using Etech.CMS.Core.IO;
using System.IO;
using SubSonic.Utilities;

namespace Etech.CMS.Web.admin
{
    public partial class contentAddEdit : System.Web.UI.Page
    {

        #region Member Variables
        //DataSet ds;
        DataSet ds = new DataSet();
        DataSet dsParentPage;
        int _selectedPageId = -1;
        DataSet dsChildPage;
        DataSet dsChild;


        public int PgNum
        {
            get
            {
                if (ViewState["PgNum"] != null)
                {
                    return Convert.ToInt32(ViewState["PgNum"]);
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                ViewState["PgNum"] = value;
            }
        }

        #endregion Member Variables

        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {
            Label lblHeading = (Label)Master.FindControl("lblPageHeading");
            lblHeading.Text = "Content Management";

            SetContentEditProperties();
            SetImagesProperties();
            //SetMenuTitleProperties();
            //SetMenuTitleHoverProperties();
            //SetRightBanner();

          

            //pnlEditPage.Visible = false;
           

            if (!Page.IsPostBack)
            {
                GetPageDataSet();
                BindParentRepeater();
                LoadParentPageDropDown(ds);
                LoadRedirectPageDropDown(ds);
                LoadTemplates();
            }
        }

        #endregion Page Events

        #region Button Events

        /// <summary>
        /// Handles the Click event of the btnSave control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="T:System.EventArgs"/> instance containing the event data.</param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                Content.Page page;
                int parentId = 0;
                int pageId = 0;
                int.TryParse(lblPageId.Text, out pageId);
                if (pageId > 0)
                {
                    page = new Content.Page(pageId);
                }
                else
                {
                    page = new Content.Page();
                    page.PageGuid = Guid.NewGuid();
                }
                int.TryParse(ddlParentPage.SelectedValue, out parentId);

                page.ParentId = parentId;
                page.Title = txtTitle.Text;
                page.MenuTitle = txtMenuTitle.Text;
                page.Keywords = txtKeywords.Text;
                page.Description = txtDescription.Text;
                page.URLTitle = txtURLTitle.Text;
                page.PageName = txtPageName.Text;
                int templateId = 1; //default to 3 column
                int.TryParse(ddlPageTemplate.SelectedValue, out templateId);
                page.TemplateId = templateId;

                //default to same page
                int redirectId;
                page.RedirectId = int.TryParse(ddlPageRedirect.SelectedValue, out redirectId) ? redirectId : pageId;

                //page.Banner = txtBanner.Text;
                page.PageTitleImage = txtPageTitleImage.Text;
                //page.MenuTitelImage = txtMenuTitelImage.Text;
                //page.MenuTitleHoverImage = txtMenuTitleHoverImage.Text;

                
                if (chkIsDownLoad.Checked == true)
                {
                    page.IsDownload = true;
                }
                else
                {
                    page.IsDownload = false;
                }





                page.Save(WebUtility.GetUserName());
                //Remove from cache will make it reload on the next request.
                PageCache.RemovePageByID(pageId);
                PageMenuCache.RefreshMenuPageCollection();
                Reset();
                BindParentRepeater();
                GetPageDataSet();
    
                LoadParentPageDropDown(ds);
                LoadRedirectPageDropDown(ds);

                //LoadParentPageDropDown(dsParentPage);
                //LoadRedirectPageDropDown(dsParentPage);
                Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblPageSaved"));
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(contentedit).Name + ".btnSave_Click", ex);
                Master.MessageCenter.DisplayCriticalMessage(ex.Message);
            }
        }

        

        /// <summary>
        /// Handles the Click event of the btnReset control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="T:System.EventArgs"/> instance containing the event data.</param>
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            try
            {
                Reset();
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(contentedit).Name + ".btnReset_Click", ex);
                Master.MessageCenter.DisplayCriticalMessage(ex.Message);
            }
        }

        #endregion Button Events

        #region Methods

        /// <summary>
        /// Gets the page data set.
        /// </summary>
        private void GetPageDataSet()
        {
            ds = new Content.PageController().FetchPageList();
            //Add the root node
            ds.Tables[0].Rows.Add("0", null, null, LocalizationUtility.GetText("lblRoot"), LocalizationUtility.GetText("lblRoot"), null, null, 0, 1, null, null, null, null);
        }

        /// <summary>
        /// Loads the parent page drop down.
        /// </summary>
        /// <param name="ds">The ds.</param>
        private void LoadParentPageDropDown(DataSet ds)
        {
            ddlParentPage.Items.Clear();
            DataRow[] rootNodes = ds.Tables[0].Select("ParentId = 0");
            FillNodes(rootNodes, 1, ddlParentPage);
            ddlParentPage.Items.Insert(0, new ListItem(LocalizationUtility.GetText("lblRoot"), "0"));

            ViewState["PageDropDown"] = ds;
        }

        /// <summary>
        /// Fills the nodes.
        /// </summary>
        /// <param name="nodes">The nodes.</param>
        /// <param name="level">The level.</param>
        private void FillNodes(DataRow[] nodes, int level, DropDownList objDropDown)
        {
            DataRow[] childNodes;
            int oldLevel = level;
            string name = string.Empty;
            for (int i = 0; i <= nodes.GetUpperBound(0); i++)
            {
                for (int j = 0; j < level; j++)
                {
                    name += "-";
                }
                name += nodes[i]["MenuTitle"].ToString().Trim() == string.Empty ? nodes[i]["PageName"].ToString().Trim() : nodes[i]["MenuTitle"].ToString().Trim();
                objDropDown.Items.Add(new ListItem(name, nodes[i]["PageId"].ToString()));
                name = string.Empty;
                //if (objDropDown.ID != "ddlParentPage")
                //{

                childNodes = nodes[i].GetChildRows("ParentChild");
                if (childNodes.GetUpperBound(0) >= 0)
                {
                    level = level + 1;
                    FillNodes(childNodes, level, objDropDown);
                }
                //}
                level = oldLevel;
            }
        }

        /// <summary>
        /// Loads the parent page drop down.
        /// </summary>
        /// <param name="ds">The ds.</param>
        private void LoadRedirectPageDropDown(DataSet ds)
        {
            ddlPageRedirect.Items.Clear();
            DataRow[] rootNodes = ds.Tables[0].Select("ParentId = 0");
            FillNodes(rootNodes, 1, ddlPageRedirect);
            ddlPageRedirect.Items.Insert(0, new ListItem("---", "0"));
        }


        private void LoadRedirectPageDropDownEdit(DataSet ds)
        {
            ddlPageRedirect.Items.Clear();
            DataRow[] rootNodes = ds.Tables[0].Select("ParentId = 0");
            ddlPageRedirect.DataTextField = "Title";
            ddlPageRedirect.DataValueField = "RedirectID";
            ddlPageRedirect.DataSource = ds;
            ddlPageRedirect.DataBind();
            FillNodes(rootNodes, 1, ddlPageRedirect);

            ddlPageRedirect.Items.Insert(0, new ListItem("---", "0"));


        }


        /// <summary>
        /// Loads the regions.
        /// </summary>
        /// <param name="pageId">The page id.</param>
        private void LoadRegions(int pageId)
        {
            RegionCollection regionCollection = new RegionController().FetchRegionsByPageId(pageId);
            if (regionCollection.Count > 0)
            {
                dgRegions.DataSource = regionCollection;
                dgRegions.ItemDataBound += new DataGridItemEventHandler(dgRegions_ItemDataBound);

                dgRegions.Columns[0].HeaderText = LocalizationUtility.GetText("hdrEditRegion");
                dgRegions.Columns[1].HeaderText = LocalizationUtility.GetText("hdrTemplateRegion");
                dgRegions.Columns[2].HeaderText = LocalizationUtility.GetText("hdrTitle");
                dgRegions.Columns[3].HeaderText = LocalizationUtility.GetText("hdrSortOrder");
                dgRegions.Columns[4].HeaderText = LocalizationUtility.GetText("hdrEdit");
                dgRegions.Columns[5].HeaderText = LocalizationUtility.GetText("hdrDelete");
                dgRegions.DataBind();
            }
            else
            {
                dgRegions.DataSource = null;
                dgRegions.DataBind();
            }
        }

        /// <summary>
        /// Loads the templates.
        /// </summary>
        private void LoadTemplates()
        {
            TemplateCollection templateCollection = new TemplateController().FetchAll();
            ddlPageTemplate.DataSource = templateCollection;
            ddlPageTemplate.DataTextField = "Name";
            ddlPageTemplate.DataValueField = "TemplateId";
            ddlPageTemplate.DataBind();
        }

        /// <summary>
        /// Loads the children.
        /// </summary>
        /// <param name="pageId">The page id.</param>
        private void LoadChildren(int pageId)
        {
            PageCollection pageCollection = new PageCollection().
            Where(Content.Page.Columns.ParentId, Comparison.Equals, pageId).
            OrderByAsc(Content.Page.Columns.SortOrder).
            Load();
        }

        private void LoadGrandChildren(int pageId)
        {
            PageCollection pageCollection = new PageCollection().
             Where(Content.Page.Columns.ParentId, Comparison.Equals, pageId).
             OrderByAsc(Content.Page.Columns.SortOrder).
             Load();
        }


        private void LoadSubGrandChildren(int pageId)
        {
            PageCollection pageCollection = new PageCollection().
             Where(Content.Page.Columns.ParentId, Comparison.Equals, pageId).
             OrderByAsc(Content.Page.Columns.SortOrder).
             Load();
        }

        private void BindParentRepeater()
        {
            int cnt;
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetAllAParentPages();
            dsParentPage = (DataSet)sp.GetDataSet();

            if (dsParentPage != null && dsParentPage.Tables[0].Rows.Count > 0)
            {
                cnt = dsParentPage.Tables[0].Rows.Count;
                PagedDataSource pagedData = new PagedDataSource();
                pagedData.DataSource = dsParentPage.Tables[0].DefaultView;
                pagedData.AllowPaging = true;
                pagedData.PageSize = 10;
                pagedData.CurrentPageIndex = PgNum;
                int vcnt = cnt / pagedData.PageSize;
                if (PgNum < 1)
                {
                    lnkPrevious.Visible = false;

                }
                else if (PgNum > 0)
                {
                    lnkPrevious.Visible = true;
                }
                if (PgNum == vcnt)
                {
                    lnkNext.Visible = false;
                }
                else if (PgNum < vcnt)
                {
                    lnkNext.Visible = true;
                }
                rptParentPages.DataSource = pagedData;
                rptParentPages.DataBind();
            }
        }
        /// <summary>
        /// Sets the content edit properties.
        /// </summary>
        private void SetContentEditProperties()
        {
            this.Title = LocalizationUtility.GetText("titleContentManagement");
        }

        /// <summary>
        /// Resets this instance.
        /// </summary>
        private void Reset()
        {
            lblPageId.Text = string.Empty;
            ddlParentPage.SelectedIndex = 0;
            txtTitle.Text = string.Empty;
            txtMenuTitle.Text = string.Empty;
            txtKeywords.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtURLTitle.Text = string.Empty;
            txtPageName.Text = string.Empty;
            pnlEditPage.Visible = false;
            pnlCurrentPages.Visible = true;
            ddlPageRedirect.SelectedIndex = 0;
            //txtBanner.Text = string.Empty;
            txtPageTitleImage.Text = string.Empty;
            //txtMenuTitelImage.Text = string.Empty;
            //txtMenuTitleHoverImage.Text = string.Empty;
            dgRegions.DataSource = null;
            dgRegions.DataBind();
            pnlRegions.Visible = false;
            chkIsDownLoad.Checked = false;


        }



        private void LoadChildRedirectPageDropDown(DataSet dsChild)
        {
            ddlPageRedirect.DataSource = dsChild;
            ddlPageRedirect.DataTextField = "Title";
            ddlPageRedirect.DataValueField = "RedirectId";
            ddlPageRedirect.DataBind();

        }

        #endregion Methods

        #region Repeater Events

        protected void rptParentPages_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label lblParentID = (Label)e.Item.FindControl("lblParentPageID");
            ImageButton imgbtnUpParent = (ImageButton)e.Item.FindControl("lbUpParent");
            ImageButton imgbtnDownParent = (ImageButton)e.Item.FindControl("lbDownParent");
            Repeater rptChild = (Repeater)e.Item.FindControl("rptChildPages");

            SubSonic.StoredProcedure spCount = Etech.CMS.Content.SPs.GetChildPagesCountByParentID(Convert.ToInt32(lblParentID.Text));
            DataSet dsPageCount = (DataSet)spCount.GetDataSet();

            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                if (dsPageCount != null && dsPageCount.Tables[0].Rows.Count > 0)
                {
                    LinkButton imgDelete = (LinkButton)e.Item.FindControl("lblDeleteParent");

                    if (Convert.ToInt32(dsPageCount.Tables[0].Rows[0]["ChildPageCount"]) == 0)
                    {
                        imgDelete.Visible = true;
                    }
                    else
                    {
                        imgDelete.Visible = false;
                    }
                }

                if (e.Item.ItemIndex == 0)
                {
                    imgbtnUpParent.Visible = false;
                }

                if (e.Item.ItemIndex == dsParentPage.Tables[0].Rows.Count - 1)
                {
                    imgbtnDownParent.Visible = false;
                }


                if (rptChild != null)
                {

                    SubSonic.StoredProcedure spChild = Etech.CMS.Content.SPs.GetAllChildPagesByParentID(Convert.ToInt32(lblParentID.Text));
                    dsChildPage = (DataSet)spChild.GetDataSet();
                    rptChild.DataSource = dsChildPage;
                    rptChild.DataBind();
                }
            }

        }

        protected void rptParentPages_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Label lblPageID = (Label)e.Item.FindControl("lblParentPageID");
            int pageId = Convert.ToInt32(lblPageID.Text);
            ViewState["PageID"] = pageId;

            if (e.CommandName == "EditParent")
            {
                pnlEditPage.Visible = true;
                pnlCurrentPages.Visible = false;
                lblPageId.Text = lblPageID.Text;
                pnlRegions.Visible = true;
                LoadRegions(Convert.ToInt32(lblPageID.Text));
                hlAddRegion.NavigateUrl = string.Format("~/admin/region.aspx?pageId={0}&regionId=-1", Convert.ToInt32(lblPageID.Text));

                SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetDataByPageID(Convert.ToInt32(lblPageID.Text));
                DataSet dsParentData = (DataSet)sp.GetDataSet();

                //LoadRedirectPageDropDown(ds);

                GetPageDataSet();
                LoadParentPageDropDown(ds);
                

                LoadRedirectPageDropDown(ds);

                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    lblPageId.Text = dsParentData.Tables[0].Rows[0]["PageId"].ToString();
                    ddlParentPage.SelectedValue = dsParentData.Tables[0].Rows[0]["ParentId"].ToString();
                    txtTitle.Text = dsParentData.Tables[0].Rows[0]["Title"].ToString();
                    txtMenuTitle.Text = dsParentData.Tables[0].Rows[0]["MenuTitle"].ToString();
                    txtKeywords.Text = dsParentData.Tables[0].Rows[0]["Keywords"].ToString();
                    txtDescription.Text = dsParentData.Tables[0].Rows[0]["Description"].ToString();
                    txtURLTitle.Text = dsParentData.Tables[0].Rows[0]["URLTitle"].ToString();
                    txtPageName.Text = dsParentData.Tables[0].Rows[0]["PageName"].ToString();
                    ddlPageTemplate.SelectedValue = (dsParentData.Tables[0].Rows[0]["TemplateId"].ToString() != "0") ? dsParentData.Tables[0].Rows[0]["TemplateId"].ToString() : "1";
                    ddlPageRedirect.SelectedValue = dsParentData.Tables[0].Rows[0]["RedirectId"].ToString();
                    //txtBanner.Text = dsParentData.Tables[0].Rows[0]["Banner"].ToString();
                    txtPageTitleImage.Text = dsParentData.Tables[0].Rows[0]["PageTitleImage"].ToString();
                    //txtMenuTitelImage.Text = dsParentData.Tables[0].Rows[0]["MenuTitelImage"].ToString();
                    //txtMenuTitleHoverImage.Text = dsParentData.Tables[0].Rows[0]["MenuTitleHoverImage"].ToString();
                    bool chkStatus = Convert.ToBoolean(dsParentData.Tables[0].Rows[0]["IsDownload"]);
                    if (chkStatus == true)
                    {
                        chkIsDownLoad.Checked = true;
                    }
                    else
                    {
                        chkIsDownLoad.Checked = false;
                    }
                }
            }
            else if (e.CommandName == "DeleteParent")
            {
                Content.Page page = new Content.Page(pageId);
                int pageToLoadChildren = page.ParentId;


                SubSonic.StoredProcedure spCount = Etech.CMS.Content.SPs.GetRegionCountByPageID(Convert.ToInt32(pageId));

                int Count = (int)spCount.ExecuteScalar();

                if (Count > 0)
                {
                    ScriptManager.RegisterStartupScript(Page, this.GetType(), "Message", "alert('This Page is assigned to a region. It cannot be deleted');", true);
                }
                else
                {
                    Content.Page.Delete(pageId);
                    PageCache.RemovePageByID(pageId);//Clear the Item from the cache.
                    PageMenuCache.RefreshMenuPageCollection();
                }


                BindParentRepeater();
                GetPageDataSet();
                LoadParentPageDropDown(ds);
                LoadRedirectPageDropDown(ds);
                //LoadParentPageDropDown(dsParentPage);
                //LoadRedirectPageDropDown(dsParentPage);
                Reset();

                Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblPageDeleted"));
            }
            else if (e.CommandName == "UpParent")
            {
                pageId = -1;
                ImageButton theButton = (ImageButton)e.Item.FindControl("lbUpParent");
                pageId = Convert.ToInt32(lblPageID.Text);

                Content.Page selectedPage = new Content.Page(pageId);
                Query query = new Query(Content.Page.Schema).
                  WHERE(Content.Page.Columns.ParentId, Comparison.Equals, selectedPage.ParentId).
                  ORDER_BY(Content.Page.Columns.SortOrder);
                PageCollection pageCollection = new PageController().FetchByQuery(query);
                if (pageCollection != null)
                {
                    Content.Page pageMoved = pageCollection.Find(delegate(Content.Page page)
                    {
                        return page.PageId == pageId;
                    });
                    int index = pageCollection.IndexOf(pageMoved);
                    if (index != 0)
                    {
                        pageCollection.RemoveAt(index);
                        if (theButton.CommandName.ToLower() == "upparent")
                        {
                            pageCollection.Insert(index - 1, pageMoved);
                        }
                    }
                    int i = 1;
                    foreach (Content.Page page in pageCollection)
                    {
                        page.SortOrder = i++;
                    }
                    pageCollection.SaveAll(WebUtility.GetUserName());
                    BindParentRepeater();
                    LoadChildren(pageId);
                    // LoadParentPageDropDown(ds);


                    //LoadParentPageDropDown(dsParentPage);
                    //LoadRedirectPageDropDown(ds);
                }

            }
            else if (e.CommandName == "DownParent")
            {
                pageId = -1;
                ImageButton theButton = (ImageButton)e.Item.FindControl("lbDownParent");
                pageId = Convert.ToInt32(lblPageID.Text);

                Content.Page selectedPage = new Content.Page(pageId);
                Query query = new Query(Content.Page.Schema).
                  WHERE(Content.Page.Columns.ParentId, Comparison.Equals, selectedPage.ParentId).
                  ORDER_BY(Content.Page.Columns.SortOrder);
                PageCollection pageCollection = new PageController().FetchByQuery(query);
                if (pageCollection != null)
                {
                    Content.Page pageMoved = pageCollection.Find(delegate(Content.Page page)
                    {
                        return page.PageId == pageId;
                    });
                    int index = pageCollection.IndexOf(pageMoved);
                    //if (index != 0)
                    //{
                    pageCollection.RemoveAt(index);

                    if (theButton.CommandName.ToLower() == "downparent")
                    {
                        pageCollection.Insert(index + 1, pageMoved);
                    }
                    // }
                    int i = 1;
                    foreach (Content.Page page in pageCollection)
                    {
                        page.SortOrder = i++;
                    }
                    pageCollection.SaveAll(WebUtility.GetUserName());
                    BindParentRepeater();
                    //LoadParentPageDropDown(ds);


                    //LoadParentPageDropDown(dsParentPage);
                    //LoadRedirectPageDropDown(ds);
                }
            }
        }


        protected void rptChildPages_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            ImageButton imgbtnUp = (ImageButton)e.Item.FindControl("lbUpChild");
            ImageButton imgbtnDown = (ImageButton)e.Item.FindControl("lbDownChild");

            Label lblChildID = (Label)e.Item.FindControl("lblChildPageID");
            Repeater rptGrandChild = (Repeater)e.Item.FindControl("rptGrandChildPages");

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (e.Item.ItemIndex == 0)
                {
                    imgbtnUp.Visible = false;
                }
                else if (e.Item.ItemIndex == dsChildPage.Tables[0].Rows.Count - 1)
                {
                    imgbtnDown.Visible = false;
                }
                if (dsChildPage.Tables[0].Rows.Count == 1)
                {
                    imgbtnUp.Visible = false;
                    imgbtnDown.Visible = false;
                }

                HtmlTableCell tdName = (HtmlTableCell)e.Item.FindControl("tdChildName");
                HtmlTableCell tdChild = (HtmlTableCell)e.Item.FindControl("tdChild");


                if (e.Item.ItemIndex % 2 == 0)
                {
                    tdName.Attributes.Add("style", "border-left:1px solid #999; padding-left:10px;");

                }
                else
                {
                    tdName.Attributes.Add("style", "border-left:1px solid #999; padding-left:10px;");

                }
                if (rptGrandChild != null)
                {

                    SubSonic.StoredProcedure spChild = Etech.CMS.Content.SPs.GetAllChildPagesByParentID(Convert.ToInt32(lblChildID.Text));
                    dsChildPage = (DataSet)spChild.GetDataSet();
                    rptGrandChild.DataSource = dsChildPage;
                    rptGrandChild.DataBind();
                }
            }
        }

        protected void rptChildPages_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            Label lblPageID = (Label)e.Item.FindControl("lblChildPageID");
            ViewState["PageID"] = lblPageID.Text;
            if (e.CommandName == "EditChild")
            {
                pnlEditPage.Visible = true;
                pnlCurrentPages.Visible = false;
                pnlRegions.Visible = true;


                LoadRegions(Convert.ToInt32(lblPageID.Text));
                hlAddRegion.NavigateUrl = string.Format("~/admin/region.aspx?pageId={0}&regionId=-1", Convert.ToInt32(lblPageID.Text));

                //Get Childpage row by PageID
                SubSonic.StoredProcedure sp1 = Etech.CMS.Content.SPs.GetDataByPageID(Convert.ToInt32(lblPageID.Text));
                DataSet dsChildData = (DataSet)sp1.GetDataSet();

                GetPageDataSet();
                LoadParentPageDropDown(ds);
                LoadRedirectPageDropDown(ds);

                if (dsChildData != null && dsChildData.Tables[0].Rows.Count > 0)
                {
                    lblPageId.Text = dsChildData.Tables[0].Rows[0]["PageId"].ToString();
                    ddlParentPage.SelectedValue = dsChildData.Tables[0].Rows[0]["ParentId"].ToString();
                    txtTitle.Text = dsChildData.Tables[0].Rows[0]["Title"].ToString();
                    txtMenuTitle.Text = dsChildData.Tables[0].Rows[0]["MenuTitle"].ToString();
                    txtKeywords.Text = dsChildData.Tables[0].Rows[0]["Keywords"].ToString();
                    txtDescription.Text = dsChildData.Tables[0].Rows[0]["Description"].ToString();
                    txtURLTitle.Text = dsChildData.Tables[0].Rows[0]["URLTitle"].ToString();
                    txtPageName.Text = dsChildData.Tables[0].Rows[0]["PageName"].ToString();
                    ddlPageTemplate.SelectedValue = (dsChildData.Tables[0].Rows[0]["TemplateId"].ToString() != "0") ? dsChildData.Tables[0].Rows[0]["TemplateId"].ToString() : "1";
                    ddlPageRedirect.SelectedValue = dsChildData.Tables[0].Rows[0]["RedirectId"].ToString();

                    //txtBanner.Text = dsChildData.Tables[0].Rows[0]["Banner"].ToString();

                    txtPageTitleImage.Text = dsChildData.Tables[0].Rows[0]["PageTitleImage"].ToString();
                    //txtMenuTitelImage.Text = dsChildData.Tables[0].Rows[0]["MenuTitelImage"].ToString();
                    //txtMenuTitleHoverImage.Text = dsChildData.Tables[0].Rows[0]["MenuTitleHoverImage"].ToString();

                    bool chkStatus = Convert.ToBoolean(dsChildData.Tables[0].Rows[0]["IsDownload"]);
                    if (chkStatus == true)
                    {
                        chkIsDownLoad.Checked = true;
                    }
                    else
                    {
                        chkIsDownLoad.Checked = false;
                    }

                }

            }
            else if (e.CommandName == "Delete")
            {
                int pageId = Convert.ToInt32(lblPageID.Text);

                Content.Page page = new Content.Page(pageId);
                int pageToLoadChildren = page.ParentId;

                SubSonic.StoredProcedure spCount = Etech.CMS.Content.SPs.GetRegionCountByPageID(Convert.ToInt32(pageId));

                int Count = (int)spCount.ExecuteScalar();

                if (Count > 0)
                {
                    ScriptManager.RegisterStartupScript(Page, this.GetType(), "Message", "alert('This Page is assigned to a region. It cannot be deleted');", true);
                }
                else
                {
                    Content.Page.Delete(pageId);
                    PageCache.RemovePageByID(pageId);//Clear the Item from the cache.
                    PageMenuCache.RefreshMenuPageCollection();
                }
                BindParentRepeater();
                GetPageDataSet();
                LoadParentPageDropDown(ds);
                LoadRedirectPageDropDown(ds);
                Reset();

                Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblPageDeleted"));
            }
            else if (e.CommandName == "UpChild")
            {
                int pageId = -1;
                ImageButton theButton = (ImageButton)e.Item.FindControl("lbUpChild");
                pageId = Convert.ToInt32(lblPageID.Text);

                Content.Page selectedPage = new Content.Page(pageId);
                Query query = new Query(Content.Page.Schema).
                  WHERE(Content.Page.Columns.ParentId, Comparison.Equals, selectedPage.ParentId).
                  ORDER_BY(Content.Page.Columns.SortOrder);
                PageCollection pageCollection = new PageController().FetchByQuery(query);
                if (pageCollection != null)
                {
                    Content.Page pageMoved = pageCollection.Find(delegate(Content.Page page)
                    {
                        return page.PageId == pageId;
                    });
                    int index = pageCollection.IndexOf(pageMoved);
                    if (index != 0)
                    {
                        pageCollection.RemoveAt(index);
                        if (theButton.CommandName.ToLower() == "upchild")
                        {
                            pageCollection.Insert(index - 1, pageMoved);
                        }
                    }

                    int i = 1;
                    foreach (Content.Page page in pageCollection)
                    {
                        page.SortOrder = i++;
                    }
                    pageCollection.SaveAll(WebUtility.GetUserName());
                    BindParentRepeater();
                    LoadChildren(pageId);
                    //LoadParentPageDropDown(ds);



                    //LoadParentPageDropDown(dsParentPage);
                    //LoadRedirectPageDropDown(ds);
                }

            }
            else if (e.CommandName == "DownChild")
            {
                int pageId = -1;
                ImageButton theButton = (ImageButton)e.Item.FindControl("lbDownChild");

                pageId = Convert.ToInt32(lblPageID.Text);
                Content.Page selectedPage = new Content.Page(pageId);
                Query query = new Query(Content.Page.Schema).
                  WHERE(Content.Page.Columns.ParentId, Comparison.Equals, selectedPage.ParentId).
                  ORDER_BY(Content.Page.Columns.SortOrder);
                PageCollection pageCollection = new PageController().FetchByQuery(query);
                if (pageCollection != null)
                {
                    Content.Page pageMoved = pageCollection.Find(delegate(Content.Page page)
                    {
                        return page.PageId == pageId;
                    });
                    int index = pageCollection.IndexOf(pageMoved);
                    //if (index != 0)
                    //{
                    pageCollection.RemoveAt(index);

                    if (theButton.CommandName.ToLower() == "downchild")
                    {
                        pageCollection.Insert(index + 1, pageMoved);
                    }
                    // }
                    int i = 1;
                    foreach (Content.Page page in pageCollection)
                    {
                        page.SortOrder = i++;
                    }
                    pageCollection.SaveAll(WebUtility.GetUserName());
                    BindParentRepeater();
                    //LoadParentPageDropDown(ds);


                    //LoadParentPageDropDown(dsParentPage);
                    //LoadRedirectPageDropDown(ds);
                }
            }

        }


        protected void rptGrandChildPages_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            ImageButton imgbtnUp = (ImageButton)e.Item.FindControl("lbUpGrandChild");
            ImageButton imgbtnDown = (ImageButton)e.Item.FindControl("lbDownGrandChild");

            Repeater rptSubGrandChild = (Repeater)e.Item.FindControl("rptSubGrandChild");
            Label lblChildID = (Label)e.Item.FindControl("lblGrandChildPageID");

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (e.Item.ItemIndex == 0)
                {
                    imgbtnUp.Visible = false;
                }
                else if (e.Item.ItemIndex == dsChildPage.Tables[0].Rows.Count - 1)
                {
                    imgbtnDown.Visible = false;
                }
                if (dsChildPage.Tables[0].Rows.Count == 1)
                {
                    imgbtnUp.Visible = false;
                    imgbtnDown.Visible = false;
                }

                HtmlTableCell tdName = (HtmlTableCell)e.Item.FindControl("tdGrandChildName");
                HtmlTableCell tdChild = (HtmlTableCell)e.Item.FindControl("tdGrandChild");


                if (e.Item.ItemIndex % 2 == 0)
                {
                    tdName.Attributes.Add("style", "border-left:1px solid #999; padding-left:10px;");

                }
                else
                {
                    tdName.Attributes.Add("style", "border-left:1px solid #999; padding-left:10px;");

                }
                if (rptSubGrandChild != null)
                {

                    SubSonic.StoredProcedure spChild = Etech.CMS.Content.SPs.GetAllChildPagesByParentID(Convert.ToInt32(lblChildID.Text));
                    dsChildPage = (DataSet)spChild.GetDataSet();
                    rptSubGrandChild.DataSource = dsChildPage;
                    rptSubGrandChild.DataBind();
                }


            }
        }


        protected void rptSubGrandChild_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            ImageButton imgbtnUp = (ImageButton)e.Item.FindControl("lbUpGrandChild");
            ImageButton imgbtnDown = (ImageButton)e.Item.FindControl("lbDownGrandChild");

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (e.Item.ItemIndex == 0)
                {
                    imgbtnUp.Visible = false;
                }
                else if (e.Item.ItemIndex == dsChildPage.Tables[0].Rows.Count - 1)
                {
                    imgbtnDown.Visible = false;
                }
                if (dsChildPage.Tables[0].Rows.Count == 1)
                {
                    imgbtnUp.Visible = false;
                    imgbtnDown.Visible = false;
                }

                HtmlTableCell tdName = (HtmlTableCell)e.Item.FindControl("tdGrandChildName");
                HtmlTableCell tdChild = (HtmlTableCell)e.Item.FindControl("tdGrandChild");


                if (e.Item.ItemIndex % 2 == 0)
                {
                    tdName.Attributes.Add("style", "border-left:1px solid #999; padding-left:10px;");

                }
                else
                {
                    tdName.Attributes.Add("style", "border-left:1px solid #999; padding-left:10px;");

                }
            }
        }


        protected void rptGrandChildPages_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            Label lblPageID = (Label)e.Item.FindControl("lblGrandChildPageID");
            ViewState["PageID"] = lblPageID.Text;
            if (e.CommandName == "EditGrandChild")
            {
                pnlEditPage.Visible = true;
                pnlCurrentPages.Visible = false;
                pnlRegions.Visible = true;


                LoadRegions(Convert.ToInt32(lblPageID.Text));
                hlAddRegion.NavigateUrl = string.Format("~/admin/region.aspx?pageId={0}&regionId=-1", Convert.ToInt32(lblPageID.Text));

                //Get Childpage row by PageID
                SubSonic.StoredProcedure sp1 = Etech.CMS.Content.SPs.GetDataByPageID(Convert.ToInt32(lblPageID.Text));
                DataSet dsChildData = (DataSet)sp1.GetDataSet();

                GetPageDataSet();
                LoadParentPageDropDown(ds);
                LoadRedirectPageDropDown(ds);

                if (dsChildData != null && dsChildData.Tables[0].Rows.Count > 0)
                {
                   /* lblPageId.Text = dsChildData.Tables[0].Rows[0]["PageId"].ToString();
                    ddlParentPage.SelectedValue = dsChildData.Tables[0].Rows[0]["ParentId"].ToString();
                    txtTitle.Text = dsChildData.Tables[0].Rows[0]["Title"].ToString();
                    txtMenuTitle.Text = dsChildData.Tables[0].Rows[0]["MenuTitle"].ToString();
                    txtKeywords.Text = dsChildData.Tables[0].Rows[0]["Keywords"].ToString();
                    txtDescription.Text = dsChildData.Tables[0].Rows[0]["Description"].ToString();
                    txtURLTitle.Text = dsChildData.Tables[0].Rows[0]["URLTitle"].ToString();
                    txtPageName.Text = dsChildData.Tables[0].Rows[0]["PageName"].ToString();
                    //txtAltText.Text = dsChildData.Tables[0].Rows[0]["AltText"].ToString();
                    ddlPageTemplate.SelectedValue = (dsChildData.Tables[0].Rows[0]["TemplateId"].ToString() != "0") ? dsChildData.Tables[0].Rows[0]["TemplateId"].ToString() : "1";
                    ddlPageRedirect.SelectedValue = dsChildData.Tables[0].Rows[0]["RedirectId"].ToString();

                    txtBanner.Text = dsChildData.Tables[0].Rows[0]["Banner"].ToString();*/

                    lblPageId.Text = dsChildData.Tables[0].Rows[0]["PageId"].ToString();
                    ddlParentPage.SelectedValue = dsChildData.Tables[0].Rows[0]["ParentId"].ToString();
                    txtTitle.Text = dsChildData.Tables[0].Rows[0]["Title"].ToString();
                    txtMenuTitle.Text = dsChildData.Tables[0].Rows[0]["MenuTitle"].ToString();
                    txtKeywords.Text = dsChildData.Tables[0].Rows[0]["Keywords"].ToString();
                    txtDescription.Text = dsChildData.Tables[0].Rows[0]["Description"].ToString();
                    txtURLTitle.Text = dsChildData.Tables[0].Rows[0]["URLTitle"].ToString();
                    txtPageName.Text = dsChildData.Tables[0].Rows[0]["PageName"].ToString();
                    ddlPageTemplate.SelectedValue = (dsChildData.Tables[0].Rows[0]["TemplateId"].ToString() != "0") ? dsChildData.Tables[0].Rows[0]["TemplateId"].ToString() : "1";
                    ddlPageRedirect.SelectedValue = dsChildData.Tables[0].Rows[0]["RedirectId"].ToString();

                    //txtBanner.Text = dsChildData.Tables[0].Rows[0]["Banner"].ToString();

                    txtPageTitleImage.Text = dsChildData.Tables[0].Rows[0]["PageTitleImage"].ToString();
                    //txtMenuTitelImage.Text = dsChildData.Tables[0].Rows[0]["MenuTitelImage"].ToString();
                    //txtMenuTitleHoverImage.Text = dsChildData.Tables[0].Rows[0]["MenuTitleHoverImage"].ToString();

                    bool chkStatus = Convert.ToBoolean(dsChildData.Tables[0].Rows[0]["IsDownload"]);
                    if (chkStatus == true)
                    {
                        chkIsDownLoad.Checked = true;
                    }
                    else
                    {
                        chkIsDownLoad.Checked = false;
                    }
                }

            }
            else if (e.CommandName == "DeleteGrandChild")
            {
                int pageId = Convert.ToInt32(lblPageID.Text);

                Content.Page page = new Content.Page(pageId);
                int pageToLoadChildren = page.ParentId;

                SubSonic.StoredProcedure spCount = Etech.CMS.Content.SPs.GetRegionCountByPageID(Convert.ToInt32(pageId));

                int Count = (int)spCount.ExecuteScalar();

                if (Count > 0)
                {
                    ScriptManager.RegisterStartupScript(Page, this.GetType(), "Message", "alert('This Page is assigned to a region. It cannot be deleted');", true);
                }
                else
                {
                    Content.Page.Delete(pageId);
                    PageCache.RemovePageByID(pageId);//Clear the Item from the cache.
                    PageMenuCache.RefreshMenuPageCollection();
                }

                BindParentRepeater();
                GetPageDataSet();
                LoadParentPageDropDown(ds);
                LoadRedirectPageDropDown(ds);
                //LoadParentPageDropDown(ds);


                //LoadParentPageDropDown(dsParentPage);
                //LoadRedirectPageDropDown(ds);
                Reset();

                Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblPageDeleted"));
            }
            else if (e.CommandName == "UpGrandChild")
            {
                int pageId = -1;
                ImageButton theButton = (ImageButton)e.Item.FindControl("lbUpGrandChild");
                pageId = Convert.ToInt32(lblPageID.Text);

                Content.Page selectedPage = new Content.Page(pageId);
                Query query = new Query(Content.Page.Schema).
                  WHERE(Content.Page.Columns.ParentId, Comparison.Equals, selectedPage.ParentId).
                  ORDER_BY(Content.Page.Columns.SortOrder);
                PageCollection pageCollection = new PageController().FetchByQuery(query);
                if (pageCollection != null)
                {
                    Content.Page pageMoved = pageCollection.Find(delegate(Content.Page page)
                    {
                        return page.PageId == pageId;
                    });
                    int index = pageCollection.IndexOf(pageMoved);
                    if (index != 0)
                    {
                        pageCollection.RemoveAt(index);
                        if (theButton.CommandName.ToLower() == "upgrandchild")
                        {
                            pageCollection.Insert(index - 1, pageMoved);
                        }
                    }

                    int i = 1;
                    foreach (Content.Page page in pageCollection)
                    {
                        page.SortOrder = i++;
                    }
                    pageCollection.SaveAll(WebUtility.GetUserName());
                    BindParentRepeater();
                    //LoadChildren(pageId);
                    //LoadParentPageDropDown(ds);


                    //LoadParentPageDropDown(dsParentPage);
                    //LoadRedirectPageDropDown(ds);
                }

            }
            else if (e.CommandName == "DownGrandChild")
            {
                int pageId = -1;
                ImageButton theButton = (ImageButton)e.Item.FindControl("lbDownGrandChild");

                pageId = Convert.ToInt32(lblPageID.Text);
                Content.Page selectedPage = new Content.Page(pageId);
                Query query = new Query(Content.Page.Schema).
                  WHERE(Content.Page.Columns.ParentId, Comparison.Equals, selectedPage.ParentId).
                  ORDER_BY(Content.Page.Columns.SortOrder);
                PageCollection pageCollection = new PageController().FetchByQuery(query);
                if (pageCollection != null)
                {
                    Content.Page pageMoved = pageCollection.Find(delegate(Content.Page page)
                    {
                        return page.PageId == pageId;
                    });
                    int index = pageCollection.IndexOf(pageMoved);
                    //if (index != 0)
                    //{
                    pageCollection.RemoveAt(index);

                    if (theButton.CommandName.ToLower() == "downgrandchild")
                    {
                        pageCollection.Insert(index + 1, pageMoved);
                    }
                    // }
                    int i = 1;
                    foreach (Content.Page page in pageCollection)
                    {
                        page.SortOrder = i++;
                    }
                    pageCollection.SaveAll(WebUtility.GetUserName());
                    BindParentRepeater();
                    //LoadParentPageDropDown(ds);


                    //LoadParentPageDropDown(dsParentPage);
                    //LoadRedirectPageDropDown(ds);
                }
            }

        }


        protected void rptSubGrandChild_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            Label lblPageID = (Label)e.Item.FindControl("lblGrandChildPageID");
            ViewState["PageID"] = lblPageID.Text;
            if (e.CommandName == "EditGrandChild")
            {
                pnlEditPage.Visible = true;
                pnlCurrentPages.Visible = false;
                pnlRegions.Visible = true;


                LoadRegions(Convert.ToInt32(lblPageID.Text));
                hlAddRegion.NavigateUrl = string.Format("~/admin/region.aspx?pageId={0}&regionId=-1", Convert.ToInt32(lblPageID.Text));

                //Get Childpage row by PageID
                SubSonic.StoredProcedure sp1 = Etech.CMS.Content.SPs.GetDataByPageID(Convert.ToInt32(lblPageID.Text));
                DataSet dsChildData = (DataSet)sp1.GetDataSet();

                GetPageDataSet();
                LoadParentPageDropDown(ds);
                LoadRedirectPageDropDown(ds);

                if (dsChildData != null && dsChildData.Tables[0].Rows.Count > 0)
                {
                    /* lblPageId.Text = dsChildData.Tables[0].Rows[0]["PageId"].ToString();
                     ddlParentPage.SelectedValue = dsChildData.Tables[0].Rows[0]["ParentId"].ToString();
                     txtTitle.Text = dsChildData.Tables[0].Rows[0]["Title"].ToString();
                     txtMenuTitle.Text = dsChildData.Tables[0].Rows[0]["MenuTitle"].ToString();
                     txtKeywords.Text = dsChildData.Tables[0].Rows[0]["Keywords"].ToString();
                     txtDescription.Text = dsChildData.Tables[0].Rows[0]["Description"].ToString();
                     txtURLTitle.Text = dsChildData.Tables[0].Rows[0]["URLTitle"].ToString();
                     txtPageName.Text = dsChildData.Tables[0].Rows[0]["PageName"].ToString();
                     //txtAltText.Text = dsChildData.Tables[0].Rows[0]["AltText"].ToString();
                     ddlPageTemplate.SelectedValue = (dsChildData.Tables[0].Rows[0]["TemplateId"].ToString() != "0") ? dsChildData.Tables[0].Rows[0]["TemplateId"].ToString() : "1";
                     ddlPageRedirect.SelectedValue = dsChildData.Tables[0].Rows[0]["RedirectId"].ToString();

                     txtBanner.Text = dsChildData.Tables[0].Rows[0]["Banner"].ToString();*/

                    lblPageId.Text = dsChildData.Tables[0].Rows[0]["PageId"].ToString();
                    ddlParentPage.SelectedValue = dsChildData.Tables[0].Rows[0]["ParentId"].ToString();
                    txtTitle.Text = dsChildData.Tables[0].Rows[0]["Title"].ToString();
                    txtMenuTitle.Text = dsChildData.Tables[0].Rows[0]["MenuTitle"].ToString();
                    txtKeywords.Text = dsChildData.Tables[0].Rows[0]["Keywords"].ToString();
                    txtDescription.Text = dsChildData.Tables[0].Rows[0]["Description"].ToString();
                    txtURLTitle.Text = dsChildData.Tables[0].Rows[0]["URLTitle"].ToString();
                    txtPageName.Text = dsChildData.Tables[0].Rows[0]["PageName"].ToString();
                    ddlPageTemplate.SelectedValue = (dsChildData.Tables[0].Rows[0]["TemplateId"].ToString() != "0") ? dsChildData.Tables[0].Rows[0]["TemplateId"].ToString() : "1";
                    ddlPageRedirect.SelectedValue = dsChildData.Tables[0].Rows[0]["RedirectId"].ToString();

                    //txtBanner.Text = dsChildData.Tables[0].Rows[0]["Banner"].ToString();

                    txtPageTitleImage.Text = dsChildData.Tables[0].Rows[0]["PageTitleImage"].ToString();
                    //txtMenuTitelImage.Text = dsChildData.Tables[0].Rows[0]["MenuTitelImage"].ToString();
                    //txtMenuTitleHoverImage.Text = dsChildData.Tables[0].Rows[0]["MenuTitleHoverImage"].ToString();

                    bool chkStatus = Convert.ToBoolean(dsChildData.Tables[0].Rows[0]["IsDownload"]);
                    if (chkStatus == true)
                    {
                        chkIsDownLoad.Checked = true;
                    }
                    else
                    {
                        chkIsDownLoad.Checked = false;
                    }
                }

            }
            else if (e.CommandName == "DeleteGrandChild")
            {
                int pageId = Convert.ToInt32(lblPageID.Text);

                Content.Page page = new Content.Page(pageId);
                int pageToLoadChildren = page.ParentId;

                SubSonic.StoredProcedure spCount = Etech.CMS.Content.SPs.GetRegionCountByPageID(Convert.ToInt32(pageId));

                int Count = (int)spCount.ExecuteScalar();

                if (Count > 0)
                {
                    ScriptManager.RegisterStartupScript(Page, this.GetType(), "Message", "alert('This Page is assigned to a region. It cannot be deleted');", true);
                }
                else
                {
                    Content.Page.Delete(pageId);
                    PageCache.RemovePageByID(pageId);//Clear the Item from the cache.
                    PageMenuCache.RefreshMenuPageCollection();
                }

                BindParentRepeater();
                GetPageDataSet();
                LoadParentPageDropDown(ds);
                LoadRedirectPageDropDown(ds);
                //LoadParentPageDropDown(ds);


                //LoadParentPageDropDown(dsParentPage);
                //LoadRedirectPageDropDown(ds);
                Reset();

                Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblPageDeleted"));
            }
            else if (e.CommandName == "UpGrandChild")
            {
                int pageId = -1;
                ImageButton theButton = (ImageButton)e.Item.FindControl("lbUpGrandChild");
                pageId = Convert.ToInt32(lblPageID.Text);

                Content.Page selectedPage = new Content.Page(pageId);
                Query query = new Query(Content.Page.Schema).
                  WHERE(Content.Page.Columns.ParentId, Comparison.Equals, selectedPage.ParentId).
                  ORDER_BY(Content.Page.Columns.SortOrder);
                PageCollection pageCollection = new PageController().FetchByQuery(query);
                if (pageCollection != null)
                {
                    Content.Page pageMoved = pageCollection.Find(delegate(Content.Page page)
                    {
                        return page.PageId == pageId;
                    });
                    int index = pageCollection.IndexOf(pageMoved);
                    if (index != 0)
                    {
                        pageCollection.RemoveAt(index);
                        if (theButton.CommandName.ToLower() == "upgrandchild")
                        {
                            pageCollection.Insert(index - 1, pageMoved);
                        }
                    }

                    int i = 1;
                    foreach (Content.Page page in pageCollection)
                    {
                        page.SortOrder = i++;
                    }
                    pageCollection.SaveAll(WebUtility.GetUserName());
                    BindParentRepeater();
                    //LoadChildren(pageId);
                    //LoadParentPageDropDown(ds);


                    //LoadParentPageDropDown(dsParentPage);
                    //LoadRedirectPageDropDown(ds);
                }

            }
            else if (e.CommandName == "DownGrandChild")
            {
                int pageId = -1;
                ImageButton theButton = (ImageButton)e.Item.FindControl("lbDownGrandChild");

                pageId = Convert.ToInt32(lblPageID.Text);
                Content.Page selectedPage = new Content.Page(pageId);
                Query query = new Query(Content.Page.Schema).
                  WHERE(Content.Page.Columns.ParentId, Comparison.Equals, selectedPage.ParentId).
                  ORDER_BY(Content.Page.Columns.SortOrder);
                PageCollection pageCollection = new PageController().FetchByQuery(query);
                if (pageCollection != null)
                {
                    Content.Page pageMoved = pageCollection.Find(delegate(Content.Page page)
                    {
                        return page.PageId == pageId;
                    });
                    int index = pageCollection.IndexOf(pageMoved);
                    //if (index != 0)
                    //{
                    pageCollection.RemoveAt(index);

                    if (theButton.CommandName.ToLower() == "downgrandchild")
                    {
                        pageCollection.Insert(index + 1, pageMoved);
                    }
                    // }
                    int i = 1;
                    foreach (Content.Page page in pageCollection)
                    {
                        page.SortOrder = i++;
                    }
                    pageCollection.SaveAll(WebUtility.GetUserName());
                    BindParentRepeater();
                    //LoadParentPageDropDown(ds);


                    //LoadParentPageDropDown(dsParentPage);
                    //LoadRedirectPageDropDown(ds);
                }
            }

        }



        

        #endregion Repeater Events

        #region Regions Datagrid Events

        /// <summary>
        /// Handles the ItemDataBound event of the dgRegions control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="T:System.Web.UI.WebControls.DataGridItemEventArgs"/> instance containing the event data.</param>
        //void dgRegions_ItemDataBound(object sender, DataGridItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        Region region = e.Item.DataItem as Region;
        //        HyperLink editRegionLink = e.Item.FindControl("hlEditRegion") as HyperLink;
        //        if (editRegionLink != null && region != null)
        //        {
        //            editRegionLink.NavigateUrl = string.Format("~/admin/region.aspx?pageId={0}&regionId={1}", _selectedPageId, region.RegionId);
        //            editRegionLink.Text = LocalizationUtility.GetText("lblEditRegion");
        //        }
        //        HyperLink editLink = e.Item.FindControl("hlEdit") as HyperLink;
        //        if (editLink != null && region != null)
        //        {
        //            editLink.NavigateUrl = string.Format("~/admin/provider.aspx?pageId={0}&regionId={1}&providerId={2}", _selectedPageId, region.RegionId, region.ProviderId);
        //            //editLink.Text = LocalizationUtility.GetText("lblEdit");
        //        }
        //        LinkButton deleteButton = e.Item.FindControl("lbDelete") as LinkButton;
        //        if (deleteButton != null && region != null)
        //        {
        //           // deleteButton.Text = LocalizationUtility.GetText("lblDelete");
        //            deleteButton.Attributes.Add("onclick", "return confirm(\"" + LocalizationUtility.GetText("lblConfirmDelete") + "\");return false;");
        //        }
        //    }
        //}

        protected void dgRegions_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Region region = e.Item.DataItem as Region;
                HyperLink editRegionLink = e.Item.FindControl("hlEditRegion") as HyperLink;
                if (editRegionLink != null && region != null)
                {
                    editRegionLink.NavigateUrl = string.Format("~/admin/region.aspx?pageId={0}&regionId={1}", Convert.ToInt32(ViewState["PageID"]), region.RegionId);
                    editRegionLink.Text = LocalizationUtility.GetText("lblEditRegion");
                }
                HyperLink editLink = e.Item.FindControl("hlEdit") as HyperLink;
                if (editLink != null && region != null)
                {
                    editLink.NavigateUrl = string.Format("~/admin/provider.aspx?pageId={0}&regionId={1}&providerId={2}", Convert.ToInt32(ViewState["PageID"]), region.RegionId, region.ProviderId);
                    //editLink.Text = LocalizationUtility.GetText("lblEdit");
                }
                LinkButton deleteButton = e.Item.FindControl("lbDelete") as LinkButton;
                if (deleteButton != null && region != null)
                {
                    // deleteButton.Text = LocalizationUtility.GetText("lblDelete");
                    deleteButton.Attributes.Add("onclick", "return confirm(\"" + LocalizationUtility.GetText("lblConfirmDelete") + "\");return false;");
                }
            }
        }

        /// <summary>
        /// Handles the Click event of the lbDelete control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="T:System.Web.UI.WebControls.CommandEventArgs"/> instance containing the event data.</param>
        protected void lbDelete_Click(object sender, CommandEventArgs e)
        {
            int regionId = 0;
            int.TryParse(e.CommandArgument.ToString(), out regionId);
            int pageId = 0;
            int.TryParse(lblPageId.Text, out pageId);
            if (regionId > 0)
            {
                Query query = new Query(PageRegionMap.Schema).
                  AddWhere(PageRegionMap.Columns.RegionId, Comparison.Equals, regionId).
                  AddWhere(PageRegionMap.Columns.PageId, Comparison.Equals, pageId);
                query.QueryType = QueryType.Delete;
                query.Execute();
                Region.Delete(regionId);
                LoadRegions(pageId);
            }
            pnlCurrentPages.Visible = true;
            pnlEditPage.Visible = false;

        }
        #endregion Region Datagrid Events

        #region LinkButton Events

        protected void lnkbtnAddPage_Click(object sender, EventArgs e)
        {
            pnlCurrentPages.Visible = false;
            pnlEditPage.Visible = true;
            GetPageDataSet();

        }


        protected void lnkPrevious_Click(object sender, EventArgs e)
        {
            PgNum -= 1;
            BindParentRepeater();
        }

        protected void lnkNext_Click(object sender, EventArgs e)
        {
            PgNum += 1;
            BindParentRepeater();
        }

        #endregion LinkButton Events

        protected void btnBigDelete_Click(object sender, EventArgs e)
        {
            string fileName = Path.GetFileName(txtPageTitleImage.Text);
            File.Delete(Server.MapPath("~/repository/Gallary/" + fileName));
            Master.MessageCenter.DisplaySuccessMessage(string.Format("{0} {1}", fileName, LocalizationUtility.GetText("lblDeletedFromServer")));

            txtPageTitleImage.Text = string.Empty;
        }
        private void SetImagesProperties()
        {
            this.Page.Title = LocalizationUtility.GetText("titleProductEditImages");
            hlImageSelector.NavigateUrl = string.Format("~/admin/PageTitleImageSelector.aspx?view=s&controlId={0}", txtPageTitleImage.ClientID);
        }


        /*private void SetMenuTitleProperties()
        {
            this.Page.Title = LocalizationUtility.GetText("titleProductEditImages");
            hlMenuTitleImage.NavigateUrl = string.Format("~/admin/MenuTitelImageSelector.aspx?view=s&controlId={0}", txtMenuTitelImage.ClientID);
        }*/


       /* private void SetMenuTitleHoverProperties()
        {
            this.Page.Title = LocalizationUtility.GetText("titleProductEditImages");
            hlMenuTitleHoverImage.NavigateUrl = string.Format("~/admin/MenuTitelImageSelector.aspx?view=s&controlId={0}", txtMenuTitleHoverImage.ClientID);
        }*/


        /*private void SetRightBanner()
        {
            this.Page.Title = LocalizationUtility.GetText("titleProductEditImages");
            hlBannerImage.NavigateUrl = string.Format("~/admin/BannerSelector.aspx?view=s&controlId={0}", txtBanner.ClientID);
        }*/

        /*protected void btnMenuTitleImage_Click(object sender, EventArgs e)
        {
            string fileName = Path.GetFileName(txtMenuTitelImage.Text);
            File.Delete(Server.MapPath("~/repository/Gallary/" + fileName));
            Master.MessageCenter.DisplaySuccessMessage(string.Format("{0} {1}", fileName, LocalizationUtility.GetText("lblDeletedFromServer")));
            txtMenuTitelImage.Text = string.Empty;
        }*/

       /* protected void btnMenuTitleHoverImage_Click(object sender, EventArgs e)
        {
            string fileName = Path.GetFileName(txtMenuTitleHoverImage.Text);
            File.Delete(Server.MapPath("~/repository/Gallary/" + fileName));
            Master.MessageCenter.DisplaySuccessMessage(string.Format("{0} {1}", fileName, LocalizationUtility.GetText("lblDeletedFromServer")));
            txtMenuTitleHoverImage.Text = string.Empty;
        }

        protected void btnBanner_Click(object sender, EventArgs e)
        {
            string fileName = Path.GetFileName(txtBanner.Text);
            File.Delete(Server.MapPath("~/repository/Gallary/" + fileName));
            Master.MessageCenter.DisplaySuccessMessage(string.Format("{0} {1}", fileName, LocalizationUtility.GetText("lblDeletedFromServer")));
            txtBanner.Text = string.Empty;
            ViewState["Flage"] = "1";
        }*/

        

    }
}
