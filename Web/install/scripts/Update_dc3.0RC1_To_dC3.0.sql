/*
This script was created by Visual Studio on 5/17/2008 at 3:36 PM.
Run this script on chris\dev2005.dcRC1_ForCompare.dbo to make it the same as chris\dev2005.dc.dbo.
Please back up your target database before running this script.
*/
GO
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING ON
GO
SET ANSI_WARNINGS ON
GO
SET CONCAT_NULL_YIELDS_NULL ON
GO
SET ARITHABORT ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id=OBJECT_ID('tempdb..#tmpErrors')) DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
GO
/* The type for Field: OrderGuid in Table: [dbo].[CMS_Store_Order] is currently: [nvarchar] (50) but is being changed to: [uniqueidentifier]. */
/* The collation for Field: OrderGuid in Table: [dbo].[CMS_Store_Order] is being changed to:   from SQL_Latin1_General_CP1_CI_AS. */
--IF EXISTS (select top 1 1 from [dbo].[CMS_Store_Order])
--	RAISERROR ('Rows detected, failing schema update due to possible data loss.', 16, 127) WITH NOWAIT
--GO
BEGIN TRANSACTION
GO
PRINT N'Dropping constraints from [dbo].[CMS_Store_Order]'
GO
ALTER TABLE [dbo].[CMS_Store_Order] DROP CONSTRAINT [DF_CMS_Store_Order_orderGuid]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Content_JoinRegionToPage]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Content_JoinRegionToPage] 
  @RegionId int,
  @PageId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	  INSERT INTO CMS_Content_Page_Region_Map(RegionId, PageId)
	  VALUES (@RegionId, @PageId)
END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Core_FetchAllLogs]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Core_FetchAllLogs] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM CMS_Core_Log ORDER BY LogDate DESC
END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Core_DeleteAllLogs]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Core_DeleteAllLogs] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM CMS_Core_Log
END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[CMS_Core_StateOrRegion]'
GO
CREATE TABLE [dbo].[CMS_Core_StateOrRegion]
(
[StateOrRegionId] [int] NOT NULL IDENTITY(1, 1),
[CountryId] [int] NOT NULL,
[Name] [nvarchar] (50) NOT NULL,
[Abbreviation] [nvarchar] (6) NOT NULL
) ON [PRIMARY]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_CMS_Core_UnitedStates] on [dbo].[CMS_Core_StateOrRegion]'
GO
ALTER TABLE [dbo].[CMS_Core_StateOrRegion] ADD CONSTRAINT [PK_CMS_Core_UnitedStates] PRIMARY KEY CLUSTERED  ([StateOrRegionId]) ON [PRIMARY]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Core_Insert_Log]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Core_Insert_Log]
	-- Add the parameters for the stored procedure here
	@LogDate datetime,
	@Thread nvarchar(255),
	@LogLevel nvarchar(50),
	@Logger nvarchar(255),
	@LogMessage nvarchar(max),
	@LogInfo nvarchar(max),
	@Application nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CMS_Core_Log
		(
			 LogDate
			,Thread
			,LogLevel
			,Logger
			,LogMessage
			,LogInfo
			,[Application]
		)
	VALUES
		(
			 @LogDate
			,@Thread
			,@LogLevel
			,@Logger
			,@LogMessage
			,@LogInfo
			,@Application
		)
	
END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_Browsing_Log]'
GO
ALTER TABLE [dbo].[CMS_Store_Browsing_Log] ALTER COLUMN [Url] [nvarchar] (255) NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_Transaction]'
GO
ALTER TABLE [dbo].[CMS_Store_Transaction] ALTER COLUMN [AVSCode] [nvarchar] (20) NOT NULL
ALTER TABLE [dbo].[CMS_Store_Transaction] ALTER COLUMN [CVV2Code] [nvarchar] (20) NOT NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_FetchAvailableAttributesByProductId]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Store_FetchAvailableAttributesByProductId]
	@ProductId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT AttributeId, AttributeTypeId, [Name], Label
	FROM CMS_Store_Attribute
	WHERE AttributeId NOT IN 
	(SELECT AttributeId FROM CMS_Store_Product_Attribute_Map WHERE ProductId = @ProductId)
	ORDER BY [Name]
END


GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_Order]'
GO
ALTER TABLE [dbo].[CMS_Store_Order] ALTER COLUMN [OrderGuid] [uniqueidentifier] NOT NULL
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_FetchAllProductsByCategoryId]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Store_FetchAllProductsByCategoryId]
  @CategoryId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CMS_Store_Product.*
	FROM CMS_Store_Product
	WHERE CMS_Store_Product.ProductId 
	IN (SELECT CMS_Store_Product_Category_Map.ProductId
		FROM CMS_Store_Product_Category_Map 
		WHERE CMS_Store_Product_Category_Map.CategoryId 
		IN (SELECT CategoryId FROM dbo.CategoryHierarchy(@CategoryId))) 
  ORDER BY SortOrder      
END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Content_FetchTemplateRegionsByTemplateId]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Content_FetchTemplateRegionsByTemplateId] 
  @TemplateId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT 
	    [region].*
    FROM 
    CMS_Content_TemplateRegion region
    INNER JOIN 
    CMS_Content_Template_TemplateRegion_Map map
    ON region.TemplateRegionId = map.TemplateRegionId
    WHERE map.TemplateId = @TemplateId
END

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_FetchCategoryManufacturers]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Store_FetchCategoryManufacturers] 
	@CategoryId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT man.ManufacturerId, man.[Name]
	FROM CMS_Store_Manufacturer man
	INNER JOIN CMS_Store_Product prod ON man.ManufacturerId = prod.ManufacturerId
	INNER JOIN CMS_store_Product_Category_Map map ON prod.ProductId = map.ProductId
	WHERE (map.CategoryId IN (SELECT CategoryId FROM dbo.CategoryHierarchy(@CategoryId)))
	GROUP BY man.ManufacturerId, man.[Name] ORDER BY man.[Name]
END

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Content_FetchRegionsByPageId]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Content_FetchRegionsByPageId] 
  @PageId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT *
    FROM 
    CMS_Content_Region r
    INNER JOIN 
    CMS_Content_Page_Region_Map x
    ON r.RegionId = x.RegionId
    WHERE x.PageId = @PageId 
    ORDER BY r.TemplateRegionId, r.SortOrder
END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
exec sp_refreshview N'[dbo].[vw_CMS_NotInActiveAndLocked_Products]'
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_FetchMostPopularProducts]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Store_FetchMostPopularProducts]
  @BrowsingBehviorId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT TOP 6 
        v.*
       ,COUNT(CMS_Store_Browsing_Log.BrowsingLogId) AS ViewCount 
    FROM CMS_Store_Browsing_Log 
    INNER JOIN vw_CMS_NotInActiveAndLocked_Products v 
    ON CMS_Store_Browsing_Log.RelevantId = v.ProductId
    WHERE CMS_Store_Browsing_Log.BrowsingBehaviorId = @BrowsingBehviorId
    GROUP BY 
        v.ProductId
       ,v.ManufacturerId
       ,v.StatusId
       ,v.ProductTypeId
       ,v.ShippingEstimateId
       ,v.BaseSku
       ,v.ProductGuid
       ,v.[Name]
       ,v.ShortDescription
       ,v.OurPrice
       ,v.RetailPrice
       ,v.Weight
       ,v.Length
       ,v.Height
       ,v.Width
       ,v.SortOrder
       ,v.RatingSum
       ,v.TotalRatingVotes
       ,v.IsEnabled
       ,v.AllowNegativeInventories
       ,v.CreatedBy
       ,v.CreatedOn
       ,v.ModifiedBy
       ,v.ModifiedOn
       ,v.IsDeleted
    ORDER BY ViewCount DESC
END


GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_FetchProductsByCategoryIdAndPriceRange]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Store_FetchProductsByCategoryIdAndPriceRange] 
		@CategoryId int,
		@PriceStart money,
		@PriceEnd money
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT v.*
	FROM vw_CMS_NotInActiveAndLocked_Products v
	WHERE v.ProductId 
	IN (SELECT CMS_Store_Product_Category_Map.ProductId
		FROM CMS_Store_Product_Category_Map 
		WHERE CMS_Store_Product_Category_Map.CategoryId 
		IN (SELECT CategoryId FROM dbo.CategoryHierarchy(@CategoryId))) 
    AND (OurPrice BETWEEN @PriceStart AND @PriceEnd)
    ORDER BY SortOrder      
