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
using System.IO;
using Etech.CMS.Core.IO;



namespace Etech.CMS.Web.controls.content
{
    public partial class Repair : ProviderControl
    {
        public string strPhoto = string.Empty;
        public string strRepair = string.Empty;
        public string strPath = string.Empty;
        private const string USERPHOTO_PATH = @"~/repository/Content/Image";
        private string[] acceptedFileTypes = new string[] { ".jpg", ".jpeg", ".jpe", ".gif", ".bmp", ".png" };
        private string path = string.Empty;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fUpload.Visible = false;
                fUpload.Width = 20;
                lblChoosefile.Visible = false;

                if (rbtnPhoto.SelectedValue == "1")
                {
                    strPhoto = "Yes";
                    fUpload.Visible = true;
                }
                else
                {
                    strPhoto = "No";
                    fUpload.Visible = false;
                }
            }
        }
        public void rbtnPhoto_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbtnPhoto.SelectedValue == "1")
            {
                strPhoto = "Yes";
                lblChoosefile.Visible = true;
                fUpload.Visible = true;
            }
            else
            {
                strPhoto = "No";
                lblChoosefile.Visible = false;
                fUpload.Visible = false;
            }
        }

        private bool IsValidFileType(string extension)
        {
            Predicate<string> match = delegate(string extensionToMatch) { return string.Equals(extensionToMatch, extension, StringComparison.OrdinalIgnoreCase); };
            return Array.Exists(acceptedFileTypes, match);
        }

        protected void btnQuet_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
               
                if (rbtnPhoto.SelectedValue == "1")
                {

                    string filepath = fUpload.PostedFile.FileName;
                    string finalpath = Server.MapPath("~/repository/Content/Image") + " \\" + filepath;
                    fUpload.PostedFile.SaveAs(finalpath);
                    strPhoto = "~/repository/Content/Image/" + filepath;

                    //HttpPostedFile file = fUpload.PostedFile;
                    //fUpload.Dispose();

                    //if (!IsValidFileType(Path.GetExtension(file.FileName)))
                    //{
                    //    throw new ArgumentOutOfRangeException("file", "File is not of valid type.");
                    //}
                    //if (file.ContentLength > 0)
                    //{
                    //    FileWriter fileWriter = new FileWriter();
                    //    string finalPath = HttpContext.Current.Server.MapPath(path) + fUpload.FileName;
                    //    fileWriter.Write(finalPath, file.InputStream);

                    //    strPhoto = finalPath;
                    //}
                }
                else
                {
                    strPhoto = "Not Availabe";
                }

                if (rbtnListRepairTypes.SelectedValue == "1")
                {
                    strRepair = "Bumper Bar";
                }
                else if (rbtnListRepairTypes.SelectedValue == "2")
                {
                    strRepair = "Alloy Wheel Repair";
                }
                else if (rbtnListRepairTypes.SelectedValue == "3")
                {
                    strRepair = "Minor Dent Repair";
                }
                else if (rbtnListRepairTypes.SelectedValue == "4")
                {
                    strRepair = "Surface Mark Repair";
                }
                else if (rbtnListRepairTypes.SelectedValue == "5")
                {
                    strRepair = "Stone Chip Repair";
                }
                else if (rbtnListRepairTypes.SelectedValue == "6")
                {
                    strRepair = "Side Mirror Repair";
                }
                else if (rbtnListRepairTypes.SelectedValue == "7")
                {
                    strRepair = "Vinyl Repair";
                }
                else if (rbtnListRepairTypes.SelectedValue == "8")
                {
                    strRepair = "Leather Repair";
                }

                MailMessage mail = new MailMessage();
                mail.To = "aparna.jani@etechinc.com";
                mail.From = "admin@tcclassics.com.au";

                mail.Subject = "Booking for Repair";
                mail.Priority = MailPriority.High;
                mail.BodyFormat = MailFormat.Html;
                if (rbtnPhoto.SelectedValue == "1")
                {

                    mail.Body = "<font style='color:blue; font-family: Verdana; font-size: 12;'>Hello, <br><br></font>" +
                           "<font style='color:blue; font-family: Verdana; font-size: 12;'>The following entry has been submitted by </font><font style=color:blue; face=Verdana size=2><b>" + txtFullName.Text.Trim() + ".</b></font><br><br>" +
                           "<table>" +
                           "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Name:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtFullName.Text.Trim() + ".</font></td></tr>" +
                           "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Phone:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtRPhone.Text.Trim() + ".</font></td></tr>" +
                           "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Email:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtREmailAddress.Text.Trim() + ".</font></td></tr>" +
                           "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Address:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtAddress1.Text.Trim() + ".</font></td></tr>" +
                           "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Surburb:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtSurburb.Text.Trim() + ".</font></td></tr>" +
                           "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>State:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtState.Text.Trim() + ".</font></td></tr>" +

                           "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Car Model:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtCarModel.Text.Trim() + ".</font></td></tr>" +
                            "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Color:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtColor.Text.Trim() + ".</font></td></tr>" +
                           "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Types of Repair:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strRepair + ".</font></td></tr>" +
                           "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Send us a Photo:</b></font></td><td><img src=\"" + strPhoto + "\">"  + ".</img></td></tr>" +
                          "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Comments:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtComments.Text.Trim() + ".</font></td></tr>" +
                           "</table><BR>";
                }
                else
                {
                    mail.Body = "<font style='color:blue; font-family: Verdana; font-size: 12;'>Hello, <br><br></font>" +
                          "<font style='color:blue; font-family: Verdana; font-size: 12;'>The following entry has been submitted by </font><font style=color:blue; face=Verdana size=2><b>" + txtFullName.Text.Trim() + ".</b></font><br><br>" +
                          "<table>" +
                          "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Name:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtFullName.Text.Trim() + ".</font></td></tr>" +
                          "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Phone:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtRPhone.Text.Trim() + ".</font></td></tr>" +
                          "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Email:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtREmailAddress.Text.Trim() + ".</font></td></tr>" +
                          "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Address:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtAddress1.Text.Trim() + ".</font></td></tr>" +
                          "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Surburb:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtSurburb.Text.Trim() + ".</font></td></tr>" +
                          "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>State:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtState.Text.Trim() + ".</font></td></tr>" +

                          "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Car Model:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtCarModel.Text.Trim() + ".</font></td></tr>" +
                           "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Color:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtColor.Text.Trim() + ".</font></td></tr>" +
                          "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Types of Repair:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strRepair + ".</font></td></tr>" +
                          "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Send us a Photo:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strPhoto + ".</font></td></tr>" +
                         "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Comments:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + txtComments.Text.Trim() + ".</font></td></tr>" +
                          "</table><BR>";
                }
                // SmtpMail.SmtpServer = "27.54.85.33";
                SmtpMail.SmtpServer = "NACET1MAIL03.effectiveteleservices.local";
                try
                {
                    SmtpMail.Send(mail);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Request for Repair submitted successfully');", true);
                    Reset();
                }
                catch (Exception ex)
                {

                }
            }
        }
        private void Reset()
        {
            txtFullName.Text = string.Empty;
            txtRPhone.Text = string.Empty;
            txtREmailAddress.Text = string.Empty;
            txtAddress1.Text = string.Empty;
            txtSurburb.Text = string.Empty;
            //txtState.Text = string.Empty;
            txtCarModel.Text = string.Empty;
            txtColor.Text = string.Empty;
            rbtnListRepairTypes.SelectedValue = "1";
            rbtnPhoto.SelectedValue = "2";
            txtComments.Text = string.Empty;
        }

    }
}