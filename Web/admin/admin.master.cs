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
using System.Web;
using System.Web.UI.WebControls;

using System.Web.UI;
using Etech.CMS.Localization;
using Etech.CMS.Store.Web;
using Etech.CMS.Web.controls;
using Etech.CMS.Core;
using Etech.CMS.Content;
using Etech.CMS.Content.Caching;
using Etech.CMS.Store.Caching;

namespace Etech.CMS.Web.admin {
  public partial class admin : AdminMasterPage {


    #region Member Variables

      private int pageId;
      private int navigationId;

      public int PageId
      {
          get { return pageId; }
          set { pageId = value; }
      }

      public int NavigationId
      {
          get { return navigationId; }
          set { navigationId = value; }
      }

      #endregion

    #region Page Events

    /// <summary>
    /// Handles the Load event of the Page control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
    protected void Page_Load(object sender, EventArgs e) {


        try
        {

            base.MessageCenter.Title = LocalizationUtility.GetText("pnlMessageCenter");
            divMessageCenter.Controls.Add(base.MessageCenter);
        }
        catch (Exception ex)
        {
            Logger.Error(typeof(submenuNavigation).Name + "Page_Load", ex);
        }
    }
    #endregion

  }
}
