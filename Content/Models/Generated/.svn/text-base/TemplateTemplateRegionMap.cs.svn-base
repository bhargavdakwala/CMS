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
	/// Strongly-typed collection for the TemplateTemplateRegionMap class.
	/// </summary>
	[Serializable]
	public partial class TemplateTemplateRegionMapCollection : ActiveList<TemplateTemplateRegionMap, TemplateTemplateRegionMapCollection> 
	{	   
		public TemplateTemplateRegionMapCollection() {}

	}

	/// <summary>
	/// This is an ActiveRecord class which wraps the CMS_Content_Template_TemplateRegion_Map table.
	/// </summary>
	[Serializable]
	public partial class TemplateTemplateRegionMap : ActiveRecord<TemplateTemplateRegionMap>
	{
		#region .ctors and Default Settings
		
		public TemplateTemplateRegionMap()
		{
		  SetSQLProps();
		  InitSetDefaults();
		  MarkNew();
		}

		
		private void InitSetDefaults() { SetDefaults(); }

		
		public TemplateTemplateRegionMap(bool useDatabaseDefaults)
		{
			SetSQLProps();
			if(useDatabaseDefaults)
				ForceDefaults();
			MarkNew();
		}

		public TemplateTemplateRegionMap(object keyID)
		{
			SetSQLProps();
			InitSetDefaults();
			LoadByKey(keyID);
		}

		 
		public TemplateTemplateRegionMap(string columnName, object columnValue)
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
				TableSchema.Table schema = new TableSchema.Table("CMS_Content_Template_TemplateRegion_Map", TableType.Table, DataService.GetInstance("CMSProvider"));
				schema.Columns = new TableSchema.TableColumnCollection();
				schema.SchemaName = @"dbo";
				//columns
				
				TableSchema.TableColumn colvarTemplateId = new TableSchema.TableColumn(schema);
				colvarTemplateId.ColumnName = "TemplateId";
				colvarTemplateId.DataType = DbType.Int32;
				colvarTemplateId.MaxLength = 0;
				colvarTemplateId.AutoIncrement = false;
				colvarTemplateId.IsNullable = false;
				colvarTemplateId.IsPrimaryKey = true;
				colvarTemplateId.IsForeignKey = true;
				colvarTemplateId.IsReadOnly = false;
				colvarTemplateId.DefaultSetting = @"";
				
					colvarTemplateId.ForeignKeyTableName = "CMS_Content_Template";
				schema.Columns.Add(colvarTemplateId);
				
				TableSchema.TableColumn colvarTemplateRegionId = new TableSchema.TableColumn(schema);
				colvarTemplateRegionId.ColumnName = "TemplateRegionId";
				colvarTemplateRegionId.DataType = DbType.Int32;
				colvarTemplateRegionId.MaxLength = 0;
				colvarTemplateRegionId.AutoIncrement = false;
				colvarTemplateRegionId.IsNullable = false;
				colvarTemplateRegionId.IsPrimaryKey = true;
				colvarTemplateRegionId.IsForeignKey = true;
				colvarTemplateRegionId.IsReadOnly = false;
				colvarTemplateRegionId.DefaultSetting = @"";
				
					colvarTemplateRegionId.ForeignKeyTableName = "CMS_Content_TemplateRegion";
				schema.Columns.Add(colvarTemplateRegionId);
				
				BaseSchema = schema;
				//add this schema to the provider
				//so we can query it later
				DataService.Providers["CMSProvider"].AddSchema("CMS_Content_Template_TemplateRegion_Map",schema);
			}

		}

		#endregion
		
		#region Props
		
		  
		[XmlAttribute("TemplateId")]
		public int TemplateId 
		{
			get { return GetColumnValue<int>("TemplateId"); }

			set { SetColumnValue("TemplateId", value); }

		}

		  
		[XmlAttribute("TemplateRegionId")]
		public int TemplateRegionId 
		{
			get { return GetColumnValue<int>("TemplateRegionId"); }

			set { SetColumnValue("TemplateRegionId", value); }

		}

		
		#endregion
		
		
			
		
		#region ForeignKey Properties
		
		/// <summary>
		/// Returns a Template ActiveRecord object related to this TemplateTemplateRegionMap
		/// 
		/// </summary>
		public Etech.CMS.Content.Template Template
		{
			get { return Etech.CMS.Content.Template.FetchByID(this.TemplateId); }

			set { SetColumnValue("TemplateId", value.TemplateId); }

		}

		
		
		/// <summary>
		/// Returns a TemplateRegion ActiveRecord object related to this TemplateTemplateRegionMap
		/// 
		/// </summary>
		public Etech.CMS.Content.TemplateRegion TemplateRegion
		{
			get { return Etech.CMS.Content.TemplateRegion.FetchByID(this.TemplateRegionId); }

			set { SetColumnValue("TemplateRegionId", value.TemplateRegionId); }

		}

		
		
		#endregion
		
		
		
		//no ManyToMany tables defined (0)
		
		#region ObjectDataSource support
		
		
		/// <summary>
		/// Inserts a record, can be used with the Object Data Source
		/// </summary>
		public static void Insert(int varTemplateId,int varTemplateRegionId)
		{
			TemplateTemplateRegionMap item = new TemplateTemplateRegionMap();
			
			item.TemplateId = varTemplateId;
			
			item.TemplateRegionId = varTemplateRegionId;
			
		
			if (System.Web.HttpContext.Current != null)
				item.Save(System.Web.HttpContext.Current.User.Identity.Name);
			else
				item.Save(System.Threading.Thread.CurrentPrincipal.Identity.Name);
		}

		
		/// <summary>
		/// Updates a record, can be used with the Object Data Source
		/// </summary>
		public static void Update(int varTemplateId,int varTemplateRegionId)
		{
			TemplateTemplateRegionMap item = new TemplateTemplateRegionMap();
			
				item.TemplateId = varTemplateId;
				
				item.TemplateRegionId = varTemplateRegionId;
				
			item.IsNew = false;
			if (System.Web.HttpContext.Current != null)
				item.Save(System.Web.HttpContext.Current.User.Identity.Name);
			else
				item.Save(System.Threading.Thread.CurrentPrincipal.Identity.Name);
		}

		#endregion
		#region Columns Struct
		public struct Columns
		{
			 public static string TemplateId = @"TemplateId";
			 public static string TemplateRegionId = @"TemplateRegionId";
						
		}

		#endregion
	}

}

