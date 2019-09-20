using System;
using System.IO;
using System.Web;
using System.Web.UI;
using Etech.CMS.Content.Caching;
using Etech.CMS.Core;
using Etech.CMS.Localization;
using Etech.CMS.Store;
using Etech.CMS.Store.Web;
using Etech.CMS.Web.controls;
using SubSonic.Utilities;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.UI.HtmlControls;
using Etech.CMS.Content;
using Etech.CMS.Store.Caching;
using Etech.CMS.Store.Services.MessageService;
using System.Data;

namespace Etech.CMS.Web
{
    public partial class BlogList : System.Web.UI.Page
    {
        #region Member Variables
        DataSet ds;
        int id;
        int blogID;
        int blogCatID;
        bool flag = false;

        protected HtmlMeta htmlMetaKeywords = new HtmlMeta();
        protected HtmlMeta htmlMetaDescription = new HtmlMeta();


        #endregion

        #region PageEvent
        protected void Page_Load(object sender, EventArgs e)
        {
            blogID = Utility.GetIntParameter("blog");

            blogCatID = Utility.GetIntParameter("blogcatid");

            if (!IsPostBack)
            {
                if (blogID != 0)
                {
                    ds = new BlogEditController().FetchSubCategoryByID(blogID);
                    dgBlog.DataSource = ds;
                    dgBlog.DataBind();

                }
                else
                {
                    GetBlogDataSet();
                }

                if (blogCatID != 0)
                {
                    ds = new BlogEditController().FetchByID(blogCatID);
                    dgBlog.DataSource = ds;
                    dgBlog.DataBind();
                }

                GetBlogCategoryDataSet();
                GetRecentPostBlog();
            }
        }
        #endregion PageEvent
        
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

        

        protected void dgBlog_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dgBlog.CurrentPageIndex = e.NewPageIndex;
            GetBlogDataSet();

        }

        protected void dgBlog_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                HyperLink lnkReadFullPost = (HyperLink)e.Item.FindControl("lnkReadFullPost");
                if (blogID != 0)
                {
                    lnkReadFullPost.Visible = false;
                }
                else
                {
                    lnkReadFullPost.Visible = true;
                }

            }

        }
    }
        
        #endregion

        
}