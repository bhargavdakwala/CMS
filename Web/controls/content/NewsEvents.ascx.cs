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
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Web.Services;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using Etech.CMS.Content;
using System.Collections.Generic;
using System.Linq;
using Etech.CMS.Store;
using Etech.CMS.Store.Caching;
using Etech.CMS.Store.Services.MessageService;
using Etech.CMS.Core;
using Etech.CMS.Localization;
using SubSonic;


namespace Etech.CMS.Web.controls.content
{

    public partial class NewsEvents : ProviderControl
    {
        private int _blogID = 0;
        public int BlogID
        {
            get { return _blogID; }
            set { _blogID = value; }
        }

        #region Member Variables
        DataSet ds;
        int id;
        bool flag = false;

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetRecentPostBlog();
               
            }

        }
        private void GetRecentPostBlog()
        {
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.FetchBlogCurrentList();
            ds = sp.GetDataSet();

            dgRecentPostHeader.DataSource = ds;
            dgRecentPostHeader.DataBind();

        }


        protected void dgRecentPostHeader_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            LinkButton lnkID = (LinkButton)e.Item.FindControl("lnkTitle") as LinkButton;

            if (e.CommandName == "Title")
            {
                int ID = Convert.ToInt32(e.CommandArgument);

                Page.Cache["BlogID"] = ID;

                string url = ConfigurationManager.AppSettings["SiteRoot"].ToString() + "/hydraulic-design-australia-news-and-events.aspx";
                Response.Redirect(url);
                
            }
        }

    }
}