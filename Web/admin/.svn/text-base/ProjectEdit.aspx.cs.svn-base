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
    public partial class ProjectEdit : Etech.CMS.Store.Web.AdminPage
    {
        #region Member Variables

        DataSet ds;

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                Label lblHeading = (Label)Master.FindControl("lblPageHeading");
                lblHeading.Text = "Upcoming Meetings";

                dgBlogCategories.Attributes.Add("style", "word-break: break-all; word-wrap: break-word");

                SetCategoryEditProperties();
                if (!Page.IsPostBack)
                {
                    BindGrid();
                    pnlEditProject.Visible = false;


                    pnlCurrentProjct.Visible = true;
                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(ProjectEdit).Name + ".Page_Load", ex);
                Master.MessageCenter.DisplayCriticalMessage(ex.Message);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    int BlogId = 0;
                    BlogId = Int32.TryParse(lblBlogId.Text, out BlogId) ? Int32.Parse(lblBlogId.Text) : 0;


                    Project blogEdit = new Project();

                    //BlogCategory blogCategory = new BlogCategory();

                    if (BlogId > 0)
                    {
                        blogEdit = new Content.Project(BlogId);
                    }
                    else
                    {
                        blogEdit = new Content.Project();
                        blogEdit.ProjectGuid = Guid.NewGuid();
                    }

                    blogEdit.ProjectTitle = txtBlogTitle.Text.Trim();

                    string from = txtDate.Text;

                    string strDate = DateTime.ParseExact(from, "dd/MM/yyyy", null).ToString("MM/dd/yyyy");

                    //blogEdit.MeetingDate = Convert.ToDateTime(txtDate.Text);

                    blogEdit.MeetingDate = Convert.ToDateTime(strDate); 

                    blogEdit.ProjectDescription = txtDescriptor.Value;

                    //blogEdit.CategoryId = ddlBlogCategory.SelectedItem.Text != string.Empty ? Convert.ToInt32(ddlBlogCategory.SelectedItem.Text) : 0; 

                    blogEdit.CreatedBy = Page.User.Identity.Name;
                    blogEdit.CreatedOn = Convert.ToDateTime(DateTime.Today.Date.ToString());
                    blogEdit.IsActive = true;
                    blogEdit.Save(WebUtility.GetUserName());

                    lblBlogId.Text = "0";
                    txtBlogTitle.Text = string.Empty;
                    txtDescriptor.Value = "";
                    txtDate.Text = string.Empty;



                    //LoadBlogCategories();
                    BindGrid();

                    Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblBlogCategorySaved"));
                    pnlEditProject.Visible = false;
                    //btnAddBlog.Visible = true;
                    pnlCurrentProjct.Visible = true;

                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(ProjectEdit).Name + ".btnSave_Click", ex);
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
            pnlCurrentProjct.Visible = true;
            pnlEditProject.Visible = false;

            txtBlogTitle.Text = string.Empty;
            txtDescriptor.Value = "";
            txtDate.Text = string.Empty;
            lblBlogId.Text = "0";
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
                    Project blogEdit = new Project(Int32.Parse(e.CommandArgument.ToString()));
                    txtBlogTitle.Text = blogEdit.ProjectTitle;
                    //string mDate = Convert.ToDateTime(blogEdit.MeetingDate).ToShortDateString();
                    string mDate = Convert.ToDateTime(blogEdit.MeetingDate).ToString("dd/MM/yyyy");  
                    
                    
                    txtDate.Text = mDate;


                    txtDescriptor.Value = blogEdit.ProjectDescription;
                    pnlCurrentProjct.Visible = false;
                    //btnAddBlog.Visible = false;
                    btnCancel.Visible = true;
                    pnlEditProject.Visible = true;

                }
                else if (e.CommandName == "Delete")
                {
                    Project blogEdit = new Project(Int32.Parse(e.CommandArgument.ToString()));
                    Project.Delete(Int32.Parse(e.CommandArgument.ToString()));

                    //SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.DeleteProject(Int32.Parse(e.CommandArgument.ToString()));
                    //sp.Execute(); 


                    BindGrid();
                    //LoadBlogCategories();
                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(ProjectEdit).Name + ".dgBlogCategories_OnItemCommand", ex);
                Master.MessageCenter.DisplayCriticalMessage(ex.Message);
            }
        }

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


        private void BindGrid()
        {

            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetAllProjects();
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
            //this.Title = LocalizationUtility.GetText("titleAddBlog");
            Project blogEdit = new Project();
            this.Page.Title = "Upcoming Meetings";

        }

        protected void lnkProject_Click(object sender, EventArgs e)
        {
            pnlEditProject.Visible = true;
            pnlCurrentProjct.Visible = false;

            txtBlogTitle.Text = string.Empty;
            txtDate.Text = string.Empty;
            txtDescriptor.Value = string.Empty;
            //btnAddBlog.Visible = false;


        }



        protected void dgBlogCategories_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dgBlogCategories.CurrentPageIndex = e.NewPageIndex;
            BindGrid();
        }
    }
}
