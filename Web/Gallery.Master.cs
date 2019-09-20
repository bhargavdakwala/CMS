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

using System.Data;
using SubSonic;

namespace Etech.CMS.Web
{
    public partial class Gallery : SiteMasterPage
    {
        #region Member Variables

        DataSet ds;
        DataSet dsBlog;
        string sPageName = string.Empty;
        DataSet dsParentPageID;
        bool flag = false;

        Etech.CMS.Content.Page _page;
        int pageId = 0;

        public int PageId
        {
            get { return pageId; }
        }


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
            try
            {
                GeneratorTag.Content = "CMS";
                if (SiteSettings.SeoSetting.SiteKeywords != null)
                {
                    KeyWords.InsertRange(0, SiteSettings.SeoSetting.SiteKeywords.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries));
                    KeyWords.Add("CMS");
                    KeyWords.Add("dC");
                }

                string text = LocalizationUtility.GetText("CopyrightTemplate");
                //CopyrightTag.Content = string.Format(string.IsNullOrEmpty(text) ? "Copyright (c) {0} by {1}" : text, DateTime.Now.Year, string.IsNullOrEmpty(SiteSettings.SeoSetting.CopyrightText)? SiteSettings.SiteName : SiteSettings.SeoSetting.CopyrightText);

                if (HideSeoInformation)
                {
                    DescriptionTag.Visible = false;
                    KeywordsTag.Visible = false;
                    return;
                }

                if (string.IsNullOrEmpty(Description))
                    Description = SiteSettings.SeoSetting.SiteDescription;
                DescriptionTag.Content = string.Concat(SiteSettings.SeoSetting.SiteDescription, " ", Description);
                //if there is no description then hide the meta tag.
                DescriptionTag.Visible = !string.IsNullOrEmpty(Description);

                if (KeyWords.Count > 0)
                {
                    KeywordsTag.Content = string.Join(",", KeyWords.ToArray()).Replace(",,", ",");
                    if (KeywordsTag.Content.StartsWith(",", StringComparison.InvariantCulture))
                        KeywordsTag.Content = KeywordsTag.Content.Remove(0, 1);
                }
                //if there is no keywords then hide the meta tag.
                KeywordsTag.Visible = !string.IsNullOrEmpty(KeywordsTag.Content.Trim());
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(site).Name + ".LoadSeoContent", ex);
                throw;
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