END

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_FetchCategoryBrowsingLog]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Store_FetchCategoryBrowsingLog] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  -- Insert statements for procedure here
  SELECT DISTINCT(RelevantId), COUNT(RelevantId) AS Hits, c.[Name]
  FROM CMS_Store_Browsing_Log l INNER JOIN CMS_Store_Category c 
  ON l.RelevantId = c.CategoryId
  WHERE BrowsingBehaviorId = 1
  GROUP BY RelevantId, c.[Name]
  ORDER BY Hits DESC

END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_FetchFavoriteProducts]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Store_FetchFavoriteProducts] 
  @UserName nvarchar(50),
  @BrowsingBehaviorId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  SELECT TOP 5 
      v.ProductId
     ,v.[Name]
     ,COUNT(CMS_Store_Browsing_Log.BrowsingLogId) AS ViewCount 
  FROM CMS_Store_Browsing_Log 
  INNER JOIN vw_CMS_NotInActiveAndLocked_Products v 
  ON CMS_Store_Browsing_Log.RelevantId = v.ProductId
  WHERE CMS_Store_Browsing_Log.UserName = @UserName 
  AND CMS_Store_Browsing_Log.BrowsingBehaviorId = @BrowsingBehaviorId
  GROUP BY 
      v.ProductId
     ,v.[Name]
  ORDER BY ViewCount DESC
END


GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_FetchAssociatedOrderTransactions]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Store_FetchAssociatedOrderTransactions] 
  @OrderId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT * FROM CMS_Store_Transaction
    WHERE OrderId In (SELECT OrderId FROM CMS_Store_Order
    WHERE OrderParentId = @OrderId OR OrderId = @OrderId)
END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_ProductSearch]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Store_ProductSearch]
  @searchTerm nvarchar(100)
AS 
  BEGIN
    SET NOCOUNT ON

    SELECT *
    FROM CMS_Store_Product
    WHERE
    IsEnabled = 1 AND StatusId <> 99 AND ( 
    FREETEXT([Name], @searchTerm)
    OR
    FREETEXT([ShortDescription], @searchTerm)
    OR
    FREETEXT([BaseSku], @searchTerm))
    
  END

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Content_FetchRegionsByPageIdAndTemplateRegionId]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Content_FetchRegionsByPageIdAndTemplateRegionId] 
  @PageId int,
  @TemplateRegionId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT *
    FROM 
    CMS_Content_Region r
    INNER JOIN 
    CMS_Content_Page_Region_Map x
    ON r.RegionId = x.RegionId
    WHERE x.PageId = @PageId
    AND 
    r.TemplateRegionId = @TemplateRegionId
    ORDER BY r.TemplateRegionId, r.SortOrder
END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_FetchCategoryBreadCrumbs]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Store_FetchCategoryBreadCrumbs] 
@CategoryId 
int 
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from 
-- interfering with SELECT statements. 
	SET NOCOUNT ON; 
	DECLARE @Result TABLE (CategoryId int, [Name] nvarchar(100 ), Description nvarchar(500), [Level] int) 
	DECLARE @Level int 
	SET @Level = 1 
	DECLARE @ParentId int 
	INSERT @Result 
	SELECT CategoryId, [Name], Description , @Level FROM CMS_Store_Category WHERE CategoryId = @CategoryId 
	SELECT @ParentId = ParentId FROM CMS_Store_Category WHERE CategoryId = @CategoryId 
		WHILE (@ParentId <> 0 ) 
		BEGIN 
		SET @CategoryId = @ParentId 
		INSERT @Result 
		SELECT CategoryId, [Name], Description , @Level + 1 FROM CMS_Store_Category WHERE CategoryId = @CategoryId 
		SELECT @ParentId = ParentId FROM CMS_Store_Category WHERE CategoryId = @CategoryId 
		SET @Level = @Level + 1 
		END 
	SELECT * FROM @Result ORDER BY [Level] DESC 
END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_FetchProductBrowsingLog]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Store_FetchProductBrowsingLog] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  -- Insert statements for procedure here
  SELECT DISTINCT(RelevantId), COUNT(RelevantId) AS Hits, p.[Name]
  FROM CMS_Store_Browsing_Log l INNER JOIN CMS_Store_Product p 
  ON l.RelevantId = p.ProductId
  WHERE BrowsingBehaviorId = 2
  GROUP BY RelevantId, p.[Name]
  ORDER BY Hits DESC

