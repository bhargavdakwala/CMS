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
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using Etech.CMS.Content;
using Etech.CMS.Store;
using Etech.CMS.Store.Caching;
using Etech.CMS.Store.Services.MessageService;
using System.IO;


namespace Etech.CMS.Web.controls.content
{
    public partial class GetFreeQuote : ProviderControl
    {

        string strFullName, strCompany, strEmail, strPhone, strAddress;
        string strSanitary, strWaterServices, strFireServices, strGasServices, strStormwater, strIndustrial, strRecyclingDesign,strScopOther;
        string strNoOfStrories, strBuildingType, strProjectBudget;
        string strSchematic, strTender, strConstruction, strContract, strLimitOther;
        string strDescribe, strTimeFram;

   
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        private void CheckControlValue()
        {
            if (txtFullName.Text != "")
            {
                strFullName = txtFullName.Text;
            }
            if (txtCompany.Text != "")
            {
                strCompany = txtCompany.Text;
            }
            if (txtEmail.Text != "")
            {
                strEmail = txtEmail.Text;
            }
            if (txtPhone.Text != "")
            {
                strPhone = txtPhone.Text;
            }
            if (txtAddress.Text != "")
            {
                strAddress = txtAddress.Text;
            }

            if (chkSanitary.Checked == true)
            {
                strSanitary = chkSanitary.Text; 
            }
            if (chkWaterService.Checked == true)
            {
                strWaterServices = chkWaterService.Text;
            }
            if (chkFireService.Checked == true)
            {
                strFireServices = chkFireService.Text;
            }
            if (chkGasServices.Checked == true)
            {
                strGasServices = chkGasServices.Text;
            }
            if (chkStormwater.Checked == true)
            {
                strStormwater  = chkStormwater.Text;
            }
            if (chkIndustrialWaste.Checked == true)
            {
                strIndustrial = chkIndustrialWaste.Text;
            }

            if (chkRecyclingDesign.Checked == true)
            {
                strRecyclingDesign  = chkRecyclingDesign.Text;
            }

            if (txtOther.Text  != "")
            {
                strScopOther = txtOther.Text;
            }

            if (ddlNumberOfStories.SelectedItem.Value != "Select")
            {
                strNoOfStrories = ddlNumberOfStories.SelectedItem.Value;
            }
            else
            {
                strNoOfStrories = "";
            }

            if (ddlBuildingType.SelectedItem.Value != "Select")
            {
                strBuildingType = ddlBuildingType.SelectedItem.Value;
            }
            else
            {
                strBuildingType = string.Empty;
            }


            if (txtProductBudget.Text != "")
            {
                strProjectBudget = txtProductBudget.Text;
            }


            if (chkSchematic.Checked == true)
            {
                strSchematic  = chkSchematic.Text;
            }

            if (chkTenderDesign.Checked == true)
            {
                strTender = chkTenderDesign.Text;
            }

            if (chkConstruction.Checked == true)
            {
                strConstruction = chkConstruction.Text;
            }

            if (chkContract.Checked == true)
            {
                strContract = chkContract.Text;
            }

            if (txtOtherLimit.Text != "")
            {
                strLimitOther = txtOtherLimit.Text;
            }

            if (txtDescribeProject.Text != "")
            {
                strDescribe = txtDescribeProject.Text;
            }

            if (ddlTimeFrame.SelectedItem.Value != "Select")
            {
                strTimeFram = ddlTimeFrame.SelectedItem.Value;
            }
            else
            {
                strTimeFram = string.Empty;
            }

          
        }


