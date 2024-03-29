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
    /// Controller class for Service
    /// </summary>
    [System.ComponentModel.DataObject]
    public partial class ServiceController
    {
        // Preload our schema..
        Service thisSchemaLoad = new Service();
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
        public ServiceCollection FetchAll()
        {
            ServiceCollection coll = new ServiceCollection();
            Query qry = new Query(Service.Schema);
            coll.LoadAndCloseReader(qry.ExecuteReader());
            return coll;
        }
       
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public ServiceCollection FetchByID(object ServiceID)
        {
            ServiceCollection coll = new ServiceCollection().Where("ServiceID", ServiceID).Load();
            return coll;
        }
		
		[DataObjectMethod(DataObjectMethodType.Select, false)]
        public ServiceCollection FetchByQuery(Query qry)
        {
            ServiceCollection coll = new ServiceCollection();
            coll.LoadAndCloseReader(qry.ExecuteReader()); 
            return coll;
        }
        [DataObjectMethod(DataObjectMethodType.Delete, true)]
        public bool Delete(object ServiceID)
        {
            return (Service.Delete(ServiceID) == 1);
        }
        [DataObjectMethod(DataObjectMethodType.Delete, false)]
        public bool Destroy(object ServiceID)
        {
            return (Service.Destroy(ServiceID) == 1);
        }
        
        
    	
	    /// <summary>
	    /// Inserts a record, can be used with the Object Data Source
	    /// </summary>
        [DataObjectMethod(DataObjectMethodType.Insert, true)]
	    public void Insert(Guid? ServiceGuid,string ServiceTitle,string CreatedBy,DateTime? CreatedOn,string ModifiedBy,DateTime? ModifiedOn)
	    {
		    Service item = new Service();
		    
            item.ServiceGuid = ServiceGuid;
            
            item.ServiceTitle = ServiceTitle;
            
            item.CreatedBy = CreatedBy;
            
            item.CreatedOn = CreatedOn;
            
            item.ModifiedBy = ModifiedBy;
            
            item.ModifiedOn = ModifiedOn;
            
	    
		    item.Save(UserName);
	    }
    	
	    /// <summary>
	    /// Updates a record, can be used with the Object Data Source
	    /// </summary>
        [DataObjectMethod(DataObjectMethodType.Update, true)]
	    public void Update(int ServiceID,Guid? ServiceGuid,string ServiceTitle,string CreatedBy,DateTime? CreatedOn,string ModifiedBy,DateTime? ModifiedOn)
	    {
		    Service item = new Service();
	        item.MarkOld();
	        item.IsLoaded = true;
		    
			item.ServiceID = ServiceID;
				
			item.ServiceGuid = ServiceGuid;
				
			item.ServiceTitle = ServiceTitle;
				
			item.CreatedBy = CreatedBy;
				
			item.CreatedOn = CreatedOn;
				
			item.ModifiedBy = ModifiedBy;
				
			item.ModifiedOn = ModifiedOn;
				
	        item.Save(UserName);
	    }
    }
}
