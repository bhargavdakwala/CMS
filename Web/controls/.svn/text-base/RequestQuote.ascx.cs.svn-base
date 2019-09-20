using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Mail;
using System.Text;
using System.Text.RegularExpressions;
using Etech.CMS.Content;
using Etech.CMS.Store;
using Etech.CMS.Store.Caching;
using Etech.CMS.Store.Services.MessageService;

namespace Etech.CMS.Web.controls
{
    public partial class RequestQuote : ProviderControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            MailMessage mail = new MailMessage();
            mail.To = "CONTACT@OTSD.COM";
            mail.From = "CONTACT@OTSD.COM";

            mail.Subject = "Request Inquiry";
            mail.Priority = MailPriority.High;
            mail.BodyFormat = MailFormat.Html;

            mail.Body = "<font style='color:blue; font-family: Verdana; font-size: 12;'>Hello, <br><br></font>" +
                   "<font style='color:blue; font-family: Verdana; font-size: 12;'>The following entry has been submitted by </font><font style=color:blue; face=Verdana size=2><b>" + txtFullName.Text.Trim() + ".</b></font><br><br>" +
                   "<table>" +
                   "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Full Name:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtFullName.Text.Trim() + ".</font></td></tr>" +
                   "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Address1:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtAddress1.Text.Trim() + ".</font></td></tr>" +
                   "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Address2:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtAddress2.Text.Trim() + ".</font></td></tr>" +
                   "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Surburb:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtSurburb.Text.Trim() + ".</font></td></tr>" +
                   "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Phone:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtPreferedContact.Text.Trim() + ".</font></td></tr>" +
                   "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Email:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtEmail.Text.Trim() + ".</font></td></tr>" +
                   "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Make:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtMake.Text.Trim() + ".</font></td></tr>" +
                   "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Model:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtModel.Text.Trim() + ".</font></td></tr>" +
                   "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Year:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtYear.Text.Trim() + ".</font></td></tr>" +
                   "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Color:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtColor.Text.Trim() + ".</font></td></tr>" +
                    "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Date &amp; Time:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtDate.Text.Trim()+ " " + txtTime.Text.Trim() + ".</font></td></tr>" +
                   "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Comments:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtComments.Text.Trim() + ".</font></td></tr>" +
                   "</table><BR>";
            SmtpMail.SmtpServer = "27.54.85.33";
           // SmtpMail.SmtpServer = "NACET1MAIL03.effectiveteleservices.local";
            try
            {
                SmtpMail.Send(mail);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Request submitted successfully');", true);
                Reset();
            }
            catch (Exception ex)
            {

            }
        }

        private void Reset()
        {
            txtFullName.Text = string.Empty;
            txtAddress1.Text = string.Empty;
            txtAddress2.Text = string.Empty;
            txtSurburb.Text = string.Empty;
            txtPreferedContact.Text = string.Empty;
            txtEmail.Text=string.Empty;
            txtMake.Text = string.Empty;
            txtModel.Text = string.Empty;
            txtYear.Text = string.Empty;
            txtColor.Text = string.Empty;
            txtDate.Text = string.Empty;
            txtTime.Text = string.Empty;
            txtComments.Text = string.Empty;
        }
    }
}