END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_FetchAssociatedAttributesByProductId]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Store_FetchAssociatedAttributesByProductId]
	@ProductId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		 attribute.AttributeId
		,attribute.AttributeTypeId
		,attribute.[Name]
		,attribute.Label
		,map.SortOrder
		,map.IsRequired
	FROM 
	CMS_Store_Attribute attribute
	INNER JOIN 
	CMS_Store_Product_Attribute_Map map
	ON 
	attribute.AttributeId = map.AttributeId
	WHERE map.ProductId = @ProductId
	ORDER BY map.SortOrder ASC
END

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_FetchProductsByCategoryIdAndManufacturerId]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Store_FetchProductsByCategoryIdAndManufacturerId] 
  @CategoryId int,
  @ManufacturerId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT v.*
	FROM vw_CMS_NotInActiveAndLocked_Products v
	WHERE v.ManufacturerId = @ManufacturerId 
  AND v.ProductId 
	IN (SELECT CMS_Store_Product_Category_Map.ProductId
		FROM CMS_Store_Product_Category_Map 
		WHERE CMS_Store_Product_Category_Map.CategoryId 
		IN (SELECT CategoryId FROM dbo.CategoryHierarchy(@CategoryId))) 
  ORDER BY SortOrder      
END

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_FetchBrowsingLogSearchTerms]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Store_FetchBrowsingLogSearchTerms] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  SELECT DISTINCT TOP 5 (SearchTerms), COUNT(CMS_Store_Browsing_Log.BrowsingLogId) AS ViewCount 
  FROM CMS_Store_Browsing_Log 
  WHERE CMS_Store_Browsing_Log.BrowsingBehaviorId = 5
  GROUP BY SearchTerms
  ORDER BY ViewCount DESC

END

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[CMS_Core_FetchStateOrRegionByCountryCode]'
GO

CREATE PROCEDURE [dbo].[CMS_Core_FetchStateOrRegionByCountryCode]
	@Code nvarchar(2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @CountryId int

	SELECT @CountryId = CountryId
	FROM CMS_Core_Country
	WHERE Code = @Code

	SELECT * FROM CMS_Core_StateOrRegion
	WHERE CMS_Core_StateOrRegion.CountryId = @CountryId
END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_FetchProductsByCategoryId]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Store_FetchProductsByCategoryId] 
	@CategoryId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT v.*
	FROM vw_CMS_NotInActiveAndLocked_Products v
	WHERE v.ProductId 
	IN (SELECT CMS_Store_Product_Category_Map.ProductId
		FROM CMS_Store_Product_Category_Map 
		WHERE CMS_Store_Product_Category_Map.CategoryId 
		IN (SELECT CategoryId FROM dbo.CategoryHierarchy(@CategoryId))) 
  ORDER BY SortOrder      
END


GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_FetchProductCrossSells]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Store_FetchProductCrossSells] 
  @ProductId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT * 
    FROM vw_CMS_NotInActiveAndLocked_Products 
    WHERE ProductId IN 
    (SELECT CrossProductId 
     FROM CMS_Store_CrossSell 
     WHERE ProductId = @ProductId) 
END


GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_FetchRandomProducts]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Store_FetchRandomProducts] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  SELECT TOP 6 v.*
  FROM vw_CMS_NotInActiveAndLocked_Products v 
  ORDER BY NEWID()
END

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_FetchAssociatedOrders]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Store_FetchAssociatedOrders] 
  @OrderId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT * FROM CMS_Store_Order
    WHERE OrderId In (SELECT OrderId FROM CMS_Store_Order
    WHERE OrderParentId = @OrderId OR OrderId = @OrderId)
END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_FetchAssociatedCategoriesByProductId]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Store_FetchAssociatedCategoriesByProductId]
	@ProductId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		dbo.CMS_Store_Category.CategoryId,
		dbo.CMS_Store_Category.CategoryGuid,
		dbo.CMS_Store_Category.ParentId,
		dbo.CMS_Store_Category.[Name],
		dbo.CMS_Store_Category.ImageFile,
		dbo.CMS_Store_Category.Description,
		dbo.CMS_Store_Category.SortOrder,
		dbo.CMS_Store_Category.CreatedOn, 
		dbo.CMS_Store_Category.CreatedBy, 
		dbo.CMS_Store_Category.ModifiedOn, 
		dbo.CMS_Store_Category.ModifiedBy 
	FROM
		dbo.CMS_Store_Product_Category_Map 
		INNER JOIN dbo.CMS_Store_Category 
		ON dbo.CMS_Store_Product_Category_Map.categoryID = dbo.CMS_Store_Category.categoryID
	WHERE CMS_Store_Product_Category_Map.productID = @ProductId

