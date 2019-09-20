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
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using Etech.CMS.Core;
using Etech.CMS.Store;
//using Etech.CMS.Store.Profile;

namespace Etech.CMS.Web {
  public class WebUtility {

    #region Const

    private const string MAIN_TITLE_TEMPLATE = "{0} :: {1}";

    #endregion

    #region Methods

    #region Public

    /// <summary>
    /// Gets the name of the user.
    /// If the User didn't login it will return a Anonymous ID.
    /// If its the first Request to the site then it will give the user an Anonymous ID.
    /// </summary>
    /// <returns></returns>
    public static string GetUserName() {
      string userName = HttpContext.Current.Profile.UserName;
      if (HttpContext.Current.User.Identity.IsAuthenticated) {
        userName = HttpContext.Current.User.Identity.Name;
      }
      if (!HttpContext.Current.User.Identity.IsAuthenticated) {
        HttpCookie cookie = HttpContext.Current.Response.Cookies.Get(FormsAuthentication.FormsCookieName);
        if (cookie != null) {
          if (!string.IsNullOrEmpty(cookie.Value)) {
            userName = FormsAuthentication.Decrypt(cookie.Value).Name;
          }
        }
      }
      return userName;
    }

    /// <summary>
    /// Gets the Current Session id.
    /// </summary>
    /// <returns>The SessionID of the current request.</returns>
    public static string SessionId() {
      return System.Web.HttpContext.Current.Session.SessionID;
    }

    /// <summary>
    /// Ensures that the browser is connected using SSL if not it redirects the browser to https://CURRENT_URL.
    /// It does not redirect if the request is coming from the same IP as the site (development mode (i.e. localhost)).
    /// </summary>
    public static void EnsureSsl() {
      Uri currentUrl = HttpContext.Current.Request.Url;
      if (!currentUrl.IsLoopback) {//Don't check when in development mode (i.e. localhost)
        if (!currentUrl.Scheme.Equals("https", StringComparison.CurrentCultureIgnoreCase) && HttpContext.Current.Request.ServerVariables["HTTP_CLUSTER_HTTPS"] != "on") {
          UriBuilder uriBuilder = new UriBuilder(currentUrl);
          uriBuilder.Scheme = "https";
          uriBuilder.Port = -1;
          HttpContext.Current.Response.Redirect(uriBuilder.Uri.ToString(), true);
        }
      }
    }

    /// <summary>
    /// Removes the QueryString from the URL of the Current Request.
    /// </summary>
    /// <returns></returns>
    public static string ScrubUrl() {
      string url = HttpContext.Current.Request.Url.ToString();
      int resultPosition = url.IndexOf("?");
      if (resultPosition > -1) {
        url = url.Substring(0, resultPosition);
      }
      return url;
    }

    //Many thanks to Paul Ingles for this Code
    //http://www.codeproject.com/aspnet/creditcardvalidator.asp
    //Modified by Spook, 3/2006
    /// <summary>
    /// Determines whether <see cref="cardNumber"/> is a valid for the <see cref="cardType"/>.
    /// </summary>
    /// <param name="cardNumber">The card number.</param>
    /// <param name="cardType">Type of the card.</param>
    /// <returns>
    /// 	<c>true</c> if [is valid card type] [the specified card number]; otherwise, <c>false</c>.
    /// </returns>
    public static bool IsValidCardType(string cardNumber, CreditCardType cardType) {
      bool validCardType = true;

      // AMEX -- 34 or 37 -- 15 length
      if (Regex.IsMatch(cardNumber, "^(34|37)") && (cardType == CreditCardType.Amex))
        validCardType = 15 == cardNumber.Length;

      // MasterCard -- 51 through 55 -- 16 length
      else if (Regex.IsMatch(cardNumber, "^(51|52|53|54|55)") && (cardType == CreditCardType.MasterCard))
        validCardType = 16 == cardNumber.Length;

      // VISA -- 4 -- 13 and 16 length
      else if (Regex.IsMatch(cardNumber, "^(4)") && (cardType == CreditCardType.VISA))
        validCardType = 13 == cardNumber.Length || 16 == cardNumber.Length;

      // Discover -- 6011 -- 16 length
      else if (Regex.IsMatch(cardNumber, "^(6011)") && (cardType == CreditCardType.Discover))
        validCardType = 16 == cardNumber.Length;

      return validCardType;
    }

    /// <summary>
    /// Adds and removes keys from the QueryString using the passed in values.
    /// Adding/Updating the <see cref="keyToAdd"/> in the result.
    /// Removing the values that are in <see cref="keysToRemove"/> from the result.
    /// </summary>
    /// <param name="queryString">The query string.</param>
    /// <param name="keyToAdd">The key to add.</param>
    /// <param name="valueToAdd">The value to add.</param>
    /// <param name="keysToRemove">The keys to remove.</param>
    /// <returns>Return a string formated as a QueryString</returns>
    public static string AddRemoveFromQueryString(NameValueCollection queryString, string keyToAdd, string valueToAdd, params string[] keysToRemove) {
      StringBuilder queryStringText = new StringBuilder("?");
      const string QUERYSTRING_FORMAT = "{0}={1}";
      string currentKey;
      List<string> removeStrings = new List<string>(keysToRemove);

      for (int i = 0; i < queryString.Count; i++) {
        currentKey = queryString.GetKey(i);
        if (removeStrings.Contains(currentKey) || currentKey == keyToAdd)
          continue;
        queryStringText.Append(string.Format(QUERYSTRING_FORMAT, queryString.GetKey(i), queryString.Get(i)));
        queryStringText.Append("&");
      }
      queryStringText.Append(string.Format(QUERYSTRING_FORMAT, keyToAdd, valueToAdd));
      return queryStringText.ToString();
    }

    /// <summary>
    /// Gets and creates thumbnail.
    /// </summary>
    /// <param name="width">The width.</param>
    /// <param name="height">The height.</param>
    /// <param name="imagePath">The image path.</param>
    /// <returns></returns>
    public static string GetAndCreateProductThumbnail(int width, int height, string imagePath) {
      string thumbnail = imagePath.Replace("product/", string.Format("product/thumbs/{0}x{1}_", width, height));
      HttpServerUtility server = CurrentHttpContext.Server;
      if (!File.Exists(server.MapPath(thumbnail))) {
        if (File.Exists(server.MapPath(imagePath))) {
          //Thumbnails don't exist so lets generate them...
          string fileName = imagePath.Substring(imagePath.LastIndexOf("/") + 1);
          using (FileStream fs = File.Open(server.MapPath(imagePath), FileMode.Open, FileAccess.Read, FileShare.None)) {
            ImageProcess.ResizeAndSave(fs, fileName, server.MapPath(@"~/repository/product/thumbs/"), width, height);
    }
        }
        else {
          return imagePath;
        }
      }
      return thumbnail;
    }

    #endregion

    #endregion

    #region Properties

    /// <summary>
    /// Gets the main title template.
    /// </summary>
    /// <value>The main title template.</value>
    public static string MainTitleTemplate {
      get {
        //Get this from a Resource language file or from the SiteSettings.
        return MAIN_TITLE_TEMPLATE;
      }
    }

    /// <summary>
    /// Gets the current HTTP context.
    /// </summary>
    /// <value>The current HTTP context.</value>
    public static HttpContext CurrentHttpContext {
      get {
        return HttpContext.Current;
      }
    }

    #endregion

  }
}
