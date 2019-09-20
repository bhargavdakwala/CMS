using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Etech.CMS.Content;
using Etech.CMS.Core;
using Etech.CMS.Localization;
using Etech.CMS.Store;
using SubSonic;
using SubSonic.Utilities;
using System.Web;

namespace Etech.CMS.Web.admin
{
    public partial class GallerySubCategoryEdit : Etech.CMS.Store.Web.AdminPage
    {
        #region Member Variables

        DataSet ds;

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

                Label lblHeading = (Label)Master.FindControl("lblPageHeading");
                lblHeading.Text = "Service Detail";

                dgBlogCategories.Attributes.Add("style", "word-break: break-all; word-wrap: break-word");

                SetCategoryEditProperties();
                if (!Page.IsPostBack)
                {
                    BindGrid();
                    pnlEditServiceDetail.Visible = false;
                    //LoadBlogCategories();
                    LoadGalleryTitle();
                    pnlCurrentServiceDetail.Visible = true;
                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(ServiceDetailEdit).Name + ".Page_Load", ex);
                Master.MessageCenter.DisplayCriticalMessage(ex.Message);
            }

            //BindCategory();
        }

        /// <summary>
        /// Handles the Click event of the btnSave control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="T:System.EventArgs"/> instance containing the event data.</param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    int BlogId = 0;
                    BlogId = Int32.TryParse(lblBlogId.Text, out BlogId) ? Int32.Parse(lblBlogId.Text) : 0;

                    //ServiceDetail blogEdit = new ServiceDetail();
                    GallerySubCategory blogEdit = new GallerySubCategory();

                    if (BlogId > 0)
                    {
                        blogEdit = new Content.GallerySubCategory(BlogId);
                    }
                    else
                    {
                        blogEdit = new Content.GallerySubCategory();
                        blogEdit.ImgSubCategoryGuid  = Guid.NewGuid();
                    }

                    blogEdit.ImgSubCategoryTitle  = txtBlogTitle.Text.Trim();

                    

                    //blogEdit.CategoryId = ddlBlogCategory.SelectedItem.Text != string.Empty ? Convert.ToInt32(ddlBlogCategory.SelectedItem.Text) : 0; 
                    blogEdit.ImgCategoryID  = Convert.ToInt32(ddlBlogCategory.SelectedValue);
                    blogEdit.CreatedBy = Page.User.Identity.Name;
                    blogEdit.CreatedOn = Convert.ToDateTime(DateTime.Today.Date.ToString());
                    
                    blogEdit.Save(WebUtility.GetUserName());

                    lblBlogId.Text = "0";
                    txtBlogTitle.Text = string.Empty;

                    //LoadBlogCategories();
                    BindGrid();

                    Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblServiceDetailSaved"));
                    pnlEditServiceDetail.Visible = false;
                    //btnAddBlog.Visible = true;
                    pnlCurrentServiceDetail.Visible = true;

                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(blogedit).Name + ".btnSave_Click", ex);
                Master.MessageCenter.DisplayCriticalMessage(ex.Message);
            }
        }

        /// <summary>
        /// Handles the Click event of the btnCancel control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="T:System.EventArgs"/> instance containing the event data.</param>
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            pnlCurrentServiceDetail.Visible = true;
            pnlEditServiceDetail.Visible = false;
            //btnAddBlog.Visible = true;

            
            //ddlBlogCategory.SelectedItem.Text = "";
            lblBlogId.Text = "0";

            //btnCancel.Visible = false;

        }


        private void LoadGalleryTitle()
        {
            

            BlogCategory categorytitle = new BlogCategory();
            ds = new BlogCategoryController().FetchGalleryList();
            ddlBlogCategory.DataTextField = "ImgCategoryTitle";
            ddlBlogCategory.DataValueField = "ImgCategoryID";
            ddlBlogCategory.DataSource = ds.Tables[0].DefaultView;
            if (IsPostBack)
            {
                ddlBlogCategory.SelectedValue = categorytitle.CategoryTitle;
            }
            ddlBlogCategory.DataBind();
            ddlBlogCategory.Items.Insert(0, "Select");

        }


        /// <summary>
        /// Handles the Click event of the btnSave control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="T:System.EventArgs"/> instance containing the event data.</param>
        protected void dgBlogCategories_OnItemCommand(object sender, DataGridCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Edit")
                {

                    lblBlogId.Text = e.CommandArgument.ToString();
                    GallerySubCategory blogEdit = new GallerySubCategory(Int32.Parse(e.CommandArgument.ToString()));
                    txtBlogTitle.Text = blogEdit.ImgSubCategoryTitle;
                    ddlBlogCategory.SelectedValue = Convert.ToString(blogEdit.ImgCategoryID);
                    LoadGalleryTitle();


                    
                    pnlCurrentServiceDetail.Visible = false;
                    //btnAddBlog.Visible = false;
                    btnCancel.Visible = true;
                    pnlEditServiceDetail.Visible = true;

                }
                else if (e.CommandName == "Delete")
                {
                    GallerySubCategory blogEdit = new GallerySubCategory(Int32.Parse(e.CommandArgument.ToString()));
                    GallerySubCategory.Delete(Int32.Parse(e.CommandArgument.ToString()));

                    BindGrid();
                    //LoadBlogCategories();
                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(ServiceDetailEdit).Name + ".dgBlogCategories_OnItemCommand", ex);
                Master.MessageCenter.DisplayCriticalMessage(ex.Message);
            }
        }



        #endregion

        #region Methods

        #region Private

        /// <summary>
        /// Gets the category data set.
        /// </summary>
        private void GetBlogDataSet()
        {
            ds = new BlogEditController().FetchBlogList();
            //ds = new SubSonic.StoredProcedure("CMS_Core_FetchCategoryTitlebyCategoryID", DataService.GetInstance("CMSProvider"));
            //Etech.CMS.Content.SPs.FetchCategoryTitlebyCategoryID();


        }

        /// <summary>
        /// Loads the tree view.
        /// </summary>
        /// <param name="ds">The ds.</param>
        private void LoadBlogCategories()
        {

            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.FetchCategoryTitlebyCategoryID();
            dgBlogCategories.DataSource = sp.GetReader();
            dgBlogCategories.DataBind();

        }

        private void BindGrid()
        {

            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetAllGallerySubCategory();
            ds = sp.GetDataSet();
            dgBlogCategories.DataSource = ds;

            if (dgBlogCategories.Items.Count % dgBlogCategories.PageSize == 1 && dgBlogCategories.CurrentPageIndex == dgBlogCategories.PageCount - 1 && dgBlogCategories.CurrentPageIndex != 0)
            {
                dgBlogCategories.CurrentPageIndex = dgBlogCategories.CurrentPageIndex - 1;
            }
            dgBlogCategories.DataBind();



        }

        /// <summary>
        /// Sets the category edit properties.
        /// </summary>
        private void SetCategoryEditProperties()
        {
            this.Title = LocalizationUtility.GetText("titleAddBlog");

        }

        #endregion

        protected void lnkAddSubCategory_Click(object sender, EventArgs e)
        {
            pnlEditServiceDetail.Visible = true;
            pnlCurrentServiceDetail.Visible = false;
            //btnAddBlog.Visible = false;
            ddlBlogCategory.SelectedIndex = -1;

        }


        #endregion

        protected void ddlBlogCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string test = ddlBlogCategory.SelectedValue.ToString();
        }

        protected void dgBlogCategories_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dgBlogCategories.CurrentPageIndex = e.NewPageIndex;
            BindGrid();
        }
    }
}