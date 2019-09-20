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
using System.Collections;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Etech.CMS.Content.Caching;
using SubSonic.Utilities;
using System.Configuration;

namespace Etech.CMS.Content {

  public partial class PageBuilder : System.Web.UI.Page {

    #region Member Variables

    int pageId = 0;
          
    Page _page;
    protected HtmlMeta htmlMetaKeywords = new HtmlMeta();
    protected HtmlMeta htmlMetaDescription = new HtmlMeta();
      protected HtmlMeta htmlMetaauthor = new HtmlMeta();
      
    private string _title;

    public int PageId
    {
        get { return pageId; }
    }

    #endregion
    protected override void OnPreInit(EventArgs e)
    {
        pageId = Utility.GetIntParameter("pageId");
        if (pageId > 0)
        {
            _page = PageCache.GetPageByID(pageId);
        }
        else
        {
            _page = PageCache.GetDefaultPage();
        }
        base.OnPreInit(e);
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        ControlCollection container = this.Page.Header.Controls;
        foreach (var control in container)
        {
            //if (control.GetType().ToString() == "<link ID=\"stylesheet\" rel=\"stylesheet\" type=\"text/css\" href=\"/controls/content/styles/3col.css\" />")
            //{
            //    control.ToString().Replace("<link ID=\"stylesheet\" rel=\"stylesheet\" type=\"text/css\" href=\"/controls/content/styles/3col.css\" />", "<link rel=\"stylesheet\" type=\"text/css\" href=\"/controls/content/styles/3col.css\" />");
            //}

            if (control.GetType().ToString() == "System.Web.UI.HtmlControls.HtmlLink")
            {

                HtmlLink css = (HtmlLink)control;

                css.Href = css.Href.Replace("~", ConfigurationManager.AppSettings["siteRoot"].ToString());
            }
        }
    } 
    protected override void OnInit(EventArgs e) {
      
      if (_page != null) {

        this._title = _page.Title;

        htmlMetaKeywords.Attributes.Add("name", "keywords");
        htmlMetaKeywords.Attributes.Add("content", _page.Keywords);
        Page.Header.Controls.Add(htmlMetaKeywords);

        htmlMetaDescription.Attributes.Add("name", "description");
        htmlMetaDescription.Attributes.Add("content", _page.Description);
        Page.Header.Controls.Add(htmlMetaDescription);

        //htmlMetaauthor.Attributes.Add("name", "author");
        //htmlMetaauthor.Attributes.Add("content", "iSolutions Technology");
        //Page.Header.Controls.Add(htmlMetaauthor);

        Template template = new Template(_page.TemplateId);
        if (template.TemplateId > 0) {
          if (!string.IsNullOrEmpty(template.StyleSheet)) {
            //Header.Controls.Add(new LiteralControl("<link ID=\"stylesheet\" rel=\"stylesheet\" type=\"text/css\" href=\"" + Page.ResolveUrl(template.StyleSheet) + "\" />"));
              Header.Controls.Add(new LiteralControl("<link rel=\"stylesheet\" type=\"text/css\" href=\"" + Page.ResolveUrl(template.StyleSheet) + "\" />"));
          }
        }

        //now get the template regions for this page
        TemplateRegionCollection templateRegionCollection = new TemplateRegionController().FetchByTemplateId(_page.TemplateId);
        //now get the regions for the page
        RegionCollection regionCollection = new RegionController().FetchRegionsByPageId(_page.PageId);
        regionCollection.OrderByAsc("SortOrder");
        HtmlGenericControl templateRegionControl;
        HtmlGenericControl regionControl;
        HtmlGenericControl titleControl;
        HtmlGenericControl regionTitleControl;
        foreach (TemplateRegion templateRegion in templateRegionCollection) {
          //1st, add the region
          templateRegionControl = new HtmlGenericControl("div");
          templateRegionControl.Attributes.Add("id", templateRegion.Name.Replace(" ", string.Empty).ToString());
          ((PlaceHolder)this.Placeholders["contentPlaceHolder"]).Controls.Add(templateRegionControl);
          //2nd, add the regions that belong in this control
          foreach (Region _region in regionCollection) {
            if (_region.TemplateRegionId == templateRegion.TemplateRegionId) { //then it belongs in this TemplateRegion 
              regionControl = new HtmlGenericControl("div");
              regionControl.Attributes.Add("class", "contentGroup");
              if (_region.ShowTitle) {
                titleControl = new HtmlGenericControl("div");
                titleControl.Attributes.Add("class", "rightContainer");
                regionTitleControl = new HtmlGenericControl("h1");
                regionTitleControl.Attributes.Add("align", "left");
                regionTitleControl.InnerHtml = _region.Title;
                titleControl.Controls.Add(regionTitleControl);
                regionControl.Controls.Add(titleControl);
              }
              templateRegionControl.Controls.Add(regionControl);
              Provider _provider = new Content.Provider(_region.ProviderId);
              if (!string.IsNullOrEmpty(_provider.StyleSheet)) {
                Header.Controls.Add(new LiteralControl("<link ID=\"stylesheet\" rel=\"stylesheet\" type=\"text/css\" href=\"" + Page.ResolveUrl(_provider.StyleSheet) + "\" />"));
              }
              ProviderControl _providerControl = Page.LoadControl(_provider.ViewControl) as ProviderControl;
              _providerControl.PageId = _page.PageId;
              _providerControl.RegionId = _region.RegionId;
              _providerControl.ProviderId = _provider.ProviderId;
              regionControl.Controls.Add(_providerControl);
            }
          }
        }
      }

      base.OnInit(e);
    }

    public new string Title {
      get {
        return _title;
      }
      set {
        _title = value;
      }
    }


    public Hashtable Placeholders {
      get {
        Hashtable placeholders = new Hashtable();
        foreach (Control ctrl in Master.FindControl("ContentPlaceHolder1").Controls) {
          if (ctrl is PlaceHolder) {
            placeholders.Add(ctrl.ID, ctrl);
          }
        }
        return placeholders;
      }
    }

  }
}
