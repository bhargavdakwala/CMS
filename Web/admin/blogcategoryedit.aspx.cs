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

namespace Etech.CMS.Web.admin {
  public partial class blogcategoryedit : Etech.CMS.Store.Web.AdminPage
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
              lblHeading.Text = "Categories";

              dgBlogCategories.Attributes.Add("style", "word-break: break-all; word-wrap: break-word");

              SetCategoryEditProperties();
              if (!Page.IsPostBack)
              {
                  LoadBlogCategories();
              }
          }
          catch (Exception ex)
          {
              Logger.Error(typeof(categoryedit).Name + ".Page_Load", ex);
              Master.MessageCenter.DisplayCriticalMessage(ex.Message);
          }
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
                  int CategoryId = 0;
                  CategoryId = Int32.TryParse(lblBlogCategoryId.Text, out CategoryId) ? Int32.Parse(lblBlogCategoryId.Text) : 0;

                  BlogCategory blogCategory = new BlogCategory();

                  if (CategoryId > 0)
                  {
                      blogCategory = new Content.BlogCategory(CategoryId);
                  }
                  else
                  {
                      blogCategory = new Content.BlogCategory();
                      blogCategory.CategoryGuid = Guid.NewGuid();
                  }

                  blogCategory.CategoryTitle = txtBlogCategory.Text.Trim();
                  blogCategory.URLTitle = txtURLTitle.Text;
                  blogCategory.Keywords = txtKeywords.Text;
                  blogCategory.Title = txtTitle.Text;
                  blogCategory.Description = txtDescription.Text;

                  blogCategory.Save(WebUtility.GetUserName());

                  lblBlogCategoryId.Text = "0";
                  txtBlogCategory.Text = string.Empty;
                  txtKeywords.Text = string.Empty;
                  txtTitle.Text = string.Empty;
                  txtDescription.Text = string.Empty;
                  txtURLTitle.Text = string.Empty;

                  pnlCurrentCategories.Visible = true;
                  pnlEditBlogCategories.Visible = false;

                  LoadBlogCategories();

                  Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblBlogCategorySaved"));
              }
          }
          catch (Exception ex)
          {
              Logger.Error(typeof(blogcategoryedit).Name + ".btnSave_Click", ex);
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
          txtBlogCategory.Text = string.Empty;
          txtKeywords.Text = string.Empty;
          txtTitle.Text = string.Empty;
          txtDescription.Text = string.Empty;
          txtURLTitle.Text = string.Empty;
          lblBlogCategoryId.Text = "0";
          pnlCurrentCategories.Visible = true;
          pnlEditBlogCategories.Visible = false;
          
      }

      /// <summary>
      /// Handles the Click event of the btnSave control.
      /// </summary>
      /// <param name="sender">The source of the event.</param>
      /// <param name="e">The <see cref="T:System.EventArgs"/> instance containing the event data.</param>




      #endregion

      #region Methods

      #region Private

      /// <summary>
      /// Gets the category data set.
      /// </summary>
      private void GetBlogCategoryDataSet()
      {
          ds = new BlogCategoryController().FetchBlogCategoryList();
      }

      /// <summary>
      /// Loads the tree view.
      /// </summary>
      /// <param name="ds">The ds.</param>
      private void LoadBlogCategories()
      {
          GetBlogCategoryDataSet();
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
          this.Title = LocalizationUtility.GetText("titleBlogCategories");
      }

      #endregion

      protected void dgBlogCategories_ItemCommand(object source, DataGridCommandEventArgs e)
      {

          try
          {
              if (e.CommandName == "Edit")
              {
                  lblBlogCategoryId.Text = e.CommandArgument.ToString();
                  BlogCategory blogCategory = new BlogCategory(Int32.Parse(e.CommandArgument.ToString()));
                  txtBlogCategory.Text = blogCategory.CategoryTitle;
                  txtURLTitle.Text = blogCategory.URLTitle;
                  txtKeywords.Text = blogCategory.Keywords;
                  txtTitle.Text = blogCategory.Title;
                  txtDescription.Text = blogCategory.Description;

                  pnlCurrentCategories.Visible = false;
                  pnlEditBlogCategories.Visible = true;
                 
              }
              else if (e.CommandName == "Delete")
              {
                  BlogCategory blogCategory = new BlogCategory(Int32.Parse(e.CommandArgument.ToString()));
                  BlogCategory.Delete(Int32.Parse(e.CommandArgument.ToString()));
                  LoadBlogCategories();
              }
          }
          catch (Exception ex)
          {
              Logger.Error(typeof(blogcategoryedit).Name + ".dgBlogCategories_OnItemCommand", ex);
              Master.MessageCenter.DisplayCriticalMessage(ex.Message);
          }
      }

      #endregion

      protected void dgBlogCategories_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
      {
          dgBlogCategories.CurrentPageIndex = e.NewPageIndex;
          LoadBlogCategories();

      }

      protected void lnkAddTherapists_Click(object sender, EventArgs e)
      {
          pnlCurrentCategories.Visible = false;
          pnlEditBlogCategories.Visible = true;
      }

  }
}
