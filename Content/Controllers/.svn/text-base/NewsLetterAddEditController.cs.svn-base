using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using SubSonic;

namespace Etech.CMS.Content
{
    public partial class NewsLetterAddEditController
    {
        #region Constants

        private const string CATEGORIES = "NewsLetterTitle";
        private const string CATEGORY = "NewsLetterID";
        private const string ASC = "ASC";
        private const string CATEGORY_ID = "NewsLetterId";
        private const string PARENT_ID = "NewsLetterId";

        #endregion

        public DataSet FetchAllNewsletter()
        {
            DataSet ds = new Query(NewsLetter.Schema).ORDER_BY(NewsLetter.Columns.NewsLetterID, ASC).ExecuteDataSet();
            ds.DataSetName = CATEGORIES;
            ds.Tables[0].TableName = CATEGORY;
            return ds;
        }
    }
}
