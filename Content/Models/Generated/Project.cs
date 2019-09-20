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
// <auto-generated />
namespace Etech.CMS.Content
{
	/// <summary>
	/// Strongly-typed collection for the Project class.
	/// </summary>
    [Serializable]
	public partial class ProjectCollection : ActiveList<Project, ProjectCollection>
	{	   
		public ProjectCollection() {}
        
        /// <summary>
		/// Filters an existing collection based on the set criteria. This is an in-memory filter
		/// Thanks to developingchris for this!
        /// </summary>
        /// <returns>ProjectCollection</returns>
		public ProjectCollection Filter()
        {
            for (int i = this.Count - 1; i > -1; i--)
            {
                Project o = this[i];
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
	/// This is an ActiveRecord class which wraps the Projects table.
	/// </summary>
	[Serializable]
	public partial class Project : ActiveRecord<Project>
	{
		#region .ctors and Default Settings
		
		public Project()
		{
		  SetSQLProps();
		  InitSetDefaults();
		  MarkNew();
		}
		
		private void InitSetDefaults() { SetDefaults(); }
		
		public Project(bool useDatabaseDefaults)
		{
			SetSQLProps();
			if(useDatabaseDefaults)
				ForceDefaults();
			MarkNew();
		}
        
		public Project(object keyID)
		{
			SetSQLProps();
			InitSetDefaults();
			LoadByKey(keyID);
		}
		 
		public Project(string columnName, object columnValue)
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
				TableSchema.Table schema = new TableSchema.Table("CMS_Content_Projects", TableType.Table, DataService.GetInstance("CMSProvider"));
				schema.Columns = new TableSchema.TableColumnCollection();
				schema.SchemaName = @"dbo";
				//columns
				
				TableSchema.TableColumn colvarProjectId = new TableSchema.TableColumn(schema);
				colvarProjectId.ColumnName = "ProjectId";
				colvarProjectId.DataType = DbType.Int32;
				colvarProjectId.MaxLength = 0;
				colvarProjectId.AutoIncrement = true;
				colvarProjectId.IsNullable = false;
				colvarProjectId.IsPrimaryKey = true;
				colvarProjectId.IsForeignKey = false;
				colvarProjectId.IsReadOnly = false;
				colvarProjectId.DefaultSetting = @"";
				colvarProjectId.ForeignKeyTableName = "";
				schema.Columns.Add(colvarProjectId);
				
				TableSchema.TableColumn colvarProjectGuid = new TableSchema.TableColumn(schema);
				colvarProjectGuid.ColumnName = "ProjectGuid";
				colvarProjectGuid.DataType = DbType.Guid;
				colvarProjectGuid.MaxLength = 0;
				colvarProjectGuid.AutoIncrement = false;
				colvarProjectGuid.IsNullable = false;
				colvarProjectGuid.IsPrimaryKey = false;
				colvarProjectGuid.IsForeignKey = false;
				colvarProjectGuid.IsReadOnly = false;
				colvarProjectGuid.DefaultSetting = @"";
				colvarProjectGuid.ForeignKeyTableName = "";
				schema.Columns.Add(colvarProjectGuid);
				
				TableSchema.TableColumn colvarProjectTitle = new TableSchema.TableColumn(schema);
				colvarProjectTitle.ColumnName = "ProjectTitle";
				colvarProjectTitle.DataType = DbType.String;
				colvarProjectTitle.MaxLength = 300;
				colvarProjectTitle.AutoIncrement = false;
				colvarProjectTitle.IsNullable = true;
				colvarProjectTitle.IsPrimaryKey = false;
				colvarProjectTitle.IsForeignKey = false;
				colvarProjectTitle.IsReadOnly = false;
				colvarProjectTitle.DefaultSetting = @"";
				colvarProjectTitle.ForeignKeyTableName = "";
				schema.Columns.Add(colvarProjectTitle);
				
				TableSchema.TableColumn colvarProjectDescription = new TableSchema.TableColumn(schema);
				colvarProjectDescription.ColumnName = "ProjectDescription";
				colvarProjectDescription.DataType = DbType.String;
				colvarProjectDescription.MaxLength = 1073741823;
				colvarProjectDescription.AutoIncrement = false;
				colvarProjectDescription.IsNullable = true;
				colvarProjectDescription.IsPrimaryKey = false;
				colvarProjectDescription.IsForeignKey = false;
				colvarProjectDescription.IsReadOnly = false;
				colvarProjectDescription.DefaultSetting = @"";
				colvarProjectDescription.ForeignKeyTableName = "";
				schema.Columns.Add(colvarProjectDescription);
				
				TableSchema.TableColumn colvarIsActive = new TableSchema.TableColumn(schema);
				colvarIsActive.ColumnName = "IsActive";
				colvarIsActive.DataType = DbType.Boolean;
				colvarIsActive.MaxLength = 0;
				colvarIsActive.AutoIncrement = false;
				colvarIsActive.IsNullable = true;
				colvarIsActive.IsPrimaryKey = false;
				colvarIsActive.IsForeignKey = false;
				colvarIsActive.IsReadOnly = false;
				colvarIsActive.DefaultSetting = @"";
				colvarIsActive.ForeignKeyTableName = "";
				schema.Columns.Add(colvarIsActive);
				
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


                TableSchema.TableColumn colvarMeetingDate = new TableSchema.TableColumn(schema);
                colvarMeetingDate.ColumnName = "MeetingDate";
                colvarMeetingDate.DataType = DbType.DateTime;
                colvarMeetingDate.MaxLength = 0;
                colvarMeetingDate.AutoIncrement = false;
                colvarMeetingDate.IsNullable = true;
                colvarMeetingDate.IsPrimaryKey = false;
                colvarMeetingDate.IsForeignKey = false;
                colvarMeetingDate.IsReadOnly = false;
                colvarMeetingDate.DefaultSetting = @"";
                colvarMeetingDate.ForeignKeyTableName = "";
                schema.Columns.Add(colvarMeetingDate);
				
				BaseSchema = schema;
				//add this schema to the provider
				//so we can query it later
				DataService.Providers["CMSProvider"].AddSchema("Projects",schema);
			}
		}
		#endregion
		
		#region Props
		  
		[XmlAttribute("ProjectId")]
		[Bindable(true)]
		public int ProjectId 
		{
			get { return GetColumnValue<int>(Columns.ProjectId); }
			set { SetColumnValue(Columns.ProjectId, value); }
		}
		  
		[XmlAttribute("ProjectGuid")]
		[Bindable(true)]
		public Guid ProjectGuid 
		{
			get { return GetColumnValue<Guid>(Columns.ProjectGuid); }
			set { SetColumnValue(Columns.ProjectGuid, value); }
		}
		  
		[XmlAttribute("ProjectTitle")]
		[Bindable(true)]
		public string ProjectTitle 
		{
			get { return GetColumnValue<string>(Columns.ProjectTitle); }
			set { SetColumnValue(Columns.ProjectTitle, value); }
		}
		  
		[XmlAttribute("ProjectDescription")]
		[Bindable(true)]
		public string ProjectDescription 
		{
			get { return GetColumnValue<string>(Columns.ProjectDescription); }
			set { SetColumnValue(Columns.ProjectDescription, value); }
		}
		  
		[XmlAttribute("IsActive")]
		[Bindable(true)]
		public bool? IsActive 
		{
			get { return GetColumnValue<bool?>(Columns.IsActive); }
			set { SetColumnValue(Columns.IsActive, value); }
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

        [XmlAttribute("MeetingDate")]
        [Bindable(true)]
        public DateTime? MeetingDate
        {
            get { return GetColumnValue<DateTime?>(Columns.MeetingDate); }
            set { SetColumnValue(Columns.MeetingDate, value); }
        }
		
		#endregion
		
		
			
		
		//no foreign key tables defined (0)
		
		
		
		//no ManyToMany tables defined (0)
		
        
        
		#region ObjectDataSource support
		
		
		/// <summary>
		/// Inserts a record, can be used with the Object Data Source
		/// </summary>
        public static void Insert(Guid varProjectGuid, string varProjectTitle, string varProjectDescription, bool? varIsActive, string varCreatedBy, DateTime? varCreatedOn, string varModifiedBy, DateTime? varModifiedOn, DateTime? varMeetingDate)
		{
			Project item = new Project();
			
			item.ProjectGuid = varProjectGuid;
			
			item.ProjectTitle = varProjectTitle;
			
			item.ProjectDescription = varProjectDescription;
			
			item.IsActive = varIsActive;
			
			item.CreatedBy = varCreatedBy;
			
			item.CreatedOn = varCreatedOn;
			
			item.ModifiedBy = varModifiedBy;
			
			item.ModifiedOn = varModifiedOn;

            item.MeetingDate = varMeetingDate;
			
		
			if (System.Web.HttpContext.Current != null)
				item.Save(System.Web.HttpContext.Current.User.Identity.Name);
			else
				item.Save(System.Threading.Thread.CurrentPrincipal.Identity.Name);
		}
		
		/// <summary>
		/// Updates a record, can be used with the Object Data Source
		/// </summary>
        public static void Update(int varProjectId, Guid varProjectGuid, string varProjectTitle, string varProjectDescription, bool? varIsActive, string varCreatedBy, DateTime? varCreatedOn, string varModifiedBy, DateTime? varModifiedOn, DateTime? varMeetingDate)
		{
			Project item = new Project();
			
				item.ProjectId = varProjectId;
			
				item.ProjectGuid = varProjectGuid;
			
				item.ProjectTitle = varProjectTitle;
			
				item.ProjectDescription = varProjectDescription;
			
				item.IsActive = varIsActive;
			
				item.CreatedBy = varCreatedBy;
			
				item.CreatedOn = varCreatedOn;
			
				item.ModifiedBy = varModifiedBy;
			
				item.ModifiedOn = varModifiedOn;

                item.MeetingDate = varMeetingDate;
			
			item.IsNew = false;
			if (System.Web.HttpContext.Current != null)
				item.Save(System.Web.HttpContext.Current.User.Identity.Name);
			else
				item.Save(System.Threading.Thread.CurrentPrincipal.Identity.Name);
		}
		#endregion
        
        
        
        #region Typed Columns
        
        
        public static TableSchema.TableColumn ProjectIdColumn
        {
            get { return Schema.Columns[0]; }
        }
        
        
        
        public static TableSchema.TableColumn ProjectGuidColumn
        {
            get { return Schema.Columns[1]; }
        }
        
        
        
        public static TableSchema.TableColumn ProjectTitleColumn
        {
            get { return Schema.Columns[2]; }
        }
        
        
        
        public static TableSchema.TableColumn ProjectDescriptionColumn
        {
            get { return Schema.Columns[3]; }
        }
        
        
        
        public static TableSchema.TableColumn IsActiveColumn
        {
            get { return Schema.Columns[4]; }
        }
        
        
        
        public static TableSchema.TableColumn CreatedByColumn
        {
            get { return Schema.Columns[5]; }
        }
        
        
        
        public static TableSchema.TableColumn CreatedOnColumn
        {
            get { return Schema.Columns[6]; }
        }
        
        
        
        public static TableSchema.TableColumn ModifiedByColumn
        {
            get { return Schema.Columns[7]; }
        }
        
        
        
        public static TableSchema.TableColumn ModifiedOnColumn
        {
            get { return Schema.Columns[8]; }
        }

        public static TableSchema.TableColumn MeetingDateColumn
        {
            get { return Schema.Columns[9]; }
        }
        
        
        
        #endregion
		#region Columns Struct
		public struct Columns
		{
			 public static string ProjectId = @"ProjectId";
			 public static string ProjectGuid = @"ProjectGuid";
			 public static string ProjectTitle = @"ProjectTitle";
			 public static string ProjectDescription = @"ProjectDescription";
			 public static string IsActive = @"IsActive";
			 public static string CreatedBy = @"CreatedBy";
			 public static string CreatedOn = @"CreatedOn";
			 public static string ModifiedBy = @"ModifiedBy";
			 public static string ModifiedOn = @"ModifiedOn";
             public static string MeetingDate = @"MeetingDate";
						
		}
		#endregion
		
		#region Update PK Collections
		
        #endregion
    
        #region Deep Save
		
        #endregion
	}
}