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

namespace Etech.CMS.Store
{
    public partial class SPs
    {

        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchCategoryBreadCrumbs Procedure
        /// </summary>
        public static StoredProcedure FetchCategoryBreadCrumbs(int? CategoryId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchCategoryBreadCrumbs", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@CategoryId", CategoryId, DbType.Int32);

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchRandomProducts Procedure
        /// </summary>
        public static StoredProcedure FetchRandomProducts()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchRandomProducts", DataService.GetInstance("CMSProvider"));

            return sp;
        }

        public static StoredProcedure GetProductHomepage()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_Product_GetAllProducts", DataService.GetInstance("CMSProvider"));

            //sp.Command.AddParameter("@CategoryId", CategoryId,DbType.Int32);

            return sp;
        }
        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchProductCrossSells Procedure
        /// </summary>
        public static StoredProcedure FetchProductCrossSells(int? ProductId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchProductCrossSells", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@ProductId", ProductId, DbType.Int32);

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchAssociatedAttributesByProductId Procedure
        /// </summary>
        public static StoredProcedure FetchAssociatedAttributesByProductId(int? ProductId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchAssociatedAttributesByProductId", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@ProductId", ProductId, DbType.Int32);

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchAvailableAttributesByProductId Procedure
        /// </summary>
        public static StoredProcedure FetchAvailableAttributesByProductId(int? ProductId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchAvailableAttributesByProductId", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@ProductId", ProductId, DbType.Int32);

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchAssociatedCategoriesByProductId Procedure
        /// </summary>
        public static StoredProcedure FetchAssociatedCategoriesByProductId(int? ProductId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchAssociatedCategoriesByProductId", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@ProductId", ProductId, DbType.Int32);

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchCategoryPriceRanges Procedure
        /// </summary>
        public static StoredProcedure FetchCategoryPriceRanges(int? CategoryId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchCategoryPriceRanges", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@CategoryId", CategoryId, DbType.Int32);

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchCategoryManufacturers Procedure
        /// </summary>
        public static StoredProcedure FetchCategoryManufacturers(int? CategoryId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchCategoryManufacturers", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@CategoryId", CategoryId, DbType.Int32);

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchProductsByCategoryIdAndManufacturerId Procedure
        /// </summary>
        public static StoredProcedure FetchProductsByCategoryIdAndManufacturerId(int? CategoryId, int? ManufacturerId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchProductsByCategoryIdAndManufacturerId", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@CategoryId", CategoryId, DbType.Int32);

            sp.Command.AddParameter("@ManufacturerId", ManufacturerId, DbType.Int32);

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchProductsByCategoryId Procedure
        /// </summary>
        public static StoredProcedure FetchProductsByCategoryId(int? CategoryId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchProductsByCategoryId", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@CategoryId", CategoryId, DbType.Int32);

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchProductsByCategoryIdAndPriceRange Procedure
        /// </summary>
        public static StoredProcedure FetchProductsByCategoryIdAndPriceRange(int? CategoryId, decimal? PriceStart, decimal? PriceEnd)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchProductsByCategoryIdAndPriceRange", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@CategoryId", CategoryId, DbType.Int32);

            sp.Command.AddParameter("@PriceStart", PriceStart, DbType.Currency);

            sp.Command.AddParameter("@PriceEnd", PriceEnd, DbType.Currency);

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchAllProductsByCategoryId Procedure
        /// </summary>
        public static StoredProcedure FetchAllProductsByCategoryId(int? CategoryId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchAllProductsByCategoryId", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@CategoryId", CategoryId, DbType.Int32);

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_ProductSearch Procedure
        /// </summary>
        public static StoredProcedure ProductSearch(string searchTerm)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_ProductSearch", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@searchTerm", searchTerm, DbType.String);

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchProductBrowsingLog Procedure
        /// </summary>
        public static StoredProcedure FetchProductBrowsingLog()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchProductBrowsingLog", DataService.GetInstance("CMSProvider"));

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchBrowsingLogSearchTerms Procedure
        /// </summary>
        public static StoredProcedure FetchBrowsingLogSearchTerms()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchBrowsingLogSearchTerms", DataService.GetInstance("CMSProvider"));

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchFavoriteCategories Procedure
        /// </summary>
        public static StoredProcedure FetchFavoriteCategories(string UserName, int? BrowsingBehaviorId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchFavoriteCategories", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@UserName", UserName, DbType.String);

            sp.Command.AddParameter("@BrowsingBehaviorId", BrowsingBehaviorId, DbType.Int32);

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchCategoryBrowsingLog Procedure
        /// </summary>
        public static StoredProcedure FetchCategoryBrowsingLog()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchCategoryBrowsingLog", DataService.GetInstance("CMSProvider"));

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchFavoriteProducts Procedure
        /// </summary>
        public static StoredProcedure FetchFavoriteProducts(string UserName, int? BrowsingBehaviorId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchFavoriteProducts", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@UserName", UserName, DbType.String);

            sp.Command.AddParameter("@BrowsingBehaviorId", BrowsingBehaviorId, DbType.Int32);

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchMostPopularProducts Procedure
        /// </summary>
        public static StoredProcedure FetchMostPopularProducts(int? BrowsingBehviorId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchMostPopularProducts", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@BrowsingBehviorId", BrowsingBehviorId, DbType.Int32);

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchAssociatedOrderTransactions Procedure
        /// </summary>
        public static StoredProcedure FetchAssociatedOrderTransactions(int? OrderId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchAssociatedOrderTransactions", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@OrderId", OrderId, DbType.Int32);

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchAssociatedOrders Procedure
        /// </summary>
        public static StoredProcedure FetchAssociatedOrders(int? OrderId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchAssociatedOrders", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@OrderId", OrderId, DbType.Int32);

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchRefundedOrderItems Procedure
        /// </summary>
        public static StoredProcedure FetchRefundedOrderItems(int? OrderId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchRefundedOrderItems", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@OrderId", OrderId, DbType.Int32);

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchAvailableDownloadsByProductId Procedure
        /// </summary>
        public static StoredProcedure FetchAvailableDownloadsByProductId(int? ProductId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchAvailableDownloadsByProductId", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@ProductId", ProductId, DbType.Int32);

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchAssociatedDownloadsByProductId Procedure
        /// </summary>
        public static StoredProcedure FetchAssociatedDownloadsByProductId(int? ProductId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchAssociatedDownloadsByProductId", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@ProductId", ProductId, DbType.Int32);

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchAssociatedDownloadsByProductIdAndForPurchase Procedure
        /// </summary>
        public static StoredProcedure FetchAssociatedDownloadsByProductIdAndForPurchase(int? ProductId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchAssociatedDownloadsByProductIdAndForPurchase", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@ProductId", ProductId, DbType.Int32);

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchAssociatedDownloadsByProductIdAndNotForPurchase Procedure
        /// </summary>
        public static StoredProcedure FetchAssociatedDownloadsByProductIdAndNotForPurchase(int? ProductId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchAssociatedDownloadsByProductIdAndNotForPurchase", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@ProductId", ProductId, DbType.Int32);

            return sp;
        }


        /// <summary>
        /// Creates an object wrapper for the CMS_Store_FetchPurchasedDownloadsByUserId Procedure
        /// </summary>
        public static StoredProcedure FetchPurchasedDownloadsByUserId(Guid? UserId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchPurchasedDownloadsByUserId", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@UserId", UserId, DbType.Guid);

            return sp;
        }


        public static StoredProcedure FetchFeaturedProducts(string UserName, int? BrowsingBehaviorId)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_FetchFeaturedProducts", DataService.GetInstance("CMSProvider"));

            sp.Command.AddParameter("@UserName", UserName, DbType.String);
            sp.Command.AddParameter("@BrowsingBehaviorId", BrowsingBehaviorId, DbType.Int32);

            return sp;
        }

        //Added By Bhargav on 6th April 2011
        public static StoredProcedure GetAllProducts()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_Product_GetAllProducts", DataService.GetInstance("CMSProvider"));
            return sp;
        }

        #region Categories

        public static StoredProcedure GetAllAParentCategories()
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_GetAll_ParentCategories", DataService.GetInstance("CMSProvider"));
            return sp;
        }

        public static StoredProcedure GetDataByCategoryID(int CategoryID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_GetData_By_CategoryId", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@CategoryId", CategoryID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetChildCategoryCountByParentID(int ParentCategoryID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_GeChildCategoryCount_By_ParentCategoryID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@ParentCategoryID", ParentCategoryID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetAllChildCategoriesByParentID(int ParentCategoryID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Content_GetAll_ChildCategories_By_ParentCategoryID", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@ParentCategoryID", ParentCategoryID, DbType.Int32);
            return sp;
        }

        public static StoredProcedure GetProductCount(int CategoryID)
        {
            SubSonic.StoredProcedure sp = new SubSonic.StoredProcedure("CMS_Store_Category_Get_ProductCount", DataService.GetInstance("CMSProvider"));
            sp.Command.AddParameter("@CategoryID", CategoryID, DbType.Int32);
            return sp;
        }

        #endregion Categories


    }


}

