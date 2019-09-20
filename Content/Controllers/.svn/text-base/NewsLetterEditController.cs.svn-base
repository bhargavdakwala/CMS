using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using SubSonic;

namespace Etech.CMS.Content
{
    public partial class NewsLetterEditController
    {
        #region Constants

        private const string CATEGORIES = "GroupName";
        private const string CATEGORY = "GroupID";
        private const string ASC = "ASC";
        private const string CATEGORY_ID = "GroupId";
        private const string PARENT_ID = "GroupId";

        #endregion

        /// <summary>
        /// Fetches the category list.
        /// </summary>
        /// <returns></returns>
        public DataSet FetchNewsletterByGroup()
        {
            DataSet ds = new Query(NewsLetterGroup.Schema).ORDER_BY(NewsLetterGroup.Columns.GroupID, ASC).ExecuteDataSet();
            ds.DataSetName = CATEGORIES;
            ds.Tables[0].TableName = CATEGORY;
            return ds;
        }
    }
}

