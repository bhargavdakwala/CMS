/*
This script was created by Visual Studio on 6/13/2008 at 7:28 PM.
Run this script on chris\dev2005.dC3.0_Base.dbo to make it the same as chris\dev2005.dC3.1.dbo.
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
BEGIN TRANSACTION
GO
PRINT N'Creating [dbo].[CMS_Store_CustomizedProductDisplayType_Product_Map]'
GO
CREATE TABLE [dbo].[CMS_Store_CustomizedProductDisplayType_Product_Map]
(
[CustomizedProductsDisplayTypeId] [int] NOT NULL,
[ProductId] [int] NOT NULL
) ON [PRIMARY]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_CustomizedProductsDisplayType_Product_Map] on [dbo].[CMS_Store_CustomizedProductDisplayType_Product_Map]'
GO
ALTER TABLE [dbo].[CMS_Store_CustomizedProductDisplayType_Product_Map] ADD CONSTRAINT [PK_CustomizedProductsDisplayType_Product_Map] PRIMARY KEY CLUSTERED  ([CustomizedProductsDisplayTypeId], [ProductId]) ON [PRIMARY]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[CMS_Store_CustomizedProductDisplayTypes]'
GO
CREATE TABLE [dbo].[CMS_Store_CustomizedProductDisplayTypes]
(
[CustomizedProductsDisplayTypeId] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (50) NOT NULL,
[CreatedBy] [nvarchar] (50) NOT NULL,
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_CMS_Content_CustomizedProductsDisplayTypes_CreatedOn] DEFAULT (getutcdate()),
[ModifiedBy] [nvarchar] (50) NOT NULL,
[ModifiedOn] [datetime] NOT NULL CONSTRAINT [DF_CMS_Content_CustomizedProductsDisplayTypes_ModifiedOn] DEFAULT (getutcdate())
) ON [PRIMARY]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_CMS_Content_CustomizedProductsDisplayTypes] on [dbo].[CMS_Store_CustomizedProductDisplayTypes]'
GO
ALTER TABLE [dbo].[CMS_Store_CustomizedProductDisplayTypes] ADD CONSTRAINT [PK_CMS_Content_CustomizedProductsDisplayTypes] PRIMARY KEY CLUSTERED  ([CustomizedProductsDisplayTypeId]) ON [PRIMARY]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[CMS_Content_CustomizedProductDisplay]'
GO
CREATE TABLE [dbo].[CMS_Content_CustomizedProductDisplay]
(
[CustomizedProductDisplayId] [int] NOT NULL IDENTITY(1, 1),
[CustomizedProductDisplayTypeId] [int] NOT NULL,
[RegionId] [int] NOT NULL,
[IsActive] [bit] NOT NULL,
[CreatedBy] [nvarchar] (50) NOT NULL,
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_CMS_Content_CustomizedProductsDisplay_CreatedOn] DEFAULT (getutcdate()),
[ModifiedBy] [nvarchar] (50) NOT NULL,
[ModifiedOn] [datetime] NOT NULL CONSTRAINT [DF_CMS_Content_CustomizedProductsDisplay_ModifiedOn] DEFAULT (getutcdate())
) ON [PRIMARY]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_CMS_Content_CustomizedProductsDisplay] on [dbo].[CMS_Content_CustomizedProductDisplay]'
GO
ALTER TABLE [dbo].[CMS_Content_CustomizedProductDisplay] ADD CONSTRAINT [PK_CMS_Content_CustomizedProductsDisplay] PRIMARY KEY CLUSTERED  ([CustomizedProductDisplayId]) ON [PRIMARY]
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
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[CMS_Store_CustomizedProductDisplayType_Product_Map]'
GO
ALTER TABLE [dbo].[CMS_Store_CustomizedProductDisplayType_Product_Map] ADD
CONSTRAINT [FK_CMS_Store_CustomizedProductDisplayType_Product_Map_CMS_Store_CustomizedProductDisplayTypes] FOREIGN KEY ([CustomizedProductsDisplayTypeId]) REFERENCES [dbo].[CMS_Store_CustomizedProductDisplayTypes] ([CustomizedProductsDisplayTypeId]),
CONSTRAINT [FK_CustomizedProductsDisplayType_Product_Map_CMS_Store_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[CMS_Store_Product] ([ProductId])
GO
INSERT [dbo].[CMS_Content_Provider] ([Name], [ViewControl], [EditControl], [StyleSheet], [CreatedBy], [ModifiedBy]) VALUES (N'Customized Products Display', N'~/controls/content/products/ViewCustomizedProductsDisplay.ascx', N'~/admin/controls/content/products/EditCustomizedProductsDisplay.ascx', NULL, N'SYSTEM', N'SYSTEM')
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
