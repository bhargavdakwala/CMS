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
using System.Web.Profile;
using System.Web.Security;
using Etech.CMS.Core;
using Etech.CMS.Core.Caching;
using Etech.CMS.Store;
using System.Web;

namespace Etech.CMS.Web {
  public class Global : System.Web.HttpApplication {

    /// <summary>
    /// Handles the Start event of the Application control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="T:System.EventArgs"/> instance containing the event data.</param>
    protected void Application_Start(object sender, EventArgs e) {

    }


    protected void Application_BeginRequest(object sender, EventArgs e)
    {
        string FromHomeURL = "http://ahscawa.com.au/";
        string ToHomeURL = "http://www.ahscawa.com.au/";
        string url = this.Request.Url.AbsoluteUri.ToLower().Trim();

      
      
        if (HttpContext.Current.Request.Url.ToString().ToLower().Contains(FromHomeURL))
        {
            HttpContext.Current.Response.Status = "301 Moved Permanently";
            HttpContext.Current.Response.AddHeader("Location", Request.Url.ToString().ToLower().Replace(FromHomeURL, ToHomeURL));
        }
        else if (url == "http://www.ahscawa.com.au/home.aspx?pageid=237&pageid=237")
        {
            //HttpContext.Current.Response.Redirect("http://www.mtmphysio.com.au/Home.aspx");
            HttpContext.Current.Response.Redirect("http://www.ahscawa.com.au/");
        }
       /* else if (HttpContext.Current.Request.QueryString["publicationid"].ToString() == "Publication" && HttpContext.Current.Request.QueryString["id"].ToString()=="1")
        {
            HttpContext.Current.Response.Status = "301 Moved Permanently";
            HttpContext.Current.Response.AddHeader("Location", "ahsca-hydraulic-services.aspx");
        }*/
        
        /*else if (url == "http://www.ahscawa.com.au/home.aspx?pageid=237")
        {
            //HttpContext.Current.Response.Redirect("http://www.mtmphysio.com.au/Home.aspx");
            HttpContext.Current.Response.Redirect("http://www.ahscawa.com.au/");
        }*/

       
    }
    /// <summary>
    /// Handles the End event of the Application control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="T:System.EventArgs"/> instance containing the event data.</param>
    protected void Application_End(object sender, EventArgs e) { }

    protected void Application_Error(object sender, EventArgs e) {
      // Code that runs when an unhandled error occurs
      Logger.LogMessageType msgType = Logger.LogMessageType.Error;
      Exception exAppError = Server.GetLastError();
      bool logException = true;
      Exception baseException = exAppError.GetBaseException();
      if (baseException is System.Data.SqlClient.SqlException && baseException.Message.StartsWith("Timeout expired")) {
        msgType = Logger.LogMessageType.DatabaseError; //Database timeout error.
      }
      else if (baseException is System.Web.HttpException && baseException.Message.EndsWith("does not exist.")) {
        msgType = Logger.LogMessageType.Warning; //404 Errors not really and error but might be usefull to log them.
      }
      else if (baseException is System.Security.Cryptography.CryptographicException && baseException.Message.StartsWith("Padding is invalid")) {
        logException = false; //Googlebots can fire these exceptions it's safe to ignore them.
      }
      if (logException)
        Logger.Error(exAppError.Message, exAppError, msgType);
    }

    /// <summary>
    /// Handles the PreRequestHandlerExecute event of the Application control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="T:System.EventArgs"/> instance containing the event data.</param>
    protected void Application_PreRequestHandlerExecute(object sender, EventArgs e) {
      SiteSettings siteSettings = null;
      try {
        siteSettings = SiteSettingCache.GetSiteSettings();
      }
      catch (Exception) {
        //swallow it - probably no connection string during install
      }

      string cultureName = ""; //default this. TODO: Get this into installer?
      if (siteSettings != null) {
        cultureName = siteSettings.Language ?? cultureName;
      }
      System.Threading.Thread.CurrentThread.CurrentCulture = System.Globalization.CultureInfo.CreateSpecificCulture(cultureName);
      System.Threading.Thread.CurrentThread.CurrentUICulture = System.Threading.Thread.CurrentThread.CurrentCulture;
    }

    /// <summary>
    /// Handles the OnMigrateAnonymous event of the Profile control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="args">The <see cref="T:System.Web.Profile.ProfileMigrateEventArgs"/> instance containing the event data.</param>
    public void Profile_OnMigrateAnonymous(object sender, ProfileMigrateEventArgs args) {
      OrderController.MigrateCart(args.AnonymousID, WebProfile.Current.UserName);
      ProfileManager.DeleteProfile(args.AnonymousID);
      AnonymousIdentificationModule.ClearAnonymousIdentifier();
    }
  }
}
