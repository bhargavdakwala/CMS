using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Web.Services;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using Etech.CMS.Content;
using System.Collections.Generic;
using System.Linq;
using Etech.CMS.Store;
using Etech.CMS.Store.Caching;
using Etech.CMS.Store.Services.MessageService;
using Etech.CMS.Core;
using Etech.CMS.Localization;
using SubSonic;

namespace Etech.CMS.Web.controls.content
{
    public partial class Projects : ProviderControl
    {
        #region Member Variables
        DataSet ds;

        #endregion


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateRootLevel();
            }
        }

        private DataTable PopulateRootLevel()
        {
            DataTable dtServices = new DataTable();

            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetProjectList(1);
            ds = sp.GetDataSet();
            dtServices = ds.Tables[0];

            PopulateNodes(dtServices, TreeView1.Nodes);


            return dtServices;
        }
        private void PopulateNodes(DataTable dt, TreeNodeCollection nodes)
        {
            foreach (DataRow dr in dt.Rows)
            {
                TreeNode tn = new TreeNode();
                tn.Text = dr["descr"].ToString();
                tn.Value = dr["id"].ToString();
                nodes.Add(tn);

                //If node has child nodes, then enable on-demand populating
                if (Convert.ToInt32(dr["childnodecount"]) > 0)
                {
                    tn.PopulateOnDemand = true;
                    tn.SelectAction = TreeNodeSelectAction.Expand;
                }


                //tn.SelectAction = TreeNodeSelectAction.None;
                //tn.SelectAction = TreeNodeSelectAction.Expand;
                tn.Collapse();
                //tn.CollapseAll();
            }
        }

        private void PopulateSubLevel(int parentid, TreeNode parentNode)
        {
            DataTable dtServicesDetail = new DataTable();


            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetProjectList(parentid);
            ds = sp.GetDataSet();
            dtServicesDetail = ds.Tables[1];
            PopulateNodes(dtServicesDetail, parentNode.ChildNodes);

        }

        protected void TreeView1_TreeNodePopulate(object sender, TreeNodeEventArgs e)
        {
            PopulateSubLevel(Convert.ToInt32(e.Node.Value), e.Node);

        }

        protected void TreeView1_TreeNodeExpanded(object sender, TreeNodeEventArgs e)
        {
            // Loop through all nodes




            foreach (TreeNode treenode in TreeView1.Nodes)
            {

                if (treenode != e.Node)
                {
                    // Collapse all other nodes
                    treenode.SelectAction = TreeNodeSelectAction.Expand;
                }
               

                // If node is expanded

                /*if (e.Node.Depth == 0)
                {
                    if (treenode != e.Node)
                    {
                        // Collapse all other nodes
                        treenode.CollapseAll();
                    }
                }*/
               /* else if (e.Node.Depth == 1)
                {
                    if (treenode == e.Node)
                    {
                        //treenode.Expand();
                        treenode.ToggleExpandState();
                    }


                }
                else
                {
                    treenode.CollapseAll();
                }*/
            }



        }
    }
}