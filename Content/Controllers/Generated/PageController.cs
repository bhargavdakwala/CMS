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
    /// Controller class for CMS_Content_Page
    /// </summary>
    [System.ComponentModel.DataObject]
    public partial class PageController
    {
        // Preload our schema..
        Page thisSchemaLoad = new Page();
        private string userName = string.Empty;
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

        /// <summary>
        /// Fetches the category list.
        /// </summary>
        /// <returns></returns>
        public DataSet FetchMenuListById(int PageId)
        {
            DataSet ds = new Query(Page.Schema).ORDER_BY(Page.Columns.SortOrder, ASC).ExecuteDataSet();
            ds.DataSetName = MENUS;
            ds.Tables[0].TableName = MENU;
            DataRelation relation = new DataRelation(PARENT_CHILD, ds.Tables[MENU].Columns[PAGE_ID], ds.Tables[MENU].Columns[PARENT_ID], false);
            relation.Nested = true;
            ds.Relations.Add(relation);
            return ds;
        }

        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public PageCollection FetchAll()
        {
            PageCollection coll = new PageCollection();
            Query qry = new Query(Page.Schema);
            coll.LoadAndCloseReader(qry.ExecuteReader());
            return coll;
        }

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public PageCollection FetchByID(object PageId)
        {
            PageCollection coll = new PageCollection().Where("PageId", PageId).Load();
            return coll;
        }

		[DataObjectMethod(DataObjectMethodType.Select, false)]
        public PageCollection FetchByQuery(Query qry)
        {
            PageCollection coll = new PageCollection();
            coll.LoadAndCloseReader(qry.ExecuteReader()); 
            return coll;
        }

        [DataObjectMethod(DataObjectMethodType.Delete, true)]
        public bool Delete(object PageId)
        {
            return (Page.Delete(PageId) == 1);
        }

        [DataObjectMethod(DataObjectMethodType.Delete, false)]
        public bool Destroy(object PageId)
        {
            return (Page.Destroy(PageId) == 1);
        }

        
        
    	
	    /// <summary>
	    /// Inserts a record, can be used with the Object Data Source
	    /// </summary>
        [DataObjectMethod(DataObjectMethodType.Insert, true)]
	    public void Insert(Guid PageGuid,int ParentId,string Title,string MenuTitle,string Keywords,string Description,int SortOrder,int TemplateId,string CreatedBy,DateTime CreatedOn,string ModifiedBy,DateTime ModifiedOn)
	    {
		    Page item = new Page();
		    
            item.PageGuid = PageGuid;
            
            item.ParentId = ParentId;
            
            item.Title = Title;
            
            item.MenuTitle = MenuTitle;
            
            item.Keywords = Keywords;
            
            item.Description = Description;
            
            item.SortOrder = SortOrder;
            
            item.TemplateId = TemplateId;
            
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
	    public void Update(int PageId,Guid PageGuid,int ParentId,string Title,string MenuTitle,string Keywords,string Description,int SortOrder,int TemplateId,string CreatedBy,DateTime CreatedOn,string ModifiedBy,DateTime ModifiedOn)
	    {
		    Page item = new Page();
		    
				item.PageId = PageId;
				
				item.PageGuid = PageGuid;
				
				item.ParentId = ParentId;
				
				item.Title = Title;
				
				item.MenuTitle = MenuTitle;
				
				item.Keywords = Keywords;
				
				item.Description = Description;
				
				item.SortOrder = SortOrder;
				
				item.TemplateId = TemplateId;
				
				item.CreatedBy = CreatedBy;
				
				item.CreatedOn = CreatedOn;
				
				item.ModifiedBy = ModifiedBy;
				
				item.ModifiedOn = ModifiedOn;
				
		    item.MarkOld();
		    item.Save(UserName);
	    }

    }

}

