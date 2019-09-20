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
    public partial class newsletterAddEdit : System.Web.UI.Page
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
                lblHeading.Text = "News Letters";

                dgNewsLetter.Attributes.Add("style", "word-break: break-all; word-wrap: break-word");

                // btnSave.Attributes.Add("onClick", "return ConfirmSendEmail(this);");

                if (!Page.IsPostBack)
                {
                    pnlEditNewLetter.Visible = false;
                    pnlCurrentNewsLetter.Visible = true;
                    BindGrid();
                    LoadListBox();
                    BindDropDown();

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
                    //ScriptManager.RegisterStartupScript(Page, this.GetType(), "Message", "alert('This Group is assigned to a newsLetter. It cannot be deleted');", true);

                    SaveNewsLetter();
                    //btnSave.Attributes.Add("onClick", "return ConfirmSendEmail(this);");

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
            pnlCurrentNewsLetter.Visible = true;
            pnlEditNewLetter.Visible = false;
            txtNewLetterTitle.Text = string.Empty;
            txtNewsLetterSubject.Text = string.Empty;
            BindDropDown();
            //ddlTemplates.SelectedValue = "1";
            lblNewLetterId.Text = "0";
            lblDuplicateMessage.Visible = false;
            lblDuplicateMessage.Text = string.Empty;
            LoadListBox();

        }
        #endregion Button Events

        #region Methods

        /// <summary>
        /// Gets all the NewsLetters
        /// </summary>
        private void BindGrid()
        {
            ds = new NewsLetterAddEditController().FetchAllNewsletter();
            dgNewsLetter.DataSource = ds;

            if (dgNewsLetter.Items.Count % dgNewsLetter.PageSize == 1 && dgNewsLetter.CurrentPageIndex == dgNewsLetter.PageCount - 1 && dgNewsLetter.CurrentPageIndex != 0)
            {
                dgNewsLetter.CurrentPageIndex = dgNewsLetter.CurrentPageIndex - 1;
            }
            dgNewsLetter.DataBind();

        }

        /// <summary>
        /// Loads the group name listbox.
        /// </summary>
        /// <param name="ds">The ds.</param>
        private void LoadListBox()
        {
            ds = new NewsLetterEditController().FetchNewsletterByGroup();

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {

                lstNewsletterGroupName.DataSource = ds;
                lstNewsletterGroupName.DataTextField = "GroupName";
                lstNewsletterGroupName.DataValueField = "GroupID";
                lstNewsletterGroupName.DataBind();
            }
        }

        private void BindDropDown()
        {
            NewsLetterEditTemplatesController obj = new NewsLetterEditTemplatesController();
            ds = obj.FetchAllNewsletterTemplates();
            ddlTemplates.DataSource = ds;
            ddlTemplates.DataTextField = "TemplateName";
            ddlTemplates.DataValueField = "TemplateID";
            ddlTemplates.DataBind();
        }


        /// <summary>
        /// Save the NewsLetter and its details
        /// </summary>
        private void SaveNewsLetter()
        {

            NewsLetter newsLetter = new NewsLetter();
            NewsLetterDetail newsLetterDetails = new NewsLetterDetail();

            //Insert
            if (lblNewLetterId.Text == "")
            {
                if (CheckDuplicateNewsLetterTitle())
                {
                    newsLetter.NewsLetterGUID = Guid.NewGuid().ToString();
                    newsLetter.NewsLetterTitle = txtNewLetterTitle.Text.Trim().ToString();
                    newsLetter.NewsLetterSubject = txtNewsLetterSubject.Text.Trim();
                    newsLetter.TemplateID = Convert.ToInt32(ddlTemplates.SelectedValue);
                    newsLetter.NewsLetterDescription = string.Empty;
                    newsLetter.IsActive = Convert.ToBoolean(true);
                    newsLetter.CreatedBy = Page.User.Identity.Name;
                    newsLetter.CreatedOn = Convert.ToDateTime(DateTime.Today.Date.ToString());
                    newsLetter.ModifiedBy = Page.User.Identity.Name;
                    newsLetter.ModifiedOn = Convert.ToDateTime(DateTime.Today.Date.ToString());
                    newsLetter.Save(WebUtility.GetUserName());

                    SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetMaxID(1);
                    DataSet dsMaxID = (DataSet)sp.GetDataSet();
                    int MaxID = Convert.ToInt32(dsMaxID.Tables[0].Rows[0][0]);

                    foreach (ListItem sourceItem in lstNewsletterGroupName.Items)
                    {
                        if (sourceItem.Selected)
                        {
                            newsLetterDetails.NewsLetterID = MaxID;
                            newsLetterDetails.GroupID = Convert.ToInt32(sourceItem.Value);
                            NewsLetterDetail.Insert(newsLetterDetails.NewsLetterID, Convert.ToInt32(newsLetterDetails.GroupID));
                        }

                    }
                    if (hdnEmailConfirmation.Value == "1")
                    {
                        SendEmail(MaxID, Convert.ToInt32(ddlTemplates.SelectedValue));
                    }
                    lblDuplicateMessage.Visible = false;
                    lblDuplicateMessage.Text = string.Empty;

                    txtNewLetterTitle.Text = string.Empty;
                    txtNewsLetterSubject.Text = string.Empty;
                    BindGrid();

                    Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblNewsLetterSaved"));
                    pnlEditNewLetter.Visible = false;
                    pnlCurrentNewsLetter.Visible = true;
                }
                else
                {
                    lblDuplicateMessage.Visible = true;
                    lblDuplicateMessage.Text = "News Title already exists";
                    txtNewLetterTitle.Text = string.Empty;
                    txtNewsLetterSubject.Text = string.Empty;
                    pnlEditNewLetter.Visible = true;
                    pnlCurrentNewsLetter.Visible = false;

                }
            }
            //Update
            else if (Convert.ToInt32(lblNewLetterId.Text) > 0)
            {

                newsLetter.NewsLetterID = Convert.ToInt32(lblNewLetterId.Text);
                newsLetter.NewsLetterTitle = txtNewLetterTitle.Text.Trim().ToString();
                newsLetter.NewsLetterSubject = txtNewsLetterSubject.Text.Trim();
                newsLetter.TemplateID = Convert.ToInt32(ddlTemplates.SelectedValue);
                newsLetter.NewsLetterDescription = string.Empty;
                newsLetter.IsActive = Convert.ToBoolean(true);
                newsLetter.ModifiedBy = Page.User.Identity.Name;


                NewsLetter.Update(Convert.ToInt32(newsLetter.NewsLetterID), ViewState["Guid"].ToString(), newsLetter.NewsLetterTitle, newsLetter.NewsLetterSubject.ToString(), Convert.ToInt32(newsLetter.TemplateID), newsLetter.NewsLetterDescription, true, newsLetter.ModifiedBy.ToString(), Convert.ToDateTime(DateTime.Today.Date.ToString()));

                if (lstNewsletterGroupName.Items.Count > 0)
                {
                    SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.DeleteDetailsByNewsLetterID(Convert.ToInt32(lblNewLetterId.Text));
                    sp.ExecuteScalar();

                    foreach (ListItem sourceItem in lstNewsletterGroupName.Items)
                    {
                        if (sourceItem.Selected)
                        {
                            newsLetterDetails.NewsLetterID = Convert.ToInt32(lblNewLetterId.Text);
                            newsLetterDetails.GroupID = Convert.ToInt32(sourceItem.Value);
                            NewsLetterDetail.Insert(Convert.ToInt32(newsLetterDetails.NewsLetterID), Convert.ToInt32(newsLetterDetails.GroupID));
                        }
                    }
                }



                if (hdnEmailConfirmation.Value == "1")
                {
                    SendEmail(Convert.ToInt32(lblNewLetterId.Text), Convert.ToInt32(newsLetter.TemplateID));
                }
                txtNewLetterTitle.Text = string.Empty;
                txtNewsLetterSubject.Text = string.Empty;
                BindGrid();

                Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblNewsLetterSaved"));
                pnlEditNewLetter.Visible = false;
                pnlCurrentNewsLetter.Visible = true;
            }



        }

        /// <summary>
        /// Check whether News Title already exists or not
        /// </summary>
        private bool CheckDuplicateNewsLetterTitle()
        {
            bool chkName = true;

            ds = new NewsLetterAddEditController().FetchAllNewsletter();

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    if (ds.Tables[0].Rows[i]["NewsLetterTitle"].ToString().ToLower() == txtNewLetterTitle.Text.Trim().ToLower())
                    {
                        chkName = false;
                    }
                }
            }
            return chkName;
        }


        /// <summary>
        /// Sends email to the user who have signed up for newsletter
        /// </summary>
        /// 
        private void SendEmail(int NewsLetterID, int TemplateID)
        {
            string strBody;

            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetDataForNewsLetterSignUp(Convert.ToInt32(NewsLetterID));
            ds = sp.GetDataSet();

            SubSonic.StoredProcedure spTemplate = Etech.CMS.Content.SPs.GetDataForNewsLetterTemplates(Convert.ToInt32(TemplateID));
            DataSet dsTemplate = spTemplate.GetDataSet();

            if (dsTemplate != null && dsTemplate.Tables[0].Rows.Count > 0)
            {
                strBody = dsTemplate.Tables[0].Rows[0]["TemplateDescription"].ToString();

            }
            else
            {
                strBody = string.Empty;
            }

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    if (ds.Tables[0].Rows[i]["IsNewsLetterSignUp"].ToString() == "True")
                    {
                        if (strBody.Contains("[Customer Name]"))
                        {
                            strBody = strBody.Replace("[Customer Name]", ds.Tables[0].Rows[i]["UserName"].ToString());
                        }
                        if (strBody.Contains("[Todays Date]"))
                        {
                            strBody = strBody.Replace("[Todays Date]", Convert.ToDateTime(DateTime.Today.Date).ToShortDateString());
                        }
                        if (strBody.Contains("[Email]"))
                        {
                            strBody = strBody.Replace("[Email]", ds.Tables[0].Rows[i]["Email"].ToString());
                        }


                        MailSettings mail = MessagingCache.GetMailSettings(); //TODO: Cache?
                        MailMessage mailMessage = new MailMessage();
                        //mailMessage.From = new MailAddress("support@isolutionstechnology.com.au", "iSolutions Technology");
                        mailMessage.From = new MailAddress("Manan.Gajjar@etechinc.com", "iSolutions Technology"); ;
                        mailMessage.To.Add(new MailAddress(ds.Tables[0].Rows[i]["Email"].ToString()));
                        mailMessage.Subject = txtNewsLetterSubject.Text.Trim();
                        mailMessage.Body = strBody;
                        mailMessage.Priority = MailPriority.High;
                        mailMessage.IsBodyHtml = true;

                        Email email = new Email();
                        try
                        {
                            email.Send(mailMessage);
                            InsertEmailLogs(NewsLetterID, Convert.ToInt32(ds.Tables[0].Rows[i]["UserID"]), ds.Tables[0].Rows[i]["Email"].ToString(), mailMessage.From.ToString(), txtNewsLetterSubject.Text.Trim(), string.Empty, "Success", DateTime.Now);
                        }
                        catch (Exception ex)
                        {
                            Logger.Error(typeof(blogedit).Name + ".btnSave_Click", ex);
                            InsertEmailLogs(NewsLetterID, Convert.ToInt32(ds.Tables[0].Rows[i]["UserID"]), ds.Tables[0].Rows[i]["Email"].ToString(), mailMessage.From.ToString(), txtNewsLetterSubject.Text.Trim(), ex.Message.ToString(), "Failure", Convert.ToDateTime(DateTime.Today.Date));
                            Master.MessageCenter.DisplayCriticalMessage(ex.Message);
                        }
                    }
                }
            }

        }


        private void InsertEmailLogs(int NewsLetterID, int UserID, string ToAddress, string FromAddress, string Subject, string Reason, string Result, DateTime LogDate)
        {
            NewsLetterEmailLog nLEmail = new NewsLetterEmailLog();
            nLEmail.NewsLetterID = NewsLetterID;
            nLEmail.UserID = UserID;
            nLEmail.ToAddress = ToAddress;
            nLEmail.FromAddress = FromAddress;
            nLEmail.Subject = Subject;
            nLEmail.Reason = Reason;
            nLEmail.Result = Result;
            nLEmail.LogDate = LogDate;
            nLEmail.Save();

        }

        #endregion Methods

        #region Grid Events


        /// <summary>
        /// Handles the Click event of the btnSave control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="T:System.EventArgs"/> instance containing the event data.</param>
        protected void dgNewsLetter_OnItemCommand(object sender, DataGridCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Edit")
                {

                    lblNewLetterId.Text = e.CommandArgument.ToString();
                    NewsLetter newsLetterEdit = new NewsLetter(Int32.Parse(e.CommandArgument.ToString()));
                    strGUID = newsLetterEdit.NewsLetterGUID.ToString();
                    ViewState["Guid"] = strGUID;
                    txtNewLetterTitle.Text = newsLetterEdit.NewsLetterTitle;
                    txtNewsLetterSubject.Text = newsLetterEdit.NewsLetterSubject;
                    ddlTemplates.SelectedValue = newsLetterEdit.TemplateID.ToString();
                    //Gets the groupID to highlight in listbox in edit mode
                    SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetNewsLetterDetailsByNewsLetterID(Int32.Parse(e.CommandArgument.ToString()));
                    DataSet ds = sp.GetDataSet();
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                        {
                            foreach (ListItem sourceItem in lstNewsletterGroupName.Items)
                            {
                                if (sourceItem.Value == ds.Tables[0].Rows[i]["GroupID"].ToString())
                                {
                                    sourceItem.Selected = true;
                                }
                            }
                        }
                    }

                    pnlEditNewLetter.Visible = true;
                    pnlCurrentNewsLetter.Visible = false;
                    btnCancel.Visible = true;

                }
                else if (e.CommandName == "Delete")
                {
                    // deletes the news letter
                    NewsLetter newsLetterEdit = new NewsLetter(Int32.Parse(e.CommandArgument.ToString()));
                    NewsLetter.Delete(Int32.Parse(e.CommandArgument.ToString()));
                    // deletes the news letter details
                    SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.DeleteDetailsByNewsLetterID(Int32.Parse(e.CommandArgument.ToString()));
                    sp.ExecuteScalar();

                    BindGrid();
                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(blogcategoryedit).Name + ".dgNewsLetter_OnItemCommand", ex);
                Master.MessageCenter.DisplayCriticalMessage(ex.Message);
            }
        }

        protected void lnkAddNewsLetter_Click(object sender, EventArgs e)
        {
            pnlEditNewLetter.Visible = true;
            pnlCurrentNewsLetter.Visible = false;

            lblNewLetterId.Text = string.Empty;
            lblDuplicateMessage.Visible = false;
            lblDuplicateMessage.Text = string.Empty;
        }

        protected void dgNewsLetter_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dgNewsLetter.CurrentPageIndex = e.NewPageIndex;
            BindGrid();
        }

        #endregion Grid Events
    }
}