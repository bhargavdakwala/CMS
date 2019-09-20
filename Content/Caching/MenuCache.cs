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

using System.Data;
using System.Web.Caching;
using Etech.CMS.Core.Caching.Manager;


namespace Etech.CMS.Content.Caching
{
  public class MenuCache {

    #region Constants

    private const string CACHE_MENU_BYID = "MenuController_ById_{0}";
    

    #endregion

    #region Methods

    #region Refresh Cache

    /// <summary>
    /// Refreshes the menu page collection in the cache.
    /// This will make that the menu should reinsert itself on the next page request
    /// </summary>
    public static void RefreshMenuCollection() {
        CacheHelper.RemoveCacheObject<string>(CACHE_MENU_BYID);
    }

  


    #endregion

    #region Public

    /// <summary>
    /// Gets the page menu.
    /// </summary>
    /// <returns></returns>
    /// 

    public static string GetLeftMenu(int PageId)
    {
        return CacheHelper.CacheObject<string>(delegate { return new PageController().FetchLeftPageList(PageId).GetXml(); },
          string.Format(CACHE_MENU_BYID, PageId), CacheLength.GetLongCacheTime, CacheItemPriority.High);
    }

    public static string GetSubmenuById(int PageId)
    {
        return CacheHelper.CacheObject<string>(delegate { return new PageController().FetchChildPageList(PageId).GetXml(); },
          string.Format(CACHE_MENU_BYID, PageId), CacheLength.GetLongCacheTime, CacheItemPriority.High);
    }

  

    public static string GetTopMenuById(int PageId)
    {
        return CacheHelper.CacheObject<string>(delegate { return new PageController().FetchTopPageList(PageId).GetXml(); },
          string.Format(CACHE_MENU_BYID, PageId), CacheLength.GetLongCacheTime, CacheItemPriority.High);
    }

    #endregion

    #endregion

  }
}
