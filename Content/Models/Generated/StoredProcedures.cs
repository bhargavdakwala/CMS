using System;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Data.Common;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Xml;
using System.Xml.Serialization;
using SubSonic;
using SubSonic.Utilities;

namespace Etech.CMS.Content
{
    public partial class SPs
    {

        /// <summary>
        /// Creates an object wrapper for the CMS_Content_FetchRegionsByPageId Procedure
        /// </summary>
        public static StoredProcedure FetchRegionsByPageId(int? PageId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_FetchRegionsByPageId", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@PageId", PageId, DbType.Int32);

            return sp;
        }

        public static StoredProcedure FetchCommonBannerBySortOrder()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_FetchCommonBannerBySortOrder", DataService.GetInstance("CMSProvider"));

            return sp;
        }
   

        /// <summary>
        /// Creates an object wrapper for the CMS_Content_FetchRegionsByPageIdAndTemplateRegionId Procedure
        /// </summary>
        public static StoredProcedure FetchRegionsByPageIdAndTemplateRegionId(int? PageId, int? TemplateRegionId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_FetchRegionsByPageIdAndTemplateRegionId", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@PageId", PageId, DbType.Int32);

            sp.Command.AddParameter("@TemplateRegionId", TemplateRegionId, DbType.Int32);

            return sp;
        }
        //Create sp for Blog

        public static StoredProcedure FetchCategoryTitlebyCategoryID()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_FetchCategoryTitlebyCategoryID", DataService.GetInstance("CMSProvider"));
            //SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_FetchAllNews", DataService.GetInstance("CMSProvider"));

            return sp;
        }
        public static StoredProcedure FetchFullDetails()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_FetchFullDetails", DataService.GetInstance("CMSProvider"));
            //SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_FetchAllNews", DataService.GetInstance("CMSProvider"));

            return sp;
        }
        public static StoredProcedure FetchBlogCurrentPostList()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_FetchBlogCurrentPostList", DataService.GetInstance("CMSProvider"));
            return sp;
        }
        public static StoredProcedure FetchBlogCurrentList()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_FetchBlogCurrentList", DataService.GetInstance("CMSProvider"));
            return sp;
        }
        public static StoredProcedure FetchFullMember()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_FullMember_UI", DataService.GetInstance("CMSProvider"));
            return sp;
        }
        
        public static StoredProcedure FetchCurrentProjectsList()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("FetchCurrentProjectsList", DataService.GetInstance("CMSProvider"));
            return sp;
        }

        /// <summary>
        /// Creates an object wrapper for the CMS_Content_JoinRegionToPage Procedure
        /// </summary>
        public static StoredProcedure JoinRegionToPage(int? RegionId, int? PageId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_JoinRegionToPage", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@RegionId", RegionId, DbType.Int32);

            sp.Command.AddParameter("@PageId", PageId, DbType.Int32);

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Content_FetchTemplateRegionsByTemplateId Procedure
        /// </summary>
        public static StoredProcedure FetchTemplateRegionsByTemplateId(int? TemplateId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_FetchTemplateRegionsByTemplateId", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@TemplateId", TemplateId, DbType.Int32);

            return sp;
        }

        #region NewsLetter Module

        public static StoredProcedure GetGroupDetailsByGroupID(int GroupID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_NewsGroupDetails_GetData_By_GroupID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@GroupID", GroupID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetAllListBoxByGroupID(int GroupID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_NewsGroupDetails_FetchAllListbox_By_GroupID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@GroupID", GroupID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure DeleteGroupDetailsByGroupID(int GroupID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_NewsLetterGroup_Details_Delete_By_GroupID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@GroupID", GroupID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetMaxID(int Val)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetMaxID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@Val", Val, DbType.Int32);
            return sp;
        }

        public static StoredProcedure DeleteDetailsByNewsLetterID(int NewsLetterID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_NewsLetterDetail_Delete_By_NewsLetterID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@NewsLetterID", NewsLetterID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetNewsLetterDetailsByNewsLetterID(int NewsLetterID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_NewsLetterDetail_GetData_By_NewsLetterID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@NewsLetterID", NewsLetterID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetDataForNewsLetterSignUp(int NewsLetterID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetData_For_NewsLetter_SignUp", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@NewsLetterID", NewsLetterID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetGroupCount(int GroupID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_NewsLetterDetails_Get_GroupCount", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@GroupID", GroupID, DbType.Int32);
            return sp;
        }


        public static StoredProcedure GetDataForNewsLetterTemplates(int TemplateID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_NewsLetter_Templates_GetTemplates_By_TemplateID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@TemplateID", TemplateID, DbType.Int32);
            return sp;
        }
        public static StoredProcedure UpdateNewsLetterUserList(int UserID, int GroupID, bool checkboxvalue)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_UpdateNewsletter_UserList", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@UserID", UserID, DbType.Int32);
            sp.Command.AddParameter("@GroupID", GroupID, DbType.Int32);
            sp.Command.AddParameter("@checkboxvalue", checkboxvalue, DbType.Boolean);
            return sp;
        }
        public static StoredProcedure DeleteNewsLetterUserList(int UserID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_DeleteNewsletter_UserList", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@UserID", UserID, DbType.Int32);
            return sp;
        }
        //public static StoredProcedure FindNewsLetterUserList()
        //{
        //    SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetNewsletter_UserList", DataService.GetInstance("CMSProvider"));
        //    return sp;
        //}
        public static StoredProcedure FindNewsLetterUserList(string strUserName, int Flag)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_FindUserNameByNewsletter", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@UserName", strUserName, DbType.String);
            sp.Command.AddParameter("@Flag", Flag, DbType.Int32);
            return sp;
        }
        
        public static StoredProcedure FindNewsLetterGroupList()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_FetchNewsLetter_Groups", DataService.GetInstance("CMSProvider"));
            return sp;
        }

        

        #endregion NewsLetter Module


        #region Content Page

        public static StoredProcedure GetAllAParentPages()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetAll_ParentPages", DataService.GetInstance("CMSProvider"));
            return sp;
        }


        public static StoredProcedure GetAllChildPagesByParentID(int ParentPageID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetAll_ChildPages_By_ParentPageID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@ParentPageID", ParentPageID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetDataByPageID(int PageId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetData_By_PageId", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@PageId", PageId, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetChildPagesCountByParentID(int ParentPageID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GeChildPageCount_By_ParentPageID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@ParentPageID", ParentPageID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetParentPageByChldPageID(int ChildPageID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetParent_By_ChildPageID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@ChildPageID", ChildPageID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetRegionCountByPageID(int PageId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_Region_Get_RegionCount", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@PageId", PageId, DbType.Int32);
            return sp;
        }

        public static StoredProcedure FetchAllImageGallary(int ImageID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("FetchAllImageGallary", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@ImageID", ImageID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetImageIDFromGallary()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("GetFirstImageIDFromGallary", DataService.GetInstance("CMSProvider"));
            
            return sp;
        }

        #endregion Content Page

        #region Domain


        public static StoredProcedure GetDomainSuffix(string KeyValue)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_Get_DomainKey_Suffix", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@KeyValue", KeyValue, DbType.String);
            return sp;
        }


        #endregion Domain


        #region Category

        public static StoredProcedure GetAllChildCategoriesByCategoryID(int CategoryID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_Category_GetChildCategories_By_CategoryID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@CategoryID", CategoryID, DbType.Int32);
            return sp;
        }

        #endregion Category


        #region GetIdFromPageName

        public static StoredProcedure GetIdFromPageName(string PageTitle)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("[CMS_Content_GetIdFromPageName]", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@PageTitle", PageTitle, DbType.String);
            return sp;
        }

        #endregion

        public static StoredProcedure GetProductsForHomePage()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_Product_GetProducts_For_HomePage", DataService.GetInstance("CMSProvider"));
            return sp;
        }

        public static StoredProcedure GetCountByURLTitle(string URLTitle)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("[CMS_Content_Get_Count_By_URLTitle]", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@URLTitle", URLTitle, DbType.String);
            return sp;
        }
        public static StoredProcedure FindUserNameByName(string UserName, int flag)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("aspnet_FindUserNameByName", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@UserName", UserName, DbType.String);
            sp.Command.AddParameter("@Flag", flag, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetUserRole()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("aspnet_GetUserRole", DataService.GetInstance("CMSProvider"));


            return sp;
        }

        public static StoredProcedure GetParentIDByPageID(int PageID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_Get_ParentID_By_PageID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@PageID", PageID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetMaxSortOrderID()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("sp_GetMax_SortOrderID", DataService.GetInstance("CMSProvider"));
            return sp;
        }

        public static StoredProcedure SortServiceOrderID()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("sp_GetMax_SortServiceOrderID", DataService.GetInstance("CMSProvider"));
            return sp;
        }
        public static StoredProcedure GetMaxCommonBannerSortOrderID()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("sp_GetMax_CommonBanner_SortOrderID", DataService.GetInstance("CMSProvider"));
            return sp;
        }
        

        public static StoredProcedure GetServices(int ServiceID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("proc_ServiceList", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@parentID", ServiceID, DbType.Int32);
            return sp;
        }


        public static StoredProcedure GetGallery(int ID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("proc_GalleryList", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@parentID", ID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetProjectList(int ProjectID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("proc_ProjectList", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@parentID", ProjectID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetAllProjects()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetAllProjects", DataService.GetInstance("CMSProvider"));
            return sp;
        }

        public static StoredProcedure GetAllServices()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetAllServices", DataService.GetInstance("CMSProvider"));
            return sp;
        }
        public static StoredProcedure GetAllServicesAdminPanel()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetAllServicesAdmin", DataService.GetInstance("CMSProvider"));
            return sp;
        }

        
        public static StoredProcedure GetAllServices_LatestNews()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetAllServices_LAtestNews", DataService.GetInstance("CMSProvider"));
            return sp;
        }
        
        public static StoredProcedure GetAllImageGalleryCategory()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetAllImageGalleryCategory", DataService.GetInstance("CMSProvider"));
            return sp;
        }

        public static StoredProcedure FetchServiceTitlebyServiceID()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_FetchServiceTitlebyServiceID", DataService.GetInstance("CMSProvider"));
            return sp;
        }

        public static StoredProcedure DeleteProject(int ProjectID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("DeleteProject", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@ProjectID", ProjectID, DbType.Int32);
            return sp;
        }


        public static StoredProcedure GetAllGallerySubCategory()
        {
            //SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_FetchCategoryTitlebyCategoryID", DataService.GetInstance("CMSProvider"));
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetAllGallerySubCategory", DataService.GetInstance("CMSProvider"));

            return sp;
        }
        public static StoredProcedure GetGalleryID()
        {
            //SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_FetchCategoryTitlebyCategoryID", DataService.GetInstance("CMSProvider"));
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetGalleryID", DataService.GetInstance("CMSProvider"));

            return sp;
        }


        public static StoredProcedure GetRegionTitleByPageID(int PageID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetRegionTitleByPageID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@PageID", PageID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetAllImages()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetAllImages", DataService.GetInstance("CMSProvider"));
            return sp;
        }

        public static StoredProcedure GetAllCategoryImages(int ImgCategoryID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetAllCategoryImages", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@ImgCategoryID", ImgCategoryID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetAllCategoryImagesDetail(int ImageID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetAllCategoryImagesDetail", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@ImageID", ImageID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure CountNoOfChild(int PageID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_CountNoOfChild", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@PageID", PageID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetAllInfoByPageID(int PageID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetAllInfoByPageID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@PageID", PageID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetServicesByPageID(int PageID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetParentIDbyPageID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@PageID", PageID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetServiceHomeImages()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetServiceHomeImages", DataService.GetInstance("CMSProvider"));
            return sp;
        }


        public static StoredProcedure DeleteImageByImageCategoryID(int ImgCategoryID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_DeleteImageByImageCategoryID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@ImgCategoryID", ImgCategoryID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetBlogByBlogID(int BlogId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetBlogByBlogID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@BlogID", BlogId, DbType.Int32);
            return sp;
        }


        public static StoredProcedure GetBlogCategoryByBlogCatID(int CategoryId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetBlogCategoryByBlogCatID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@CategoryID", CategoryId, DbType.Int32);
            return sp;
        }


        public static StoredProcedure GetLeftMenu()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetLeftMenu", DataService.GetInstance("CMSProvider"));
            
            return sp;
        }

        public static StoredProcedure GetLeftChildMenu(int PageID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetLeftChildMenu", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@PageID", PageID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetChildMenuByPageID(int PageID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetChildMenuByPageID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@PageID", PageID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetSubChildMenuByPageID(int PageID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetSubChildMenuByPageID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@PageID", PageID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetFooterMenu()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetFooterMenu", DataService.GetInstance("CMSProvider"));

            return sp;
        }

        public static StoredProcedure GetRecentNews()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetRecentNews", DataService.GetInstance("CMSProvider"));
            return sp;
        }
        public static StoredProcedure GetLatestNews()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetRecentNews_LatestNews", DataService.GetInstance("CMSProvider"));
            return sp;
        }
        

        public static StoredProcedure GetRecentMonthlyMeeting()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetRecentMonthlyMeeting", DataService.GetInstance("CMSProvider"));
            return sp;
        }

        public static StoredProcedure GetListServices()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetListServices", DataService.GetInstance("CMSProvider"));
            return sp;
        }

        public static StoredProcedure GetMonthlyMeeting()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetMonthlyMeeting", DataService.GetInstance("CMSProvider"));
            return sp;
        }

        public static StoredProcedure GetTemplateCount(int TemplateID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_NewsLetter_Get_TemplateCount", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@TemplateID", TemplateID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetPlatinumSponsorsImages()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetPlatinumSponsorsImages", DataService.GetInstance("CMSProvider"));

            return sp;
        }

        public static StoredProcedure GetFooterImages()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetFooterImages", DataService.GetInstance("CMSProvider"));

            return sp;
        }


        public static StoredProcedure GetParentIDByChildIDOrGrandChildID(int PageID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetParentIDByChildIDOrGrandChildID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@PageID", PageID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetMenuTitleByPageID(int PageID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetMenuTitleByPageID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@PageID", PageID, DbType.Int32);
            return sp;
        }
        public static StoredProcedure InsertCommonBanner(string ImagePath, string ImageTitle, int SortOrder,string IsActive)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_CommonBanner_Insert", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@ImagePath", ImagePath, DbType.String);
            sp.Command.AddParameter("@ImageTitle",ImageTitle, DbType.String);
            sp.Command.AddParameter("@SortOrder", SortOrder, DbType.Int32);
            sp.Command.AddParameter("@IsActive", IsActive, DbType.String);
            return sp;
        }

        

        
    }


}

