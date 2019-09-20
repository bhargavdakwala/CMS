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
	/// <summary>
	/// Strongly-typed collection for the CmsContentBlogCategory class.
	/// </summary>
    [Serializable]
	public partial class BlogCategoryCollection : ActiveList<BlogCategory, BlogCategoryCollection>
	{
        public BlogCategoryCollection() { }
        
        /// <summary>
		/// Filters an existing collection based on the set criteria. This is an in-memory filter
		/// Thanks to developingchris for this!
        /// </summary>
        /// <returns>CmsContentBlogCategoryCollection</returns>
        public BlogCategoryCollection Filter()
        {
            for (int i = this.Count - 1; i > -1; i--)
            {
                BlogCategory o = this[i];
                foreach (SubSonic.Where w in this.wheres)
                {
                    bool remove = false;
                    System.Reflection.PropertyInfo pi = o.GetType().GetProperty(w.ColumnName);
                    if (pi.CanRead)
                    {
                        object val = pi.GetValue(o, null);
                        switch (w.Comparison)
                        {
                            case SubSonic.Comparison.Equals:
                                if (!val.Equals(w.ParameterValue))
                                {
                                    remove = true;
                                }
                                break;
                        }
                    }
                    if (remove)
                    {
                        this.Remove(o);
                        break;
                    }
                }
            }
            return this;
        }
		
		
	}
	/// <summary>
	/// This is an ActiveRecord class which wraps the CMS_Content_BlogCategory table.
	/// </summary>
	[Serializable]
	public partial class BlogCategory : ActiveRecord<BlogCategory>
	{
		#region .ctors and Default Settings
		
		public BlogCategory()
		{
		  SetSQLProps();
		  InitSetDefaults();
		  MarkNew();
		}
		
		private void InitSetDefaults() { SetDefaults(); }
		
		public BlogCategory(bool useDatabaseDefaults)
		{
			SetSQLProps();
			if(useDatabaseDefaults)
				ForceDefaults();
			MarkNew();
		}
        
		public BlogCategory(object keyID)
		{
			SetSQLProps();
			InitSetDefaults();
			LoadByKey(keyID);
		}

        public BlogCategory(string columnName, object columnValue)
		{
			SetSQLProps();
			InitSetDefaults();
			LoadByParam(columnName,columnValue);
		}
		
		protected static void SetSQLProps() { GetTableSchema(); }
		
		#endregion
		
		#region Schema and Query Accessor	
		public static Query CreateQuery() { return new Query(Schema); }
		public static TableSchema.Table Schema
		{
			get
			{
				if (BaseSchema == null)
					SetSQLProps();
				return BaseSchema;
			}
		}
		
		private static void GetTableSchema() 
		{
			if(!IsSchemaInitialized)
			{
				//Schema declaration
                TableSchema.Table schema = new TableSchema.Table("CMS_Content_BlogCategory", TableType.Table, DataService.GetInstance("CMSProvider"));
				schema.Columns = new TableSchema.TableColumnCollection();
				schema.SchemaName = @"dbo";
				//columns
				
				TableSchema.TableColumn colvarCategoryId = new TableSchema.TableColumn(schema);
				colvarCategoryId.ColumnName = "CategoryId";
				colvarCategoryId.DataType = DbType.Int32;
				colvarCategoryId.MaxLength = 0;
				colvarCategoryId.AutoIncrement = true;
				colvarCategoryId.IsNullable = false;
				colvarCategoryId.IsPrimaryKey = true;
				colvarCategoryId.IsForeignKey = false;
				colvarCategoryId.IsReadOnly = false;
				colvarCategoryId.DefaultSetting = @"";
				colvarCategoryId.ForeignKeyTableName = "";
				schema.Columns.Add(colvarCategoryId);

                TableSchema.TableColumn colvarCategoryGuid = new TableSchema.TableColumn(schema);
                colvarCategoryGuid.ColumnName = "CategoryGuid";
                colvarCategoryGuid.DataType = DbType.Guid;
                colvarCategoryGuid.MaxLength = 0;
                colvarCategoryGuid.AutoIncrement = false;
                colvarCategoryGuid.IsNullable = false;
                colvarCategoryGuid.IsPrimaryKey = true;
                colvarCategoryGuid.IsForeignKey = false;
                colvarCategoryGuid.IsReadOnly = false;
                colvarCategoryGuid.DefaultSetting = @"(newid())";
                colvarCategoryGuid.ForeignKeyTableName = "";
                schema.Columns.Add(colvarCategoryGuid);
				
				TableSchema.TableColumn colvarCategoryTitle = new TableSchema.TableColumn(schema);
				colvarCategoryTitle.ColumnName = "CategoryTitle";
				colvarCategoryTitle.DataType = DbType.String;
				colvarCategoryTitle.MaxLength = 255;
				colvarCategoryTitle.AutoIncrement = false;
				colvarCategoryTitle.IsNullable = true;
				colvarCategoryTitle.IsPrimaryKey = false;
				colvarCategoryTitle.IsForeignKey = false;
				colvarCategoryTitle.IsReadOnly = false;
				colvarCategoryTitle.DefaultSetting = @"";
				colvarCategoryTitle.ForeignKeyTableName = "";
				schema.Columns.Add(colvarCategoryTitle);
				
				TableSchema.TableColumn colvarCreatedBy = new TableSchema.TableColumn(schema);
				colvarCreatedBy.ColumnName = "CreatedBy";
				colvarCreatedBy.DataType = DbType.String;
				colvarCreatedBy.MaxLength = 50;
				colvarCreatedBy.AutoIncrement = false;
				colvarCreatedBy.IsNullable = true;
				colvarCreatedBy.IsPrimaryKey = false;
				colvarCreatedBy.IsForeignKey = false;
				colvarCreatedBy.IsReadOnly = false;
				colvarCreatedBy.DefaultSetting = @"";
				colvarCreatedBy.ForeignKeyTableName = "";
				schema.Columns.Add(colvarCreatedBy);
				
				TableSchema.TableColumn colvarCreatedOn = new TableSchema.TableColumn(schema);
				colvarCreatedOn.ColumnName = "CreatedOn";
				colvarCreatedOn.DataType = DbType.DateTime;
				colvarCreatedOn.MaxLength = 0;
				colvarCreatedOn.AutoIncrement = false;
				colvarCreatedOn.IsNullable = true;
				colvarCreatedOn.IsPrimaryKey = false;
				colvarCreatedOn.IsForeignKey = false;
				colvarCreatedOn.IsReadOnly = false;
				colvarCreatedOn.DefaultSetting = @"";
				colvarCreatedOn.ForeignKeyTableName = "";
				schema.Columns.Add(colvarCreatedOn);
				
				TableSchema.TableColumn colvarModifiedBy = new TableSchema.TableColumn(schema);
				colvarModifiedBy.ColumnName = "ModifiedBy";
				colvarModifiedBy.DataType = DbType.String;
				colvarModifiedBy.MaxLength = 50;
				colvarModifiedBy.AutoIncrement = false;
				colvarModifiedBy.IsNullable = true;
				colvarModifiedBy.IsPrimaryKey = false;
				colvarModifiedBy.IsForeignKey = false;
				colvarModifiedBy.IsReadOnly = false;
				colvarModifiedBy.DefaultSetting = @"";
				colvarModifiedBy.ForeignKeyTableName = "";
				schema.Columns.Add(colvarModifiedBy);
				
				TableSchema.TableColumn colvarModifiedOn = new TableSchema.TableColumn(schema);
				colvarModifiedOn.ColumnName = "ModifiedOn";
				colvarModifiedOn.DataType = DbType.DateTime;
				colvarModifiedOn.MaxLength = 0;
				colvarModifiedOn.AutoIncrement = false;
				colvarModifiedOn.IsNullable = true;
				colvarModifiedOn.IsPrimaryKey = false;
				colvarModifiedOn.IsForeignKey = false;
				colvarModifiedOn.IsReadOnly = false;
				colvarModifiedOn.DefaultSetting = @"";
				colvarModifiedOn.ForeignKeyTableName = "";
				schema.Columns.Add(colvarModifiedOn);


                TableSchema.TableColumn colvarURLTitle = new TableSchema.TableColumn(schema);
                colvarURLTitle.ColumnName = "URLTitle";
                colvarURLTitle.DataType = DbType.String;
                colvarURLTitle.MaxLength = 100;
                colvarURLTitle.AutoIncrement = false;
                colvarURLTitle.IsNullable = true;
                colvarURLTitle.IsPrimaryKey = false;
                colvarURLTitle.IsForeignKey = false;
                colvarURLTitle.IsReadOnly = false;
                colvarURLTitle.DefaultSetting = @"";
                colvarURLTitle.ForeignKeyTableName = "";
                schema.Columns.Add(colvarURLTitle);


                TableSchema.TableColumn colvarKeywords = new TableSchema.TableColumn(schema);
                colvarKeywords.ColumnName = "Keywords";
                colvarKeywords.DataType = DbType.String;
                colvarKeywords.MaxLength = 500;
                colvarKeywords.AutoIncrement = false;
                colvarKeywords.IsNullable = true;
                colvarKeywords.IsPrimaryKey = false;
                colvarKeywords.IsForeignKey = false;
                colvarKeywords.IsReadOnly = false;
                colvarKeywords.DefaultSetting = @"";
                colvarKeywords.ForeignKeyTableName = "";
                schema.Columns.Add(colvarKeywords);

                TableSchema.TableColumn colvarTitle = new TableSchema.TableColumn(schema);
                colvarTitle.ColumnName = "Title";
                colvarTitle.DataType = DbType.String;
                colvarTitle.MaxLength = 250;
                colvarTitle.AutoIncrement = false;
                colvarTitle.IsNullable = true;
                colvarTitle.IsPrimaryKey = false;
                colvarTitle.IsForeignKey = false;
                colvarTitle.IsReadOnly = false;
                colvarTitle.DefaultSetting = @"";
                colvarTitle.ForeignKeyTableName = "";
                schema.Columns.Add(colvarTitle);

                TableSchema.TableColumn colvarDescription = new TableSchema.TableColumn(schema);
                colvarDescription.ColumnName = "Description";
                colvarDescription.DataType = DbType.String;
                colvarDescription.MaxLength = 500;
                colvarDescription.AutoIncrement = false;
                colvarDescription.IsNullable = true;
                colvarDescription.IsPrimaryKey = false;
                colvarDescription.IsForeignKey = false;
                colvarDescription.IsReadOnly = false;
                colvarDescription.DefaultSetting = @"";
                colvarDescription.ForeignKeyTableName = "";
                schema.Columns.Add(colvarDescription);
				
				BaseSchema = schema;
				//add this schema to the provider
				//so we can query it later
                DataService.Providers["CMSProvider"].AddSchema("CMS_Content_BlogCategory", schema);
			}
		}
		#endregion
		
		#region Props
		  
		[XmlAttribute("CategoryId")]
		[Bindable(true)]
		public int CategoryId 
		{
			get { return GetColumnValue<int>(Columns.CategoryId); }
			set { SetColumnValue(Columns.CategoryId, value); }
		}

        [XmlAttribute("CategoryGuid")]
		public Guid CategoryGuid 
		{
			get { return GetColumnValue<Guid>("CategoryGuid"); }

			set { SetColumnValue("CategoryGuid", value); }

		}
		  
		[XmlAttribute("CategoryTitle")]
		[Bindable(true)]
		public string CategoryTitle 
		{
			get { return GetColumnValue<string>(Columns.CategoryTitle); }
			set { SetColumnValue(Columns.CategoryTitle, value); }
		}
		  
		[XmlAttribute("CreatedBy")]
		[Bindable(true)]
		public string CreatedBy 
		{
			get { return GetColumnValue<string>(Columns.CreatedBy); }
			set { SetColumnValue(Columns.CreatedBy, value); }
		}
		  
		[XmlAttribute("CreatedOn")]
		[Bindable(true)]
		public DateTime? CreatedOn 
		{
			get { return GetColumnValue<DateTime?>(Columns.CreatedOn); }
			set { SetColumnValue(Columns.CreatedOn, value); }
		}
		  
		[XmlAttribute("ModifiedBy")]
		[Bindable(true)]
		public string ModifiedBy 
		{
			get { return GetColumnValue<string>(Columns.ModifiedBy); }
			set { SetColumnValue(Columns.ModifiedBy, value); }
		}
		  
		[XmlAttribute("ModifiedOn")]
		[Bindable(true)]
		public DateTime? ModifiedOn 
		{
			get { return GetColumnValue<DateTime?>(Columns.ModifiedOn); }
			set { SetColumnValue(Columns.ModifiedOn, value); }
		}


        [XmlAttribute("URLTitle")]
        [Bindable(true)]
        public string URLTitle
        {
            get { return GetColumnValue<string>(Columns.URLTitle); }
            set { SetColumnValue(Columns.URLTitle, value); }
        }

        [XmlAttribute("Keywords")]
        [Bindable(true)]
        public string Keywords
        {
            get { return GetColumnValue<string>(Columns.Keywords); }
            set { SetColumnValue(Columns.Keywords, value); }
        }

        [XmlAttribute("Title")]
        [Bindable(true)]
        public string Title
        {
            get { return GetColumnValue<string>(Columns.Title); }
            set { SetColumnValue(Columns.Title, value); }
        }

        [XmlAttribute("Description")]
        [Bindable(true)]
        public string Description
        {
            get { return GetColumnValue<string>(Columns.Description); }
            set { SetColumnValue(Columns.Description, value); }
        }
		
		#endregion
		
		
			
		
		//no foreign key tables defined (0)
		
		
		
		//no ManyToMany tables defined (0)
		
        
        
		#region ObjectDataSource support
		
		
		/// <summary>
		/// Inserts a record, can be used with the Object Data Source
		/// </summary>
        public static void Insert(int varCategoryId, Guid varCategoryGuid, string varCategoryTitle, string varCreatedBy, DateTime? varCreatedOn, string varModifiedBy, DateTime? varModifiedOn, string varURLTitle, string varKeywords, string varTitle, string varDescription)
		{
            BlogCategory item = new BlogCategory();
			
			item.CategoryId = varCategoryId;

            item.CategoryGuid = varCategoryGuid;
			
			item.CategoryTitle = varCategoryTitle;
			
			item.CreatedBy = varCreatedBy;
			
			item.CreatedOn = varCreatedOn;
			
			item.ModifiedBy = varModifiedBy;
			
			item.ModifiedOn = varModifiedOn;

            item.URLTitle = varURLTitle;

            item.Keywords = varKeywords;

            item.Title = varTitle;

            item.Description = varDescription;
			
		
			if (System.Web.HttpContext.Current != null)
				item.Save(System.Web.HttpContext.Current.User.Identity.Name);
			else
				item.Save(System.Threading.Thread.CurrentPrincipal.Identity.Name);
		}
		
		/// <summary>
		/// Updates a record, can be used with the Object Data Source
		/// </summary>
        public static void Update(int varCategoryId, Guid varCategoryGuid, string varCategoryTitle, string varCreatedBy, DateTime? varCreatedOn, string varModifiedBy, DateTime? varModifiedOn, string varURLTitle, string varKeywords, string varTitle, string varDescription)
		{
            BlogCategory item = new BlogCategory();
			
				item.CategoryId = varCategoryId;

                item.CategoryGuid = varCategoryGuid;
			
				item.CategoryTitle = varCategoryTitle;
			
				item.CreatedBy = varCreatedBy;
			
				item.CreatedOn = varCreatedOn;
			
				item.ModifiedBy = varModifiedBy;
			
				item.ModifiedOn = varModifiedOn;

                item.URLTitle = varURLTitle;

                item.Keywords = varKeywords;

                item.Title = varTitle;

                item.Description = varDescription;
			
			item.IsNew = false;
			if (System.Web.HttpContext.Current != null)
				item.Save(System.Web.HttpContext.Current.User.Identity.Name);
			else
				item.Save(System.Threading.Thread.CurrentPrincipal.Identity.Name);
		}
		#endregion
        
        
        
        #region Typed Columns
        
        
        public static TableSchema.TableColumn CategoryIdColumn
        {
            get { return Schema.Columns[0]; }
        }

        public static TableSchema.TableColumn CategoryGuidColumn
        {
            get { return Schema.Columns[1]; }
        }
        
        
        
        public static TableSchema.TableColumn CategoryTitleColumn
        {
            get { return Schema.Columns[2]; }
        }
        
        
        
        public static TableSchema.TableColumn CreatedByColumn
        {
            get { return Schema.Columns[3]; }
        }
        
        
        
        public static TableSchema.TableColumn CreatedOnColumn
        {
            get { return Schema.Columns[4]; }
        }
        
        
        
        public static TableSchema.TableColumn ModifiedByColumn
        {
            get { return Schema.Columns[5]; }
        }
        
        
        
        public static TableSchema.TableColumn ModifiedOnColumn
        {
            get { return Schema.Columns[6]; }
        }


        public static TableSchema.TableColumn URLTitleColumn
        {
            get { return Schema.Columns[7]; }
        }

        public static TableSchema.TableColumn KeywordsColumn
        {
            get { return Schema.Columns[8]; }
        }

        public static TableSchema.TableColumn TitleColumn
        {
            get { return Schema.Columns[9]; }
        }

        public static TableSchema.TableColumn DescriptionColumn
        {
            get { return Schema.Columns[10]; }
        }
        
        
        #endregion
		#region Columns Struct
		public struct Columns
		{
			 public static string CategoryId = @"CategoryId";
             public static string CategoryGuid = @"CategoryGuid";
			 public static string CategoryTitle = @"CategoryTitle";
			 public static string CreatedBy = @"CreatedBy";
			 public static string CreatedOn = @"CreatedOn";
			 public static string ModifiedBy = @"ModifiedBy";
			 public static string ModifiedOn = @"ModifiedOn";
             public static string URLTitle = @"URLTitle";
             public static string Keywords = @"Keywords";
             public static string Title = @"Title";
             public static string Description = @"Description";
						
		}
		#endregion
		
		#region Update PK Collections
		
        #endregion
    
        #region Deep Save
		
        #endregion
	}
}
