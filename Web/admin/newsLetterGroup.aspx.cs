using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Etech.CMS.Content;
using Etech.CMS.Core;
using Etech.CMS.Localization;
using Etech.CMS.Store;
using SubSonic;
using System.Web.Configuration;

namespace Etech.CMS.Web.admin
{
    public partial class newsLetterGroup : System.Web.UI.Page
    {
        #region Member Variables

        DataSet ds;
        public string strGUID;


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
                Label lblHeading = (Label)Master.FindControl("lblPageHeading");
                lblHeading.Text = "Group";

                dgBlogCategories.Attributes.Add("style", "word-break: break-all; word-wrap: break-word");
                // SetCategoryEditProperties();
                if (!Page.IsPostBack)
                {


                    BindGrid();
                  //  LoadListBox();

                    pnlNewsLetterEditGroup.Visible = false;
                    pnlNewsletterGroup.Visible = true;
                }

            }
            catch (Exception ex)
            {
                Logger.Error(typeof(newsLetterGroup).Name + ".Page_Load", ex);
                Master.MessageCenter.DisplayCriticalMessage(ex.Message);
            }
        }

        #endregion

        #region Button Events

        //protected void btnAdd_Click(object sender, EventArgs e)
        //{
        //    lblDuplicateMessage.Visible = false;
        //    lblDuplicateMessage.Text = string.Empty;
        //    foreach (ListItem sourceItem in lstNewsletterUserAll.Items)
        //    {
        //        if (sourceItem.Selected)
        //        {
        //            if (lstNewsletterUserSelected.Items.FindByValue(sourceItem.Value) == null)
        //            {
        //                lstNewsletterUserSelected.Items.Add(sourceItem);
        //                sourceItem.Attributes["toberemoved"] = "1";
        //            }
        //        }
        //    }
        //    for (int i = lstNewsletterUserAll.Items.Count; i > 0; i--)
        //    {
        //        if (lstNewsletterUserAll.Items[i - 1].Attributes["toberemoved"] != null && lstNewsletterUserAll.Items[i - 1].Attributes["toberemoved"] == "1")
        //        {
        //            lstNewsletterUserAll.Items.Remove(lstNewsletterUserAll.Items[i - 1]);
        //        }
        //    }
        //    GetSelectedItemForSelectedListbox();

        //}

        //protected void btnRemove_Click(object sender, EventArgs e)
        //{
        //    foreach (ListItem sourceItem in lstNewsletterUserSelected.Items)
        //    {
        //        if (sourceItem.Selected)
        //        {
        //            if (lstNewsletterUserAll.Items.FindByValue(sourceItem.Value) == null)
        //            {
        //                lstNewsletterUserAll.Items.Add(sourceItem);
        //                sourceItem.Attributes["toberemoved"] = "1";
        //            }
        //        }
        //    }
        //    for (int i = lstNewsletterUserSelected.Items.Count - 1; i >= 0; i--)
        //    {
        //        if (lstNewsletterUserSelected.Items[i].Selected == true)
        //        {
        //            lstNewsletterUserSelected.Items.Remove(lstNewsletterUserSelected.Items[i]);
        //        }

        //    }
        //    GetSelectedItemForAllListbox();
        //    GetSelectedItemForSelectedListbox();
        //}

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {

                    SaveNewsLetterGroup();
                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(newsLetterGroup).Name + ".btnSave_Click", ex);
                Master.MessageCenter.DisplayCriticalMessage(ex.Message);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            pnlNewsletterGroup.Visible = true;
            pnlNewsLetterEditGroup.Visible = false;

            txtGroupName.Text = string.Empty;
           // LoadListBox();
            //if (lstNewsletterUserSelected.Items.Count >= 0)
            //{
            //    for (int i = 0; i < lstNewsletterUserSelected.Items.Count; i++)
            //    {
            //        lstNewsletterUserSelected.Items.RemoveAt(i);
            //    }
            //}
        }


        #endregion Button Events

        #region Methods

        /// <summary>
        /// Gets all the NewsLetterGroups
        /// </summary>
        private void BindGrid()
        {
            ds = new NewsLetterEditController().FetchNewsletterByGroup();
            dgBlogCategories.DataSource = ds;

            if (dgBlogCategories.Items.Count % dgBlogCategories.PageSize == 1 && dgBlogCategories.CurrentPageIndex == dgBlogCategories.PageCount - 1 && dgBlogCategories.CurrentPageIndex != 0)
            {
                dgBlogCategories.CurrentPageIndex = dgBlogCategories.CurrentPageIndex - 1;
            }
            dgBlogCategories.DataBind();
        }

        /// <summary>
        /// Loads the All Users listbox.
        /// </summary>
        /// <param name="ds">The ds.</param>
        //private void LoadListBox()
        //{
        //    ds = new NewsLetterEditUserController().FetchAllUsersForNewsLetter();

        //    if (ds != null && ds.Tables[0].Rows.Count > 0)
        //    {

        //        lstNewsletterUserAll.DataSource = ds;
        //        lstNewsletterUserAll.DataTextField = "UserName";
        //        lstNewsletterUserAll.DataValueField = "UserID";
        //        lstNewsletterUserAll.DataBind();
        //    }
        //}


        /// <summary>
        /// Save the NewsLetterGroups and its details
        /// </summary>
        private void SaveNewsLetterGroup()
        {
            NewsLetterGroup nLG = new NewsLetterGroup();
            NewsLetterGroupDetail nLGDetails = new NewsLetterGroupDetail();

            //Insert
            if (lblNewsLetterGroupId.Text == "")
            {
                if (CheckDuplicateGroupName())
                {
                    nLG.GroupGuID = Guid.NewGuid().ToString();
                    nLG.GroupName = txtGroupName.Text.Trim().ToString();
                    nLG.IsActive = Convert.ToBoolean(true);
                    nLG.CreatedOn = Convert.ToDateTime(DateTime.Today.Date.ToString());
                    nLG.ModifiedOn = Convert.ToDateTime(DateTime.Today.Date.ToString());
                    nLG.Save(WebUtility.GetUserName());


                    SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetMaxID(3);
                    DataSet dsMaxID = (DataSet)sp.GetDataSet();
                    int MaxID = Convert.ToInt32(dsMaxID.Tables[0].Rows[0][0]);

                    //foreach (ListItem sourceItem in lstNewsletterUserSelected.Items)
                    //{
                    //    nLGDetails.GroupID = MaxID;
                    //    nLGDetails.UserID = Convert.ToInt32(sourceItem.Value);
                    //    NewsLetterGroupDetail.Insert(nLGDetails.GroupID, Convert.ToInt32(nLGDetails.UserID));

                    //}
                    lblDuplicateMessage.Visible = false;
                    pnlNewsletterGroup.Visible = true;
                    pnlNewsLetterEditGroup.Visible = false;
                    lblDuplicateMessage.Text = string.Empty;
                    txtGroupName.Text = string.Empty;
                   // lstNewsletterUserSelected.Items.Clear();
                    BindGrid();
                    Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblNewsLettrGroupSaved"));

                }
                else
                {
                    lblDuplicateMessage.Visible = true;
                    lblDuplicateMessage.Text = "Group Name already exists";
                    pnlNewsletterGroup.Visible = false;
                    pnlNewsLetterEditGroup.Visible = true;
                    txtGroupName.Text = string.Empty;
                   // lstNewsletterUserSelected.Items.Clear();
                    txtGroupName.Focus();

                }
            }
            //Update
            else if (Convert.ToInt32(lblNewsLetterGroupId.Text) > 0)
            {
                nLG.GroupID = Convert.ToInt32(lblNewsLetterGroupId.Text);
                nLG.GroupName = txtGroupName.Text.Trim().ToString();
                nLG.IsActive = Convert.ToBoolean(true);

                NewsLetterGroup.Update(Convert.ToInt32(nLG.GroupID), ViewState["Guid"].ToString(), nLG.GroupName, true, Convert.ToDateTime(DateTime.Today.Date.ToString()));

                //if (lstNewsletterUserSelected.Items.Count > 0)
                //{
                //    SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.DeleteGroupDetailsByGroupID(Convert.ToInt32(lblNewsLetterGroupId.Text));
                //    sp.ExecuteScalar();

                //    foreach (ListItem sourceItem in lstNewsletterUserSelected.Items)
                //    {
                //        nLGDetails.GroupID = Convert.ToInt32(lblNewsLetterGroupId.Text);
                //        nLGDetails.UserID = Convert.ToInt32(sourceItem.Value);
                //        NewsLetterGroupDetail.Insert(Convert.ToInt32(nLGDetails.GroupID), Convert.ToInt32(nLGDetails.UserID));

                //    }
                //}

                txtGroupName.Text = string.Empty;
                BindGrid();
                pnlNewsLetterEditGroup.Visible = false;
                pnlNewsletterGroup.Visible = true;
                Master.MessageCenter.DisplaySuccessMessage(LocalizationUtility.GetText("lblNewsLettrGroupSaved"));
            }







        }

        /// <summary>
        /// Keeps atleast one item in All Users Listbox selected
        /// </summary>
        //private void GetSelectedItemForAllListbox()
        //{
        //    if (lstNewsletterUserAll.Items.Count > 0)
        //    {
        //        for (int i = 0; i < lstNewsletterUserAll.Items.Count; i++)
        //        {
        //            if (i == 0)
        //            {
        //                lstNewsletterUserAll.Items[i].Selected = true;
        //            }
        //            else
        //            {
        //                lstNewsletterUserAll.Items[i].Selected = false;
        //            }
        //        }
        //    }
        //}


        /// <summary>
        /// Keeps atleast one item in Selected Users Listbox selected
        /// </summary>
        //private void GetSelectedItemForSelectedListbox()
        //{
        //    if (lstNewsletterUserSelected.Items.Count > 0)
        //    {
        //        for (int i = 0; i < lstNewsletterUserSelected.Items.Count; i++)
        //        {
        //            if (i == 0)
        //            {

        //                lstNewsletterUserSelected.Items[i].Selected = true;
        //            }
        //            else
        //            {
        //                lstNewsletterUserSelected.Items[i].Selected = false;
        //            }
        //        }
        //    }
        //}

        /// <summary>
        /// Check whether Group Name already exists or not
        /// </summary>
        private bool CheckDuplicateGroupName()
        {
            bool chkName = true;

            ds = new NewsLetterEditController().FetchNewsletterByGroup();

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    if (ds.Tables[0].Rows[i]["GroupName"].ToString().ToLower() == txtGroupName.Text.Trim().ToLower())
                    {
                        chkName = false;
                    }
                }
            }
            //lblDuplicateMessage.Visible = true;
            return chkName;

        }

        #endregion

        #region Grid Events

        protected void dgBlogCategories_OnItemCommand(object sender, DataGridCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Edit")
                {
                    lblNewsLetterGroupId.Text = e.CommandArgument.ToString();
                    NewsLetterGroup nLGEdit = new NewsLetterGroup(Int32.Parse(e.CommandArgument.ToString()));
                    strGUID = nLGEdit.GroupGuID.ToString();
                    ViewState["Guid"] = strGUID;
                    txtGroupName.Text = nLGEdit.GroupName;

                    //Populates the listbox lstNewsletterUserSelected
                    SubSonic.StoredProcedure splb = Etech.CMS.Content.SPs.GetGroupDetailsByGroupID(Convert.ToInt32(e.CommandArgument.ToString()));
                    //lstNewsletterUserSelected.DataSource = splb.GetReader();
                    //lstNewsletterUserSelected.DataTextField = "UserName";
                    //lstNewsletterUserSelected.DataValueField = "UserID";
                    //lstNewsletterUserSelected.DataBind();

                    //Populates the listbox lstNewsletterUserAll
                    SubSonic.StoredProcedure spAllListBox = Etech.CMS.Content.SPs.GetAllListBoxByGroupID(Convert.ToInt32(e.CommandArgument.ToString()));
                    //lstNewsletterUserAll.DataSource = spAllListBox.GetReader();
                    //lstNewsletterUserAll.DataTextField = "UserName";
                    //lstNewsletterUserAll.DataValueField = "UserID";
                    //lstNewsletterUserAll.DataBind();



                    pnlNewsletterGroup.Visible = false;
                    pnlNewsLetterEditGroup.Visible = true;
                    btnCancel.Visible = true;
                    lblDuplicateMessage.Text = string.Empty;
                  //  GetSelectedItemForSelectedListbox();

                }
                else if (e.CommandName == "Delete")
                {
                    NewsLetterGroup nLGDelete = new NewsLetterGroup(Int32.Parse(e.CommandArgument.ToString()));

                    //Deletes the Group

                    SubSonic.StoredProcedure spCount = Etech.CMS.Content.SPs.GetGroupCount(Int32.Parse(e.CommandArgument.ToString()));

                    int Count = (int)spCount.ExecuteScalar();

                    if (Count > 0)
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "Message", "alert('This Group is assigned to a user. It cannot be deleted');", true);
                    }
                    else
                    {
                        NewsLetterGroup.Delete(Int32.Parse(e.CommandArgument.ToString()));
                        //Deletes the Group details
                        SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.DeleteGroupDetailsByGroupID(Int32.Parse(e.CommandArgument.ToString()));
                        sp.ExecuteScalar();
                    }
                    BindGrid();
                }
            }
            catch (Exception ex)
            {
                Logger.Error(typeof(blogcategoryedit).Name + ".dgBlogCategories_OnItemCommand", ex);
                Master.MessageCenter.DisplayCriticalMessage(ex.Message);
            }
        }

        protected void lnkAddNewGroup_Click(object sender, EventArgs e)
        {
            pnlNewsLetterEditGroup.Visible = true;
            pnlNewsletterGroup.Visible = false;
          //  lstNewsletterUserSelected.Items.Clear();
            lblNewsLetterGroupId.Text = string.Empty;
            lblDuplicateMessage.Visible = false;
            lblDuplicateMessage.Text = string.Empty;

        }

        protected void dgBlogCategories_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dgBlogCategories.CurrentPageIndex = e.NewPageIndex;
            BindGrid();
        }

        #endregion Grid Events
    }
}