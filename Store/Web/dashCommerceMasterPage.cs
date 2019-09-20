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

namespace Etech.CMS.Store.Web {
  public partial class CMSMasterPage : MasterPage {

    #region Member Variables

    private SiteSettings _siteSettings;

    #endregion

    #region Page Events

    protected override void OnInit(EventArgs e) {
      base.OnInit(e);
      //set some value in Session in order to avoid Invalid ViewState Error: 
      //http://csharpaspnet.blogspot.com/2008/02/how-i-deal-with-cross-site-request.html
      //i.e.: Gotta have something in session to be able to use SessionID
      //Session["Snipe"] = "x";
      //Page.ViewStateUserKey = Session.SessionID;
    }

    #endregion

    #region Properties

    /// <summary>
    /// Gets the site settings.
    /// </summary>
    /// <value>The site settings.</value>
    public SiteSettings SiteSettings {
      get {
        if (_siteSettings == null)
          _siteSettings = Core.Caching.SiteSettingCache.GetSiteSettings();
        return _siteSettings;
      }
    }

    #endregion
  }
}