        protected void btnQute_Click(object sender, EventArgs e)
        {

           
                CheckControlValue();

                MailMessage mail = new MailMessage();

                string Body = "<font style='color:blue; font-family: Verdana; font-size: 12;'>Hello, <br><br></font>" +

                       "<table>" +
                       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Full Name:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strFullName + "</font></td></tr>" +
                       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Company:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strCompany + "</font></td></tr>" +
                       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Email:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strEmail + "</font></td></tr>" +
                       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Phone:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strPhone + "</font></td></tr>" +
                       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Address:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strAddress + "</font></td></tr>" +
                       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Sanitary:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strSanitary + "</font></td></tr>" +
                       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Water Services:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strWaterServices + "</font></td></tr>" +
                       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Fire Services:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strFireServices + "</font></td></tr>" +
                       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Gas Services:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strGasServices + "</font></td></tr>" +
                       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Stormwater:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strStormwater + "</font></td></tr>" +
                       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Industrial:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strIndustrial + "</font></td></tr>" +
                       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Recycling Design:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strRecyclingDesign + "</font></td></tr>" +
                       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Scop Other:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strScopOther + "</font></td></tr>" +
                       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>No Of Strories:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strNoOfStrories + "</font></td></tr>" +
                       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Building Type:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strBuildingType + "</font></td></tr>" +
                       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Project Budget:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strProjectBudget + "</font></td></tr>" +
                       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Schematic:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strSchematic + "</font></td></tr>" +
                       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Tender:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strTender + ".</font></td></tr>" +
                       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Construction:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strConstruction + "</font></td></tr>" +
                       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Contract:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strContract + "</font></td></tr>" +
                       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Limit Other:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strLimitOther + "</font></td></tr>" +
                       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Describe:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strDescribe + "</font></td></tr>" +
                       "<tr><td colspan=4><font style=color:blue; face=Verdana size=2><b>Time Fram:</b></font></td><td><font style=color:blue; face=Verdana size=2>" + strTimeFram + "</font></td></tr>" +

                       "</table><BR>";


                MailMessage message = new MailMessage(txtEmail.Text.Trim(), "contact@pjwrightandassociates.com.au", "Quotation", Body);
                //MailMessage message = new MailMessage("Manan.Gajjar@etechinc.com", "Manan.Gajjar@etechinc.com", "Quotation", Body);

                if (fuProject1.HasFile)
                {

                    string fileName = Path.GetFileName(fuProject1.PostedFile.FileName);
                    Attachment myAttachment =
                                   new Attachment(fuProject1.FileContent, fileName);

                    message.Attachments.Add(myAttachment);


                }

                if (fuProject2.HasFile)
                {

                    string fileNames = Path.GetFileName(fuProject2.PostedFile.FileName);
                    Attachment myAttachments =
                                   new Attachment(fuProject2.FileContent, fileNames);

                    message.Attachments.Add(myAttachments);
                }
                if (fuProject3.HasFile)
                {
                    string fileNames1 = Path.GetFileName(fuProject3.PostedFile.FileName);
                    Attachment myAttachments1 =
                                   new Attachment(fuProject3.FileContent, fileNames1);

                    message.Attachments.Add(myAttachments1);

                }

                //MailMessage message = new MailMessage("test_mail@isolutionstechnology.com.au", "test_mail@isolutionstechnology.com.au", "Contact Inquiry", Body);
                message.Priority = MailPriority.High;
                message.IsBodyHtml = true;
                SmtpClient client = new SmtpClient();
                client.Host = "27.54.85.33";
                //client.Host = "NACET1MAIL03.effectiveteleservices.local";


                try
                {
                    client.Send(message);
                    ScriptManager.RegisterStartupScript(btnQute, this.GetType(), "Message", "alert('Request submitted successfully');", true);
                    Reset();

                }
                catch (Exception ex)
                {

                }
           
        }


        private void Reset()
        {
            txtFullName.Text = "";
            txtCompany.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtAddress.Text = "";
            chkSanitary.Checked = false;
            chkWaterService.Checked = false;
            chkFireService.Checked = false;
            chkGasServices.Checked = false;
            chkStormwater.Checked = false;
            chkIndustrialWaste.Checked = false;
            chkRecyclingDesign.Checked = false;
            txtOther.Text = "";
            txtProductBudget.Text = "";
            chkSchematic.Checked = false;
            chkTenderDesign.Checked = false;
            chkConstruction.Checked = false;
            chkContract.Checked = false;
            txtOtherLimit.Text = "";
            txtDescribeProject.Text = "";
            ddlBuildingType.SelectedIndex = 0;
            ddlNumberOfStories.SelectedIndex = 0;
            ddlTimeFrame.SelectedIndex = 0;
            
            
 
        }

        /*protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            // Get file name
            string UploadFileName = fuProject1.PostedFile.FileName;

            if (UploadFileName == "")
            {
                // There is no file selected 
                args.IsValid = false;
            }
            else
            {
                string Extension = UploadFileName.Substring(UploadFileName.LastIndexOf('.') + 1).ToLower();

                if (Extension == "pdf" || Extension == "pdf")
                {
                    args.IsValid = true; // Valid file type
                }
                else
                {
                    args.IsValid = false; // Not valid file type
                }
            }
        }*/


       
    }
}