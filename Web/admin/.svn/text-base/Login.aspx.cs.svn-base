using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Etech.CMS.Localization;
using System.Web.Security;
using System.Web.UI.HtmlControls;

namespace Etech.CMS.Web.admin
{
    public partial class Login : System.Web.UI.Page
    {
        HtmlGenericControl div;

        protected void Page_Load(object sender, EventArgs e)
        {
            div = (HtmlGenericControl)llogin.FindControl("ErrMsg");
            div.Visible = false;
        }

        protected void SetCookie(object sender, EventArgs e)
        {
            if (Membership.ValidateUser(llogin.UserName, llogin.Password))
            {
                FormsAuthentication.SetAuthCookie(llogin.UserName, ((CheckBox)llogin.FindControl("RememberMe")).Checked);
                div.Visible = false;
            }
            else
            {
                div.Visible = true;
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            TextBox txtUserName = (TextBox)llogin.FindControl("UserName");
            TextBox txtPassword = (TextBox)llogin.FindControl("Password");


            if (Membership.ValidateUser(llogin.UserName, llogin.Password))
            {
                FormsAuthentication.SetAuthCookie(llogin.UserName, ((CheckBox)llogin.FindControl("RememberMe")).Checked);
                div.Visible = false;
            }

            else if (txtUserName.Text == string.Empty || txtPassword.Text == string.Empty)
            {
                div.Visible = true;
            }
            else
            {
                div.Visible = true;
            }
        }

        protected void UserName_Validate(object source, ServerValidateEventArgs args)
        {
            TextBox txtUserName = (TextBox)llogin.FindControl("UserName");
            TextBox txtPassword = (TextBox)llogin.FindControl("Password");

            if (txtUserName.Text == string.Empty || txtPassword.Text == string.Empty)
            {
                div.Visible = true;
            }
            else
            {
                div.Visible = true;
            }
        } 
    }
}
