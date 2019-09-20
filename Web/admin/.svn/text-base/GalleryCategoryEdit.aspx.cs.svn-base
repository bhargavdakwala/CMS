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
    public partial class GalleryCategoryEdit : Etech.CMS.Store.Web.AdminPage
    {
        #region Member Variables

        DataSet ds;

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                Label lblHeading = (Label)Master.FindControl("lblPageHeading");
                lblHeading.Text = "Affiliates Category";

                dgBlogCategories.Attributes.Add("style", "word-break: break-all; word-wrap: break-word");

                SetCategoryEditProperties();
                if (!Page.IsPostBack)
                {
                    LoadImageGalleryCategories();
                    pnlEditAffiliatesCategories.Visible = false;


                    pnlCurrentAffiliatesCategories.Visible = true;
                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(ServiceEdit).Name + ".Page_Load", ex);
                Master.MessageCenter.DisplayCriticalMessage(ex.Message);


            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    int ImgCategoryID = 0;
                    ImgCategoryID = Int32.TryParse(lblBlogCategoryId.Text, out ImgCategoryID) ? Int32.Parse(lblBlogCategoryId.Text) : 0;

                    //Service blogCategory = new Service();

                    GalleryCategory imgGallaryCat = new GalleryCategory();



                    if (ImgCategoryID > 0)
                    {
                        imgGallaryCat = new Content.GalleryCategory(ImgCategoryID);
                    }
                    else
                    {
                        imgGallaryCat = new Content.GalleryCategory();
                        imgGallaryCat.ImgCategoryGuid = Guid.NewGuid();
                    }

                    imgGallaryCat.ImgCategoryTitle = txtBlogCategory.Text.Trim();

                    imgGallaryCat.Save(WebUtility.GetUserName());

                    lblBlogCategoryId.Text = "0";
                    txtBlogCategory.Text = string.Empty;

                    LoadImageGalleryCategories();

                    Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblAffiliatesSaved"));

                    pnlEditAffiliatesCategories.Visible = false;
                    //btnAddBlog.Visible = true;
                    pnlCurrentAffiliatesCategories.Visible = true;
                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(ServiceEdit).Name + ".btnSave_Click", ex);
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
            lblBlogCategoryId.Text = "0";
            btnCancel.Visible = true;

            pnlCurrentAffiliatesCategories.Visible = true;
            pnlEditAffiliatesCategories.Visible = false;

        }

        private void GetBlogCategoryDataSet()
        {
            //ds = new BlogCategoryController().FetchBlogCategoryList();



        }

        /// <summary>
        /// Loads the tree view.
        /// </summary>
        /// <param name="ds">The ds.</param>
        private void LoadImageGalleryCategories()
        {
            //GetBlogCategoryDataSet();
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetAllImageGalleryCategory();
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
            this.Title = LocalizationUtility.GetText("titleServiceCategories");
        }
        protected void dgBlogCategories_ItemCommand(object source, DataGridCommandEventArgs e)
        {

            try
            {
                if (e.CommandName == "Edit")
                {
                    lblBlogCategoryId.Text = e.CommandArgument.ToString();
                    GalleryCategory GallaryCategory = new GalleryCategory(Int32.Parse(e.CommandArgument.ToString()));
                    txtBlogCategory.Text = GallaryCategory.ImgCategoryTitle;
                    
                    btnCancel.Visible = true;
                    pnlEditAffiliatesCategories.Visible = true;
                    pnlCurrentAffiliatesCategories.Visible = false;
                }
                else if (e.CommandName == "Delete")
                {
                    GalleryCategory blogCategory = new GalleryCategory(Int32.Parse(e.CommandArgument.ToString()));
                    GalleryCategory.Delete(Int32.Parse(e.CommandArgument.ToString()));

                    SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.DeleteImageByImageCategoryID(Int32.Parse(e.CommandArgument.ToString()));
                    sp.Execute();  

                    LoadImageGalleryCategories();
                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(ServiceEdit).Name + ".dgBlogCategories_OnItemCommand", ex);
                Master.MessageCenter.DisplayCriticalMessage(ex.Message);
            }
        }

        protected void dgBlogCategories_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dgBlogCategories.CurrentPageIndex = e.NewPageIndex;
            LoadImageGalleryCategories();

        }

        protected void lnkAffiliatesCategories_Click(object sender, EventArgs e)
        {
            pnlEditAffiliatesCategories.Visible = true;
            pnlCurrentAffiliatesCategories.Visible = false;
        }
    }
}