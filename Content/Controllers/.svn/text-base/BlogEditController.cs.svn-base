using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using SubSonic;

namespace Etech.CMS.Content
{
    public partial class BlogEditController
    {
        #region Constants

        private const string CATEGORIES = "Categories";
        private const string CATEGORY = "Category";
        private const string ASC = "ASC";
        private const string DESC = "DESC";
        private const string CATEGORY_ID = "CategoryId";
        private const string Blog_ID = "BlogId";
        private const string PARENT_ID = "ParentId";

        #endregion

        /// <summary>
        /// Fetches the category list.
        /// </summary>
        /// <returns></returns>
        public DataSet FetchBlogList()
        {
            DataSet ds = new Query(Blog.Schema).ORDER_BY(Blog.Columns.CategoryId, ASC).ExecuteDataSet();
            ds.DataSetName = CATEGORIES;
            ds.Tables[0].TableName = CATEGORY;
            return ds;
        }

        public DataSet FetchAllBlogList()
        {
            DataSet ds = new Query(Blog.Schema).ORDER_BY(Blog.Columns.CreatedOn, DESC).ExecuteDataSet();
            //DataSet ds;
            //Query q = new Query(Blog.Schema).ORDER_BY(Blog.Columns.CreatedOn, DESC);
            //q.Top = "3";
            //ds = q.ExecuteDataSet();

            ds.DataSetName = CATEGORIES;
            ds.Tables[0].TableName = CATEGORY;
            return ds;
        }

        public DataSet FetchByID(int id)
        {
            //DataSet ds = new Query(Blog.FetchByID(id)).ORDER_BY(Blog.Columns.CategoryId, ASC).ExecuteDataSet();
            DataSet ds = new Query(Blog.Schema).WHERE(CATEGORY_ID,id).ExecuteDataSet();
            ds.DataSetName = CATEGORIES;
            ds.Tables[0].TableName = CATEGORY;
            return ds;
        }
        public DataSet FetchNewsByID(int id)
        {
            //DataSet ds = new Query(Blog.FetchByID(id)).ORDER_BY(Blog.Columns.CategoryId, ASC).ExecuteDataSet();
            DataSet ds = new Query(Blog.Schema).WHERE(Blog_ID, id).ExecuteDataSet();
            ds.DataSetName = CATEGORIES;
            ds.Tables[0].TableName = CATEGORY;
            return ds;
        }
        public DataSet FetchSubCategoryByID(int id)
        {
            //DataSet ds = new Query(Blog.FetchByID(id)).ORDER_BY(Blog.Columns.CategoryId, ASC).ExecuteDataSet();
            DataSet ds = new Query(Blog.Schema).WHERE(Blog.Columns.BlogId, id).ORDER_BY(Blog.Columns.BlogTitle,ASC).ExecuteDataSet();
            ds.DataSetName = CATEGORIES;
            ds.Tables[0].TableName = CATEGORY;
            return ds;

            
        }
    }
}
