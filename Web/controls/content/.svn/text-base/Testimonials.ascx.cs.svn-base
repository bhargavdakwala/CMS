
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Web.Services;
using System.Web.Mail;
using System.Text;
using System.Text.RegularExpressions;
using Etech.CMS.Content;
using Etech.CMS.Store;
using Etech.CMS.Store.Caching;
using Etech.CMS.Store.Services.MessageService;


namespace Etech.CMS.Web.controls.content
{
    public partial class Testimonials : ProviderControl
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Button
        protected void imgSubmit_Click(object sender, ImageClickEventArgs e)
        {
            MailMessage mail = new MailMessage();

            mail.To = "Manan.Gajjar@etechinc.com";
            mail.From = "Manan.Gajjar@etechinc.com";


            //mail.To = "contact@paulbradly.com.au";
            //mail.From = "contact@paulbradly.com.au";

            mail.Subject = "Testimonial";
            mail.Priority = MailPriority.High;
            mail.BodyFormat = MailFormat.Html;

            mail.Body = "<table>" +
                    "<tr><td colspan=4></td><td><font style=color:blue; face=Verdana size=2>" +DateTime.Now.ToShortDateString() + "</font></td></tr>" +
                   "<tr><td colspan=4></td><td><font style=color:blue; face=Verdana size=2>" + txtTestimonial.Text.Trim() + "</font></td></tr>" +
                   "</table><BR>";
            
            //SmtpMail.SmtpServer = "27.54.85.33";
            SmtpMail.SmtpServer = "NACET1MAIL03.effectiveteleservices.local";
            
            try
            {
                SmtpMail.Send(mail);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Testimonial sent successfully');", true);
                Reset();
            }
            catch (Exception ex)
            {

            }
        }

        #endregion Button

        #region Method
        private void Reset()
        {
            txtTestimonial.Text = string.Empty;
        }
        #endregion Method

    }


}