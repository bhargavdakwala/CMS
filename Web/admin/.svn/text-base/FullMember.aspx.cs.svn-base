using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SubSonic;
using SubSonic.Utilities;
using System.Data;
using Etech.CMS.Content;
using Etech.CMS.Core;
using Etech.CMS.Localization;
using Etech.CMS.Store;
using SubSonic.Utilities;

namespace Etech.CMS.Web.admin
{
    public partial class FullMember : Etech.CMS.Store.Web.AdminPage
    {
        DataSet ds;

        protected void Page_Load(object sender, EventArgs e)
        {
            Label lblHeading = (Label)Master.FindControl("lblPageHeading");
            lblHeading.Text = "Full Members";

            if (!Page.IsPostBack)
            {
                
                BindGrid();
                pnlCurrentFullMember.Visible = true;
                pnlEditMember.Visible = false;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                int ID = 0;
               
                ID = Int32.TryParse(lblId.Text, out ID) ? Int32.Parse(lblId.Text) : 0;
                Etech.CMS.Content.FullMember objFullMember = new Content.FullMember();

                if (ID > 0)
                {
                    objFullMember = new Content.FullMember(ID);
                }
                else
                {
                    objFullMember = new Content.FullMember();
                   
                }


                objFullMember.Name = txtName.Text.Trim();
                objFullMember.Company = txtCompany.Text.Trim();
                objFullMember.Phone = txtPhone.Text.Trim();
                objFullMember.Mobile = txtMobile.Text.Trim();
                objFullMember.Email = txtEmail.Text.Trim();
                objFullMember.WebAddress = txtWeb.Text.Trim();
                objFullMember.ModifiedDate = Convert.ToDateTime(DateTime.Now.ToString());
                objFullMember.IsActive = true;

                //objFullMember.Save(WebUtility.GetUserName());
                objFullMember.Save();
                BindGrid();

                Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblFullMemberSaved"));
                pnlCurrentFullMember.Visible = true;
                pnlEditMember.Visible = false;
                Reset();
            }
         
        }
        private void BindGrid()
        {

            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.FetchFullDetails();
            ds = sp.GetDataSet();
            dgBlogCategories.DataSource = ds;

            if (dgBlogCategories.Items.Count % dgBlogCategories.PageSize == 1 && dgBlogCategories.CurrentPageIndex == dgBlogCategories.PageCount - 1 && dgBlogCategories.CurrentPageIndex != 0)
            {
                dgBlogCategories.CurrentPageIndex = dgBlogCategories.CurrentPageIndex - 1;
            }
            dgBlogCategories.DataBind();



        }
        protected void dgBlogCategories_OnItemCommand(object sender, DataGridCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Edit")
                {

                    lblId.Text = e.CommandArgument.ToString();
                    Etech.CMS.Content.FullMember objFullMember = new Etech.CMS.Content.FullMember(Int32.Parse(e.CommandArgument.ToString()));

                    txtName.Text = objFullMember.Name.ToString();
                    txtCompany.Text = objFullMember.Company.ToString();
                    txtPhone.Text = objFullMember.Phone.ToString();
                    txtMobile.Text = objFullMember.Mobile.ToString();
                    txtEmail.Text = objFullMember.Email.ToString();
                    txtWeb.Text = objFullMember.WebAddress.ToString();
                    btnCancel.Visible = true;
                    pnlEditMember.Visible = true;
                    pnlCurrentFullMember.Visible = false;
                

                }
                else if (e.CommandName == "Delete")
                {
                    Etech.CMS.Content.FullMember FMDelete = new Etech.CMS.Content.FullMember(Int32.Parse(e.CommandArgument.ToString()));
                    Etech.CMS.Content.FullMember.Delete(Int32.Parse(e.CommandArgument.ToString()));

                    BindGrid();
                    //LoadBlogCategories();
                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(FullMember).Name + ".dgBlogCategories_OnItemCommand", ex);
                Master.MessageCenter.DisplayCriticalMessage(ex.Message);
            }
        }
        protected void dgBlogCategories_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dgBlogCategories.CurrentPageIndex = e.NewPageIndex;
            BindGrid();
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            pnlCurrentFullMember.Visible = true;
            pnlEditMember.Visible = false;
            Reset();

        }


        protected void lnkbtnAddMember_Click(object sender, EventArgs e)
        {
            
            pnlCurrentFullMember.Visible = false;
            pnlEditMember.Visible = true;
            Reset();
           
        }
        private void Reset()
        {
            txtCompany.Text = "";
            txtEmail.Text = "";
            txtMobile.Text = "";
            txtName.Text = "";
            txtPhone.Text = "";
            txtWeb.Text = "";
            lblId.Text = "0";

        }
    }
}