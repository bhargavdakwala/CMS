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
    public partial class ServiceDetailEdit : Etech.CMS.Store.Web.AdminPage
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
                    LoadCategoryTitle();
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

                    ServiceDetail blogEdit = new ServiceDetail();
                    //BlogCategory blogCategory = new BlogCategory();

                    if (BlogId > 0)
                    {
                        blogEdit = new Content.ServiceDetail(BlogId);
                    }
                    else
                    {
                        blogEdit = new Content.ServiceDetail();
                        blogEdit.ServiceDetailGuid = Guid.NewGuid();
                    }

                    blogEdit.ServiceDetailTitlte = txtBlogTitle.Text.Trim();
                    
                    blogEdit.Description = txtDescriptor.Value;

                    //blogEdit.CategoryId = ddlBlogCategory.SelectedItem.Text != string.Empty ? Convert.ToInt32(ddlBlogCategory.SelectedItem.Text) : 0; 
                    blogEdit.ServiceID = Convert.ToInt32(ddlBlogCategory.SelectedValue);
                    blogEdit.CreatedBy = Page.User.Identity.Name;
                    blogEdit.CreatedOn = Convert.ToDateTime(DateTime.Today.Date.ToString());
                    blogEdit.IsActive = true;
                    blogEdit.Save(WebUtility.GetUserName());

                    lblBlogId.Text = "0";
                    txtBlogTitle.Text = string.Empty;
                    
                    txtDescriptor.Value = "";


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
            
            txtDescriptor.Value = "";
            //ddlBlogCategory.SelectedItem.Text = "";
            lblBlogId.Text = "0";

            //btnCancel.Visible = false;

        }


        private void LoadCategoryTitle()
        {
            //SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetAllServices();
            //ds = sp.GetDataSet();
            
            
            
            //ddlBlogCategory.DataTextField = "ServiceTitle";
            //ddlBlogCategory.DataValueField = "ServiceID";
            //ddlBlogCategory.DataSource = ds.Tables[0].DefaultView;
            //if (IsPostBack)
            //{
            //    ddlBlogCategory.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["ServiceTitle"]);
            //}
            //ddlBlogCategory.DataBind();
            //ddlBlogCategory.Items.Insert(0, "Select");

            BlogCategory categorytitle = new BlogCategory();
            ds = new BlogCategoryController().FetchServiceList();
            ddlBlogCategory.DataTextField = "ServiceTitle";
            ddlBlogCategory.DataValueField = "ServiceID";
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
                    ServiceDetail blogEdit = new ServiceDetail(Int32.Parse(e.CommandArgument.ToString()));
                    txtBlogTitle.Text = blogEdit.ServiceDetailTitlte;
                    ddlBlogCategory.SelectedValue = Convert.ToString(blogEdit.ServiceID);
                    LoadCategoryTitle();

                    
                    txtDescriptor.Value = blogEdit.Description;
                    pnlCurrentServiceDetail.Visible = false;
                    //btnAddBlog.Visible = false;
                    btnCancel.Visible = true;
                    pnlEditServiceDetail.Visible = true;

                }
                else if (e.CommandName == "Delete")
                {
                    ServiceDetail blogEdit = new ServiceDetail(Int32.Parse(e.CommandArgument.ToString()));
                    ServiceDetail.Delete(Int32.Parse(e.CommandArgument.ToString()));

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

            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.FetchServiceTitlebyServiceID();
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

        protected void lnkAddBlog_Click(object sender, EventArgs e)
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
