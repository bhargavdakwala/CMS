using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using SubSonic;

namespace Etech.CMS.Content
{
    public partial class BlogCategoryController
    {

        #region Constants

        private const string CATEGORIES = "Categories";
        private const string CATEGORY = "Category";
        private const string ASC = "ASC";
        private const string CATEGORY_ID = "CategoryId";
        private const string PARENT_ID = "ParentId";

        private const string SERVICE = "Service";
        private const string SERVICES = "Services";

        private const string GALLERYCategory = "GalleryCategory";
        private const string GALLERYESCategory = "GalleryCategory";

        private const string GALLERYSubCategory = "GallerySubCategory";
        private const string GALLERYESSubCategory = "GallerySubCategory";

        #endregion

        /// <summary>
        /// Fetches the category list.
        /// </summary>
        /// <returns></returns>
        public DataSet FetchBlogCategoryList()
        {
            DataSet ds = new Query(BlogCategory.Schema).ORDER_BY(BlogCategory.Columns.CategoryId, ASC).ExecuteDataSet();
            ds.DataSetName = CATEGORIES;
            ds.Tables[0].TableName = CATEGORY;
            return ds;
        }

        public DataSet FetchServiceList()
        {
            DataSet ds = new Query(Service.Schema).ORDER_BY(Service.Columns.ServiceID, ASC).ExecuteDataSet();
            ds.DataSetName = SERVICES;
            ds.Tables[0].TableName = SERVICE;
            return ds;
        }


        public DataSet FetchGalleryList()
        {
            DataSet ds = new Query(GalleryCategory.Schema).ORDER_BY(GalleryCategory.Columns.ImgCategoryID, ASC).ExecuteDataSet();
            ds.DataSetName = GALLERYESCategory;
            ds.Tables[0].TableName = GALLERYCategory;
            return ds;
        }


        public DataSet FetchSubGalleryList(int ImgCategoryID)
        {
            DataSet ds = new Query(GallerySubCategory.Schema).WHERE(GallerySubCategory.Columns.ImgCategoryID,ImgCategoryID).ORDER_BY(GallerySubCategory.Columns.ImgSubCategoryID, ASC).ExecuteDataSet();
            ds.DataSetName = GALLERYESSubCategory;
            ds.Tables[0].TableName = GALLERYSubCategory;
            return ds;
        }


        /*public DataSet FetchSubGalleryList(int id)
        {
            //DataSet ds = new Query(Blog.FetchByID(id)).ORDER_BY(Blog.Columns.CategoryId, ASC).ExecuteDataSet();
            DataSet ds = new Query(Blog.Schema).WHERE(Blog.Columns.BlogId, id).ORDER_BY(Blog.Columns.BlogTitle, ASC).ExecuteDataSet();
            ds.DataSetName = CATEGORIES;
            ds.Tables[0].TableName = CATEGORY;
            return ds;


        }*/



    }
}
