using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using SubSonic;

namespace Etech.CMS.Content
{
    public partial class NewsLetterEditUserController
    {
        #region Constants

        private const string CATEGORIES = "UserName";
        private const string CATEGORY = "UserID";
        private const string ASC = "ASC";
        private const string CATEGORY_ID = "UserId";
        private const string PARENT_ID = "UserId";

        #endregion

        /// <summary>
        /// Fetches the category list.
        /// </summary>
        /// <returns></returns>
        public DataSet FetchAllUsersForNewsLetter()
        {
            DataSet ds = new Query(NewsLetterUser.Schema).ORDER_BY(NewsLetterUser.Columns.UserID, ASC).ExecuteDataSet();
            ds.DataSetName = CATEGORIES;
            ds.Tables[0].TableName = CATEGORY;
            return ds;
        }

    }
}
