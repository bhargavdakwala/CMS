using System;
using System.Text.RegularExpressions;
using System.Configuration;
using URLRewriter.Config;
using System.Data;
using System.Data.Sql;
using System.Web;
using System.Web.UI;
using System.Web.Caching;

namespace URLRewriter
{
    /// <summary>
    /// Provides a rewriting HttpModule.
    /// </summary>
    public class ModuleRewriter : BaseModuleRewriter
    {

        DataSet ds = null;
        int Result = 0;
        int ID = 0;

        /// <summary>
        /// This method is called during the module's BeginRequest event.
        /// </summary>
        /// <param name="requestedRawUrl">The RawUrl being requested (includes path and querystring).</param>
        /// <param name="app">The HttpApplication instance.</param>
        protected override void Rewrite(string requestedPath, System.Web.HttpApplication app)
        {
          

            string redirectID = string.Empty;
            // log information to the Trace object.
            app.Context.Trace.Write("ModuleRewriter", "Entering ModuleRewriter");

           

            

            // get the configuration rules
            RewriterRuleCollection rules = RewriterConfiguration.GetConfig().Rules;

            // iterate through each rule...
            for (int i = 0; i < rules.Count; i++)
            {
                // get the pattern to look for, and Resolve the Url (convert ~ into the appropriate directory)

                string lookFor = "^" + RewriterUtils.ResolveUrl(app.Context.Request.ApplicationPath, rules[i].LookFor) + "$";

                //string pageNames = "/test" + lookFor;

                // Create a regex (note that IgnoreCase is set...)
                Regex re = new Regex(lookFor, RegexOptions.IgnoreCase);

                // See if a match is found
                if (re.IsMatch(requestedPath))
                {
                    if (requestedPath.ToLower() != "/default.aspx" && requestedPath.ToLower() != "/Test.aspx" && requestedPath.ToLower() != "/Home.aspx" && !requestedPath.ToLower().Contains("admin") && !requestedPath.ToLower().Contains("/resources/submodal/loading") && requestedPath != "/readmore-test.aspx" && requestedPath != "/Sitemap.aspx" && requestedPath != "/test.aspx" && requestedPath != "/404Error.aspx" && requestedPath != "/FCKeditor/editor/filemanager/connectors/aspx/connector.aspx")
                    {
                        

                        if (requestedPath.Contains(".aspx"))
                        {
                            char[] separator = new char[] { '.' };
                            string[] strSplitArr = requestedPath.Split(separator);

                            //Get RedirectID is base on URLTitle

                           

                            this.GetIdFromPageName(strSplitArr[0]);
                            redirectID = Convert.ToString(ID);

                        }
                    }

                    // match found - do any replacement needed
                    string sendToUrl = RewriterUtils.ResolveUrl(app.Context.Request.ApplicationPath, re.Replace(requestedPath, rules[i].SendTo));
                    if (redirectID == "0")
                    {
                        sendToUrl = "/404Error.aspx";
                    }
                    else if (requestedPath.ToLower() != "/default.aspx" && requestedPath.ToLower() != "/Test.aspx" && requestedPath.ToLower() != "/Home.aspx" && !requestedPath.ToLower().Contains("admin") && !requestedPath.ToLower().Contains("/resources/submodal/loading") && requestedPath != "/readmore-test.aspx" && requestedPath != "/Sitemap.aspx" && requestedPath != "/test.aspx" && requestedPath != "/404Error.aspx" && requestedPath != "/FCKeditor/editor/filemanager/connectors/aspx/connector.aspx")
                    {
                        if (requestedPath.Contains(".aspx"))
                        {
                            //sendToUrl = "/default.aspx?pageId=" + redirectID;

                            //if (requestedPath == "/jewellery-perth-gallery.aspx")
                            //{
                            //    sendToUrl = "ImageGallery.aspx";
                            //    Result = 0;
                            //    ID = 0;
                            //}

                            if (Result == 1)
                            {
                                sendToUrl = "/Home.aspx?pageId=" + redirectID;
                            }
                            else if (Result == 2)
                            {
                                sendToUrl = "/catalog.aspx?cid=" + redirectID;
                            }

                            else if (Result == 3)
                            {
                                sendToUrl = "/TherapiststList.aspx?mid=" + redirectID;
                                // sendToUrl = "/catalog.aspx";

                            }
                            else if (Result == 4)
                            {
                                sendToUrl = "/BlogList.aspx?blog=" + redirectID;
                            }

                            else if (Result == 5)
                            {
                                sendToUrl = "/BlogList.aspx?blogcatid=" + redirectID;
                            }
                        }
                    }
                    else
                    {
                        sendToUrl = requestedPath;
                    }

                    // log rewriting information to the Trace object
                    app.Context.Trace.Write("ModuleRewriter", "Rewriting URL to " + sendToUrl);

                    // Rewrite the URL
                    RewriterUtils.RewriteUrl(app.Context, sendToUrl);
                    break;		// exit the for loop
                }
            }

            // Log information to the Trace object
            app.Context.Trace.Write("ModuleRewriter", "Exiting ModuleRewriter");
        }

        private void GetIdFromPageName(string urlTitle)
        {
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetCountByURLTitle(urlTitle);
            ds = sp.GetDataSet();
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["ID"].ToString() != "" || ds.Tables[0].Rows[0]["Result"].ToString() != "")
                {
                    ID = Convert.ToInt32(ds.Tables[0].Rows[0]["ID"]);
                    Result = Convert.ToInt32(ds.Tables[0].Rows[0]["Result"]);
                }
                else
                {
                    ID = 0;
                    Result = 0;
                }
            }

        }


    }
}
