using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Text;
using System.Data;
using System.Text.RegularExpressions;
using Etech.CMS.Content;
using Etech.CMS.Store;
using Etech.CMS.Store.Caching;
using Etech.CMS.Store.Services.MessageService;
using Etech.CMS.Core;
using Etech.CMS.Localization;
using SubSonic;
using System.Web.UI.HtmlControls;
using Etech.CMS.Store.Web;

namespace Etech.CMS.Web.controls.content
{
    public partial class FullMember : ProviderControl
    {
        #region Member Variables
        DataSet ds;
        int id;
        

        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDatalist();
            }
        }
        private void BindDatalist()
        {
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.FetchFullMember();
            ds = sp.GetDataSet();

            dlFullMember.DataSource = ds;
            dlFullMember.DataBind();

        }

        protected void dlFullMember_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //LinkButton lnkFullposttest = (LinkButton)e.Item.FindControl("lnkReadFullPost") as LinkButton;

                Label LblCompanyData = (Label)e.Item.FindControl("lblCompany") as Label;
                Label lblPhone = (Label)e.Item.FindControl("lblPhone") as Label;
                Label lblMobile = (Label)e.Item.FindControl("lblMobile") as Label;
                Label lblEmail = (Label)e.Item.FindControl("lblEmail") as Label;
                Label lblWebAddress = (Label)e.Item.FindControl("lblWebAddress") as Label;
                
                
                
                if (LblCompanyData.Text == "")
                {
                    //Label lblCompany = (Label)e.Item.FindControl("labelCompany") as Label;
                    //lblCompany.Visible = false;
                    ((HtmlTableRow)e.Item.FindControl("Company")).Visible = false;
                    LblCompanyData.Visible = false;
                    e.Item.FindControl("labelCompany").Visible = false;
                }
                if (lblPhone.Text == "")
                {
                    ((HtmlTableRow)e.Item.FindControl("Phone")).Visible = false;
                    lblPhone.Visible = false;
                    e.Item.FindControl("labelPhone").Visible = false;
                   
                }
                if (lblMobile.Text == "")
                {
                    ((HtmlTableRow)e.Item.FindControl("Mobile")).Visible = false;
                    lblMobile.Visible = false;
                    e.Item.FindControl("labelMobile").Visible = false;

                }
                if (lblEmail.Text == "")
                {
                    ((HtmlTableRow)e.Item.FindControl("Email")).Visible = false;
                    lblEmail.Visible = false;
                    e.Item.FindControl("labelEmail").Visible = false;

                }
                if (lblWebAddress.Text == "")
                {
                    ((HtmlTableRow)e.Item.FindControl("WebAddress")).Visible = false;
                    lblWebAddress.Visible = false;
                    e.Item.FindControl("labelWeb").Visible = false;

                }
            }
        }
    }
}