END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_FetchCategoryPriceRanges]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Store_FetchCategoryPriceRanges] 
	@CategoryId int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @MinPrice money, @MaxPrice money
	
	SELECT  @MinPrice = MIN(ourPrice)
		     ,@MaxPrice = MAX(ourPrice)
	FROM CMS_Store_Product 
	WHERE ProductId IN 
		(SELECT ProductId 
		 FROM CMS_Store_Product_Category_Map 
		 WHERE CategoryId IN (SELECT CategoryId FROM dbo.CategoryHierarchy(@CategoryId))
	)
	CREATE TABLE #prices(lowRange money, hiRange money)
	DECLARE @thisLow money, @thisHigh money
	SET @thisLow = @minPrice
	SET @thisHigh = 2 * @thisLow - 1
	IF @thisLow = 0
	BEGIN
		SET @thisHigh = 1
	END	

	DECLARE @loopCatch int
	
	--catch infinite loops
	SELECT @loopCatch = 1
	WHILE @thisLow <= @maxPrice AND @loopCatch < 100
		BEGIN
			INSERT INTO #prices(lowRange, hiRange) VALUES (@thisLow, @thisHigh)
			SET @thisLow = @thisHigh + 1
			SET @thisHigh = 2 * @thisLow - 1
			SELECT @loopCatch = @loopCatch + 1
		END
	SELECT * FROM #prices
	DROP TABLE #prices
END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_FetchFavoriteCategories]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Store_FetchFavoriteCategories] 
	-- Add the parameters for the stored procedure here
  @UserName nvarchar(50),
  @BrowsingBehaviorId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT TOP 5 
        dbo.CMS_Store_Category.CategoryId
       ,dbo.CMS_Store_Category.[Name] 
	     ,COUNT(dbo.CMS_Store_Browsing_Log.BrowsingLogId) AS ViewCount
    FROM dbo.CMS_Store_Browsing_Log 
    INNER JOIN dbo.CMS_Store_Category 
    ON dbo.CMS_Store_Browsing_Log.RelevantId = dbo.CMS_Store_Category.CategoryId
    WHERE CMS_Store_Browsing_Log.UserName = @UserName 
          AND CMS_Store_Browsing_Log.BrowsingBehaviorId = @BrowsingBehaviorId
    GROUP BY 
            dbo.CMS_Store_Category.CategoryId
           ,dbo.CMS_Store_Category.[Name]
    ORDER BY ViewCount DESC
END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Altering [dbo].[CMS_Store_FetchRefundedOrderItems]'
GO

-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

ALTER PROCEDURE [dbo].[CMS_Store_FetchRefundedOrderItems]
  @OrderId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT Sku, SUM(Quantity) AS Quantity FROM CMS_Store_OrderItem
    WHERE OrderId In (SELECT OrderId FROM CMS_Store_Order
    WHERE OrderParentId = @OrderId AND OrderTypeId = 2)
    GROUP BY Sku
