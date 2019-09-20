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
	/// Controller class for FullMember
	/// </summary>
	[System.ComponentModel.DataObject]
	public partial class FullMemberController
	{
		// Preload our schema..
		FullMember thisSchemaLoad = new FullMember();
		private string userName = String.Empty;
		protected string UserName
		{
			get
			{
				if (userName.Length == 0) 
				{
					if (System.Web.HttpContext.Current != null)
					{
						userName=System.Web.HttpContext.Current.User.Identity.Name;
					}
					else
					{
						userName=System.Threading.Thread.CurrentPrincipal.Identity.Name;
					}
				}
				return userName;
			}
		}
		[DataObjectMethod(DataObjectMethodType.Select, true)]
		public FullMemberCollection FetchAll()
		{
			FullMemberCollection coll = new FullMemberCollection();
			Query qry = new Query(FullMember.Schema);
			coll.LoadAndCloseReader(qry.ExecuteReader());
			return coll;
		}
		[DataObjectMethod(DataObjectMethodType.Select, false)]
		public FullMemberCollection FetchByID(object Id)
		{
			FullMemberCollection coll = new FullMemberCollection().Where("Id", Id).Load();
			return coll;
		}
		
		[DataObjectMethod(DataObjectMethodType.Select, false)]
		public FullMemberCollection FetchByQuery(Query qry)
		{
			FullMemberCollection coll = new FullMemberCollection();
			coll.LoadAndCloseReader(qry.ExecuteReader()); 
			return coll;
		}
		[DataObjectMethod(DataObjectMethodType.Delete, true)]
		public bool Delete(object Id)
		{
			return (FullMember.Delete(Id) == 1);
		}
		[DataObjectMethod(DataObjectMethodType.Delete, false)]
		public bool Destroy(object Id)
		{
			return (FullMember.Destroy(Id) == 1);
		}
		
		
		
		/// <summary>
		/// Inserts a record, can be used with the Object Data Source
		/// </summary>
		[DataObjectMethod(DataObjectMethodType.Insert, true)]
		public void Insert(string Name,string Company,string Phone,string Mobile,string Email,string WebAddress,DateTime? ModifiedDate,bool? IsActive)
		{
			FullMember item = new FullMember();
			
			item.Name = Name;
			
			item.Company = Company;
			
			item.Phone = Phone;
			
			item.Mobile = Mobile;
			
			item.Email = Email;
			
			item.WebAddress = WebAddress;
			
			item.ModifiedDate = ModifiedDate;
			
			item.IsActive = IsActive;
			
		
			item.Save(UserName);
		}
		
		/// <summary>
		/// Updates a record, can be used with the Object Data Source
		/// </summary>
		[DataObjectMethod(DataObjectMethodType.Update, true)]
		public void Update(int Id,string Name,string Company,string Phone,string Mobile,string Email,string WebAddress,DateTime? ModifiedDate,bool? IsActive)
		{
			FullMember item = new FullMember();
			item.MarkOld();
			item.IsLoaded = true;
			
			item.Id = Id;
				
			item.Name = Name;
				
			item.Company = Company;
				
			item.Phone = Phone;
				
			item.Mobile = Mobile;
				
			item.Email = Email;
				
			item.WebAddress = WebAddress;
				
			item.ModifiedDate = ModifiedDate;
				
			item.IsActive = IsActive;
				
			item.Save(UserName);
		}
	}
}
