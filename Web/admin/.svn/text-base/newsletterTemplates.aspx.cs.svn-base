using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using Etech.CMS.Content;
using Etech.CMS.Core;
using Etech.CMS.Localization;
using Etech.CMS.Store;
using SubSonic;
using System.Net.Mail;
using Etech.CMS.Store.Caching;
using Etech.CMS.Store.Services.MessageService;

namespace Etech.CMS.Web.admin
{
    public partial class newsletterTemplates : System.Web.UI.Page
    {
        #region Member Variables

        DataSet ds;
        public string strGUID;

        #endregion Member Variables

        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Label lblHeading = (Label)Master.FindControl("lblPageHeading");
                lblHeading.Text = "Templates";

                dgTemplates.Attributes.Add("style", "word-break: break-all; word-wrap: break-word");

                if (!Page.IsPostBack)
                {
                    pnlEditTemplate.Visible = false;
                    pnlCurrentTemplate.Visible = true;
                    BindGrid();
                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(categoryedit).Name + ".Page_Load", ex);
                Master.MessageCenter.DisplayCriticalMessage(ex.Message);
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
                if (Page.IsValid)
                {
                    SaveTemplates();
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
            pnlCurrentTemplate.Visible = true;
            pnlEditTemplate.Visible = false;
            txtTemplateTitle.Text = string.Empty;
            txtDescriptor.Value = "";
            lblTemplateId.Text = "0";

        }
        #endregion Button Events

        #region Methods

        /// <summary>
        /// Gets all the NewsLetters
        /// </summary>
        private void BindGrid()
        {
            ds = new NewsLetterEditTemplatesController().FetchAllNewsletterTemplates();
            dgTemplates.DataSource = ds;

            if (dgTemplates.Items.Count % dgTemplates.PageSize == 1 && dgTemplates.CurrentPageIndex == dgTemplates.PageCount - 1 && dgTemplates.CurrentPageIndex != 0)
            {
                dgTemplates.CurrentPageIndex = dgTemplates.CurrentPageIndex - 1;
            }
            dgTemplates.DataBind();

        }


        /// <summary>
        /// Save the NewsLetter and its details
        /// </summary>
        private void SaveTemplates()
        {
            NewsLetterTemplate newsLetterTemplate = new NewsLetterTemplate();

            //Insert
            if (lblTemplateId.Text == "")
            {
                if (CheckDuplicateTemplateTitle())
                {
                    newsLetterTemplate.TemplateGuID = Guid.NewGuid().ToString();
                    newsLetterTemplate.TemplateName = txtTemplateTitle.Text.Trim().ToString();
                    newsLetterTemplate.TemplateDescription = txtDescriptor.Value.ToString();
                    newsLetterTemplate.IsActive = Convert.ToBoolean(true);
                    newsLetterTemplate.CreatedBy = Page.User.Identity.Name;
                    newsLetterTemplate.CreatedOn = Convert.ToDateTime(DateTime.Today.Date.ToString());
                    newsLetterTemplate.ModifiedBy = Page.User.Identity.Name;
                    newsLetterTemplate.ModifiedOn = Convert.ToDateTime(DateTime.Today.Date.ToString());
                    newsLetterTemplate.Save(WebUtility.GetUserName());

                    SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetMaxID(2);
                    DataSet dsMaxID = (DataSet)sp.GetDataSet();
                    int MaxID = Convert.ToInt32(dsMaxID.Tables[0].Rows[0][0]);



                    lblDuplicateMessage.Visible = false;
                    lblDuplicateMessage.Text = string.Empty;
                    txtTemplateTitle.Text = string.Empty;
                    txtDescriptor.Value = string.Empty;
                    BindGrid();

                    Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblTemplateSaved"));
                    pnlEditTemplate.Visible = false;
                    pnlCurrentTemplate.Visible = true;

                }
                else
                {
                    lblDuplicateMessage.Visible = true;
                    lblDuplicateMessage.Text = "Template Title already exists";


                    pnlCurrentTemplate.Visible = false;
                    pnlEditTemplate.Visible = true;
                    txtTemplateTitle.Text = string.Empty;
                    txtDescriptor.Value = string.Empty;
                    txtTemplateTitle.Focus();

                }
            }
            //Update
            else if (Convert.ToInt32(lblTemplateId.Text) > 0)
            {

                newsLetterTemplate.TemplateID = Convert.ToInt32(lblTemplateId.Text);
                newsLetterTemplate.TemplateName = txtTemplateTitle.Text.Trim().ToString();
                newsLetterTemplate.TemplateDescription = txtDescriptor.Value.ToString();
                newsLetterTemplate.IsActive = Convert.ToBoolean(true);
                newsLetterTemplate.ModifiedBy = Page.User.Identity.Name;

                NewsLetterTemplate.Update(Convert.ToInt32(newsLetterTemplate.TemplateID), ViewState["Guid"].ToString(), newsLetterTemplate.TemplateName, newsLetterTemplate.TemplateDescription, true, newsLetterTemplate.ModifiedBy.ToString(), Convert.ToDateTime(DateTime.Today.Date.ToString()));

                txtTemplateTitle.Text = string.Empty;
                txtDescriptor.Value = string.Empty;
                BindGrid();

                Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblTemplateSaved"));
                pnlEditTemplate.Visible = false;
                pnlCurrentTemplate.Visible = true;

            }


        }

