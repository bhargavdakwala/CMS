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
using System.IO;
using System.Web.UI.WebControls;
using Etech.CMS.Core;
using Etech.CMS.Localization;
using Etech.CMS.Store;
using Etech.CMS.Store.Web;
using Etech.CMS.Store.Web.Controls;
using System.Data;
using Etech.CMS.Content;
using Etech.CMS.Store.Caching;
using Etech.CMS.Web.controls.catalog;
using Etech.CMS.Web.controls.content.products;
using SubSonic.Utilities;

namespace Etech.CMS.Web.controls.content.products
{
    public partial class ViewCustomizedProductsDisplay : ProviderControl
    {

        #region Page Events
        PagedDataSource pagedDataSource = new PagedDataSource();
        private int ProductID = 0;
        DataSet ds;
        private int CurrentPage
        {
            get
            {
                object objPage = ViewState["_CurrentPage"];
                int _CurrentPage = 0;
                if (objPage == null)
                {
                    _CurrentPage = 0;
                }
                else
                {
                    _CurrentPage = (int)objPage;
                }
                return _CurrentPage;
            }
            set { ViewState["_CurrentPage"] = value; }
        }
        private int fistIndex
        {
            get
            {

                int _FirstIndex = 0;
                if (ViewState["_FirstIndex"] == null)
                {
                    _FirstIndex = 0;
                }
                else
                {
                    _FirstIndex = Convert.ToInt32(ViewState["_FirstIndex"]);
                }
                return _FirstIndex;
            }
            set { ViewState["_FirstIndex"] = value; }
        }
        private int lastIndex
        {
            get
            {

                int _LastIndex = 0;
                if (ViewState["_LastIndex"] == null)
                {
                    _LastIndex = 0;
                }
                else
                {
                    _LastIndex = Convert.ToInt32(ViewState["_LastIndex"]);
                }
                return _LastIndex;
            }
            set { ViewState["_LastIndex"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindItemsList();

                #region custom product display
                //   CustomizedProductDisplay cpd = new CustomizedProductDisplay(CustomizedProductDisplay.Columns.RegionId, base.RegionId);

                //   CustomizedProductDisplayTypeProductMapCollection cpdmColl = new CustomizedProductDisplayTypeProductMapCollection()
                //     .Where(CustomizedProductDisplayTypeProductMap.Columns.CustomizedProductDisplayTypeId, cpd.CustomizedProductDisplayTypeId)
                //     .Load();

                //////string strDV = "<div class='floatLeft contentbox'>";

                //   System.Web.UI.WebControls.Panel pnl = null;
                //   for (int i = 1; i < cpdmColl.Count; i++)
                //   {
                //       if (i % 2 != 0)
                //       {
                //           if (pnl == null)
                //               pnl = new System.Web.UI.WebControls.Panel();

                //           pnl.CssClass = "floatLeft contentbox";
                //           ProductItem ctrl = (ProductItem)LoadControl("~/controls/content/products/ProductItem.ascx");
                //           ctrl.CurrentProduct = LoadProduct(cpdmColl[i].ProductId);
                //           pnl.Controls.Add(ctrl);

                //           pnl1.Controls.Add(pnl);

                //           if (i < cpdmColl.Count - 1)
                //           {
                //               ProductItem ctrl1 = (ProductItem)LoadControl("~/controls/content/products/ProductItem.ascx");
                //               ctrl1.CurrentProduct = LoadProduct(cpdmColl[i + 1].ProductId);
                //               pnl.Controls.Add(ctrl1);
                //               pnl1.Controls.Add(pnl);

                //               pagedDataSource.AllowPaging = true;

                //               pagedDataSource.CurrentPageIndex = CurrentPage;
                //               pagedDataSource.DataSource = cpdmColl;

                //               pagedDataSource.PageSize = 4;
                //               ViewState["TotalPages"] = pagedDataSource.PageCount;

                //               //dlProducts.DataSource = pagedDataSource;
                //               //dlProducts.DataBind();
                //               this.doPaging();
                //           }
                //           else
                //           {
                //               System.Web.UI.WebControls.Panel blankPanel0 = new System.Web.UI.WebControls.Panel();
                //               blankPanel0.CssClass = "floatLeft range";
                //               blankPanel0.Style.Add("border", "none");
                //               blankPanel0.Style.Add("float", "right");
                //               System.Web.UI.WebControls.Panel blankPanel1 = new System.Web.UI.WebControls.Panel();
                //               blankPanel1.CssClass = "floatLeft viewmore";

                //               blankPanel1.Style.Add("background", "none");
                //               blankPanel0.Controls.Add(blankPanel1);
                //               System.Web.UI.WebControls.Panel blankPanel2 = new System.Web.UI.WebControls.Panel();
                //               blankPanel2.CssClass = "floatRight productInfo";
                //               blankPanel0.Controls.Add(blankPanel2);
                //               pnl.Controls.Add(blankPanel0);
                //               pnl1.Controls.Add(pnl);


                //               pagedDataSource.AllowPaging = true;

                //               pagedDataSource.CurrentPageIndex = CurrentPage;
                //               pagedDataSource.DataSource = cpdmColl;

                //               pagedDataSource.PageSize = 4;
                //               ViewState["TotalPages"] = pagedDataSource.PageCount;

                //               //dlProducts.DataSource = pagedDataSource;
                //               //dlProducts.DataBind();
                //               this.doPaging();
                //           }
                //       }
                //       else
                //       {
                //           pnl = null;

                //       }
                //   }
                #endregion
            }
        }
        public void BindItemsList()
        {
            //CustomizedProductDisplay cpd = new CustomizedProductDisplay(CustomizedProductDisplay.Columns.RegionId, base.RegionId);

            //CustomizedProductDisplayTypeProductMapCollection cpdmColl = new CustomizedProductDisplayTypeProductMapCollection()
            //  .Where(CustomizedProductDisplayTypeProductMap.Columns.CustomizedProductDisplayTypeId, cpd.CustomizedProductDisplayTypeId)
            //  .Load();
            SubSonic.StoredProcedure sp = Etech.CMS.Store.SPs.GetProductHomepage();
            ds = (DataSet)sp.GetDataSet();

            dlProducts.DataSource = ds;
            dlProducts.DataBind();

            //dlProducts.DataSource = cpdmColl;
            //dlProducts.DataBind();

            pagedDataSource.AllowPaging = false;

            pagedDataSource.CurrentPageIndex = CurrentPage;
            pagedDataSource.DataSource = ds.Tables[0].DefaultView;

            pagedDataSource.PageSize = 6;
            ViewState["TotalPages"] = pagedDataSource.PageCount;

            dlProducts.DataSource = pagedDataSource;
            dlProducts.DataBind();
            this.doPaging();

        }

        private void doPaging()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("PageIndex");
            dt.Columns.Add("PageText");

            fistIndex = CurrentPage - 5;


            if (CurrentPage > 5)
            {
                lastIndex = CurrentPage + 5;
            }
            else
            {
                lastIndex = 10;
            }
            if (lastIndex > Convert.ToInt32(ViewState["TotalPages"]))
            {
                lastIndex = Convert.ToInt32(ViewState["TotalPages"]);
                fistIndex = lastIndex - 10;
            }

            if (fistIndex < 0)
            {
                fistIndex = 0;
            }

            for (int i = fistIndex; i < lastIndex; i++)
            {
                DataRow dr = dt.NewRow();
                dr[0] = i;
                dr[1] = i + 1;
                dt.Rows.Add(dr);
            }

            this.dlPaging.DataSource = dt;
            this.dlPaging.DataBind();
        }
        protected void lbtnNext_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            this.BindItemsList();
        }
        protected void lbtnPrevious_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            this.BindItemsList();
        }
        protected void dlPaging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("Paging"))
            {
                CurrentPage = Convert.ToInt16(e.CommandArgument.ToString());
                this.BindItemsList();
            }
        }
        protected void dlPaging_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            //{
            //    LinkButton lnkbtnPage = (LinkButton)e.Item.FindControl("lnkbtnPaging");
            //    if (lnkbtnPage.CommandArgument.ToString() == CurrentPage.ToString())
            //    {
            //        lnkbtnPage.Enabled = false;
            //        lnkbtnPage.Style.Add("fone-size", "14px");
            //        lnkbtnPage.Font.Bold = true;

            //    }
            //}
        }
        protected void lbtnLast_Click(object sender, EventArgs e)
        {

            CurrentPage = (Convert.ToInt32(ViewState["TotalPages"]) - 1);
            this.BindItemsList();

        }
        protected void lbtnFirst_Click(object sender, EventArgs e)
        {

            CurrentPage = 0;
            this.BindItemsList();


        }
        #endregion

        #region Methods

        /// <summary>
        /// Loads the product.
        /// </summary>
        /// <param name="productId">The product id.</param>
        /// <returns></returns>
        //protected Product s(int productId)
        //{   
        //    return ProductCache.GetProductByProductID(productId);
        //}
        protected Product LoadProduct(int productId)
        {
            return ProductCache.GetProductByProductID(productId);
        }
        #endregion

        protected void dlProducts_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            //{

            //    ProductItem ctrl1 = (ProductItem)LoadControl("~/controls/content/products/ProductItem.ascx");
            //    ctrl1.CurrentProduct = LoadProduct(Convert.ToInt32(dlProducts.DataKeys[e.Item.ItemIndex]));
            //}
        }

    }
}