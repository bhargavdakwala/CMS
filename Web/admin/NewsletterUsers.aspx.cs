using System;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

using Etech.CMS.Core;
using Etech.CMS.Localization;
using System.Data;

namespace Etech.CMS.Web.admin
{
    public partial class NewsletterUsers : Etech.CMS.Store.Web.AdminPage
    {
        #region Member Variables

        int flag = 0;
        DataSet dsUser;


        #endregion

        #region Page Events

        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="T:System.EventArgs"/> instance containing the event data.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindNewsLetterUserCollection();
                    SetUserListProperties();
                    LoadUsers();
                }
                //SetUserListProperties();
                //LoadUsers();
                Label lblHeading = (Label)Master.FindControl("lblPageHeading");
                lblHeading.Text = "NewsLetter User Administration";

            }
            catch (Exception ex)
            {
                Logger.Error(typeof(userlist).Name + ".Page_Load", ex);
                Master.MessageCenter.DisplayCriticalMessage(ex.Message);
            }
        }

        /// <summary>
        /// Handles the Click event of the btnSearch control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="T:System.EventArgs"/> instance containing the event data.</param>

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(txtSearchBy.Text.Trim()))
                {
                    string text = txtSearchBy.Text.Trim();
                    text = text.Replace("*", "%");
                    text = text.Replace("?", "_");
                    if (ddlSearchBy.SelectedIndex == 0 /* userID */)
                    {

                        flag = 1;
                        BindNewsLetterUserCollection();
                        //membershipUserCollection = Membership.FindUsersByName(text);
                    }
                    else
                    {
                        flag = 2;
                        BindNewsLetterUserCollection();
                        //membershipUserCollection = Membership.FindUsersByEmail(text);
                    }
                    //BindNewsLetterUserCollection(membershipUserCollection);
                    hlShowAll.Visible = true;
                }
                else
                {
                    BindNewsLetterUserCollection();
                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(userlist).Name + ".btnSearch_Click", ex);
                Master.MessageCenter.DisplayCriticalMessage(ex.Message);
            }
        }
        /// <summary>
        /// Handles the Click event of the lbDelete control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="T:System.Web.UI.WebControls.CommandEventArgs"/> instance containing the event data.</param>
        protected void lbDelete_Click(object sender, CommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("mydelete"))
                {
                    DataSet dsDelete = new DataSet();
                    int UserID = Convert.ToInt32(e.CommandArgument);
                    SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.DeleteNewsLetterUserList(UserID);
                    dsDelete = sp.GetDataSet();
                    //dgUserList.DataSource = dsDelete;
                    //dgUserList.DataBind();
                    BindNewsLetterUserCollection();
                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(userlist).Name + ".lbDelete_Click", ex);
                Master.MessageCenter.DisplayCriticalMessage(ex.Message);

            }
        }

      
        #endregion

        #region Methods

        #region Private

        /// <summary>
        /// Sets the user list properties.
        /// </summary>
        private void SetUserListProperties()
        {
            this.Title = LocalizationUtility.GetText("titleUserAdministration");
            if (!Page.IsPostBack)
            {
                ddlSearchBy.Items.Add(new ListItem(LocalizationUtility.GetText("lblUserName")));
                ddlSearchBy.Items.Add(new ListItem(LocalizationUtility.GetText("lblEmailAddress")));
            }
        }

        private void BindNewsLetterUserCollection()
        {

            dsUser = new DataSet();
            if (flag == 1)
            {
                SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.FindNewsLetterUserList(txtSearchBy.Text, flag);
                dsUser = sp.GetDataSet();
                ViewState["BindData"] = dsUser;
            }
            else if (flag == 2)
            {
                SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.FindNewsLetterUserList(txtSearchBy.Text, flag);
                dsUser = sp.GetDataSet();
                ViewState["BindData"] = dsUser;
            }
            else
            {
                SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.FindNewsLetterUserList("", 0);
                dsUser = sp.GetDataSet();
                ViewState["BindData"] = dsUser;
            }

            //dsUser = new DataSet();
            //SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.FindNewsLetterUserList();
            //dsUser = sp.GetDataSet();

            dgUserList.DataSource = dsUser;


            //if (dgUserList.Rows.Count % dgUserList.PageSize == 1 && dgUserList.PageIndex == dgUserList.PageCount - 1 && dgUserList.PageIndex != 0)
            //{
            //    dgUserList.PageIndex = dgUserList.PageIndex - 1;
            //}
            dgUserList.DataBind();

            if (dsUser != null && dsUser.Tables[0].Rows.Count > 0)
            {
                lblNumberOfTotalUsers.Text = dsUser.Tables[0].Rows.Count.ToString();
            }
           // dgUserList.DataBind();
         
        }


        private void LoadUsers()
        {
            //BindNewsLetterUserCollection(Membership.GetAllUsers());
            BindNewsLetterUserCollection();
        }

        #endregion

        #endregion

        protected void lnkCancel_Click(object sender, EventArgs e)
        {

        }

        protected void lbUpdate_Command(object sender, CommandEventArgs e)
        {

        }
   

        protected void dgUserList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            DataRowView drv = e.Row.DataItem as DataRowView;
            Label lblACtive = (Label)e.Row.FindControl("lblACtive");
            if (lblACtive != null)
            {
                string test = lblACtive.Text;
                if (lblACtive.Text == "True")
                {
                    lblACtive.Text = "Active";
                }
                else
                {
                    lblACtive.Text = "InActive";
                }
            }
       

            //if (e.Row.RowType == DataControlRowType.Header)
            //{
            //    Image img = new Image();

            //    if (dgUserList.SortDirection == SortDirection.Ascending)
            //    {
            //        img.ImageUrl = "../images/uparrow.gif";
            //    }
            //    else
            //    {
            //        img.ImageUrl = "../images/dnarrow.gif";
            //    }
            //    // e.Row.Cells[0].Controls.Add(LiteralControl(" "));
            //    e.Row.Cells[1].Controls.Add(img);
            //}
      
      
  
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {

                
                    DropDownList ddlGroup = (DropDownList)e.Row.FindControl("ddlGroup");
                    SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.FindNewsLetterGroupList();
                    DataSet dsChild = (DataSet)sp.GetDataSet();
                    if (ddlGroup != null)
                    {
                        ddlGroup.DataSource = dsChild;
                        ddlGroup.DataTextField = "GroupName";
                        ddlGroup.DataValueField = "GroupID";
                        ddlGroup.DataBind();
                        ddlGroup.SelectedValue = dgUserList.DataKeys[e.Row.RowIndex].Values["GroupID"].ToString();
                    }

                }
            }
        }

        public DataSet FillGroup()
        {
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.FindNewsLetterGroupList();
            DataSet dsChild = (DataSet)sp.GetDataSet();
            return dsChild;
        }

        private bool isEditMode = false;
        protected bool IsInEditMode
        {
            get
            {
                return this.isEditMode;
            }
            set
            {
                this.isEditMode = value;
            }
        }



            
        protected void dgUserList_RowEditing(object sender, GridViewEditEventArgs e)
        {

            dgUserList.EditIndex = e.NewEditIndex;

            dgUserList.DataSource = ViewState["BindData"];
            dgUserList.DataBind();
           // BindNewsLetterUserCollection();
        }

    
        protected void dgUserList_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            dgUserList.EditIndex = -1;
            dgUserList.DataSource = ViewState["BindData"];
            dgUserList.DataBind();
           // BindNewsLetterUserCollection();

        }

        protected void dgUserList_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int userid = Convert.ToInt32(dgUserList.DataKeys[e.RowIndex].Values["UserID"].ToString());
            
            DropDownList ddlGroup = (DropDownList)dgUserList.Rows[e.RowIndex].Cells[4].FindControl("ddlGroup");
            int GroupID = Convert.ToInt32(ddlGroup.SelectedValue);

            CheckBox chkActiveEdit = (CheckBox)dgUserList.Rows[e.RowIndex].Cells[5].FindControl("chkActiveEdit");
            bool checkboxvalue = true;
            if (chkActiveEdit != null)
            {
                checkboxvalue = chkActiveEdit.Checked;
            }
            

            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.UpdateNewsLetterUserList(userid, GroupID,checkboxvalue);

            dsUser = sp.GetDataSet();
            dgUserList.EditIndex = -1;
            BindNewsLetterUserCollection();         

    

        }

        protected void dgUserList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
       

        private string GetSortDirection(string column)
        {
            string sortDirection = "DESC";
            string sortExpression = ViewState["SortExpression"] as string;

            if (sortExpression != null)
            {
                if (sortExpression == column)
                {
                    string lastDirection = ViewState["SortDirection"] as string;
                    if ((lastDirection != null) && (lastDirection == "DESC"))
                    {
                        sortDirection = "ASC";
                    }
                    else if (lastDirection == "ASC")
                    {
                        sortDirection = "DESC";
                    }
                }
            }

            ViewState["SortDirection"] = sortDirection;
            ViewState["SortExpression"] = column;

            return sortDirection;
        }

        protected void dgUserList_Sorting(object sender, GridViewSortEventArgs e)
        {
 
            DataSet dataSet = (DataSet)ViewState["BindData"];
            DataTable dt = dataSet.Tables[0];
            
            dt.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
            dgUserList.DataSource = dt;
            dgUserList.DataBind();

        }
        protected void dgUserList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgUserList.PageIndex = e.NewPageIndex;
            dgUserList.DataSource = ViewState["BindData"];
            dgUserList.DataBind();
        }

      }
}