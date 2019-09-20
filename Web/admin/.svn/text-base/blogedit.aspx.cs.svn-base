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
    public partial class blogedit1 : Etech.CMS.Store.Web.AdminPage
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
                lblHeading.Text = "Blogs";

                dgBlogCategories.Attributes.Add("style", "word-break: break-all; word-wrap: break-word");

                SetCategoryEditProperties();
                if (!Page.IsPostBack)
                {
                    BindGrid();
                    pnlEditBlog.Visible = false;
                    //LoadBlogCategories();
                    LoadCategoryTitle();
                    pnlCurrentBlog.Visible = true;
                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(categoryedit).Name + ".Page_Load", ex);
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

                    Blog blogEdit = new Blog();
                    //BlogCategory blogCategory = new BlogCategory();

                    if (BlogId > 0)
                    {
                        blogEdit = new Content.Blog(BlogId);
                    }
                    else
                    {
                        blogEdit = new Content.Blog();
                        blogEdit.BlogGuid = Guid.NewGuid();
                    }

                    blogEdit.BlogTitle = txtBlogTitle.Text.Trim();
                    //blogEdit.Title = txtTitle.Text.Trim();
                    //blogEdit.Keywords = txtKeywords.Text.Trim();
                    // blogEdit.Description = txtDescription.Text.Trim();
                    blogEdit.BlogDescription = txtDescriptor.Value;

                    //blogEdit.CategoryId = ddlBlogCategory.SelectedItem.Text != string.Empty ? Convert.ToInt32(ddlBlogCategory.SelectedItem.Text) : 0; 
                    blogEdit.CategoryId = Convert.ToInt32(ddlBlogCategory.SelectedValue);
                    blogEdit.CreatedBy = Page.User.Identity.Name;
                    blogEdit.CreatedOn = Convert.ToDateTime(DateTime.Today.Date.ToString());
                    blogEdit.IsActive = true;

                    blogEdit.URLTitle = txtURLTitle.Text;
                    blogEdit.Keywords = txtKeywords.Text;
                    blogEdit.Title = txtTitle.Text;
                    blogEdit.Description = txtDescription.Text;

                    blogEdit.Save(WebUtility.GetUserName());

                    lblBlogId.Text = "0";
                    txtBlogTitle.Text = string.Empty;

                    txtURLTitle.Text = string.Empty;
                    txtKeywords.Text = string.Empty;
                    txtTitle.Text = string.Empty;
                    txtDescription.Text = string.Empty;

                    //txtTitle.Text = string.Empty;
                    // txtDescription.Text = string.Empty;
                    // txtKeywords.Text = string.Empty;
                    txtDescriptor.Value = "";


                    //LoadBlogCategories();
                    BindGrid();

                    Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblBlogSaved"));
                    pnlEditBlog.Visible = false;
                    //btnAddBlog.Visible = true;
                    pnlCurrentBlog.Visible = true;

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
            pnlCurrentBlog.Visible = true;
            pnlEditBlog.Visible = false;
            txtURLTitle.Text = string.Empty;
            txtKeywords.Text = string.Empty;
            txtTitle.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtBlogTitle.Text = string.Empty;

            //btnAddBlog.Visible = true;
            //txtTitle.Text = string.Empty;
            //txtDescription.Text = string.Empty;
            // txtKeywords.Text = string.Empty;
            txtDescriptor.Value = "";
            //ddlBlogCategory.SelectedItem.Text = "";
            lblBlogId.Text = "0";

            //btnCancel.Visible = false;

        }


        private void LoadCategoryTitle()
        {
            BlogCategory categorytitle = new BlogCategory();
            ds = new BlogCategoryController().FetchBlogCategoryList();
            ddlBlogCategory.DataTextField = "CategoryTitle";
            ddlBlogCategory.DataValueField = "CategoryID";
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
                    Blog blogEdit = new Blog(Int32.Parse(e.CommandArgument.ToString()));
                    
                    txtBlogTitle.Text = blogEdit.BlogTitle;
                    txtURLTitle.Text = blogEdit.URLTitle;
                    txtKeywords.Text = blogEdit.Keywords;
                    txtTitle.Text = blogEdit.Title;
                    txtDescription.Text = blogEdit.Description;

                    ddlBlogCategory.SelectedValue = Convert.ToString(blogEdit.CategoryId);
                    LoadCategoryTitle();

                    //txtTitle.Text = blogEdit.Title;
                    // txtKeywords.Text = blogEdit.Keywords;
                    // txtDescription.Text = blogEdit.Description;
                    txtDescriptor.Value = blogEdit.BlogDescription;
                    pnlCurrentBlog.Visible = false;
                    //btnAddBlog.Visible = false;
                    btnCancel.Visible = true;
                    pnlEditBlog.Visible = true;

                }
                else if (e.CommandName == "Delete")
                {
                    Blog blogEdit = new Blog(Int32.Parse(e.CommandArgument.ToString()));
                    Blog.Delete(Int32.Parse(e.CommandArgument.ToString()));

                    BindGrid();
                    //LoadBlogCategories();
                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(blogcategoryedit).Name + ".dgBlogCategories_OnItemCommand", ex);
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

            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.FetchCategoryTitlebyCategoryID();
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
            //Blog blogEdit = new Blog();
            //Page.Title = blogEdit.Title;
        }

        #endregion

        protected void lnkAddBlog_Click(object sender, EventArgs e)
        {
            pnlEditBlog.Visible = true;
            pnlCurrentBlog.Visible = false;
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