using System;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Etech.CMS.Core;
using Etech.CMS.Localization;
using Etech.CMS.Store.Web.Controls;
using SubSonic;
using SubSonic.Utilities;
using Etech.CMS.Content;
using System.Collections.Generic;
using Etech.CMS.Core.IO;
using Img = System.Drawing;

namespace Etech.CMS.Web.admin.controls.Gallary
{
    public partial class ImageGallary : AdminControl
    {
        private int imageId = 0;
        private string view = string.Empty;
        DataSet ds;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {


                SetImagesProperties();
                SetThumbImagesProperties();
                if (!Page.IsPostBack)
                {
                    LoadGalleryTitle();
                  
                    LoadProductImages();
                    pnlImages.Visible = true;
                    pnlEditPage.Visible = false;
                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(ImageGallary).Name + ".Page_Load", ex);
                base.MasterPage.MessageCenter.DisplayCriticalMessage(ex.Message);
            }
        }
        public bool ThumbnailCallback()
        {
            return true;
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string imageId = lblImageId.Text;
                    Where where = new Where();
                    where.ColumnName = Content.ImageGallary.Columns.ImageID;
                    where.DbType = DbType.Int32;
                    where.ParameterValue = imageId;
                    Query query = new Query(Content.ImageGallary.Schema);
                    object strSortOrder = query.GetMax(Content.ImageGallary.Columns.SortOrder, where);

                    DataSet dsSortOrder = new DataSet();
                    SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetMaxSortOrderID();
                    dsSortOrder = (DataSet)sp.GetDataSet();
                    int maxSortOrder = Convert.ToInt32(dsSortOrder.Tables[0].Rows[0]["MaxSortOrder"]);

                    //int.TryParse(strSortOrder.ToString(), out maxSortOrder);
                    Content.ImageGallary imagegallary;
                    if (!string.IsNullOrEmpty(imageId))
                    {
                        imagegallary = new Content.ImageGallary(imageId);
                    }
                    else
                    {
                        imagegallary = new Content.ImageGallary();
                        imagegallary.SortOrder = maxSortOrder + 1;
                    }

                    // Logic End for tumbsize images

                    imagegallary.ImageFile = txtImageFile.Text.Trim().Replace("~", "");
                    imagegallary.ThumbImageFile = txtTumbImageFile.Text.Trim().Replace("~", "");
                    
                    imagegallary.Caption = txtImageCaption.Text.Trim();
                    imagegallary.ImgCategoryID = int.Parse(ddlImgCategoryID.SelectedValue);
                    imagegallary.URLTitle = txtURLTitle.Text.Trim();
                    imagegallary.Keywords = txtLeftSponsorURLTitle.Text.Trim();

                    if (chkLeftSponsorImage.Checked == true)
                    {
                        imagegallary.IsLeftSponsorImage = true;
                    }
                    else
                    {
                        imagegallary.IsLeftSponsorImage = false;
                    }
                                
                    
 
                    imagegallary.Save(WebUtility.GetUserName());
                    Reset();
                    LoadProductImages();
                    pnlImages.Visible = true;
                    pnlEditPage.Visible = false;
                }
                catch (Exception ex)
                {
                    Logger.Error(typeof(ImageGallary).Name + ".btnSave_Click", ex);
                    base.MasterPage.MessageCenter.DisplayCriticalMessage(ex.Message);
                }
            }
        }
        private void Reset()
        {
            txtImageFile.Text = string.Empty;
            lblImageId.Text = string.Empty;
            txtImageCaption.Text = string.Empty;
            txtTumbImageFile.Text = string.Empty;
            ddlImgCategoryID.SelectedIndex = 0;
            txtURLTitle.Text = "";
            txtLeftSponsorURLTitle.Text = "";
            chkLeftSponsorImage.Checked = false;
            
        }

        private void LoadGalleryTitle()
        {


            BlogCategory categorytitle = new BlogCategory();
            ds = new BlogCategoryController().FetchGalleryList();
            ddlImgCategoryID.DataTextField = "ImgCategoryTitle";
            ddlImgCategoryID.DataValueField = "ImgCategoryID";
            ddlImgCategoryID.DataSource = ds.Tables[0].DefaultView;
            if (IsPostBack)
            {
                ddlImgCategoryID.SelectedValue = categorytitle.CategoryTitle;
            }
            ddlImgCategoryID.DataBind();
            ddlImgCategoryID.Items.Insert(0, "Select");

        }


        

        private void SetImagesProperties()
        {
            this.Page.Title = LocalizationUtility.GetText("titleProductEditImages");
            hlImageSelector.NavigateUrl = string.Format("~/admin/imageGallaryselector.aspx?view=s&controlId={0}", txtImageFile.ClientID);
        }
        
        void dgProductImages_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                LinkButton editButton = e.Item.Cells[0].FindControl("lbEdit") as LinkButton;
                if (editButton != null)
                {
                    //editButton.Text = LocalizationUtility.GetText("lblEdit");
                }
                LinkButton deleteButton = e.Item.Cells[4].FindControl("lbDelete") as LinkButton;
                if (deleteButton != null)
                {
                    //deleteButton.Text = LocalizationUtility.GetText("lblDelete");
                    deleteButton.Attributes.Add("onclick", "return confirm(\"" + LocalizationUtility.GetText("lblConfirmDelete") + "\");return false;");
                }

                System.Web.UI.WebControls.Image image = e.Item.Cells[3].FindControl("productImage") as System.Web.UI.WebControls.Image;
                if (image != null)
                {
                    string mappedPath = HttpContext.Current.Server.MapPath(image.ImageUrl);
                    if (File.Exists(mappedPath))
                    {
                        using (System.Drawing.Image drawnImage = System.Drawing.Image.FromFile(mappedPath))
                        {
                            //do a little simple scaling
                            //landscape
                            if (drawnImage.Width > drawnImage.Height)
                            {
                                if (drawnImage.Width > 90)
                                {
                                    image.Width = 90;
                                    image.Height = drawnImage.Height * 90 / drawnImage.Width;
                                }
                            }
                            else
                            { //portrait
                                if (drawnImage.Height > 90)
                                {
                                    image.Height = 90;
                                    image.Width = drawnImage.Width * 90 / drawnImage.Height;
                                }
                            }
                        }
                        HyperLink hoverlink = e.Item.Cells[3].FindControl("hlImage") as HyperLink;
                        if (hoverlink != null)
                        {
                            LocalizationUtility.AddHoverHtml(hoverlink, string.Format("<img border=\"0\" src=\"{0}\"/>", Page.ResolveUrl(image.ImageUrl)));
                        }
                    }
                }
            }
        }
        private void LoadProductImages()
        {
            Query query = new Query(Content.ImageGallary.Schema).ORDER_BY(Content.ImageGallary.Columns.SortOrder);
            Content.ImageGallaryCollection imageCollection = new Content.ImageGallaryController().FetchByQuery(query);
            dgProductImages.DataSource = imageCollection;
            dgProductImages.ItemDataBound += new DataGridItemEventHandler(dgProductImages_ItemDataBound);
       
            
            dgProductImages.Columns[0].HeaderText = LocalizationUtility.GetText("hdrImage");
            dgProductImages.Columns[1].HeaderText = LocalizationUtility.GetText("hdrFooterImage");
            dgProductImages.Columns[2].HeaderText = LocalizationUtility.GetText("hdrImageCaption");
            dgProductImages.Columns[3].HeaderText = LocalizationUtility.GetText("hdrSortOrder");
            dgProductImages.Columns[4].HeaderText = LocalizationUtility.GetText("hdrEdit");
            dgProductImages.Columns[5].HeaderText = LocalizationUtility.GetText("hdrMove");
            dgProductImages.Columns[6].HeaderText = LocalizationUtility.GetText("hdrDelete");

            dgProductImages.DataBind();
            if (dgProductImages.Items.Count > 0)
            {
                ImageButton lbUp = dgProductImages.Items[0].Cells[0].FindControl("lbUp") as ImageButton;
                if (lbUp != null)
                {
                    lbUp.Visible = false;
                }
                ImageButton lbDown = dgProductImages.Items[dgProductImages.Items.Count - 1].Cells[0].FindControl("lbDown") as ImageButton;
                if (lbDown != null)
                {
                    lbDown.Visible = false;
                }
            }
        }
        protected void lbEdit_Click(object sender, CommandEventArgs e)
        {
            try
            {
                int imageId = 0;
                bool isParsed = int.TryParse(e.CommandArgument.ToString(), out imageId);
                if (isParsed)
                {
                    Content.ImageGallary image = new Etech.CMS.Content.ImageGallary(imageId);
                    lblImageId.Text = image.ImageID.ToString();
                    txtImageFile.Text = image.ImageFile;
                    txtTumbImageFile.Text = image.ThumbImageFile;
                    
                    txtImageCaption.Text = image.Caption;
                    ddlImgCategoryID.SelectedValue = Convert.ToString(image.ImgCategoryID);
                    txtURLTitle.Text = image.URLTitle;
                    txtLeftSponsorURLTitle.Text = image.Keywords;

                    if (image.IsLeftSponsorImage  == true)
                    {
                        chkLeftSponsorImage.Checked = true;
                    }
                    else
                    {
                        chkLeftSponsorImage.Checked = false;
                    }
                   
                    pnlImages.Visible = false;
                    pnlEditPage.Visible = true;
                    
                   
                   
                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(ImageGallary).Name + ".lbEdit_Click", ex);
                base.MasterPage.MessageCenter.DisplayCriticalMessage(ex.Message);
            }
        }
        protected void lbDelete_Click(object sender, CommandEventArgs e)
        {
            try
            {
                int imageId = 0;
                bool isParsed = int.TryParse(e.CommandArgument.ToString(), out imageId);
                if (isParsed)
                {
                    Content.ImageGallary.Delete(imageId);
                    Content.Caching.PageCache.RemovePageByID(imageId);
                    //Store.Caching.ProductCache.RemoveImageCollectionFromCache(productId);
                    LoadProductImages();
                    base.MasterPage.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblProductImageDeleted"));
                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(ImageGallary).Name + ".lbDelete_Click", ex);
                base.MasterPage.MessageCenter.DisplayCriticalMessage(ex.Message);
            }
        }
        protected void Items_ItemReorder(object sender, EventArgs e)
        {
            ImageButton theButton = sender as ImageButton;
//            Query query = new Query(Content.ImageGallary.Schema).WHERE(Content.ImageGallary.Columns.ImageID, imageId).ORDER_BY(Content.ImageGallary.Columns.SortOrder);
            Query query = new Query(Content.ImageGallary.Schema).ORDER_BY(Content.ImageGallary.Columns.SortOrder);
            Content.ImageGallaryCollection imageCollection = new Content.ImageGallaryController().FetchByQuery(query);
            if (imageCollection != null)
            {
                int imgId = 0;
                int.TryParse(theButton.CommandArgument, out imgId);
                if (imgId > 0)
                {
                    Content.ImageGallary imageMoved = imageCollection.Find(delegate(Content.ImageGallary image)
                    {
                        return image.ImageID == imgId;
                    });
                    int index = imageCollection.IndexOf(imageMoved);
                    imageCollection.RemoveAt(index);
                    if (theButton.CommandName.ToLower() == "up")
                    {
                        if (index == 0)
                        {
                            imageCollection.Insert(1, imageMoved);
                        }
                        else
                        {
                            imageCollection.Insert(index - 1, imageMoved);
                        }
                    }
                    else if (theButton.CommandName.ToLower() == "down")
                    {
                        imageCollection.Insert(index + 1, imageMoved);
                    }
                    int i = 1;
                    foreach (Content.ImageGallary image in imageCollection)
                    {
                        image.SortOrder = i++;
                    }
                    imageCollection.SaveAll(WebUtility.GetUserName());
                    LoadProductImages();
                }
            }
        }

        protected void btnBigDelete_Click(object sender, EventArgs e)
        {
            string fileName = Path.GetFileName(txtImageFile.Text);
            File.Delete(Server.MapPath("~/repository/Gallary/" + fileName));
            base.MasterPage.MessageCenter.DisplaySuccessMessage(string.Format("{0} {1}", fileName, LocalizationUtility.GetText("lblDeletedFromServer")));
            txtImageFile.Text = string.Empty;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
                Reset();
                pnlImages.Visible = true;
                pnlEditPage.Visible = false;
        }

        protected void lnkAddTherapists_Click(object sender, EventArgs e)
        {
            pnlImages.Visible = false;
            pnlEditPage.Visible = true;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string fileName = Path.GetFileName(txtTumbImageFile.Text);
            File.Delete(Server.MapPath("~/repository/Gallary/thumbs/" + fileName));
            MasterPage.MessageCenter.DisplaySuccessMessage(string.Format("{0} {1}", fileName, LocalizationUtility.GetText("lblDeletedFromServer")));
            txtTumbImageFile.Text = string.Empty;
        }
        private void SetThumbImagesProperties()
        {
            this.Page.Title = LocalizationUtility.GetText("titleProductEditImages");
            hlThumbImageSelector.NavigateUrl = string.Format("~/admin/ThumbimageGallaryselector.aspx?view=s&controlId={0}", txtTumbImageFile.ClientID);
        }
    }
}