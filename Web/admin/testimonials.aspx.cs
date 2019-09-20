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
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Etech.CMS.Content;
using Etech.CMS.Core;
using Etech.CMS.Localization;
using Etech.CMS.Store;
using SubSonic;

namespace Etech.CMS.Web.admin
{
    public partial class blogedit : Etech.CMS.Store.Web.AdminPage
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
            Label lblHeading = (Label)Master.FindControl("lblPageHeading");
            lblHeading.Text = "Testimonials";

            try
            {
                SetCategoryEditProperties();
                if (!Page.IsPostBack)
                {
                    pnlEditBlog.Visible = false;
                    LoadBlogCategories();
                    // LoadCategoryTitle();
                    pnlCurrentNewsEvent.Visible = true;
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
                    blogEdit.BlogDescription = txtDescriptor.Value;
                    //blogEdit.CategoryId = ddlBlogCategory.SelectedItem.Text != string.Empty ? Convert.ToInt32(ddlBlogCategory.SelectedItem.Text) : 0; 
                    // blogEdit.CategoryId = Convert.ToInt32(ddlBlogCategory.SelectedValue);
                    blogEdit.CreatedBy = Page.User.Identity.Name;
                    blogEdit.CreatedOn = Convert.ToDateTime(DateTime.Today.Date.ToString());
                    blogEdit.IsActive = true;
                    blogEdit.Save(WebUtility.GetUserName());

                    lblBlogId.Text = "0";
                    txtBlogTitle.Text = string.Empty;
                    txtDescriptor.Value = "";


                    LoadBlogCategories();

                    Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblBlogCategorySaved"));
                    pnlEditBlog.Visible = false;
                    //btnAddBlog.Visible = true;
                    pnlCurrentNewsEvent.Visible = true;

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
            pnlCurrentNewsEvent.Visible = true;
            pnlEditBlog.Visible = false;
            //btnAddBlog.Visible = true;
            txtBlogTitle.Text = string.Empty;
            txtDescriptor.Value = "";
            //ddlBlogCategory.SelectedItem.Text = "";
            lblBlogId.Text = "0";

            //btnCancel.Visible = false;

        }


        //private void LoadCategoryTitle()
        //{
        //    BlogCategory categorytitle = new BlogCategory();
        //    ds = new BlogCategoryController().FetchBlogCategoryList();
        //    ddlBlogCategory.DataTextField = "CategoryTitle";
        //    ddlBlogCategory.DataValueField = "CategoryID";
        //    ddlBlogCategory.DataSource = ds.Tables[0].DefaultView;
        //    if (IsPostBack)
        //    {
        //        ddlBlogCategory.SelectedValue = categorytitle.CategoryTitle;
        //    }
        //    ddlBlogCategory.DataBind();
        //    ddlBlogCategory.Items.Insert(0, "Select");
        //}


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
                    //                   ddlBlogCategory.SelectedValue = Convert.ToString(blogEdit.CategoryId);
                    //                    LoadCategoryTitle();
                    txtDescriptor.Value = blogEdit.BlogDescription;
                    pnlCurrentNewsEvent.Visible = false;
                    //btnAddBlog.Visible = false;
                    btnCancel.Visible = true;
                    pnlEditBlog.Visible = true;

                }
                else if (e.CommandName == "Delete")
                {
                    Blog blogEdit = new Blog(Int32.Parse(e.CommandArgument.ToString()));
                    Blog.Delete(Int32.Parse(e.CommandArgument.ToString()));


                    LoadBlogCategories();
                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(blogedit).Name + ".dgBlogCategories_OnItemCommand", ex);
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
            dgBlogCategories.DataSource = sp.GetDataSet();
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

        protected void lnkAddBlog_Click(object sender, EventArgs e)
        {
            pnlEditBlog.Visible = true;
            pnlCurrentNewsEvent.Visible = false;
            //btnAddBlog.Visible = false;


        }


        #endregion

        protected void dgBlogCategories_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dgBlogCategories.CurrentPageIndex = e.NewPageIndex;
            LoadBlogCategories();
        }



    }
}

