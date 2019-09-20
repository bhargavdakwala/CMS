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
	/// Strongly-typed collection for the NewsLetterEmailLog class.
	/// </summary>
    [Serializable]
	public partial class NewsLetterEmailLogCollection : ActiveList<NewsLetterEmailLog, NewsLetterEmailLogCollection>
	{	   
		public NewsLetterEmailLogCollection() {}
        
        /// <summary>
		/// Filters an existing collection based on the set criteria. This is an in-memory filter
		/// Thanks to developingchris for this!
        /// </summary>
        /// <returns>NewsLetterEmailLogCollection</returns>
		public NewsLetterEmailLogCollection Filter()
        {
            for (int i = this.Count - 1; i > -1; i--)
            {
                NewsLetterEmailLog o = this[i];
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
	/// This is an ActiveRecord class which wraps the NewsLetter_Email_Log table.
	/// </summary>
	[Serializable]
	public partial class NewsLetterEmailLog : ActiveRecord<NewsLetterEmailLog>
	{
		#region .ctors and Default Settings
		
		public NewsLetterEmailLog()
		{
		  SetSQLProps();
		  InitSetDefaults();
		  MarkNew();
		}
		
		private void InitSetDefaults() { SetDefaults(); }
		
		public NewsLetterEmailLog(bool useDatabaseDefaults)
		{
			SetSQLProps();
			if(useDatabaseDefaults)
				ForceDefaults();
			MarkNew();
		}
        
		public NewsLetterEmailLog(object keyID)
		{
			SetSQLProps();
			InitSetDefaults();
			LoadByKey(keyID);
		}
		 
		public NewsLetterEmailLog(string columnName, object columnValue)
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
				TableSchema.Table schema = new TableSchema.Table("CMS_Content_NewsLetter_Email_Log", TableType.Table, DataService.GetInstance("CMSProvider"));
				schema.Columns = new TableSchema.TableColumnCollection();
				schema.SchemaName = @"dbo";
				//columns
				
				TableSchema.TableColumn colvarLogID = new TableSchema.TableColumn(schema);
				colvarLogID.ColumnName = "LogID";
				colvarLogID.DataType = DbType.Int32;
				colvarLogID.MaxLength = 0;
				colvarLogID.AutoIncrement = true;
				colvarLogID.IsNullable = false;
				colvarLogID.IsPrimaryKey = true;
				colvarLogID.IsForeignKey = false;
				colvarLogID.IsReadOnly = false;
				colvarLogID.DefaultSetting = @"";
				colvarLogID.ForeignKeyTableName = "";
				schema.Columns.Add(colvarLogID);
				
				TableSchema.TableColumn colvarNewsLetterID = new TableSchema.TableColumn(schema);
				colvarNewsLetterID.ColumnName = "NewsLetterID";
				colvarNewsLetterID.DataType = DbType.Int32;
				colvarNewsLetterID.MaxLength = 0;
				colvarNewsLetterID.AutoIncrement = false;
				colvarNewsLetterID.IsNullable = true;
				colvarNewsLetterID.IsPrimaryKey = false;
				colvarNewsLetterID.IsForeignKey = false;
				colvarNewsLetterID.IsReadOnly = false;
				colvarNewsLetterID.DefaultSetting = @"";
				colvarNewsLetterID.ForeignKeyTableName = "";
				schema.Columns.Add(colvarNewsLetterID);
				
				TableSchema.TableColumn colvarUserID = new TableSchema.TableColumn(schema);
				colvarUserID.ColumnName = "UserID";
				colvarUserID.DataType = DbType.Int32;
				colvarUserID.MaxLength = 0;
				colvarUserID.AutoIncrement = false;
				colvarUserID.IsNullable = true;
				colvarUserID.IsPrimaryKey = false;
				colvarUserID.IsForeignKey = false;
				colvarUserID.IsReadOnly = false;
				colvarUserID.DefaultSetting = @"";
				colvarUserID.ForeignKeyTableName = "";
				schema.Columns.Add(colvarUserID);
				
				TableSchema.TableColumn colvarToAddress = new TableSchema.TableColumn(schema);
				colvarToAddress.ColumnName = "ToAddress";
				colvarToAddress.DataType = DbType.String;
				colvarToAddress.MaxLength = 100;
				colvarToAddress.AutoIncrement = false;
				colvarToAddress.IsNullable = true;
				colvarToAddress.IsPrimaryKey = false;
				colvarToAddress.IsForeignKey = false;
				colvarToAddress.IsReadOnly = false;
				colvarToAddress.DefaultSetting = @"";
				colvarToAddress.ForeignKeyTableName = "";
				schema.Columns.Add(colvarToAddress);
				
				TableSchema.TableColumn colvarFromAddress = new TableSchema.TableColumn(schema);
				colvarFromAddress.ColumnName = "FromAddress";
				colvarFromAddress.DataType = DbType.String;
				colvarFromAddress.MaxLength = 100;
				colvarFromAddress.AutoIncrement = false;
				colvarFromAddress.IsNullable = true;
				colvarFromAddress.IsPrimaryKey = false;
				colvarFromAddress.IsForeignKey = false;
				colvarFromAddress.IsReadOnly = false;
				colvarFromAddress.DefaultSetting = @"";
				colvarFromAddress.ForeignKeyTableName = "";
				schema.Columns.Add(colvarFromAddress);
				
				TableSchema.TableColumn colvarSubject = new TableSchema.TableColumn(schema);
				colvarSubject.ColumnName = "Subject";
				colvarSubject.DataType = DbType.String;
				colvarSubject.MaxLength = 100;
				colvarSubject.AutoIncrement = false;
				colvarSubject.IsNullable = true;
				colvarSubject.IsPrimaryKey = false;
				colvarSubject.IsForeignKey = false;
				colvarSubject.IsReadOnly = false;
				colvarSubject.DefaultSetting = @"";
				colvarSubject.ForeignKeyTableName = "";
				schema.Columns.Add(colvarSubject);
				
				TableSchema.TableColumn colvarReason = new TableSchema.TableColumn(schema);
				colvarReason.ColumnName = "Reason";
				colvarReason.DataType = DbType.String;
				colvarReason.MaxLength = -1;
				colvarReason.AutoIncrement = false;
				colvarReason.IsNullable = true;
				colvarReason.IsPrimaryKey = false;
				colvarReason.IsForeignKey = false;
				colvarReason.IsReadOnly = false;
				colvarReason.DefaultSetting = @"";
				colvarReason.ForeignKeyTableName = "";
				schema.Columns.Add(colvarReason);
				
				TableSchema.TableColumn colvarResult = new TableSchema.TableColumn(schema);
				colvarResult.ColumnName = "Result";
				colvarResult.DataType = DbType.String;
				colvarResult.MaxLength = 50;
				colvarResult.AutoIncrement = false;
				colvarResult.IsNullable = true;
				colvarResult.IsPrimaryKey = false;
				colvarResult.IsForeignKey = false;
				colvarResult.IsReadOnly = false;
				colvarResult.DefaultSetting = @"";
				colvarResult.ForeignKeyTableName = "";
				schema.Columns.Add(colvarResult);
				
				TableSchema.TableColumn colvarLogDate = new TableSchema.TableColumn(schema);
				colvarLogDate.ColumnName = "LogDate";
				colvarLogDate.DataType = DbType.DateTime;
				colvarLogDate.MaxLength = 0;
				colvarLogDate.AutoIncrement = false;
				colvarLogDate.IsNullable = true;
				colvarLogDate.IsPrimaryKey = false;
				colvarLogDate.IsForeignKey = false;
				colvarLogDate.IsReadOnly = false;
				colvarLogDate.DefaultSetting = @"";
				colvarLogDate.ForeignKeyTableName = "";
				schema.Columns.Add(colvarLogDate);
				
				BaseSchema = schema;
				//add this schema to the provider
				//so we can query it later
				DataService.Providers["CMSProvider"].AddSchema("NewsLetter_Email_Log",schema);
			}
		}
		#endregion
		
		#region Props
		  
		[XmlAttribute("LogID")]
		[Bindable(true)]
		public int LogID 
		{
			get { return GetColumnValue<int>(Columns.LogID); }
			set { SetColumnValue(Columns.LogID, value); }
		}
		  
		[XmlAttribute("NewsLetterID")]
		[Bindable(true)]
		public int? NewsLetterID 
		{
			get { return GetColumnValue<int?>(Columns.NewsLetterID); }
			set { SetColumnValue(Columns.NewsLetterID, value); }
		}
		  
		[XmlAttribute("UserID")]
		[Bindable(true)]
		public int? UserID 
		{
			get { return GetColumnValue<int?>(Columns.UserID); }
			set { SetColumnValue(Columns.UserID, value); }
		}
		  
		[XmlAttribute("ToAddress")]
		[Bindable(true)]
		public string ToAddress 
		{
			get { return GetColumnValue<string>(Columns.ToAddress); }
			set { SetColumnValue(Columns.ToAddress, value); }
		}
		  
		[XmlAttribute("FromAddress")]
		[Bindable(true)]
		public string FromAddress 
		{
			get { return GetColumnValue<string>(Columns.FromAddress); }
			set { SetColumnValue(Columns.FromAddress, value); }
		}
		  
		[XmlAttribute("Subject")]
		[Bindable(true)]
		public string Subject 
		{
			get { return GetColumnValue<string>(Columns.Subject); }
			set { SetColumnValue(Columns.Subject, value); }
		}
		  
		[XmlAttribute("Reason")]
		[Bindable(true)]
		public string Reason 
		{
			get { return GetColumnValue<string>(Columns.Reason); }
			set { SetColumnValue(Columns.Reason, value); }
		}
		  
		[XmlAttribute("Result")]
		[Bindable(true)]
		public string Result 
		{
			get { return GetColumnValue<string>(Columns.Result); }
			set { SetColumnValue(Columns.Result, value); }
		}
		  
		[XmlAttribute("LogDate")]
		[Bindable(true)]
		public DateTime? LogDate 
		{
			get { return GetColumnValue<DateTime?>(Columns.LogDate); }
			set { SetColumnValue(Columns.LogDate, value); }
		}
		
		#endregion
		
		
			
		
		//no foreign key tables defined (0)
		
		
		
		//no ManyToMany tables defined (0)
		
        
        
		#region ObjectDataSource support
		
		
		/// <summary>
		/// Inserts a record, can be used with the Object Data Source
		/// </summary>
		public static void Insert(int? varNewsLetterID,int? varUserID,string varToAddress,string varFromAddress,string varSubject,string varReason,string varResult,DateTime? varLogDate)
		{
			NewsLetterEmailLog item = new NewsLetterEmailLog();
			
			item.NewsLetterID = varNewsLetterID;
			
			item.UserID = varUserID;
			
			item.ToAddress = varToAddress;
			
			item.FromAddress = varFromAddress;
			
			item.Subject = varSubject;
			
			item.Reason = varReason;
			
			item.Result = varResult;
			
			item.LogDate = varLogDate;
			
		
			if (System.Web.HttpContext.Current != null)
				item.Save(System.Web.HttpContext.Current.User.Identity.Name);
			else
				item.Save(System.Threading.Thread.CurrentPrincipal.Identity.Name);
		}
		
		/// <summary>
		/// Updates a record, can be used with the Object Data Source
		/// </summary>
		public static void Update(int varLogID,int? varNewsLetterID,int? varUserID,string varToAddress,string varFromAddress,string varSubject,string varReason,string varResult,DateTime? varLogDate)
		{
			NewsLetterEmailLog item = new NewsLetterEmailLog();
			
				item.LogID = varLogID;
			
				item.NewsLetterID = varNewsLetterID;
			
				item.UserID = varUserID;
			
				item.ToAddress = varToAddress;
			
				item.FromAddress = varFromAddress;
			
				item.Subject = varSubject;
			
				item.Reason = varReason;
			
				item.Result = varResult;
			
				item.LogDate = varLogDate;
			
			item.IsNew = false;
			if (System.Web.HttpContext.Current != null)
				item.Save(System.Web.HttpContext.Current.User.Identity.Name);
			else
				item.Save(System.Threading.Thread.CurrentPrincipal.Identity.Name);
		}
		#endregion
        
        
        
        #region Typed Columns
        
        
        public static TableSchema.TableColumn LogIDColumn
        {
            get { return Schema.Columns[0]; }
        }
        
        
        
        public static TableSchema.TableColumn NewsLetterIDColumn
        {
            get { return Schema.Columns[1]; }
        }
        
        
        
        public static TableSchema.TableColumn UserIDColumn
        {
            get { return Schema.Columns[2]; }
        }
        
        
        
        public static TableSchema.TableColumn ToAddressColumn
        {
            get { return Schema.Columns[3]; }
        }
        
        
        
        public static TableSchema.TableColumn FromAddressColumn
        {
            get { return Schema.Columns[4]; }
        }
        
        
        
        public static TableSchema.TableColumn SubjectColumn
        {
            get { return Schema.Columns[5]; }
        }
        
        
        
        public static TableSchema.TableColumn ReasonColumn
        {
            get { return Schema.Columns[6]; }
        }
        
        
        
        public static TableSchema.TableColumn ResultColumn
        {
            get { return Schema.Columns[7]; }
        }
        
        
        
        public static TableSchema.TableColumn LogDateColumn
        {
            get { return Schema.Columns[8]; }
        }
        
        
        
        #endregion
		#region Columns Struct
		public struct Columns
		{
			 public static string LogID = @"LogID";
			 public static string NewsLetterID = @"NewsLetterID";
			 public static string UserID = @"UserID";
			 public static string ToAddress = @"ToAddress";
			 public static string FromAddress = @"FromAddress";
			 public static string Subject = @"Subject";
			 public static string Reason = @"Reason";
			 public static string Result = @"Result";
			 public static string LogDate = @"LogDate";
						
		}
		#endregion
		
		#region Update PK Collections
		
        #endregion
    
        #region Deep Save
		
        #endregion
	}
}
