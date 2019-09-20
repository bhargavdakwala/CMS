﻿#region CMS License
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
#region DotNetKicks License
/* 
 * This license is based on the new BSD template found here 
 * (http://www.opensource.org/licenses/bsd-license.php)
 *
 * -----------------------------------------------------------------
 * DotNetKicks (http://www.dotnetkicks.com/)
 * Copyright (c) 2007
 * by Gavin Joyce (gavin@incremental.ie)
 *
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *      * Redistributions of source code must retain the above copyright
 *        notice, this list of conditions and the following disclaimer.
 *      * Redistributions in binary form must reproduce the above copyright
 *        notice, this list of conditions and the following disclaimer in the
 *        documentation and/or other materials provided with the distribution.
 *      * Neither the name of the 'DotNetKicks.com', 'Incremental Systems' nor 
 *        the names of its contributors may be used to endorse or promote 
 *        products derived from this software without specific prior written 
 *        permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
#endregion

using System.Collections.Generic;
using System.Web.Caching;
using Etech.CMS.Core.Caching.Providers;
using Etech.CMS.Store;

namespace Etech.CMS.Core.Caching.Manager {
  /// <summary>
  /// The Cache Manager.
  /// </summary>
  /// <typeparam name="TKey">The type of the key.</typeparam>
  /// <typeparam name="TValue">The type of the value.</typeparam>
  public class CacheManager<TKey, TValue> {

    #region Member Variables

    private static CacheManager<TKey, TValue> _currentCache = null;
    private static readonly object _cacheLock = new object();

    #endregion

    #region Constructors

    /// <summary>
    /// Initializes a new instance of the <see cref="CacheManager&lt;TKey, TValue&gt;"/> class.
    /// </summary>
    private CacheManager() {
    }

    #endregion

    #region Indexer

    /// <summary>
    /// Gets the <see cref="TValue"/> with the specified key.
    /// </summary>
    /// <value></value>
    public TValue this[TKey key] {
      get {
        return GetFromCache(key);
      }
    }

    #endregion

    #region Methods

    #region Public Static

    #region Cache Object Helpers

    /// <summary>
    /// Gets from cache object.
    /// </summary>
    /// <param name="key">The key.</param>
    /// <returns></returns>
    private static TValue GetFromCache(TKey key) {
      return (TValue)GetFromCache(MakeKey(key));
    }

    /// <summary>
    /// Gets from cache object.
    /// This doesn't use any boxing.
    /// </summary>
    /// <param name="key">The key.</param>
    /// <returns></returns>
    private static object GetFromCacheObject(TKey key) {
      return GetFromCache(MakeKey(key));
    }

    /// <summary>
    /// Gets from cache object.
    /// </summary>
    /// <param name="key">The key.</param>
    /// <returns></returns>
    private static object GetFromCache(string key) {
      return GenericCacheManager.GetInstance().CacheProvider[key];
    }

    #endregion

    /// <summary>
    /// Gets the instance of the cache manager.
    /// </summary>
    /// <returns></returns>
    public static CacheManager<TKey, TValue> GetInstance() {
      if(_currentCache == null) {
        lock(_cacheLock) {
          if(_currentCache == null) {
            _currentCache = new CacheManager<TKey, TValue>();
          }
        }
      }
      return _currentCache;
    }

    /// <summary>
    /// Reloads the cache provider and its settings.
    /// </summary>
    public void ReloadCacheProvider() {
        GenericCacheManager.GetInstance().ReloadCacheProvider();
    }

    #endregion

    #region Public

    /// <summary>
    /// Determines whether the Cache contains the key.
    /// </summary>
    /// <param name="key">The key.</param>
    /// <returns>
    /// 	<c>true</c> if the cache contains the key; otherwise, <c>false</c>.
    /// </returns>
    public bool ContainsKey(TKey key) {
      return GetFromCacheObject(key) != null;
    }

    /// <summary>
    /// Gets the specified key from the cache.
    /// </summary>
    /// <param name="key">The key.</param>
    /// <returns></returns>
    public TValue Get(TKey key) {
      return GetFromCache(key);
    }

    /// <summary>
    /// Inserts the specified key into the cache.
    /// </summary>
    /// <param name="key">The key.</param>
    /// <param name="value">The value.</param>
    public void Insert(TKey key, TValue value) {
      Insert(key, value, CacheLength.GetDefaultCacheTime);
    }

    /// <summary>
    /// Inserts the specified key into the cache.
    /// </summary>
    /// <param name="key">The key.</param>
    /// <param name="value">The value.</param>
    /// <param name="cacheDurationInSeconds">The cache duration in seconds.</param>
    public void Insert(TKey key, TValue value, int cacheDurationInSeconds) {
      Insert(key, value, cacheDurationInSeconds, CacheItemPriority.Default);
    }

    /// <summary>
    /// Inserts the specified key into the cache.
    /// </summary>
    /// <param name="key">The key.</param>
    /// <param name="value">The value.</param>
    /// <param name="cacheDurationInSeconds">The cache duration in seconds.</param>
    /// <param name="priority">The priority.</param>
    public void Insert(TKey key, TValue value, int cacheDurationInSeconds, CacheItemPriority priority) {
      CacheProvider.Insert(MakeKey(key), value, cacheDurationInSeconds, priority);
    }

    /// <summary>
    /// Removes the specified key from the cache.
    /// </summary>
    /// <param name="key">The key.</param>
    public void Remove(TKey key) {
      CacheProvider.Remove(MakeKey(key));
    }

    /// <summary>
    /// Clears the cache.
    /// </summary>
    public void ClearCache() {
      CacheProvider.ClearCache();
    }

    /// <summary>
    /// Gets the amount of items in the cache.
    /// </summary>
    /// <returns></returns>
    public int GetCount() {
        return CacheProvider.GetCount();
    }

    #endregion

    #region Private

    /// <summary>
    /// Creates the key used for identifying the cache object.
    /// </summary>
    /// <param name="key">The key.</param>
    /// <returns></returns>
    private static string MakeKey(TKey key) {
       return key + "|" + typeof(TKey).ToString() + key.GetHashCode();
    }

    #endregion

    #region internal

    /// <summary>
    /// Gets a list of cached objects.
    /// </summary>
    /// <returns></returns>
    internal IList<string> GetListOfCachedKeys()
    {
       System.Collections.IDictionaryEnumerator itemsInCache = CacheProvider.GetEnumerator();
       IList<string> keysInCache = new List<string>();
       while (itemsInCache.MoveNext())
       {
           keysInCache.Add(itemsInCache.Key.ToString());
       }
       return keysInCache;
    }

    /// <summary>
    /// Removes the specified key from the cache.
    /// </summary>
    /// <param name="key">The key.</param>
    internal void RemoveByKey(string key) {
        CacheProvider.Remove(key);
    }

    #endregion

    #endregion

    #region Properties

    /// <summary>
    /// Gets the cache provider.
    /// </summary>
    /// <value>The cache provider.</value>
    public ICacheProvider CacheProvider {
        get { return GenericCacheManager.GetInstance().CacheProvider; }
    }

    /// <summary
    /// Gets or sets the get site settings.
    /// </summary>
    /// <value>The get site settings.</value>
    public SiteSettings GetSiteSettings {
      get {
          return GenericCacheManager.GetInstance().SiteSettings;
      }
    }

    #endregion

  }

  /// <summary>
  /// This is a Generic Cache Manager That doesn't know the type of object that you are using
  /// That way it just loads once the settings that don't have anything with the type.
  /// </summary>
  internal class GenericCacheManager
  {

      #region Member Variables

      private static GenericCacheManager _genericCacheManager;
      private static object _thisLock = new object();

      private SiteSettings _siteSettings;
      private ICacheProvider _cacheProvider;
      private const bool DEFAULT_USE_CACHE = false;

      #endregion

      #region Constructors

      /// <summary>
      /// Initializes a new instance of the <see cref="GenericCacheManager"/> class.
      /// </summary>
      private GenericCacheManager() {
          ReloadGenericCacheManager();
      }

      #endregion
      
      #region Methods

      /// <summary>
      /// Gets a instance of this class.
      /// </summary>
      /// <returns></returns>
      public static GenericCacheManager GetInstance() {
          if (_genericCacheManager == null) {
              lock (_thisLock) {
                  if (_genericCacheManager == null) {
                      _genericCacheManager = new GenericCacheManager();
                  }
              }
          }
          return _genericCacheManager;
      }

      /// <summary>
      /// Reloads the generic cache manager.
      /// </summary>
      private void ReloadGenericCacheManager() {
          bool _useCache = DEFAULT_USE_CACHE;
          _siteSettings = SiteSettings.Load();
          if (_siteSettings != null) //site setting is not yet loaded
              _useCache = _siteSettings.UseCaching;

          _cacheProvider = SetCacheSettings(_useCache);
      }

      /// <summary>
      /// Sets the cache settings.
      /// </summary>
      /// <param name="useCache">if set to <c>true</c> [use cache].</param>
      private ICacheProvider SetCacheSettings(bool useCache) {
          if (useCache)
              return new HttpRuntimeCache();
          else
              return new NullCache();
      }
      #endregion

      #region Properties

      /// <summary>
      /// Gets or sets the site settings.
      /// </summary>
      /// <value>The site settings.</value>
      public SiteSettings SiteSettings {
          get { return _siteSettings; }
          set { _siteSettings = value; }
      }

      /// <summary>
      /// Gets or sets the cache provider.
      /// </summary>
      /// <value>The cache provider.</value>
      public ICacheProvider CacheProvider {
          get { return _cacheProvider; }
          private set { _cacheProvider = value; }
      }

      /// <summary>
      /// Reloads the cache provider and its settings.
      /// </summary>
      public void ReloadCacheProvider() {
          ReloadGenericCacheManager();
      }

      #endregion
  }
}
