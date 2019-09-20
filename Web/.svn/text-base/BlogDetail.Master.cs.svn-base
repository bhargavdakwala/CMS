#region CMS License
/*
The MIT License

Copyright (c) 2008 - 2010 Mettle Systems LLC, P.O. Box 181192 Cleveland Heights, Ohio 44118, United States

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/
#endregion
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
using System.Data;
using SubSonic;

namespace Etech.CMS.Web
{
    public partial class BlogDetail : SiteMasterPage
    {
        #region Member Variables

        
        string sPageName = string.Empty;
        DataSet ds;
        

        #endregion

        #region Page Events

        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="T:System.EventArgs"/> instance containing the event data.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                LoadSeoContent();
            }
        }
        #endregion

        #region Private Methods

        /// <summary>
        /// Loads the SEO Meta Tags.
        /// </summary>
        
        private void LoadSeoContent()
        {
            int blogID = Utility.GetIntParameter("blog");

            int blogCatID = Utility.GetIntParameter("blogcatid");


            if (blogID != 0)
            {
                SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetBlogByBlogID(blogID);
                ds = sp.GetDataSet();

                KeywordsTag.Content = ds.Tables[0].Rows[0]["Keywords"].ToString();
                DescriptionTag.Content = ds.Tables[0].Rows[0]["Description"].ToString();
                this.Page.Title = ds.Tables[0].Rows[0]["Title"].ToString();
            }


            if (blogCatID != 0)
            {
                SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetBlogCategoryByBlogCatID(blogCatID);
                ds = sp.GetDataSet();

                KeywordsTag.Content = ds.Tables[0].Rows[0]["Keywords"].ToString();
                DescriptionTag.Content = ds.Tables[0].Rows[0]["Description"].ToString();
                this.Page.Title = ds.Tables[0].Rows[0]["Title"].ToString();
            }

            
        }

       
        #endregion Private Methods

        #region Properties

        /// <summary>
        /// Gets the script manager.
        /// </summary>
        /// <value>The script manager.</value>
        public ScriptManager ScriptManager
        {
            get
            {
                return scriptManager;
            }
        }

        #endregion

    }
}