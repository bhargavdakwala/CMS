<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeBehind="userlist.aspx.cs" Inherits="Etech.CMS.Web.admin.userlist" Title="Untitled Page" %>


<%@ MasterType VirtualPath="~/admin/admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- <div class="sectionHeader"><CMS:Label ID="lblUserAdministration" runat="server" /></div><br />--%>
    <CMS:Panel ID="pnlUserSearch" runat="server" SkinID="pnlBorder">
        <div class="panelWrap">
            <CMS:Label ID="lblSearchBy" runat="server" CssClass="label" /><br />
            <br />
            <asp:DropDownList ID="ddlSearchBy" runat="server" CssClass="dropdownlist" />
            &nbsp;
            <asp:TextBox ID="txtSearchBy" runat="server" CssClass="textbox" MaxLength="50"/>&nbsp;
            <CMS:Button ID="btnSearch" runat="server" CssClass="button" OnClick="btnSearch_Click" />
        </div>
        <div style="padding-left:150px">
            <asp:RegularExpressionValidator ID="regexUserNameName" runat="server" ControlToValidate="txtSearchBy"
                ErrorMessage="Please enter valid name/email address." SetFocusOnError="true" Display="Dynamic"
                ValidationExpression="^[a-zA-Z0-9()/@&,|' ?.-]+$"></asp:RegularExpressionValidator>
        </div>
    </CMS:Panel>
    <CMS:Panel ID="pnlUserList" runat="server" SkinID="pnlBorder">
        <div class="gridBox">
            <div class="gridWrap">
                <div style="padding: 0 10px 10px 0;" >
                    <CMS:Label ID="lblTotalUsers" runat="server" CssClass="floatLeft"/>&nbsp;<CMS:Label
                        ID="lblNumberOfTotalUsers" runat="server" />&nbsp;&nbsp;<CMS:HyperLink ID="hlAddUser"
                            runat="server" NavigateUrl="~/admin/useredit.aspx" CssClass="submodal-400-500 floatRight"
                            SkinID="addnew" Text="Add New User" Font-Bold="true" Font-Underline="true"  ForeColor="#0066a6"/>
                </div>
                <CMS:DataGrid ID="dgUserList" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                    OnPageIndexChanged="dgUserList_PageIndexChanging" SkinID="adminDataGrid">
                    <Columns>
                        <asp:TemplateColumn>
                            <HeaderStyle HorizontalAlign="center" />
                            <ItemStyle HorizontalAlign="center" />
                            <ItemTemplate>
                                <CMS:CheckBox runat="server" ID="chkActive" OnCheckedChanged="EnabledChanged" AutoPostBack="true" Enabled="false"
                                    Checked='<%#DataBinder.Eval(Container.DataItem, "IsApproved")%>' Value='<%#DataBinder.Eval(Container.DataItem, "UserName")%>' />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn>
                            <ItemTemplate>
                                <CMS:HyperLink ID="hlUserEdit" runat="server" NavigateUrl='<%# FormatEditUrl(DataBinder.Eval(Container.DataItem, "UserName").ToString()) %>'
                                    Text='<%# Eval("UserName") %>' SkinID="submodal-640-500" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn>
                            <ItemTemplate>
                                <CMS:HyperLink ID="EmailLink" runat="server" NavigateUrl='<%# Eval("Email", "mailto:{0}") %>'
                                    Text='<%# Eval("Email") %>' />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn DataField="CreationDate" ReadOnly="True" SortExpression="CreationDate" />
                        <asp:BoundColumn DataField="LastLoginDate" SortExpression="LastLoginDate" />
                        <asp:TemplateColumn>
                            <ItemTemplate>
                                <CMS:LinkButton runat="server" ID="lbDelete" CommandName="mydelete" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "UserName")%>'
                                    OnCommand="lbDelete_Click" SkinID="delete" OnClientClick="return confirm('Do you want to Delete this record?');" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </CMS:DataGrid>
            </div>
        </div>
        <br />
        <CMS:HyperLink ID="hlShowAll" runat="server" NavigateUrl="~/admin/userlist.aspx"
            SkinID="showAll" Visible="false" />
    </CMS:Panel>
</asp:Content>
