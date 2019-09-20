<%@ Page Language="C#" MasterPageFile="~/admin/modal.master" AutoEventWireup="true"
    CodeBehind="useredit.aspx.cs" Inherits="Etech.CMS.Web.admin.useredit" Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/admin/modal.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <CMS:Panel ID="pnlAddUser" runat="server" Visible="false" SkinID="pnlBorder">
        <div class="panelWrap">
            <asp:CreateUserWizard ID="cuwRegister" runat="server" CssClass="login" TitleTextStyle-CssClass="sectionHeader"
                Width="100%" CreateUserButtonStyle-CssClass="btnCreateUser" EmailRegularExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" EmailRegularExpressionErrorMessage="Invalid email." InvalidPasswordErrorMessage="Password minimum length should be 4. No non alphanumeric characters allowed."/>
        </div>
    </CMS:Panel>
    <CMS:Panel ID="pnlEditUser" runat="server" Visible="false" SkinID="pnlBorder">
        <div class="panelWrap">
            <div class="verticalalign">
                <CMS:Label ID="lblUserName" runat="server" CssClass="label" />&nbsp;<CMS:HelpLink
                    ID="helpUserName" runat="server" NavigateUrl="javascript:void(0);" /><br />
            </div>
            <asp:TextBox ID="txtUserName" runat="server" CssClass="textbox" /><br />
            <br />
            <div class="verticalalign">
                <CMS:Label ID="lblEmail" runat="server" CssClass="label" />&nbsp;<CMS:HelpLink ID="helpEmail"
                    runat="server" NavigateUrl="javascript:void(0);" /><br />
            </div>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="longtextbox" /><br />
            <br />
            <div class="verticalalign">
                <CMS:CheckBox ID="chkActive" runat="server" CssClass="label" />&nbsp;<CMS:HelpLink
                    ID="helpActive" runat="server" NavigateUrl="javascript:void(0);" /><br />
                <br />
            </div>
            <CMS:Panel ID="pnlRoles" runat="server">
                <asp:Repeater ID="rptrRoles" runat="server">
                    <ItemTemplate>
                        <CMS:CheckBox runat="server" ID="checkBox1" Text='<%# Container.DataItem.ToString()%>'
                            Checked='<%# IsUserInRole(Container.DataItem.ToString())%>' CssClass="label" />
                        <br />
                    </ItemTemplate>
                </asp:Repeater>
            </CMS:Panel>
            <br />
            <CMS:Button ID="btnSave" runat="server" OnClick="btnSave_Click" CssClass="fButton" />
        </div>
    </CMS:Panel>
</asp:Content>

