using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using SubSonic;

namespace Etech.CMS.Content
{
    public partial class NewsLetterEditTemplatesController
    {
        #region Constants

        private const string CATEGORIES = "TemplateName";
        private const string CATEGORY = "TemplateID";
        private const string ASC = "ASC";
        private const string CATEGORY_ID = "TemplateId";
        private const string PARENT_ID = "TemplateId";

        #endregion

        /// <summary>
        /// Fetches the Templates list.
        /// </summary>
        /// <returns></returns>
        public DataSet FetchAllNewsletterTemplates()
        {
            DataSet ds = new Query(NewsLetterTemplate.Schema).ORDER_BY(NewsLetterTemplate.Columns.TemplateID, ASC).ExecuteDataSet();
            ds.DataSetName = CATEGORIES;
            ds.Tables[0].TableName = CATEGORY;
            return ds;
        }
    }
}
