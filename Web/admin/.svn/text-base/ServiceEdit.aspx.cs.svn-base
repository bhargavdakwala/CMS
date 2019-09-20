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
    public partial class ServiceEdit : Etech.CMS.Store.Web.AdminPage
    {
        #region Member Variables

        DataSet ds;

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                Label lblHeading = (Label)Master.FindControl("lblPageHeading");
                lblHeading.Text = "Upcoming Affiliate Meetings/Latest News";

                

                dgBlogCategories.Attributes.Add("style", "word-break: break-all; word-wrap: break-word");

                SetCategoryEditProperties();
                if (!Page.IsPostBack)
                {
                    LoadServiceCategories();
                    pnlEditServiceCategories.Visible = false;


                    pnlCurrentServicesCategories.Visible = true;
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
                    int CategoryId = 0;
                    CategoryId = Int32.TryParse(lblBlogCategoryId.Text, out CategoryId) ? Int32.Parse(lblBlogCategoryId.Text) : 0;

                    string imageId = lblBlogCategoryId.Text;
                    Where where = new Where();
                    where.ColumnName = Content.Service.Columns.ServiceID;
                    where.DbType = DbType.Int32;
                    where.ParameterValue = imageId;
                    Query query = new Query(Content.Service.Schema);
                    object strSortOrder = query.GetMax(Content.Service.Columns.SortOrder, where);

                    DataSet dsSortOrder = new DataSet();
                    SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.SortServiceOrderID(); 
                    dsSortOrder = (DataSet)sp.GetDataSet();
                    int maxSortOrder = Convert.ToInt32(dsSortOrder.Tables[0].Rows[0]["MaxSortOrder"]);

                    //int.TryParse(strSortOrder.ToString(), out maxSortOrder);
                    Content.Service service;
                    if (!string.IsNullOrEmpty(imageId))
                    {
                        service = new Content.Service(imageId);
                    }
                    else
                    {
                        service = new Content.Service();
                        service.SortOrder = maxSortOrder + 1;
                    }


                    Service blogCategory = new Service();

                    if (CategoryId > 0)
                    {
                        blogCategory = new Content.Service(CategoryId);
                    }
                    else
                    {
                        blogCategory = new Content.Service();
                        blogCategory.ServiceGuid = Guid.NewGuid();
                    }

                    blogCategory.ServiceTitle = txtBlogCategory.Text.Trim();
                    blogCategory.ServiceDescription = txtDescriptor.Value;
                    blogCategory.AffiliateNews = ddlAffiliateNews.SelectedItem.Text.ToString();
                    blogCategory.Save(WebUtility.GetUserName());

                    lblBlogCategoryId.Text = "0";
                    txtBlogCategory.Text = string.Empty;
                    txtDescriptor.Value = string.Empty;
                    ddlAffiliateNews.SelectedIndex = 0;
                    LoadServiceCategories();

                    Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblBlogServiceSaved"));

                    pnlEditServiceCategories.Visible = false;
                    //btnAddBlog.Visible = true;
                    pnlCurrentServicesCategories.Visible = true;
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
            txtDescriptor.Value = string.Empty;
            ddlAffiliateNews.SelectedIndex = 0;
            lblBlogCategoryId.Text = "0";
            btnCancel.Visible = true;

            pnlCurrentServicesCategories.Visible = true;
            pnlEditServiceCategories.Visible = false;
            
        }

        private void GetBlogCategoryDataSet()
        {
            //ds = new BlogCategoryController().FetchBlogCategoryList();

            
            
        }

        /// <summary>
        /// Loads the tree view.
        /// </summary>
        /// <param name="ds">The ds.</param>
        private void LoadServiceCategories()
        {
            //GetBlogCategoryDataSet();
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetAllServicesAdminPanel();
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

        protected void Items_ItemReorder(object sender, EventArgs e)
        {
            ImageButton theButton = sender as ImageButton;
            //            Query query = new Query(Content.ImageGallary.Schema).WHERE(Content.ImageGallary.Columns.ImageID, imageId).ORDER_BY(Content.ImageGallary.Columns.SortOrder);
            Query query = new Query(Content.Service.Schema).ORDER_BY(Content.Service.Columns.SortOrder);
            Content.ServiceCollection imageCollection = new Content.ServiceController ().FetchByQuery(query);
            if (imageCollection != null)
            {
                int imgId = 0;
                int.TryParse(theButton.CommandArgument, out imgId);
                if (imgId > 0)
                {
                    Content.Service imageMoved = imageCollection.Find(delegate(Content.Service image)
                    {
                        return image.ServiceID  == imgId;
                    });
                    int index = imageCollection.IndexOf(imageMoved);
                    imageCollection.RemoveAt(index);
                    if (theButton.CommandName.ToLower() == "up")
                    {
                        if (index == 0)
                        {
                            imageCollection.Insert(1, imageMoved);
                        }
                        else
                        {
                            imageCollection.Insert(index - 1, imageMoved);
                        }
                    }
                    else if (theButton.CommandName.ToLower() == "down")
                    {
                        imageCollection.Insert(index + 1, imageMoved);
                    }
                    int i = 1;
                    foreach (Content.Service image in imageCollection)
                    {
                        image.SortOrder = i++;
                    }
                    imageCollection.SaveAll(WebUtility.GetUserName());
                    LoadServiceCategories();
                }
            }
        }

        protected void dgBlogCategories_ItemCommand(object source, DataGridCommandEventArgs e)
        {

            try
            {
                if (e.CommandName == "Edit")
                {
                    lblBlogCategoryId.Text = e.CommandArgument.ToString();
                    Service blogCategory = new Service(Int32.Parse(e.CommandArgument.ToString()));
                    txtBlogCategory.Text = blogCategory.ServiceTitle;
                    txtDescriptor.Value = blogCategory.ServiceDescription;

                    int k = 0;
                    foreach (ListItem list in ddlAffiliateNews.Items)
                    {

                        if (list.Text == blogCategory.AffiliateNews.Trim())
                        {
                            ddlAffiliateNews.SelectedIndex = k;
                            break;
                        }
                        k = k + 1;
                    }



                    //ddlAffiliateNews.SelectedItem.Text = blogCategory.AffiliateNews;
                    btnCancel.Visible = true;
                    pnlEditServiceCategories.Visible = true;
                    pnlCurrentServicesCategories.Visible = false;
                }
                else if (e.CommandName == "Delete")
                {
                    Service blogCategory = new Service(Int32.Parse(e.CommandArgument.ToString()));
                    Service.Delete(Int32.Parse(e.CommandArgument.ToString()));
                    LoadServiceCategories();
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
            LoadServiceCategories();

        }

        protected void lnkServices_Click(object sender, EventArgs e)
        {
            pnlEditServiceCategories.Visible = true;
            pnlCurrentServicesCategories.Visible = false;
            txtBlogCategory.Text = string.Empty;
            txtDescriptor.Value = string.Empty;
        }
    }
}
