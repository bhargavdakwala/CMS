using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using SubSonic;

namespace Etech.CMS.Content.Controllers
{
    public class DomainEditKeyController
    {
        #region Constants

        private const string CATEGORIES = "KeyValue";
        private const string CATEGORY = "KeyID";
        private const string ASC = "ASC";
        private const string CATEGORY_ID = "KeyId";
        private const string PARENT_ID = "KeyId";

        #endregion

        public DataSet FetchAllDomainNames()
        {
            DataSet ds = new Query(DomainKey.Schema).ORDER_BY(DomainKey.Columns.KeyID, ASC).ExecuteDataSet();
            ds.DataSetName = CATEGORIES;
            ds.Tables[0].TableName = CATEGORY;
            return ds;
        }
    }
}