        /// <summary>
        /// Check whether News Title already exists or not
        /// </summary>
        private bool CheckDuplicateTemplateTitle()
        {
            bool chkName = true;

            ds = new NewsLetterEditTemplatesController().FetchAllNewsletterTemplates();

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    if (ds.Tables[0].Rows[i]["TemplateName"].ToString().ToLower() == txtTemplateTitle.Text.Trim().ToLower())
                    {
                        chkName = false;
                    }
                }
            }
            return chkName;
        }

        #endregion Methods

        #region Grid Events


        /// <summary>
        /// Handles the Click event of the btnSave control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="T:System.EventArgs"/> instance containing the event data.</param>
        protected void dgTemplates_OnItemCommand(object sender, DataGridCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Edit")
                {
                    lblTemplateId.Text = e.CommandArgument.ToString();
                    NewsLetterTemplate newsLetterTemplateEdit = new NewsLetterTemplate(Int32.Parse(e.CommandArgument.ToString()));
                    strGUID = newsLetterTemplateEdit.TemplateGuID.ToString();
                    ViewState["Guid"] = strGUID;
                    txtTemplateTitle.Text = newsLetterTemplateEdit.TemplateName;
                    txtDescriptor.Value = newsLetterTemplateEdit.TemplateDescription;

                    pnlEditTemplate.Visible = true;
                    pnlCurrentTemplate.Visible = false;
                    btnCancel.Visible = true;

                }
                else if (e.CommandName == "Delete")
                {
                    // deletes the news letter template
                    NewsLetterTemplate newsLetterTemplateEdit = new NewsLetterTemplate(Int32.Parse(e.CommandArgument.ToString()));

                    SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetTemplateCount(Int32.Parse(e.CommandArgument.ToString()));

                    int Count = (int)sp.ExecuteScalar();

                    if (Count > 0)
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "Message", "alert('This Template is assigned to a newsLetter. It cannot be deleted.');", true);

                    }
                    else
                    {
                        NewsLetterTemplate.Delete(Int32.Parse(e.CommandArgument.ToString()));
                    }
                    BindGrid();
                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(blogcategoryedit).Name + ".dgTemplates_OnItemCommand", ex);
                Master.MessageCenter.DisplayCriticalMessage(ex.Message);
            }
        }

        protected void lnkAddTemplate_Click(object sender, EventArgs e)
        {
            pnlEditTemplate.Visible = true;
            pnlCurrentTemplate.Visible = false;

            lblTemplateId.Text = string.Empty;
            lblDuplicateMessage.Visible = false;
            lblDuplicateMessage.Text = string.Empty;

        }

        protected void dgTemplates_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dgTemplates.CurrentPageIndex = e.NewPageIndex;
            BindGrid();
        }

        #endregion Grid Events
    }
}