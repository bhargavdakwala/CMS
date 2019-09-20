using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using Etech.CMS.Content;
using Etech.CMS.Store;
using Etech.CMS.Store.Caching;
using Etech.CMS.Store.Services.MessageService;
using Etech.CMS.Content.Caching;
using System.Data;
using Etech.CMS.Web.iSolutionsService;

namespace Etech.CMS.Web.controls.content
{
    public partial class HomeContent : ProviderControl
    {
        #region Properties from Conact US

        private string _EmailTo, _EmailSubject, _EmailBody, _EmailReplyFrom, _EmailReplySubject, _EmailReplyBody, _FormHeader, _FormText, _ThankYouHeaderText, _ThankYouMessageText;
        private bool _EnableSSL;

        public string EmailTo
        {
            get
            {
                return _EmailTo;
            }
            set
            {
                _EmailTo = value;
            }
        }

        public string EmailSubject
        {
            get
            {
                return _EmailSubject;
            }
            set
            {
                _EmailSubject = value;
            }
        }

        public string EmailBody
        {
            get
            {
                return _EmailBody;
            }
            set
            {
                _EmailBody = value;
            }
        }

        public string EmailReplyFrom
        {
            get
            {
                return _EmailReplyFrom;
            }
            set
            {
                _EmailReplyFrom = value;
            }
        }

        public string EmailReplySubject
        {
            get
            {
                return _EmailReplySubject;
            }
            set
            {
                _EmailReplySubject = value;
            }
        }

        public string EmailReplyBody
        {
            get
            {
                return _EmailReplyBody;
            }
            set
            {
                _EmailReplyBody = value;
            }
        }

        public string FormHeader
        {
            get
            {
                return _FormHeader;
            }
            set
            {
                _FormHeader = value;
            }
        }

        public string FormText
        {
            get
            {
                return _FormText;
            }
            set
            {
                _FormText = value;
            }
        }

        public string ThankYouHeaderText
        {
            get
            {
                return _ThankYouHeaderText;
            }
            set
            {
                _ThankYouHeaderText = value;
            }
        }

        public string ThankYouMessageText
        {
            get
            {
                return _ThankYouMessageText;
            }
            set
            {
                _ThankYouMessageText = value;
            }
        }

        public bool EnableSSL
        {
            get
            {
                return _EnableSSL;
            }
            set
            {
                _EnableSSL = value;
            }
        }

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            //imgCheck.Visible = false;
        }
        //public void btnSubmit_Click(object sender, EventArgs e)
        //{
        //    //MailSettings mail = MessagingCache.GetMailSettings(); //TODO: Cache?
        //    //MailMessage mailMessage = new MailMessage();
        //    //mailMessage.From = new MailAddress("support@isolutionstechnology.com.au", "iSolutions Technology"); ;
        //    //mailMessage.To.Add(new MailAddress(mail.Contact));
        //    //mailMessage.Subject = "Business Inquiry";

        //    //if (chkNewsletter.Checked == true)
        //    //{
        //    //    lblNewsletter.Text = "Sign up for Newsletter";
        //    //}
        //    //else
        //    //{
        //    //    lblNewsletter.Text = "No Sign up for Newsletter";
        //    //}

        //    //mailMessage.Body = "<font style='color:blue; font-family: Verdana; font-size: 12;'>Hello, <br><br></font>" +
        //    //       "<font style='color:blue; font-family: Verdana; font-size: 12;'>The following entry has been submitted by </font><font style=color:blue; face=Verdana size=2><b>" + ddlQuote.SelectedItem.Text + ".</b></font><br><br>" +
        //    //       "<table>" +
        //    //       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Your Name:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + name.Text + ".</font></td></tr>" +
        //    //       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Email:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + emailAddress.Text + ".</font></td></tr>" +
        //    //       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Phone:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + addressLine1.Text + ".</font></td></tr>" +
        //    //       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Business Name:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + addressLine2.Text + ".</font></td></tr>" +
        //    //       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>NewsLetter:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + lblNewsletter.Text + ".</font></td></tr>" +
        //    //       "</table><BR>";

        //    //mailMessage.IsBodyHtml = true;
        //    //Email email = new Email();
        //    //try
        //    //{
        //    //    email.Send(mailMessage);
        //    //    ScriptManager.RegisterStartupScript(btnSubmit, this.GetType(), "Message", "alert('Contact submitted successfully');", true);
                
        //    //    name.Text = "";
        //    //    emailAddress.Text = "";
        //    //    addressLine1.Text = "";
        //    //    addressLine2.Text = "";
        //    //    lblNewsletter.Text = "";
        //    //    chkNewsletter.Checked = false;
        //    //}
        //    //catch
        //    //{ 
        //    //}
        //}
        //#region Validation
        //protected void RequiredName_ServerValidate(object source, ServerValidateEventArgs args)
        //{
        //    if (name.Text == String.Empty)
        //    {
        //        name.CssClass = "error";
        //        args.IsValid = false;
        //    }
        //    else
        //    {
        //        name.CssClass = "";
        //        args.IsValid = true;
        //    }
        //}


        //protected void RequiredEmailAddress_ServerValidate(object source, ServerValidateEventArgs args)
        //{
        //    if (emailAddress.Text == String.Empty)
        //    {
        //        emailAddress.CssClass = "error";
        //        args.IsValid = false;
        //    }
        //    else
        //    {
        //        emailAddress.CssClass = "";
        //        args.IsValid = true;
        //    }
        //}

        //protected void RequiredMessage_ServerValidate(object source, ServerValidateEventArgs args)
        //{
        //    if (message.Text == String.Empty)
        //    {
        //        message.CssClass = "error";
        //        args.IsValid = false;
        //    }
        //    else
        //    {
        //        message.CssClass = "";
        //        args.IsValid = true;
        //    }
        //}

        //protected void CheckEmailAddress_ServerValidate(object source, ServerValidateEventArgs args)
        //{

        //    //Email Regex String
        //    Regex reg = new Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");

        //    // Check if there is NO match in Regex
        //    if (!reg.IsMatch(emailAddress.Text))
        //    {
        //        //Does not match RegEx - Invalid email address

        //        emailAddress.CssClass = "error";
        //        args.IsValid = false;
        //    }
        //    else
        //    {
        //        emailAddress.CssClass = "";
        //        args.IsValid = true;
        //    }
        //}

        //#endregion


        //protected void lnkCheck_Click(object sender, EventArgs e)
        //{
        //    //PageParameterCache.GetPageParameter(18, "DomainName", "test");

        //    //API10PortTypeClient client = new API10PortTypeClient();



        //    //DomainCheckResponse response = null;

        //    //string[] domainsToCheck = new string[2];

        //    //domainsToCheck[0] = "abottech.com.au";
        //    //domainsToCheck[1] = "abottech.co.uk";

        //    //DomainCheckRequest request = new DomainCheckRequest();

        //    //request.DomainNames = domainsToCheck;

        //    //response = client.DomainCheck(request);

        //    PageParameterCache.GetPageParameter(18, ddlASAP.SelectedItem.Text.Trim(), txtDomainName.Text.Trim());
        //    Session["ASAP"] = ddlASAP.SelectedItem.Text.Trim();
        //    Session["DomainName"] = txtDomainName.Text.Trim();
        //    Response.Redirect("~/Page-Domain-Names_18.aspx");
        //   // Response.Redirect("~/Page-Optimisation_12.aspx");

        //}
    }
}