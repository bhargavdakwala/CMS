using System;
using System.Collections;
using System.Configuration;
using System.Data;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Etech.CMS.Web
{
    public partial class Test : System.Web.UI.Page
    {
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void MyCalendar_SelectionChanged(object sender, EventArgs e)
        {


        }
        protected void MyCalendar_DayRender(object sender, DayRenderEventArgs e)
        {
            //if (e.Day.DayNumberText == "25")
            //{
            //    e.Cell.Controls.Add(new LiteralControl("<a href='abc.html'>Pay Day asdfhks sdah fkhkjdf</a>"));
            //    e.Cell.BorderColor = Color.Black;
            //    e.Cell.BorderWidth = 1;
            //    e.Cell.BorderStyle = BorderStyle.Solid;
            //    e.Cell.BackColor = Color.LightGray;
            //}
            DataGrid dg = new DataGrid();
            SubSonic.StoredProcedure sp = Etech.CMS.Content.SPs.FetchBlogCurrentList();
            ds = sp.GetDataSet();
            if (e.Day.DayNumberText == "25")
            { 
            dg.DataSource = ds;
            dg.DataBind();
            }
            e.Cell.Controls.Add(dg);

        }
    }
}
