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
using System.Drawing;
using System.Web.Services;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using Etech.CMS.Content;
using Etech.CMS.Store;
using Etech.CMS.Store.Caching;
using Etech.CMS.Store.Services.MessageService;


namespace Etech.CMS.Web.controls.content
{
    public partial class ContactUs : ProviderControl
    {



        protected void Page_Load(object sender, EventArgs e)
        {
            GoogleMapForASPNet1.GoogleMapObject.APIKey = "ABQIAAAA05Pcu-jGM29FtBWfap1CsxRZmYI4aanJYzOxu1uvt70jmOKX9hSjEiwIMDN5J-FeIZ6jRf3Jbqvb2Q";//ConfigurationManager.AppSettings["GoogleAPIKey"];
            //Specify width and height for map. You can specify either in pixels or in percentage relative to it's container.
            GoogleMapForASPNet1.GoogleMapObject.Width = "490px"; // You can also specify percentage(e.g. 80%) here
            GoogleMapForASPNet1.GoogleMapObject.Height = "176px";

            //Specify initial Zoom level.
            GoogleMapForASPNet1.GoogleMapObject.ZoomLevel = 14;

            //Specify Center Point for map. Map will be centered on this point.
            GoogleMapForASPNet1.GoogleMapObject.CenterPoint = new GooglePoint("1", -31.8306124, 115.7752703);

            //Add pushpins for map. 
            //This should be done with intialization of GooglePoint class. 
            //ID is to identify a pushpin. It must be unique for each pin. Type is string.
            //Other properties latitude and longitude.
            GooglePoint GP1 = new GooglePoint();
            GP1.ID = "1";
            GP1.Latitude = -31.8349438;
            GP1.Longitude = 115.7839451;
            GP1.IconImage = "images/mtm_logo.png";
            //GP1.InfoHTML = "iSolution Technology</br>Suite 1, 101 Scarborough Beach Road</br>Mt Hawthorn</br>WA<br>WA 6016";
            GP1.InfoHTML = "Suite 1,64 Arnisdale Road,Duncraig,Western Australia 6023";
            
            GoogleMapForASPNet1.GoogleMapObject.Points.Add(GP1);

        }
    }
}