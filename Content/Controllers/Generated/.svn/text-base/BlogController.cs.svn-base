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
    /// Controller class for Blog
    /// </summary>
    [System.ComponentModel.DataObject]
    public partial class BlogController
    {
        // Preload our schema..
        Blog thisSchemaLoad = new Blog();
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
        public BlogCollection FetchAll()
        {
            BlogCollection coll = new BlogCollection();
            Query qry = new Query(Blog.Schema);
            coll.LoadAndCloseReader(qry.ExecuteReader());
            return coll;
        }
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public BlogCollection FetchByID(object BlogId)
        {
            BlogCollection coll = new BlogCollection().Where("BlogId", BlogId).Load();
            return coll;
        }
		
		[DataObjectMethod(DataObjectMethodType.Select, false)]
        public BlogCollection FetchByQuery(Query qry)
        {
            BlogCollection coll = new BlogCollection();
            coll.LoadAndCloseReader(qry.ExecuteReader()); 
            return coll;
        }
        [DataObjectMethod(DataObjectMethodType.Delete, true)]
        public bool Delete(object BlogId)
        {
            return (Blog.Delete(BlogId) == 1);
        }
        [DataObjectMethod(DataObjectMethodType.Delete, false)]
        public bool Destroy(object BlogId)
        {
            return (Blog.Destroy(BlogId) == 1);
        }
        
        
    	
	    /// <summary>
	    /// Inserts a record, can be used with the Object Data Source
	    /// </summary>
        [DataObjectMethod(DataObjectMethodType.Insert, true)]
	    public void Insert(Guid BlogGuid,string BlogTitle,string BlogDescription,bool? IsActive,int? CategoryId,string CreatedBy,DateTime? CreatedOn,string ModifiedBy,DateTime? ModifiedOn)
	    {
		    Blog item = new Blog();
		    
            item.BlogGuid = BlogGuid;
            
            item.BlogTitle = BlogTitle;
            
            item.BlogDescription = BlogDescription;
            
            item.IsActive = IsActive;
            
            item.CategoryId = CategoryId;
            
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
	    public void Update(int BlogId,Guid BlogGuid,string BlogTitle,string BlogDescription,bool? IsActive,int? CategoryId,string CreatedBy,DateTime? CreatedOn,string ModifiedBy,DateTime? ModifiedOn)
	    {
		    Blog item = new Blog();
	        item.MarkOld();
	        item.IsLoaded = true;
		    
			item.BlogId = BlogId;
				
			item.BlogGuid = BlogGuid;
				
			item.BlogTitle = BlogTitle;
				
			item.BlogDescription = BlogDescription;
				
			item.IsActive = IsActive;
				
			item.CategoryId = CategoryId;
				
			item.CreatedBy = CreatedBy;
				
			item.CreatedOn = CreatedOn;
				
			item.ModifiedBy = ModifiedBy;
				
			item.ModifiedOn = ModifiedOn;
				
	        item.Save(UserName);
	    }
    }
}
