
using System.Web.Caching;
using Etech.CMS.Core.Caching.Manager;

namespace Etech.CMS.Content.Caching
{
    public class PageParameterCache
    {
        #region Constants

        private const string CACHE_PAGE_PARAMETER = "PageParameter_ItemID_{0}_{1}";

        #endregion

        /// <summary>
        /// Adds a page parameter to cache
        /// </summary>
        /// <param name="pageId"></param>
        /// <param name="paramName"></param>
        /// <param name="paramValue"></param>
        /// <returns></returns>
        public static string GetPageParameter(int pageId, string paramName, string paramValue)
        {
            return CacheHelper.CacheObject<string>(delegate
            {
                return paramValue;
            }, MakePageParameterKey(pageId, paramName), CacheLength.GetDefaultCacheTime, CacheItemPriority.AboveNormal);
        }

        /// <summary>
        /// Makes the page parameter key.
        /// </summary>
        /// <param name="pageId">The page id.</param>
        /// <returns></returns>
        private static string MakePageParameterKey(int pageId, string paramName)
        {
            return string.Format(CACHE_PAGE_PARAMETER, pageId, paramName);
        }

        /// <summary>
        /// Removes the page parameter by ID.
        /// This will force a reinsert to the cache on the next request.
        /// </summary>
        /// <param name="pageId">The page ID.</param>
        public static void RemovePageParameter(int pageId, string paramName)
        {
            CacheHelper.RemoveCacheObject<string>(MakePageParameterKey(pageId, paramName));
        }
    }
}
