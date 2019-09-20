﻿#region CMS License
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
using System.Web.Caching;
using Etech.CMS.Core.Caching.Manager;

namespace Etech.CMS.Store.Caching {
  public class ProductCache {

    #region Constants

    private const string CACHE_PRODUCTCOLLECTION_CAT = "ProductCollection_Cat{0}";
    private const string CACHE_PRODUCTCOLLECTION_CAT_MAN = CACHE_PRODUCTCOLLECTION_CAT + "_Man{1}";
    private const string CACHE_PRODUCTCOLLECTION_CAT_PRANGE = CACHE_PRODUCTCOLLECTION_CAT + "_PRange_Start{1}_End{2}";
    private const string CACHE_REVIEWCOLLECTION = "ReviewCollection_Product{0}";
    private const string CACHE_DISCRIPTORCOLLECTION = "DescriptorCollection_Product{0}";
    private const string CACHE_IMAGECOLLECTION = "ImageCollection_Product{0}";
    private const string CACHE_PRODUCT = "Product{0}";
    private const string CACHE_CROSSSELLCOLLECTION = "ProductCollection_CrossSell_Product{0}";
    private const string CACHE_MOST_POPULAR_PRODUCTS = "MostPopularProducts";
    private const string CACHE_ASSOCIATED_ATTRIBUTECOLLECTION = "AssociatedAttributeCollection_Product{0}";
    private const string CACHE_SKU = "SKU{0}";

    #endregion

    #region Methods

    #region Public

    #region Product in Category Menu

    /// <summary>
    /// Removes the ProductCollection from the cache.
    /// </summary>
    /// <param name="categoryId">The Category Id to remove from the cache.</param>
    public static void RemoveProductsByCategoryIdFromCache(int categoryId) {
      CacheHelper.RemoveCacheObject<ProductCollection>(string.Format(CACHE_PRODUCTCOLLECTION_CAT, categoryId));
      CacheHelper.RemoveAllCacheObjectStartWith(string.Format(CACHE_PRODUCTCOLLECTION_CAT, categoryId));

    }

    /// <summary>
    /// Gets the products by category id.
    /// </summary>
    /// <param name="categoryId">The category id.</param>
    /// <returns></returns>
    public static ProductCollection GetProductsByCategoryId(int categoryId) {
      return CacheHelper.CacheObject<ProductCollection>(delegate { return new ProductController().FetchProductsByCategoryId(categoryId); },
          string.Format(CACHE_PRODUCTCOLLECTION_CAT, categoryId), CacheLength.GetDefaultCacheTime, CacheItemPriority.BelowNormal);
    }

    /// <summary>
    /// Gets the products by category id manufacture.
    /// </summary>
    /// <param name="categoryId">The category id.</param>
    /// <param name="manufacturerId">The manufacturer id.</param>
    /// <returns></returns>
    public static ProductCollection GetProductsByCategoryIdManufacture(int categoryId, int manufacturerId) {
      return CacheHelper.CacheObject<ProductCollection>(delegate { return new ProductController().FetchProductsByCategoryIdAndManufacturerId(categoryId, manufacturerId); },
          string.Format(CACHE_PRODUCTCOLLECTION_CAT_MAN, categoryId, manufacturerId), CacheLength.GetDefaultCacheTime, CacheItemPriority.BelowNormal);
    }


    /// <summary>
    /// Gets the products by category id price range.
    /// </summary>
    /// <param name="categoryId">The category id.</param>
    /// <param name="priceStart">The price start.</param>
    /// <param name="priceEnd">The price end.</param>
    /// <returns></returns>
    public static ProductCollection GetProductsByCategoryIdPriceRange(int categoryId, Decimal priceStart, Decimal priceEnd) {
      return CacheHelper.CacheObject<ProductCollection>(delegate { return new ProductController().FetchProductsByCategoryIdAndPriceRange(categoryId, priceStart, priceEnd); },
          string.Format(CACHE_PRODUCTCOLLECTION_CAT_PRANGE, categoryId, priceStart, priceEnd), CacheLength.GetDefaultCacheTime, CacheItemPriority.BelowNormal);
    }

