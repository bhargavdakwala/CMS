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
using System.Web.UI;

using Etech.CMS.Localization;

[assembly: TagPrefix("Etech.CMS.Controls", "CMS")]
namespace Etech.CMS.Controls {

  [ToolboxData("<{0}:HelpLink ID=\"HelpLinkId\" runat=\"server\" />")]
  public class HelpLink : System.Web.UI.WebControls.HyperLink {

    protected override void Render(HtmlTextWriter writer) {
      if (!string.IsNullOrEmpty(this.ID) && this.Text.Length == 0) {
        string helpText = string.IsNullOrEmpty(LocalizationUtility.GetHelpText(this.ID)) ? LocalizationUtility.GetHelpText("noHelp") : LocalizationUtility.GetHelpText(this.ID);
        this.Attributes.Add("onmouseover", string.Format(Overlib.TOOLTIP, helpText));
        this.Attributes.Add("onmouseout", Overlib.MOUSEOUT);
      }
      base.Render(writer);
    }
  }
}
