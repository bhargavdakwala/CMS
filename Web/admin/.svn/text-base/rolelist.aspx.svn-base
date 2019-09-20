<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeBehind="rolelist.aspx.cs" Inherits="Etech.CMS.Web.admin.rolelist" Title="" %>

<%@ MasterType VirtualPath="~/admin/admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="mainContentRegion">
        <div id="admin_centercontent">
            <%-- <div class="sectionHeader"><CMS:Label ID="lblRoleAdministration" runat="server" /></div><br />--%>
            <CMS:Panel ID="pnlRoleList" runat="server" SkinID="pnlBorder">
                <div class="gridBox">
                    <div class="gridWrap">
                        <CMS:DataGrid ID="dgRoles" runat="server" AutoGenerateColumns="false" SkinID="adminDataGrid">
                            <Columns>
                                <asp:TemplateColumn>
                                    <ItemTemplate>
                                        <%# Container.DataItem %>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn>
                                    <ItemTemplate>
                                        <CMS:LinkButton ID="lbDelete" runat="server" CommandName="mydelete" CommandArgument='<%# Container.DataItem %>'
                                            OnCommand="lbDelete_Click" SkinID="delete" OnClientClick="return confirm('Do you want to Delete this record?');" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                        </CMS:DataGrid>
                    </div>
                </div>
            </CMS:Panel>
            <br />
            <CMS:Panel ID="pnlAddRole" runat="server" SkinID="pnlBorder">
                <div class="panelWrap">
                    <br />
                    <CMS:Label ID="lblRoleName" runat="server" CssClass="label" />&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtRoleName" runat="server" CssClass="textbox" MaxLength="25"/><br />
                    <asp:RequiredFieldValidator ID="rfvRoelName" runat="server" ControlToValidate="txtRoleName"
                        ErrorMessage="Please enter role name." SetFocusOnError="false" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regexRoleName" runat="server" ControlToValidate="txtRoleName"
                        ErrorMessage="Please enter valid name." SetFocusOnError="true" Display="Dynamic"
                        ValidationExpression="^[a-zA-Z0-9()/&,|' ?.-]+$"></asp:RegularExpressionValidator>
                    <br />
                    <CMS:Button ID="btnSave" runat="server" OnClick="btnSave_Click" CssClass="button" />
                </div>
            </CMS:Panel>
        </div>
    </div>
</asp:Content>
