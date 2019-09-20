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
    public partial class Blog : ProviderControl
    {
        #region Member Variables
        DataSet ds;
        int id;
        bool flag = false;
      
        protected HtmlMeta htmlMetaKeywords = new HtmlMeta();
        protected HtmlMeta htmlMetaDescription = new HtmlMeta();


        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
       
            if (!IsPostBack)
            {
                GetBlogDataSet();
                GetBlogCategoryDataSet();
                GetRecentPostBlog();
            }
        }

        #region Bind Datagrid/Repeater
        private void GetBlogDataSet()
        {
     

            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.FetchBlogCurrentList();
            ds = sp.GetDataSet();

            dgBlog.DataSource = ds;
            dgBlog.DataBind();




        }

        private void GetBlogCategoryDataSet()
        {
            ds = new BlogCategoryController().FetchBlogCategoryList();
            rptrCategory.DataSource = ds;
            rptrCategory.DataBind();

        }

        private void GetRecentPostBlog()
        {
      
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.FetchBlogCurrentPostList();
            ds = sp.GetDataSet();

            dgRecentPostHeader.DataSource = ds;
            dgRecentPostHeader.DataBind();


        }


        #endregion

        #region Datagrid/Repeater Event

        protected void dgBlog_ItemCommand(object source, DataGridCommandEventArgs e)
        {



            /*if (e.CommandName == "Category")
            {
                int ID = Convert.ToInt32(e.CommandArgument);
                ds = new BlogEditController().FetchByID(ID);
                dgBlog.DataSource = ds;
                dgBlog.DataBind();
                Label lbl = (Label)e.Item.FindControl("lblReadFullPost") as Label;
                lbl.Visible = false;
                Label lblDesc = (Label)e.Item.FindControl("lblDescription") as Label;
                lblDesc.Visible = true;

                LinkButton lnkFullpost = (LinkButton)e.Item.FindControl("lnkReadFullPost") as LinkButton;
                lnkFullpost.Visible = true;
            }
            if (e.CommandName == "Read")
            {

                Label lbl = (Label)e.Item.FindControl("lblReadFullPost") as Label;
                lbl.Visible = true;

                Label lblDesc = (Label)e.Item.FindControl("lblDescription") as Label;
                lblDesc.Visible = false;

                LinkButton lnkFullpost = (LinkButton)e.Item.FindControl("lnkReadFullPost") as LinkButton;
                lnkFullpost.Visible = false;


               
                

                flag = true;

                

                int ID = Convert.ToInt32(e.CommandArgument);
                ds = new BlogEditController().FetchSubCategoryByID(ID);
                dgBlog.CurrentPageIndex = 0;
                dgBlog.DataSource = ds;
                dgBlog.DataBind();
            
            }
            if (e.CommandName == "Title")
            {
                try
                {
                    Label lbl = (Label)e.Item.FindControl("lblReadFullPost") as Label;
                    lbl.Visible = false;

                    Label lblDesc = (Label)e.Item.FindControl("lblDescription") as Label;
                    lblDesc.Visible = true; ;

                    LinkButton lnkFullpost = (LinkButton)e.Item.FindControl("lnkReadFullPost") as LinkButton;
                    lnkFullpost.Visible = false;

                    flag = true;

                    int ID = Convert.ToInt32(e.CommandArgument);
                    ds = new BlogEditController().FetchSubCategoryByID(ID);
                    dgBlog.CurrentPageIndex = 0;
                    dgBlog.DataSource = ds;
                    dgBlog.DataBind();
                    

                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message.ToString());
                }
            }*/
        }
        protected void rptrCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            /*if (e.CommandName == "Category")
            {

                int ID = Convert.ToInt32(e.CommandArgument);
                ds = new BlogEditController().FetchByID(ID);
                dgBlog.DataSource = ds;
                dgBlog.DataBind();

            }
            if (e.CommandName == "SubCategory")
            {
                int ID = Convert.ToInt32(e.CommandArgument);
                ds = new BlogEditController().FetchSubCategoryByID(ID);
                dgBlog.DataSource = ds;
                dgBlog.DataBind();
             
            }*/
        }



        protected void rptrCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            /*if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lbl = (Label)e.Item.FindControl("lbl") as Label;
                id = Convert.ToInt32(lbl.Text);
                ds = new BlogEditController().FetchByID(id);
       
            }*/

        }
        protected void dgBlog_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dgBlog.CurrentPageIndex = e.NewPageIndex;
            GetBlogDataSet();

        }

        protected void dgRecentPostHeader_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            /*if (e.CommandName == "RecentPostedBlog")
            {
                flag = true;
                int ID = Convert.ToInt32(e.CommandArgument);
                ds = new BlogEditController().FetchSubCategoryByID(ID);
                dgBlog.DataSource = ds;
                dgBlog.DataBind();

       
            }
            else
            {
                flag = false;
            }*/

        }
        #endregion

        protected void dgBlog_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //LinkButton lnkFullposttest = (LinkButton)e.Item.FindControl("lnkReadFullPost") as LinkButton;

                Label lbl = (Label)e.Item.FindControl("lblReadFullPost") as Label;

                Label lblDesc = (Label)e.Item.FindControl("lblDescription") as Label;
                //LinkButton lnkFullpost = (LinkButton)e.Item.FindControl("lnkReadFullPost") as LinkButton;

                HtmlGenericControl div = new HtmlGenericControl("div");
                div = (HtmlGenericControl)e.Item.FindControl("divRead");

                
                if (flag == true)
                {
                    //lnkFullpost.Visible = false;
                    lblDesc.Visible = false;
                    lbl.Visible = true;
                    div.Attributes.Add("class", "");
                    
                    
                }
                else
                {
                    //lnkFullpost.Visible = true;
                    lblDesc.Visible = true;
                    lbl.Visible = false;
                    
                }

            }

        }
    }
}