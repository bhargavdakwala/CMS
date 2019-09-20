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
	/// Strongly-typed collection for the NewsLetterUser class.
	/// </summary>
	[Serializable]
	public partial class NewsLetterUserCollection : ActiveList<NewsLetterUser, NewsLetterUserCollection>
	{	   
		public NewsLetterUserCollection() {}
		
		/// <summary>
		/// Filters an existing collection based on the set criteria. This is an in-memory filter
		/// Thanks to developingchris for this!
		/// </summary>
		/// <returns>NewsLetterUserCollection</returns>
		public NewsLetterUserCollection Filter()
		{
			for (int i = this.Count - 1; i > -1; i--)
			{
				NewsLetterUser o = this[i];
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
	/// This is an ActiveRecord class which wraps the NewsLetter_Users table.
	/// </summary>
	[Serializable]
	public partial class NewsLetterUser : ActiveRecord<NewsLetterUser>
	{
		#region .ctors and Default Settings
		
		public NewsLetterUser()
		{
		  SetSQLProps();
		  InitSetDefaults();
		  MarkNew();
		}
		
		private void InitSetDefaults() { SetDefaults(); }
		
		public NewsLetterUser(bool useDatabaseDefaults)
		{
			SetSQLProps();
			if(useDatabaseDefaults)
				ForceDefaults();
			MarkNew();
		}
		
		public NewsLetterUser(object keyID)
		{
			SetSQLProps();
			InitSetDefaults();
			LoadByKey(keyID);
		}
		 
		public NewsLetterUser(string columnName, object columnValue)
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
				TableSchema.Table schema = new TableSchema.Table("CMS_Content_NewsLetter_Users", TableType.Table, DataService.GetInstance("CMSProvider"));
				schema.Columns = new TableSchema.TableColumnCollection();
				schema.SchemaName = @"dbo";
				//columns
				
				TableSchema.TableColumn colvarUserID = new TableSchema.TableColumn(schema);
				colvarUserID.ColumnName = "UserID";
				colvarUserID.DataType = DbType.Int32;
				colvarUserID.MaxLength = 0;
				colvarUserID.AutoIncrement = true;
				colvarUserID.IsNullable = false;
				colvarUserID.IsPrimaryKey = true;
				colvarUserID.IsForeignKey = false;
				colvarUserID.IsReadOnly = false;
				colvarUserID.DefaultSetting = @"";
				colvarUserID.ForeignKeyTableName = "";
				schema.Columns.Add(colvarUserID);
				
				TableSchema.TableColumn colvarUserGUID = new TableSchema.TableColumn(schema);
				colvarUserGUID.ColumnName = "UserGUID";
				colvarUserGUID.DataType = DbType.String;
				colvarUserGUID.MaxLength = 100;
				colvarUserGUID.AutoIncrement = false;
				colvarUserGUID.IsNullable = true;
				colvarUserGUID.IsPrimaryKey = false;
				colvarUserGUID.IsForeignKey = false;
				colvarUserGUID.IsReadOnly = false;
				colvarUserGUID.DefaultSetting = @"";
				colvarUserGUID.ForeignKeyTableName = "";
				schema.Columns.Add(colvarUserGUID);
				
				TableSchema.TableColumn colvarUserName = new TableSchema.TableColumn(schema);
				colvarUserName.ColumnName = "UserName";
				colvarUserName.DataType = DbType.String;
				colvarUserName.MaxLength = 100;
				colvarUserName.AutoIncrement = false;
				colvarUserName.IsNullable = true;
				colvarUserName.IsPrimaryKey = false;
				colvarUserName.IsForeignKey = false;
				colvarUserName.IsReadOnly = false;
				colvarUserName.DefaultSetting = @"";
				colvarUserName.ForeignKeyTableName = "";
				schema.Columns.Add(colvarUserName);
				
				TableSchema.TableColumn colvarEmail = new TableSchema.TableColumn(schema);
				colvarEmail.ColumnName = "Email";
				colvarEmail.DataType = DbType.String;
				colvarEmail.MaxLength = 250;
				colvarEmail.AutoIncrement = false;
				colvarEmail.IsNullable = true;
				colvarEmail.IsPrimaryKey = false;
				colvarEmail.IsForeignKey = false;
				colvarEmail.IsReadOnly = false;
				colvarEmail.DefaultSetting = @"";
				colvarEmail.ForeignKeyTableName = "";
				schema.Columns.Add(colvarEmail);
				
				TableSchema.TableColumn colvarPhone = new TableSchema.TableColumn(schema);
				colvarPhone.ColumnName = "Phone";
				colvarPhone.DataType = DbType.String;
				colvarPhone.MaxLength = 50;
				colvarPhone.AutoIncrement = false;
				colvarPhone.IsNullable = true;
				colvarPhone.IsPrimaryKey = false;
				colvarPhone.IsForeignKey = false;
				colvarPhone.IsReadOnly = false;
				colvarPhone.DefaultSetting = @"";
				colvarPhone.ForeignKeyTableName = "";
				schema.Columns.Add(colvarPhone);
				
				TableSchema.TableColumn colvarBusinessName = new TableSchema.TableColumn(schema);
				colvarBusinessName.ColumnName = "BusinessName";
				colvarBusinessName.DataType = DbType.String;
				colvarBusinessName.MaxLength = 100;
				colvarBusinessName.AutoIncrement = false;
				colvarBusinessName.IsNullable = true;
				colvarBusinessName.IsPrimaryKey = false;
				colvarBusinessName.IsForeignKey = false;
				colvarBusinessName.IsReadOnly = false;
				colvarBusinessName.DefaultSetting = @"";
				colvarBusinessName.ForeignKeyTableName = "";
				schema.Columns.Add(colvarBusinessName);



				TableSchema.TableColumn colvarSubscriptionDate = new TableSchema.TableColumn(schema);
				colvarSubscriptionDate.ColumnName = "SubscriptionDate";
				colvarSubscriptionDate.DataType = DbType.DateTime;
				colvarSubscriptionDate.MaxLength = 0;
				colvarSubscriptionDate.AutoIncrement = false;
				colvarSubscriptionDate.IsNullable = true;
				colvarSubscriptionDate.IsPrimaryKey = false;
				colvarSubscriptionDate.IsForeignKey = false;
				colvarSubscriptionDate.IsReadOnly = false;
				colvarSubscriptionDate.DefaultSetting = @"";
				colvarSubscriptionDate.ForeignKeyTableName = "";
				schema.Columns.Add(colvarSubscriptionDate);
				
				
				TableSchema.TableColumn colvarIsNewsLetterSignUp = new TableSchema.TableColumn(schema);
				colvarIsNewsLetterSignUp.ColumnName = "IsNewsLetterSignUp";
				colvarIsNewsLetterSignUp.DataType = DbType.Boolean;
				colvarIsNewsLetterSignUp.MaxLength = 0;
				colvarIsNewsLetterSignUp.AutoIncrement = false;
				colvarIsNewsLetterSignUp.IsNullable = true;
				colvarIsNewsLetterSignUp.IsPrimaryKey = false;
				colvarIsNewsLetterSignUp.IsForeignKey = false;
				colvarIsNewsLetterSignUp.IsReadOnly = false;
				colvarIsNewsLetterSignUp.DefaultSetting = @"";
				colvarIsNewsLetterSignUp.ForeignKeyTableName = "";
				schema.Columns.Add(colvarIsNewsLetterSignUp);


				TableSchema.TableColumn colvarGroupID = new TableSchema.TableColumn(schema);
				colvarGroupID.ColumnName = "GroupID";
				colvarGroupID.DataType = DbType.Int32;
				colvarGroupID.MaxLength = 0;
				colvarGroupID.AutoIncrement = false;
				colvarGroupID.IsNullable = true;
				colvarGroupID.IsPrimaryKey = false;
				colvarGroupID.IsForeignKey = false;
				colvarGroupID.IsReadOnly = false;
				colvarGroupID.DefaultSetting = @"";
				colvarGroupID.ForeignKeyTableName = "";
				schema.Columns.Add(colvarGroupID);


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

				
				
				BaseSchema = schema;
				//add this schema to the provider
				//so we can query it later
				DataService.Providers["CMSProvider"].AddSchema("CMS_Content_NewsLetter_Users",schema);
			}
		}
		#endregion
		
		#region Props
		  
		[XmlAttribute("UserID")]
		[Bindable(true)]
		public int UserID 
		{
			get { return GetColumnValue<int>(Columns.UserID); }
			set { SetColumnValue(Columns.UserID, value); }
		}

		[XmlAttribute("GroupID")]
		[Bindable(true)]
		public int GroupID 
		{
			get { return GetColumnValue<int>(Columns.GroupID); }
			set { SetColumnValue(Columns.GroupID, value); }
		}
		
		  
		[XmlAttribute("UserGUID")]
		[Bindable(true)]
		public string UserGUID 
		{
			get { return GetColumnValue<string>(Columns.UserGUID); }
			set { SetColumnValue(Columns.UserGUID, value); }
		}
		  
		[XmlAttribute("UserName")]
		[Bindable(true)]
		public string UserName 
		{
			get { return GetColumnValue<string>(Columns.UserName); }
			set { SetColumnValue(Columns.UserName, value); }
		}
		  
		[XmlAttribute("Email")]
		[Bindable(true)]
		public string Email 
		{
			get { return GetColumnValue<string>(Columns.Email); }
			set { SetColumnValue(Columns.Email, value); }
		}
		  
		[XmlAttribute("Phone")]
		[Bindable(true)]
		public string Phone 
		{
			get { return GetColumnValue<string>(Columns.Phone); }
			set { SetColumnValue(Columns.Phone, value); }
		}
		  
		[XmlAttribute("BusinessName")]
		[Bindable(true)]
		public string BusinessName 
		{
			get { return GetColumnValue<string>(Columns.BusinessName); }
			set { SetColumnValue(Columns.BusinessName, value); }
		}

		[XmlAttribute("SubscriptionDate")]
		[Bindable(true)]
		public string SubscriptionDate 
		{
			get { return GetColumnValue<string>(Columns.SubscriptionDate); }
			set { SetColumnValue(Columns.SubscriptionDate, value); }
		}
		  
		
		[XmlAttribute("IsNewsLetterSignUp")]
		[Bindable(true)]
		public bool? IsNewsLetterSignUp 
		{
			get { return GetColumnValue<bool?>(Columns.IsNewsLetterSignUp); }
			set { SetColumnValue(Columns.IsNewsLetterSignUp, value); }
		}

		[XmlAttribute("IsActive")]
		[Bindable(true)]
		public bool? IsActive 
		{
			get { return GetColumnValue<bool?>(Columns.IsActive); }
			set { SetColumnValue(Columns.IsActive, value); }
		}

		
		#endregion
		
		
			
		
		//no foreign key tables defined (0)
		
		
		
		//no ManyToMany tables defined (0)
		
		
		
		#region ObjectDataSource support
		
		
		/// <summary>
		/// Inserts a record, can be used with the Object Data Source
		/// </summary>
		public static void Insert(string varUserGUID, string varUserName, string varEmail, string varPhone, string varBusinessName, string varSubscriptionDate, bool? varIsNewsLetterSignUp, bool? varIsActive, int varGroupID)
		{
			NewsLetterUser item = new NewsLetterUser();
			
			item.UserGUID = varUserGUID;
			
			item.UserName = varUserName;
			
			item.Email = varEmail;
			
			item.Phone = varPhone;
			
			item.BusinessName = varBusinessName;

			item.SubscriptionDate = varSubscriptionDate;

			item.IsNewsLetterSignUp = varIsNewsLetterSignUp;

			item.IsActive = varIsActive;

			item.GroupID = varGroupID;
		
			if (System.Web.HttpContext.Current != null)
				item.Save(System.Web.HttpContext.Current.User.Identity.Name);
			else
				item.Save(System.Threading.Thread.CurrentPrincipal.Identity.Name);
		}
		
		/// <summary>
		/// Updates a record, can be used with the Object Data Source
		/// </summary>
		public static void Update(int varUserID, string varUserGUID, string varUserName, string varEmail, string varPhone, string varBusinessName, string varSubscriptionDate, bool? varIsNewsLetterSignUp, bool? varIsActive, int varGroupID)
		{
			NewsLetterUser item = new NewsLetterUser();
			
				item.UserID = varUserID;
			
				item.UserGUID = varUserGUID;
			
				item.UserName = varUserName;
			
				item.Email = varEmail;
			
				item.Phone = varPhone;
			
				item.BusinessName = varBusinessName;

				item.SubscriptionDate = varSubscriptionDate;
			
				item.IsNewsLetterSignUp = varIsNewsLetterSignUp;

				item.IsActive = varIsActive;

				item.GroupID = varGroupID;

			item.IsNew = false;
			if (System.Web.HttpContext.Current != null)
				item.Save(System.Web.HttpContext.Current.User.Identity.Name);
			else
				item.Save(System.Threading.Thread.CurrentPrincipal.Identity.Name);
		}
		#endregion
		
		
		
		#region Typed Columns
		
		
		public static TableSchema.TableColumn UserIDColumn
		{
			get { return Schema.Columns[0]; }
		}
		
		
		
		public static TableSchema.TableColumn UserGUIDColumn
		{
			get { return Schema.Columns[1]; }
		}
		
		
		
		public static TableSchema.TableColumn UserNameColumn
		{
			get { return Schema.Columns[2]; }
		}
		
		
		
		public static TableSchema.TableColumn EmailColumn
		{
			get { return Schema.Columns[3]; }
		}
		
		
		
		public static TableSchema.TableColumn PhoneColumn
		{
			get { return Schema.Columns[4]; }
		}
		
		
		
		public static TableSchema.TableColumn BusinessNameColumn
		{
			get { return Schema.Columns[5]; }
		}

		public static TableSchema.TableColumn IsNewsLetterSignUpColumn
		{
			get { return Schema.Columns[6]; }
		}



		public static TableSchema.TableColumn SubscriptionDateColumn
		{
			get { return Schema.Columns[7]; }
		}


		public static TableSchema.TableColumn GroupIDColumn
		{
			get { return Schema.Columns[8]; }
		}
		public static TableSchema.TableColumn IsActiveColumn
		{
			get { return Schema.Columns[9]; }
		}
		
		
		
		#endregion
		#region Columns Struct
		public struct Columns
		{
			 public static string UserID = @"UserID";
			 public static string UserGUID = @"UserGUID";
			 public static string UserName = @"UserName";
			 public static string Email = @"Email";
			 public static string Phone = @"Phone";
			 public static string BusinessName = @"BusinessName";
			 public static string SubscriptionDate = @"SubscriptionDate";            
			 public static string IsNewsLetterSignUp = @"IsNewsLetterSignUp";
			 public static string IsActive = @"IsActive";
			 public static string GroupID = @"GroupID";
						
		}
		#endregion
		
		#region Update PK Collections
		
		#endregion
	
		#region Deep Save
		
		#endregion
	}
}