using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Drawing;
using System.Web.Services;

namespace Etech.CMS.Web.controls.content
{
    public partial class GoogleMapForASPNet : System.Web.UI.UserControl
    {
        public delegate void PushpinMovedHandler(string pID);
        public event PushpinMovedHandler PushpinMoved;

        public void OnPushpinMoved(string pID)
        {
            // Check if there are any Subscribers
            if (PushpinMoved != null)
            {
                // Call the Event
                GoogleMapObject = (GoogleObject)System.Web.HttpContext.Current.Session["GOOGLE_MAP_OBJECT"];
                PushpinMoved(pID);
            }
        }
        #region Properties

        GoogleObject _googlemapobject = new GoogleObject();
        public GoogleObject GoogleMapObject
        {
            get { return _googlemapobject; }
            set { _googlemapobject = value; }
        }


        bool _showcontrols = false;
        public bool ShowControls
        {
            get { return _showcontrols; }
            set { _showcontrols = value; }
        }


        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

            //Console.Write(hidEventName.Value);
            //Console.Write(hidEventValue.Value);
            //Fire event for Pushpin Move
            if (hidEventName.Value == "PushpinMoved")
            {
                //Set event name to blank string, so on next postback same event doesn't fire again.
                hidEventName.Value = "";
                OnPushpinMoved(hidEventValue.Value);
            }
            if (!IsPostBack)
            {
                //GoogleMapObject.APIKey = "ABQIAAAAGM9-mpvzHRDXoXxamFqJIhT4FnILLDSvKvEy-q_KT9EFFEahwxRJWpmNjm2ySP7595K5kC7jx4zX5A";
                Session["GOOGLE_MAP_OBJECT"] = GoogleMapObject;

            }
            else
            {
                GoogleMapObject = (GoogleObject)Session["GOOGLE_MAP_OBJECT"];
                if (GoogleMapObject == null)
                {
                    GoogleMapObject = new GoogleObject();
                    Session["GOOGLE_MAP_OBJECT"] = GoogleMapObject;
                }

            }
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "onLoadCall", "<script language='javascript'> if (window.DrawGoogleMap) { DrawGoogleMap(); } </script>");
        }
    }
}