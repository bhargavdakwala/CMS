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
    /// Controller class for CMS_Content_BlogCategory
    /// </summary>
    [System.ComponentModel.DataObject]
    public partial class BlogCategoryController
    {
        // Preload our schema..
        BlogCategory thisSchemaLoad = new BlogCategory();
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
        public BlogCategoryCollection FetchAll()
        {
            BlogCategoryCollection coll = new BlogCategoryCollection();
            Query qry = new Query(BlogCategory.Schema);
            coll.LoadAndCloseReader(qry.ExecuteReader());
            return coll;
        }
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public BlogCategoryCollection FetchByID(object CategoryId)
        {
            BlogCategoryCollection coll = new BlogCategoryCollection().Where("CategoryId", CategoryId).Load();
            return coll;
        }
		
		[DataObjectMethod(DataObjectMethodType.Select, false)]
        public BlogCategoryCollection FetchByQuery(Query qry)
        {
            BlogCategoryCollection coll = new BlogCategoryCollection();
            coll.LoadAndCloseReader(qry.ExecuteReader()); 
            return coll;
        }
        [DataObjectMethod(DataObjectMethodType.Delete, true)]
        public bool Delete(object CategoryId)
        {
            return (BlogCategory.Delete(CategoryId) == 1);
        }
        [DataObjectMethod(DataObjectMethodType.Delete, false)]
        public bool Destroy(object CategoryId)
        {
            return (BlogCategory.Destroy(CategoryId) == 1);
        }

 	    /// <summary>
	    /// Inserts a record, can be used with the Object Data Source
	    /// </summary>
        [DataObjectMethod(DataObjectMethodType.Insert, true)]
	    public void Insert(int CategoryId,Guid varCategoryGuid,string CategoryTitle,string CreatedBy,DateTime? CreatedOn,string ModifiedBy,DateTime? ModifiedOn)
	    {
		    BlogCategory item = new BlogCategory();
		    
            item.CategoryId = CategoryId;

            item.CategoryGuid = varCategoryGuid;
            
            item.CategoryTitle = CategoryTitle;
            
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
	    public void Update(int CategoryId,Guid varCategoryGuid,string CategoryTitle,string CreatedBy,DateTime? CreatedOn,string ModifiedBy,DateTime? ModifiedOn)
	    {
		    BlogCategory item = new BlogCategory();
	        item.MarkOld();
	        item.IsLoaded = true;
		    
			item.CategoryId = CategoryId;

            item.CategoryGuid = varCategoryGuid;
				
			item.CategoryTitle = CategoryTitle;
				
			item.CreatedBy = CreatedBy;
				
			item.CreatedOn = CreatedOn;
				
			item.ModifiedBy = ModifiedBy;
				
			item.ModifiedOn = ModifiedOn;
				
	        item.Save(UserName);
	    }
    }
}
