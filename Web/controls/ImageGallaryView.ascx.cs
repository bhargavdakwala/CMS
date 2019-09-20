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


namespace Etech.CMS.Web.controls
{
    public partial class ImageGallaryView : ProviderControl
    {

        #region Varibles
    
        int noOfRecodes = 0;
        int currentIndex = 0;
        int lastIndex = 0;
        int ImageID = 0;

        DataSet ds;

        #endregion Varibles

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                ImageID = Convert.ToInt32(Request.QueryString["ImageID"]);
                if (ImageID == 0)
                {
                    ImageID = GetImageID();
                }
                ViewState["photoID"] = ImageID;
                BindBata();
                DefaultBind();
            }

            if (Convert.ToInt32(ViewState["photoID"]) != null)
            {
                ImageID = Convert.ToInt32(ViewState["photoID"]);
                int currentIndex = GetCurrentPageID();
                ViewState["currentIndex"] = currentIndex;
            }
        }

        #endregion Page_Load

        #region Method
       
        public void ShowNext(object s, EventArgs e)
        {
            int sotrID = 0;
            currentIndex = Convert.ToInt32(ViewState["currentIndex"]);
            noOfRecodes = Convert.ToInt32(ViewState["noOfRecodes"]);
            if (currentIndex + 1 <= this.noOfRecodes)
            {
                ImageID = currentIndex + 1;

                DataSet dsSortID = new DataSet();
                dsSortID = (DataSet)Cache["Data"];

                for (int i = 0; i < dsSortID.Tables[0].Rows.Count; i++)
                {
                    if (ImageID == Convert.ToInt32(dsSortID.Tables[0].Rows[i]["SortOrder"]))
                    {
                        sotrID = Convert.ToInt32(dsSortID.Tables[0].Rows[i]["ImageID"]);
                    }

                }
                ImageID = sotrID;
                ViewState["photoID"] = ImageID;
                BindBata();

            }

        }

        public void ShowPrevious(object s, EventArgs e)
        {
            int sotrID = 0;

            currentIndex = Convert.ToInt32(ViewState["currentIndex"]);
            noOfRecodes = Convert.ToInt32(ViewState["noOfRecodes"]);
            if (lastIndex < currentIndex - 1)
            {
                ImageID = currentIndex - 1;

                DataSet dsSortID = new DataSet();
                dsSortID = (DataSet)Cache["Data"];

                for (int i = 0; i < dsSortID.Tables[0].Rows.Count; i++)
                {
                    if (ImageID == Convert.ToInt32(dsSortID.Tables[0].Rows[i]["SortOrder"]))
                    {
                        sotrID = Convert.ToInt32(dsSortID.Tables[0].Rows[i]["ImageID"]);
                    }

                }
                ImageID = sotrID;

                ViewState["photoID"] = ImageID;
                BindBata();
                
            }
            else
            {
            }

        }

        private int GetCurrentPageID()
        {
            int RowID = 0;

            DataSet ds = new DataSet();
            ds = (DataSet)Cache["Data"];

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                if (Convert.ToInt32(ImageID) == Convert.ToInt32(ds.Tables[0].Rows[i]["ImageID"]))
                {
                    //RowID = Convert.ToInt32(ds.Tables[0].Rows[i]["RowNumber"]);
                    RowID = Convert.ToInt32(ds.Tables[0].Rows[i]["SortOrder"]);
                    ViewState["photoID"] = Convert.ToInt32(ds.Tables[0].Rows[i]["ImageID"]);
                }
            }
            return RowID;
        }

        private void BindBata()
        {

            ds = new DataSet();
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.FetchAllImageGallary(ImageID);
            ds = (DataSet)sp.GetDataSet();

            if (!Page.IsPostBack)
            {
                ds = (DataSet)sp.GetDataSet();
                ds = null;

            }

            ds = (DataSet)sp.GetDataSet();

            lvPhotoViewer.DataSource = ds.Tables[0].DefaultView;
            lvPhotoViewer.DataBind();
        }

        private void DefaultBind()
        {
            DataSet ds = new DataSet();
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.FetchAllImageGallary(0);
            ds = (DataSet)sp.GetDataSet();
            if (!Page.IsPostBack)
            {
                noOfRecodes = ds.Tables[0].Rows.Count;
                ViewState["noOfRecodes"] = noOfRecodes;
               
               
            }
            Cache["Data"] = ds;
        }

        private int GetImageID()
        {
            int imgeID = 0;
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetImageIDFromGallary();
            imgeID = Convert.ToInt32(sp.ExecuteScalar());
            return imgeID;

        }

        #endregion Method

    }
}