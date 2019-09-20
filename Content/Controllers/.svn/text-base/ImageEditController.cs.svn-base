using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using SubSonic;


namespace Etech.CMS.Content
{
   public partial class ImageEditController
    {
        #region Constants

        private const string CATEGORIES = "ImageFile";
        private const string CATEGORY = "ImageID";
        private const string ASC = "ASC";
        private const string CATEGORY_ID = "ImageId";
        private const string PARENT_ID = "ImageId";

        #endregion

        /*public DataSet FetchAllImageGallary()
        {
            DataSet ds = new Query(ImageGallary.Schema).ORDER_BY(ImageGallary.Columns.SortOrder, ASC).ExecuteDataSet();
            ds.DataSetName = CATEGORIES;
            ds.Tables[0].TableName = CATEGORY;
            return ds;
        }*/

        public DataSet FetchAllImageGallary(int ImgSubCategoryID)
        {
            DataSet ds = new Query(ImageGallary.Schema).WHERE(ImageGallary.Columns.ImgSubCategoryID, ImgSubCategoryID).ORDER_BY(ImageGallary.Columns.SortOrder, ASC).ExecuteDataSet();
            ds.DataSetName = CATEGORIES;
            ds.Tables[0].TableName = CATEGORY;
            return ds;
        }

        public DataSet FetchParentImageGallary(int ImgCategoryID)
        {
            DataSet ds = new Query(ImageGallary.Schema).WHERE(ImageGallary.Columns.ImgCategoryID, ImgCategoryID).ORDER_BY(ImageGallary.Columns.SortOrder, ASC).ExecuteDataSet();
            ds.DataSetName = CATEGORIES;
            ds.Tables[0].TableName = CATEGORY;
            return ds;
        }

        
    }
}
