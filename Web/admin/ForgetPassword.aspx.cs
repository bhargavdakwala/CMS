
using System;
using System.Web.UI.WebControls;
using Etech.CMS.Core;
using Etech.CMS.Localization;
using Etech.CMS.Store;
using Etech.CMS.Store.Caching;
using Etech.CMS.Store.Services.MessageService;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Net.Mail;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
namespace Etech.CMS.Web.admin
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //Label lblHeading = (Label)Master.FindControl("lblPageHeading");
            //lblHeading.Text = "Forgot Your Password?";

            MailSettings mailSettings = MessagingCache.GetMailSettings();
            MailDefinition mailDefinition = prPasswordRecover.MailDefinition;
            mailDefinition.BodyFileName = "~/admin/MailTemplate.htm";
            mailDefinition.Subject = "Password";
            mailDefinition.From = mailSettings.From;
            mailDefinition.IsBodyHtml = true;




        }

        protected void prPasswordRecover_SendingMail(object sender, MailMessageEventArgs e)
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


    }
}
