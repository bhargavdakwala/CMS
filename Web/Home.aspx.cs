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
using System.Web.UI;
using System.Configuration;

using Etech.CMS.Content;
using Etech.CMS.Store;
using Etech.CMS.Web.controls;
using SubSonic.Utilities;

namespace Etech.CMS.Web {
  public partial class Home : PageBuilder {

    #region Member Variables

    private SiteSettings _siteSettings;
    private Content.Page page;
    int menuID = 0;

    #endregion

    #region Page Events

    protected void Page_PreInit(object sender, EventArgs e)
    {

        this.MasterPageFile = "~/site.master";

        
      
        
    }

    /// <summary>
    /// Handles the Load event of the Page control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
    protected void Page_Load(object sender, EventArgs e) {

       
        Page.Title = base.Title;
        Master.HideSeoInformation = true;
      


    
    }

    #endregion

    #region Properties

    /// <summary>
    /// Gets or sets the name of the style sheet applied to this page.
    /// </summary>
    /// <value></value>
    /// <returns>The name of the style sheet applied to this page.</returns>
    /// <exception cref="T:System.InvalidOperationException">The <see cref="P:System.Web.UI.Page.StyleSheetTheme"/> property is set before the <see cref="E:System.Web.UI.Control.Init"/> event completes.</exception>
    public override string StyleSheetTheme {
      get {
        return SiteSettings.Theme;
      }
    }

    /// <summary>
    /// Gets the site settings.
    /// </summary>
    /// <value>The site settings.</value>
    public SiteSettings SiteSettings {
      get {
        if (_siteSettings == null)
          _siteSettings = Etech.CMS.Core.Caching.SiteSettingCache.GetSiteSettings();
        return _siteSettings;
      }
    }

    #endregion

  }
}
