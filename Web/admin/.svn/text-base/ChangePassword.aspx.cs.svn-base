using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Etech.CMS.Store.Services.MessageService;
using System.Net.Mail;
using Etech.CMS.Content.Caching;
using Etech.CMS.Store;
using Etech.CMS.Store.Caching;
using Etech.CMS.Core;
using Etech.CMS.Localization;

namespace Etech.CMS.Web.admin
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label lblHeading = (Label)Master.FindControl("lblPageHeading");
            lblHeading.Text = "Change Password";
            if (!Page.IsPostBack)
            {
                SetChangePasswordProperties();
            }

            MailSettings mailSettings = MessagingCache.GetMailSettings();
            MailDefinition mailDefinition = ChangePassword1.MailDefinition;
            //mailDefinition.BodyFileName = "~/admin/PasswordRecovery.txt";
            mailDefinition.BodyFileName = "~/admin/MailTemplate.htm";
            mailDefinition.Subject = "Change Password";
            mailDefinition.From = mailSettings.From;
            mailDefinition.IsBodyHtml = true;
        }
        protected void ChangePassword1_SendingMail(object sender, MailMessageEventArgs e)
        {
            try
            {

                MessageService messageService = new MessageService();
                messageService.Send(e.Message);
                e.Cancel = true;
            }
            catch (Exception ex)
            {
                Logger.Error("prPasswordRecover_SendingMail " + e.Message.To[0].Address, ex);
            }
        }

        private void SetChangePasswordProperties()
        {
            this.Title = LocalizationUtility.GetText("titleChangePassword");
        }

        //protected void NewPassword_TextChanged(object sender, EventArgs e)
        //{
        //    TextBox txtNew = (TextBox)ChangePassword1.FindControl("NewPassword");
        //    string CurrentPassword = ChangePassword1.CurrentPassword;
        //    string strNewPassword = txtNew.Text;

        //    if (CurrentPassword == strNewPassword)
        //    {
        //        ScriptManager.RegisterStartupScript(Page, this.GetType(), "Message", "alert('Please choose a different password');", true);
        //    }
        //}

    }
}