END

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding constraints to [dbo].[CMS_Store_Order]'
GO
ALTER TABLE [dbo].[CMS_Store_Order] ADD CONSTRAINT [DF_CMS_Store_Order_orderGuid] DEFAULT (newid()) FOR [OrderGuid]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[CMS_Core_StateOrRegion]'
GO
ALTER TABLE [dbo].[CMS_Core_StateOrRegion] ADD
CONSTRAINT [FK_CMS_Core_StateOrRegion_CMS_Core_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[CMS_Core_Country] ([CountryId])
GO
SET IDENTITY_INSERT [dbo].[CMS_Core_StateOrRegion] ON
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (1, 224, N'ALABAMA', N'AL')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (2, 224, N'ALASKA', N'AK')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (3, 224, N'AMERICAN SAMOA', N'AS')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (4, 224, N'ARIZONA', N'AZ')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (5, 224, N'ARKANSAS', N'AR')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (6, 224, N'CALIFORNIA', N'CA')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (7, 224, N'COLORADO', N'CO')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (8, 224, N'CONNECTICUT', N'CT')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (9, 224, N'DELAWARE', N'DE')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (10, 224, N'DISTRICT OF COLUMBIA', N'DC')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (11, 224, N'FEDERATED STATES OF MICRONESIA', N'FM')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (12, 224, N'FLORIDA', N'FL')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (13, 224, N'GEORGIA', N'GA')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (14, 224, N'GUAM', N'GU')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (15, 224, N'HAWAII', N'HI')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (16, 224, N'IDAHO', N'ID')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (17, 224, N'ILLINOIS', N'IL')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (18, 224, N'INDIANA', N'IN')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (19, 224, N'IOWA', N'IA')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (20, 224, N'KANSAS', N'KS')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (21, 224, N'KENTUCKY', N'KY')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (22, 224, N'LOUISIANA', N'LA')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (23, 224, N'MAINE', N'ME')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (24, 224, N'MARSHALL ISLANDS', N'MH')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (25, 224, N'MARYLAND', N'MD')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (26, 224, N'MASSACHUSETTS', N'MA')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (27, 224, N'MICHIGAN', N'MI')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (28, 224, N'MINNESOTA', N'MN')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (29, 224, N'MISSISSIPPI', N'MS')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (30, 224, N'MISSOURI', N'MO')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (31, 224, N'MONTANA', N'MT')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (32, 224, N'NEBRASKA', N'NE')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (33, 224, N'NEVADA', N'NV')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (34, 224, N'NEW HAMPSHIRE', N'NH')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (35, 224, N'NEW JERSEY', N'NJ')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (36, 224, N'NEW MEXICO', N'NM')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (37, 224, N'NEW YORK', N'NY')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (38, 224, N'NORTH CAROLINA', N'NC')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (39, 224, N'NORTH DAKOTA', N'ND')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (40, 224, N'NORTHERN MARIANA ISLANDS', N'MP')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (41, 224, N'OHIO', N'OH')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (42, 224, N'OKLAHOMA', N'OK')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (43, 224, N'OREGON', N'OR')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (44, 224, N'PALAU', N'PW')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (45, 224, N'PENNSYLVANIA', N'PA')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (46, 224, N'PUERTO RICO', N'PR')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (47, 224, N'RHODE ISLAND', N'RI')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (48, 224, N'SOUTH CAROLINA', N'SC')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (49, 224, N'SOUTH DAKOTA', N'SD')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (50, 224, N'TENNESSEE', N'TN')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (51, 224, N'TEXAS', N'TX')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (52, 224, N'UTAH', N'UT')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (53, 224, N'VERMONT', N'VT')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (54, 224, N'VIRGIN ISLANDS', N'VI')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (55, 224, N'VIRGINIA', N'VA')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (56, 224, N'WASHINGTON', N'WA')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (57, 224, N'WEST VIRGINIA', N'WV')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (58, 224, N'WISCONSIN', N'WI')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (59, 224, N'WYOMING', N'WY')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (60, 39, N'ALBERTA', N'AB')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (61, 39, N'BRITISH COLUMBIA', N'BC')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (62, 39, N'MANITOBA', N'MB')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (63, 39, N'NEW BRUNSWICK', N'NB')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (64, 39, N'NEWFOUNDLAND AND LABRADOR', N'NL')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (65, 39, N'NOVA SCOTIA', N'NS')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (66, 39, N'NORTHWEST TERRITORIES', N'NT')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (67, 39, N'NUNAVUT', N'NU')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (68, 39, N'ONTARIO', N'ON')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (69, 39, N'PRINCE EDWARD ISLAND', N'PE')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (70, 39, N'QUEBEC', N'QC')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (71, 39, N'SASKATCHEWAN', N'SK')
INSERT [dbo].[CMS_Core_StateOrRegion] ([StateOrRegionId], [CountryId], [Name], [Abbreviation]) VALUES (72, 39, N'YUKON', N'YT')
SET IDENTITY_INSERT [dbo].[CMS_Core_StateOrRegion] OFF
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 BEGIN
PRINT 'The database update succeeded'
COMMIT TRANSACTION
END
ELSE PRINT 'The database update failed'
GO
DROP TABLE #tmpErrors
GO
