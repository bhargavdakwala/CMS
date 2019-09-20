using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Services;
//using System.Net.Mail;
using System.Web.Mail;
using System.Text;
using System.Text.RegularExpressions;
using Etech.CMS.Content;
using Etech.CMS.Store;
using Etech.CMS.Store.Caching;
using Etech.CMS.Store.Services.MessageService;


namespace Etech.CMS.Web.controls.content
{
    public partial class Enquiry : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void btnSubmit_Click(object sender, EventArgs e)
        {

            MailMessage mail = new MailMessage();
            mail.To = "aparna.jani@etechinc.com";
            mail.From = "admin@tcclassics.com.au";

            mail.Subject = "Enquiry";
            mail.Priority = MailPriority.High;
            mail.BodyFormat = MailFormat.Html;

            mail.Body = "<font style='color:blue; font-family: Verdana; font-size: 12;'>Hello, <br><br></font>" +
                   "<font style='color:blue; font-family: Verdana; font-size: 12;'>The following entry has been submitted by </font><font style=color:blue; face=Verdana size=2><b>" + txtname.Text.Trim() + ".</b></font><br><br>" +
                   "<table>" +
                   "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Your Name:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtname.Text.Trim() + ".</font></td></tr>" +
                   "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Email:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtemailAddress.Text.Trim() + ".</font></td></tr>" +
                   "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Phone:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtPhonenumber.Text.Trim() + ".</font></td></tr>" +
                   "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Message Subject:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtMessageSubject.Text.Trim() + ".</font></td></tr>" +
                    "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Message:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtMessage.Text.Trim() + ".</font></td></tr>" +
                   "</table><BR>";
            SmtpMail.SmtpServer = "NACET1MAIL03.effectiveteleservices.local";
            try
            {
                SmtpMail.Send(mail);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Enquiry submitted successfully');", true);
                Reset();
            }
            catch (Exception ex)
            {

            }

        }

        private void Reset()
        {
            txtname.Text = string.Empty;
            txtPhonenumber.Text = string.Empty;
            txtemailAddress.Text = string.Empty;
            txtMessage.Text = string.Empty;
            txtMessageSubject.Text = string.Empty;
            
        }

    }
}