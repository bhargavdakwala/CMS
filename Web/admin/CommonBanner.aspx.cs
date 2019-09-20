using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SubSonic;
using SubSonic.Utilities;
using System.Data;
using Etech.CMS.Content;
using Etech.CMS.Core;
using Etech.CMS.Localization;
using Etech.CMS.Store;
using Img = System.Drawing;
using System.IO;
using Etech.CMS.Core.IO;
using System.Web.UI.HtmlControls;

namespace Etech.CMS.Web.admin
{
    public partial class CommonBanner : Etech.CMS.Store.Web.AdminPage
    {
        private int imageId = 0;
        private string view = string.Empty;
        DataSet ds;
        public string finalPath;
        public string IMAGE_PATH = @"~/repository/Gallary/";
        private string controlId = string.Empty;
        private string path = string.Empty;
        private string pathToThumb = string.Empty;
        private string[] acceptedFileTypes = new string[] { ".jpg", ".jpeg", ".jpe", ".gif", ".bmp", ".png" };

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //SetImagesProperties();
                //SetThumbImagesProperties();
                if (!Page.IsPostBack)
                {
                    LoadProductImages();
                    pnlBannerImages.Visible = true;
                    pnlEditPage.Visible = false;
                    panelUpdate.Visible = false;
                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(ImageGallary).Name + ".Page_Load", ex);
                Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblPageSaved"));

            }
        }
        public bool ThumbnailCallback()
        {
            return true;
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {

                string imageId = lblUpdateImageID.Text;
                Where where = new Where();
                where.ColumnName = Content.CommonBanner.Columns.ImageID;
                where.DbType = DbType.Int32;
                where.ParameterValue = imageId;
                Query query = new Query(Content.CommonBanner.Schema);
                object strSortOrder = query.GetMax(Content.CommonBanner.Columns.SortOrder, where);

                DataSet dsSortOrder = new DataSet();
                SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetMaxCommonBannerSortOrderID();
                dsSortOrder = (DataSet)sp.GetDataSet();
                int maxSortOrder = Convert.ToInt32(dsSortOrder.Tables[0].Rows[0]["MaxSortOrder"]);

                //int.TryParse(strSortOrder.ToString(), out maxSortOrder);
                Content.CommonBanner imagegallary;
                if (!string.IsNullOrEmpty(imageId))
                {
                    imagegallary = new Content.CommonBanner(imageId);
                }
                else
                {
                    imagegallary = new Content.CommonBanner();
                    imagegallary.SortOrder = maxSortOrder + 1;
                }
                imagegallary.ImagePath = imgFileUploaded.ImageUrl;
                //imagegallary.ImagePath = "~/repository/Gallary/" + fuFile.FileName;
                imagegallary.ImageTitle = textUpdateURL.Text.Trim();
                imagegallary.ModifyDate = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                imagegallary.IsActive = true;



                imagegallary.Save(WebUtility.GetUserName());
                LoadProductImages();
                pnlBannerImages.Visible = true;
                pnlEditPage.Visible = false;
                panelUpdate.Visible = false;
                Reset();
                Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblImageSaved"));

                //FileWriter fileWriter = new FileWriter();
                //HttpPostedFile file = fuFile.PostedFile;
                //fuFile.Dispose();
                //if (!IsValidFileType(Path.GetExtension(file.FileName)))
                //{
                //    throw new ArgumentOutOfRangeException("file", "File is not of valid type.");
                //}
                //if (file.ContentLength > 0)
                //{
                //    //Original size Image Save

                //    finalPath = Server.MapPath("~/repository/Gallary/" + fuFile.FileName);
                //    //finalPath = IMAGE_PATH  + fuFile.FileName;
                //    fileWriter.Write(finalPath, file.InputStream);
                //}
                //using (System.Drawing.Image objImage = System.Drawing.Image.FromFile(finalPath))
                //{
                //    // Display its Height and Width
                //    //Response.Write("Width: " + objImage.Width + "<br />Height: " + objImage.Height);
                //    if (objImage.Width == 131 && objImage.Height == 277)
                //    {

                //        finalPath = HttpContext.Current.Server.MapPath(IMAGE_PATH) + fuFile.FileName;
                //        //lblErrorMessage.Visible = false;
                //        imagegallary.ImagePath = "~/repository/Gallary/" + fuFile.FileName;
                //        imagegallary.ImageTitle = txtURLTitle.Text.Trim();
                //        imagegallary.ModifyDate = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                //        imagegallary.IsActive = true;



                //        imagegallary.Save(WebUtility.GetUserName());
                //        LoadProductImages();
                //        pnlBannerImages.Visible = true;
                //        pnlEditPage.Visible = false;
                //        panelUpdate.Visible = false;

                //        Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblImageSaved"));
                //    }
                //    else
                //    {
                //        //lblErrorMessage.Visible = true;
                //        Master.MessageCenter.DisplayCriticalMessage("Please upload 131 * 277 Banner");
                //        //lblErrorMessage.Text = "<b font='red'>Please upload 131 * 277 Banner</b>";
                //    }
                //}

            }
            catch (Exception ex)
            {
                Logger.Error(typeof(ImageGallary).Name + ".btnUpdate_Click", ex);
                Master.MessageCenter.DisplayCriticalMessage(ex.Message);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {

                    string imageId = lblImageId.Text;
                    Where where = new Where();
                    where.ColumnName = Content.CommonBanner.Columns.ImageID;
                    where.DbType = DbType.Int32;
                    where.ParameterValue = imageId;
                    Query query = new Query(Content.CommonBanner.Schema);
                    object strSortOrder = query.GetMax(Content.CommonBanner.Columns.SortOrder, where);

                    DataSet dsSortOrder = new DataSet();
                    SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetMaxCommonBannerSortOrderID();
                    dsSortOrder = (DataSet)sp.GetDataSet();
                    int maxSortOrder = Convert.ToInt32(dsSortOrder.Tables[0].Rows[0]["MaxSortOrder"]);

                    //int.TryParse(strSortOrder.ToString(), out maxSortOrder);
                    Content.CommonBanner imagegallary;
                    if (!string.IsNullOrEmpty(imageId))
                    {
                        imagegallary = new Content.CommonBanner(imageId);
                    }
                    else
                    {
                        imagegallary = new Content.CommonBanner();
                        imagegallary.SortOrder = maxSortOrder + 1;
                    }



                    FileWriter fileWriter = new FileWriter();
                    HttpPostedFile file = fuFile.PostedFile;
                    fuFile.Dispose();
                    if (!IsValidFileType(Path.GetExtension(file.FileName)))
                    {
                        throw new ArgumentOutOfRangeException("file", "File is not of valid type.");
                    }
                    if (file.ContentLength > 0)
                    {
                        //Original size Image Save

                        finalPath = Server.MapPath("~/repository/Gallary/" + fuFile.FileName);
                        //finalPath = IMAGE_PATH  + fuFile.FileName;
                        fileWriter.Write(finalPath, file.InputStream);
                    }
                    using (System.Drawing.Image objImage = System.Drawing.Image.FromFile(finalPath))
                    {
                        // Display its Height and Width
                        //Response.Write("Width: " + objImage.Width + "<br />Height: " + objImage.Height);
                        if (objImage.Width == 131 && objImage.Height == 277)
                        {

                            finalPath = HttpContext.Current.Server.MapPath(IMAGE_PATH) + fuFile.FileName;
                            //lblErrorMessage.Visible = false;
                            imagegallary.ImagePath = "~/repository/Gallary/" + fuFile.FileName;
                            imagegallary.ImageTitle = txtURLTitle.Text.Trim();
                            imagegallary.ModifyDate = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                            imagegallary.IsActive = true;



                            imagegallary.Save(WebUtility.GetUserName());
                            LoadProductImages();
                            pnlBannerImages.Visible = true;
                            pnlEditPage.Visible = false;
                            panelUpdate.Visible = false;
                            Reset();
                            Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblImageSaved"));
                        }
                        else
                        {
                            //lblErrorMessage.Visible = true;
                            Master.MessageCenter.DisplayCriticalMessage("Please upload 131 * 277 Banner");
                            //lblErrorMessage.Text = "<b font='red'>Please upload 131 * 277 Banner</b>";
                        }
                    }

                }
                catch (Exception ex)
                {
                    Logger.Error(typeof(ImageGallary).Name + ".btnSave_Click", ex);
                    Master.MessageCenter.DisplayCriticalMessage(ex.Message);
                }
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            pnlBannerImages.Visible = true;
            pnlEditPage.Visible = false;
            panelUpdate.Visible = false;
            Reset();
        }
        protected void btnUpdateCancel_Click(object sender, EventArgs e)
        {
            pnlBannerImages.Visible = true;
            pnlEditPage.Visible = false;
            panelUpdate.Visible = false;
            Reset();

        }

        private bool IsValidFileType(string extension)
        {
            Predicate<string> match = delegate(string extensionToMatch) { return string.Equals(extensionToMatch, extension, StringComparison.OrdinalIgnoreCase); };
            return Array.Exists(acceptedFileTypes, match);
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
            Query query = new Query(Content.CommonBanner.Schema).ORDER_BY(Content.CommonBanner.Columns.SortOrder);
            Content.CommonBannerCollection imageCollection = new Content.CommonBannerController().FetchByQuery(query);
            dgProductImages.DataSource = imageCollection;

            //dgProductImages.ItemDataBound += new DataGridItemEventHandler(dgProductImages_ItemDataBound);


            dgProductImages.Columns[0].HeaderText = LocalizationUtility.GetText("hdrCommonImage");
            dgProductImages.Columns[1].HeaderText = LocalizationUtility.GetText("hdrURLTitle");
            dgProductImages.Columns[2].HeaderText = LocalizationUtility.GetText("hdrSortOrder");
            dgProductImages.Columns[3].HeaderText = LocalizationUtility.GetText("hdrMove");
            dgProductImages.Columns[4].HeaderText = LocalizationUtility.GetText("hdrEdit");
            dgProductImages.Columns[5].HeaderText = LocalizationUtility.GetText("hdrDelete");

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
                imgFileUploaded.Visible = true;
                bool isParsed = int.TryParse(e.CommandArgument.ToString(), out imageId);
                if (isParsed)
                {
                    Content.CommonBanner image = new Etech.CMS.Content.CommonBanner(imageId);
                    lblImageId.Text = image.ImageID.ToString();
                    lblUpdateImageID.Text = image.ImageID.ToString();
                    imgFileUploaded.ImageUrl = image.ImagePath;
                    //HttpPostedFile file = image.ImagePath;

                    //fuFile.PostedFile = image.ImageFile;
                    //fuFile.PostedFile = (image.ImagePath);
                    //txtTumbImageFile.Text = image.ThumbImageFile;

                    //txtImageCaption.Text = image.Caption;
                    //ddlImgCategoryID.SelectedValue = Convert.ToString(image.ImgCategoryID);
                    txtURLTitle.Text = image.ImageTitle;
                    textUpdateURL.Text = image.ImageTitle;

                    pnlBannerImages.Visible = false;
                    pnlEditPage.Visible = false;
                    panelUpdate.Visible = true;

                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(ImageGallary).Name + ".lbEdit_Click", ex);
                Master.MessageCenter.DisplayCriticalMessage(ex.Message);
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
                    Content.CommonBanner.Delete(imageId);
                    Content.Caching.PageCache.RemovePageByID(imageId);
                    //Store.Caching.ProductCache.RemoveImageCollectionFromCache(productId);
                    LoadProductImages();
                    Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblProductImageDeleted"));
                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(ImageGallary).Name + ".lbDelete_Click", ex);
                Master.MessageCenter.DisplayCriticalMessage(ex.Message);
            }
        }
        protected void Items_ItemReorder(object sender, EventArgs e)
        {
            ImageButton theButton = sender as ImageButton;
            //            Query query = new Query(Content.ImageGallary.Schema).WHERE(Content.ImageGallary.Columns.ImageID, imageId).ORDER_BY(Content.ImageGallary.Columns.SortOrder);
            Query query = new Query(Content.CommonBanner.Schema).ORDER_BY(Content.CommonBanner.Columns.SortOrder);
            Content.CommonBannerCollection imageCollection = new Content.CommonBannerController().FetchByQuery(query);
            if (imageCollection != null)
            {
                int imgId = 0;
                int.TryParse(theButton.CommandArgument, out imgId);
                if (imgId > 0)
                {
                    Content.CommonBanner imageMoved = imageCollection.Find(delegate(Content.CommonBanner image)
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
                    foreach (Content.CommonBanner image in imageCollection)
                    {
                        image.SortOrder = i++;
                    }
                    imageCollection.SaveAll(WebUtility.GetUserName());
                    LoadProductImages();
                }
            }
        }

        //        protected void btnBigDelete_Click(object sender, EventArgs e)
        //        {
        //            string fileName = Path.GetFileName(txtImageFile.Text);
        //            File.Delete(Server.MapPath("~/repository/Gallary/" + fileName));
        //            base.MasterPage.MessageCenter.DisplaySuccessMessage(string.Format("{0} {1}", fileName, LocalizationUtility.GetText("lblDeletedFromServer")));
        //            txtImageFile.Text = string.Empty;
        //        }

        //        protected void btnCancel_Click(object sender, EventArgs e)
        //        {
        //            Reset();
        //            pnlBannerImages.Visible = true;
        //            pnlEditPage.Visible = false;
        //        }

        protected void lnkAddTherapists_Click(object sender, EventArgs e)
        {
            pnlBannerImages.Visible = false;
            pnlEditPage.Visible = true;
            panelUpdate.Visible = false;
        }

        private void Reset()
        {
            txtURLTitle.Text = "";
            textUpdateURL.Text = "";
            lblImageId.Text = "0";
            lblUpdateImageID.Text = "0";

        }

        //protected void dgProductImages_ItemCommand(object source, DataGridCommandEventArgs e)
        //{
        //    try
        //    {
        //        if (e.CommandName == "Edit")
        //        {
        //            System.Web.UI.WebControls.Image image = e.Item.Cells[1].FindControl("productImage") as System.Web.UI.WebControls.Image;
        //            image.Visible = false;
        //            e.Item.Cells[1].FindControl("productImage").Visible = false;



        //            lblImageId.Text = e.CommandArgument.ToString();
        //            Etech.CMS.Content.CommonBanner objCommonBanner = new Etech.CMS.Content.CommonBanner(Int32.Parse(e.CommandArgument.ToString()));
        //            //string test = objCommonBanner.ImagePath;

        //            txtURLTitle.Text = objCommonBanner.ImageTitle.ToString();

        //            //txtName.Text = objCommonBanner.Name.ToString();
        //            //txtCompany.Text = objFullMember.Company.ToString();
        //            //txtPhone.Text = objFullMember.Phone.ToString();
        //            //txtMobile.Text = objFullMember.Mobile.ToString();
        //            //txtEmail.Text = objFullMember.Email.ToString();
        //            //txtWeb.Text = objFullMember.WebAddress.ToString();
        //            btnCancel.Visible = true;
        //            pnlEditPage.Visible = true;
        //            pnlBannerImages.Visible = false;


        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Logger.Error(typeof(FullMember).Name + ".dgProductImages_ItemCommand", ex);
        //        Master.MessageCenter.DisplayCriticalMessage(ex.Message); ;
        //    }
        //}

        //        protected void btnDelete_Click(object sender, EventArgs e)
        //        {
        //            string fileName = Path.GetFileName(txtTumbImageFile.Text);
        //            File.Delete(Server.MapPath("~/repository/Gallary/thumbs/" + fileName));
        //            MasterPage.MessageCenter.DisplaySuccessMessage(string.Format("{0} {1}", fileName, LocalizationUtility.GetText("lblDeletedFromServer")));
        //            txtTumbImageFile.Text = string.Empty;
        //        }
        //        private void SetThumbImagesProperties()
        //        {
        //            this.Page.Title = LocalizationUtility.GetText("titleProductEditImages");
        //            hlThumbImageSelector.NavigateUrl = string.Format("~/admin/ThumbimageGallaryselector.aspx?view=s&controlId={0}", txtTumbImageFile.ClientID);
        //        }
    }
}