    #endregion

    #region Product Object

    #region Product

    /// <summary>
    /// Removes the product from the cache.
    /// This also removes everything connecting to the product that is in the cache.
    /// NOTE: Does not refresh the menu.
    /// </summary>
    /// <param name="productId">The Product Id to remove from the cache.</param>
    public static void RemoveProductFromCache(int productId) {
      CacheHelper.RemoveCacheObject<Product>(string.Format(CACHE_PRODUCT, productId));
      RemoveImageCollectionFromCache(productId);
      RemoveReviewCollectionFromCache(productId);
      RemoveDescriptorCollectionFromCache(productId);
      RemoveCrossSellCollectionFromCache(productId);
    }

    /// <summary>
    /// Gets a Product.
    /// </summary>
    /// <param name="productId">The ProductId.</param>
    /// <returns></returns>
    public static Product GetProductByProductID(int productId) {
      return CacheHelper.CacheObject<Product>(delegate {
        Product cacheData = new Product(productId);
        return !cacheData.IsNew ? cacheData : null;
      }, string.Format(CACHE_PRODUCT, productId), CacheLength.GetDefaultCacheTime, CacheItemPriority.Default);
    }

    #endregion

    #region ReviewCollection

    /// <summary>
    /// Removes the ReviewCollection from the cache.
    /// </summary>
    /// <param name="productId">The Product Id to remove from the cache.</param>
    public static void RemoveReviewCollectionFromCache(int productId) {
      CacheHelper.RemoveCacheObject<ReviewCollection>(string.Format(CACHE_REVIEWCOLLECTION, productId));
    }

    /// <summary>
    /// Gets a ReviewCollection for the specified product.
    /// </summary>
    /// <param name="productId">The productId.</param>
    /// <returns></returns>
    public static ReviewCollection GetReviewCollectionByProductID(int productId) {
      return CacheHelper.CacheObject<ReviewCollection>(delegate { return new ReviewController().FetchByProductIdAndIsApproved(productId); },
          string.Format(CACHE_REVIEWCOLLECTION, productId), CacheLength.GetDefaultCacheTime, CacheItemPriority.BelowNormal);
    }

    #endregion

    #region DescriptorCollection

    /// <summary>
    /// Removes the DescriptorCollection from the cache.
    /// </summary>
    /// <param name="productId">The Product Id to remove from the cache.</param>
    public static void RemoveDescriptorCollectionFromCache(int productId) {
      CacheHelper.RemoveCacheObject<DescriptorCollection>(string.Format(CACHE_DISCRIPTORCOLLECTION, productId));
    }

    /// <summary>
    /// Gets a DescriptorCollection for the specified product.
    /// </summary>
    /// <param name="product">The product.</param>
    /// <returns></returns>
    public static DescriptorCollection GetDescriptorCollectionByProduct(Product product) {
      return CacheHelper.CacheObject<DescriptorCollection>(delegate { return product.DescriptorRecords(); },
          string.Format(CACHE_DISCRIPTORCOLLECTION, product.ProductId), CacheLength.GetDefaultCacheTime, CacheItemPriority.BelowNormal);
    }

    #endregion

    #region CrossSell ProductCollection

    /// <summary>
    /// Removes the CrossSell ProductCollection from the cache.
    /// </summary>
    /// <param name="productId">The Product Id to remove from the cache.</param>
    public static void RemoveCrossSellCollectionFromCache(int productId) {
      CacheHelper.RemoveCacheObject<ProductCollection>(string.Format(CACHE_CROSSSELLCOLLECTION, productId));
    }

