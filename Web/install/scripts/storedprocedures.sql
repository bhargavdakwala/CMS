SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Store_FetchCategoryBreadCrumbs]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchCategoryBreadCrumbs] 
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
END' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Store_FetchRandomProducts]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchRandomProducts] 

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

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Store_FetchProductCrossSells]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchProductCrossSells] 
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
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Store_FetchAssociatedAttributesByProductId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchAssociatedAttributesByProductId]
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
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Store_FetchAvailableAttributesByProductId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchAvailableAttributesByProductId]
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
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Store_FetchAssociatedCategoriesByProductId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchAssociatedCategoriesByProductId]
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
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Store_FetchCategoryPriceRanges]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchCategoryPriceRanges] 
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
	SET @thisHigh = 2 * @thisLow - .01
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
			SET @thisLow = @thisHigh + .01
			SET @thisHigh = 2 * @thisLow - .01
			SELECT @loopCatch = @loopCatch + 1
		END
	SELECT * FROM #prices
	DROP TABLE #prices
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Store_FetchCategoryManufacturers]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchCategoryManufacturers] 
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

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Store_FetchProductsByCategoryIdAndManufacturerId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchProductsByCategoryIdAndManufacturerId] 
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

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Store_FetchProductsByCategoryId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchProductsByCategoryId] 
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


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Store_FetchProductsByCategoryIdAndPriceRange]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchProductsByCategoryIdAndPriceRange] 
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

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Store_FetchAllProductsByCategoryId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchAllProductsByCategoryId]
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
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Content_FetchRegionsByPageId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Content_FetchRegionsByPageId] 
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
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Content_FetchRegionsByPageIdAndTemplateRegionId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Content_FetchRegionsByPageIdAndTemplateRegionId] 
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
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Core_DeleteAllLogs]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Core_DeleteAllLogs] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM CMS_Core_Log
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Content_JoinRegionToPage]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Content_JoinRegionToPage] 
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
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Store_ProductSearch]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_ProductSearch]
  @searchTerm nvarchar(100)
AS 
  BEGIN
	  SET NOCOUNT ON

	  SET @searchTerm = ''%'' + rtrim(ltrim(@searchTerm)) + ''%''	

	  SELECT DISTINCT(p.ProductId) INTO #PRODUCTS
	  FROM 
	  CMS_Store_Product p
	  LEFT OUTER JOIN
	  CMS_Store_Descriptor d
	  ON p.ProductId = d.ProductId
	  WHERE 
	  patindex(@searchTerm, p.Name) > 0
	  OR
	  patindex(@searchTerm, isnull(p.ShortDescription, '''')) > 0
	  OR
	  patindex(@searchTerm, d.Descriptor) > 0

	  SELECT p.* FROM  #PRODUCTS p2
	  INNER JOIN
	  vw_CMS_NotInActiveAndLocked_Products p
	  ON p2.ProductId = p.ProductId

	  DROP TABLE #PRODUCTS    
  END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Store_FetchProductBrowsingLog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchProductBrowsingLog] 

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
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Content_FetchTemplateRegionsByTemplateId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Content_FetchTemplateRegionsByTemplateId] 
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

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Store_FetchBrowsingLogSearchTerms]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchBrowsingLogSearchTerms] 
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

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Store_FetchFavoriteCategories]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchFavoriteCategories] 
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
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Store_FetchCategoryBrowsingLog]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchCategoryBrowsingLog] 

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
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Store_FetchFavoriteProducts]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchFavoriteProducts] 
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


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Store_FetchMostPopularProducts]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchMostPopularProducts]
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
       ,v.ProductStatusDescriptorId
       ,v.ProductTypeId
       ,v.ShippingEstimateId
       ,v.BaseSku
       ,v.ProductGuid
       ,v.[Name]
       ,v.ShortDescription
       ,v.OurPrice
       ,v.RetailPrice
       ,v.TaxRateId
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


' 
END
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Store_FetchAssociatedOrderTransactions]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchAssociatedOrderTransactions] 
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
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Store_FetchAssociatedOrders]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchAssociatedOrders] 
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
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Store_FetchRefundedOrderItems]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchRefundedOrderItems]
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

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CMS_Core_FetchStateOrRegionByCountryCode]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

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
'
END
GO
/****** Object:  StoredProcedure [dbo].[CMS_Store_FetchAvailableDownloadsByProductId]    Script Date: 05/17/2009 14:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchAvailableDownloadsByProductId]
	@ProductId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CMS_Store_Download.*
	FROM CMS_Store_Download
	WHERE DownloadId NOT IN 
	(SELECT DownloadId FROM CMS_Store_Product_Download_Map WHERE ProductId = @ProductId)
	ORDER BY [Title]
END
GO
/****** Object:  StoredProcedure [dbo].[CMS_Store_FetchAssociatedDownloadsByProductId]    Script Date: 05/17/2009 14:06:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchAssociatedDownloadsByProductId]
  @ProductId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		dbo.CMS_Store_Download.*
	FROM
		dbo.CMS_Store_Product_Download_Map 
		INNER JOIN dbo.CMS_Store_Download 
		ON dbo.CMS_Store_Product_Download_Map.DownloadId = dbo.CMS_Store_Download.DownloadId
	WHERE CMS_Store_Product_Download_Map.ProductId = @ProductId
END
GO
/****** Object:  StoredProcedure [dbo].[CMS_Store_FetchAssociatedDownloadsByProductIdAndForPurchase]    Script Date: 05/17/2009 14:07:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchAssociatedDownloadsByProductIdAndForPurchase]
  @ProductId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		dbo.CMS_Store_Download.*
	FROM
		dbo.CMS_Store_Product_Download_Map 
		INNER JOIN dbo.CMS_Store_Download 
		ON dbo.CMS_Store_Product_Download_Map.DownloadId = dbo.CMS_Store_Download.DownloadId
	WHERE CMS_Store_Product_Download_Map.ProductId = @ProductId AND CMS_Store_Download.ForPurchaseOnly = 1
END
GO
/****** Object:  StoredProcedure [dbo].[CMS_Store_FetchAssociatedDownloadsByProductIdAndNotForPurchase]    Script Date: 05/17/2009 14:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchAssociatedDownloadsByProductIdAndNotForPurchase]
  @ProductId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		dbo.CMS_Store_Download.*
	FROM
		dbo.CMS_Store_Product_Download_Map 
		INNER JOIN dbo.CMS_Store_Download 
		ON dbo.CMS_Store_Product_Download_Map.DownloadId = dbo.CMS_Store_Download.DownloadId
	WHERE CMS_Store_Product_Download_Map.ProductId = @ProductId AND CMS_Store_Download.ForPurchaseOnly = 0
END
GO
/****** Object:  StoredProcedure [dbo].[CMS_Store_FetchPurchasedDownloadsByUserId]    Script Date: 05/17/2009 15:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================================
-- Licensed Under the CMS License 
-- http://CMS.org/CMS/license.aspx
-- Copyright (c) 2007 - 2008 Mettle Systems LLC, P.O. Box 181192 
-- Cleveland Heights, Ohio 44118, United States
-- ================================================================

CREATE PROCEDURE [dbo].[CMS_Store_FetchPurchasedDownloadsByUserId] 
  @UserId uniqueidentifier	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  -- Insert statements for procedure here
	SELECT * 
  FROM CMS_Store_Download
  WHERE CMS_Store_Download.DownloadId 
  IN (SELECT DownloadId FROM CMS_Store_DownloadAccessControl WHERE UserId = @UserId)
END
GO
