using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Etech.CMS.Web.controls.content
{
    public partial class MonthlyMeeting : System.Web.UI.UserControl
    {
        #region Member Variables
        DataSet ds;
        int id;
        string BlogID;
        bool flag = false;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindMonthlyMeeting();
            }
        }

        private void BindMonthlyMeeting()
        {
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.GetRecentMonthlyMeeting();
            ds = sp.GetDataSet();
            rptMonthlyMeeting.DataSource = ds;
            rptMonthlyMeeting.DataBind();
        }
    }
}