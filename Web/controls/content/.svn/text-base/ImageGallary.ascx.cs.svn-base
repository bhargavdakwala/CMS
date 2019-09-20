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
using SubSonic.Utilities;

namespace Etech.CMS.Web.controls.content
{
    public partial class ImageGallary : ProviderControl
    {

        #region Member Variables

        DataSet ds;
        DataSet dsImage;

        
        

        #endregion

        #region Page_Load
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetCategory();

                
                

                
            }


        }
        #endregion Page_Load


        private void GetCategory()
        {
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetAllImages();
            ds = sp.GetDataSet();
            rptParent.DataSource = ds;
            rptParent.DataBind();
            
        }

        private DataSet GetImages(int id)
        {
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetAllCategoryImages(id);
            dsImage = sp.GetDataSet();
            return dsImage;
            
        }

       /* protected void OnMyCommand3(object sender, RepeaterItemEventArgs e)
        {
            Label lblUrlTitle = (Label)e.Item.FindControl("lblUrlTitle");
            HyperLink test = (HyperLink)e.Item.FindControl("test");

            test.NavigateUrl = "http://localhost:3697" + lblUrlTitle.Text +".aspx";
            

        }*/

        protected void OnMyCommand2(object sender, RepeaterCommandEventArgs e)
        {
            /*if (e.CommandName == "Detail")
            {
                BindDetail(Convert.ToInt32(e.CommandArgument));

                Label lblUrlTitle = (Label)e.Item.FindControl("lblUrlTitle");
                ImageButton imgUrl = (ImageButton)e.Item.FindControl("imgUrl");

                //Response.Redirect("http://localhost:3697" + lblUrlTitle.Text + ".aspx",false);

                //rptParent.Visible = false;
                //rptDetail.Visible = true;
                //pre.Visible = false;

            }*/
        }

        protected string Comment(object url)
        {
            string absUrl = ConfigurationManager.AppSettings["siteRoot"].ToString() + url + ".aspx";
            return absUrl;
        }

        protected void rptParent_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                RepeaterItem item = e.Item;
               

                Label lblImgCategoryID = (Label)item.FindControl("lblImgCategoryID");

                int id = int.Parse(lblImgCategoryID.Text);

                System.Web.UI.WebControls.Repeater rptChild = (System.Web.UI.WebControls.Repeater)item.FindControl("rptChild");



                rptChild.DataSource = GetImages(id);
                 rptChild.DataBind();
               
            }
        }

        private void BindDetail(int ImageID)
        {
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetAllCategoryImagesDetail(ImageID);
            ds = sp.GetDataSet();
            //rptDetail.DataSource = ds;
            //rptDetail.DataBind();
        }

      
       
       
    }
}