    /// <summary>
    /// Gets a CrossSell ProductCollection for the specified product.
    /// </summary>
    /// <param name="productId">The product Id.</param>
    /// <returns></returns>
    public static ProductCollection GetCrossSellCollectionByProduct(int productId) {
      return CacheHelper.CacheObject<ProductCollection>(delegate { return new ProductController().FetchProductCrossSells(productId); },
          string.Format(CACHE_CROSSSELLCOLLECTION, productId), CacheLength.GetDefaultCacheTime, CacheItemPriority.BelowNormal);
    }

    #endregion

    #region ImageCollection

    /// <summary>
    /// Removes the ImageCollection from the cache.
    /// </summary>
    /// <param name="productId">The Product Id to remove from the cache.</param>
    public static void RemoveImageCollectionFromCache(int productId) {
      CacheHelper.RemoveCacheObject<ImageCollection>(string.Format(CACHE_IMAGECOLLECTION, productId));
    }

    /// <summary>
    /// Gets a ImageCollection for the specified product.
    /// </summary>
    /// <param name="product">The Product.</param>
    /// <returns></returns>
    public static ImageCollection GetImageCollectionByProduct(Product product) {
      return CacheHelper.CacheObject<ImageCollection>(delegate { return product.ImageRecords(); },
          string.Format(CACHE_IMAGECOLLECTION, product.ProductId), CacheLength.GetDefaultCacheTime, CacheItemPriority.BelowNormal);
    }

    #endregion

    #region AssociatedAttributeCollection

    /// <summary>
    /// Removes the AssociatedAttributeCollection from the cache.
    /// </summary>
    /// <param name="productId">The Product Id to remove from the cache.</param>
    public static void RemoveAssociatedAttributeCollectionFromCache(int productId) {
      CacheHelper.RemoveCacheObject<AssociatedAttributeCollection>(string.Format(CACHE_ASSOCIATED_ATTRIBUTECOLLECTION, productId));
    }

    /// <summary>
    /// Gets a AssociatedAttributeCollection for the specified product.
    /// </summary>
    /// <param name="productId">The Product.</param>
    /// <returns></returns>
    public static AssociatedAttributeCollection GetAssociatedAttributeCollectionByProduct(int productId) {
      return CacheHelper.CacheObject<AssociatedAttributeCollection>(delegate { return new ProductController().FetchAssociatedAttributesByProductId(productId); },
          string.Format(CACHE_ASSOCIATED_ATTRIBUTECOLLECTION, productId), CacheLength.GetDefaultCacheTime, CacheItemPriority.BelowNormal);
    }

    #endregion

    #region SKU

    /// <summary>
    /// Removes the SKU from the cache.
    /// </summary>
    public static void RemoveSKUFromCache(string sku) {
      CacheHelper.RemoveCacheObject<Sku>(string.Format(CACHE_SKU, sku));
    }

    /// <summary>
    /// Gets a SKU specified.
    /// </summary>
    /// <returns></returns>
    public static Sku GetSKU(string sku) {
      return CacheHelper.CacheObject<Sku>(delegate { return new Sku(Sku.Columns.SkuX, sku); },
        string.Format(CACHE_SKU, sku), CacheLength.GetShortCacheTime, CacheItemPriority.BelowNormal);
    }

    #endregion

    #endregion

    #region The Cart Cache

    #region MostPopularProducts Collection

    /// <summary>
    /// Removes the MostPopularProducts from the cache.
    /// </summary>
    public static void RemoveMostPopularProductsFromCache() {
      CacheHelper.RemoveCacheObject<ProductCollection>(CACHE_MOST_POPULAR_PRODUCTS);
    }

    /// <summary>
    /// Gets a MostPopularProducts.
    /// </summary>
    /// <returns></returns>
    public static ProductCollection GetMostPopularProducts() {
      return CacheHelper.CacheObject<ProductCollection>(delegate { return new ProductController().FetchMostPopularProducts(); },
          CACHE_MOST_POPULAR_PRODUCTS, CacheLength.GetDefaultCacheTime, CacheItemPriority.Default);
    }

    #endregion

    #endregion

    #endregion

    #endregion

  }
}
