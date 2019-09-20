using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

namespace Etech.CMS.Web.controls.content
{
    public partial class ServiceHomeImages : System.Web.UI.UserControl
    {
        DataSet dsServiceImage;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindServiceHomeImage();
            }
        }

        private void BindServiceHomeImage()
        {
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetServiceHomeImages();
            dsServiceImage = sp.GetDataSet();

            rptServiceHomeImage.DataSource = dsServiceImage;
            rptServiceHomeImage.DataBind();
        }

        protected string Geturl(object obj)
        {
            return ConfigurationManager.AppSettings["siteRoot"].ToString() + "/" + obj + ".aspx";
        }

    }
}