<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeBehind="categoryedit.aspx.cs" Inherits="Etech.CMS.Web.admin.categoryedit"
    Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/admin/admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="mainContentRegion">
        <div id="admin_centercontent">
            <%-- <div class="sectionHeader"><CMS:Label ID="lblProductCategories" runat="server" /></div><br />--%>
            <%--   CollapseImageUrl="~/App_Themes/CMS/images/icons/folderopen.gif" ExpandImageUrl="~/App_Themes/CMS/images/icons/folderclosed.gif"
                                NoExpandImageUrl="~/App_Themes/CMS/images/icons/folderclosed.gif" --%>
            <table id="categoryTable">
                <tr>
                    <td width="50%" valign="top">
                        <CMS:Panel ID="pnlCurrentCategories" runat="server" SkinID="pnlBorder">
                            <asp:TreeView ID="tvCategory" runat="server" DataSourceID="xmlDataSource" OnSelectedNodeChanged="Category_Selected"
                                NodeStyle-ImageUrl="~/App_Themes/CMS/images/icons/page.gif" ExpandDepth="FullyExpand">
                                <DataBindings>
                                    <asp:TreeNodeBinding DataMember="MenuItem" NavigateUrlField="NavigateUrl" TextField="Text"
                                        ValueField="Value" ToolTipField="ToolTip" />
                                </DataBindings>
                            </asp:TreeView>
                            <asp:XmlDataSource ID="xmlDataSource" TransformFile="~/transforms/categoryMenu.xslt"
                                XPath="MenuItems/MenuItem" runat="server" />
                        </CMS:Panel>
                    </td>
                    <td valign="top">
                        <CMS:Panel ID="pnlChildCategories" runat="server" SkinID="pnlBorder">
                            <div class="gridBox">
                                <div class="gridWrap">
                                    <CMS:DataGrid ID="dgChildren" runat="server" AutoGenerateColumns="false" SkinID="adminDataGridNoPage">
                                        <Columns>
                                            <asp:TemplateColumn>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="lbUp" runat="server" CausesValidation="false" CommandName="Up"
                                                        CommandArgument='<%# Eval("CategoryId") %>' OnClick="Items_ItemReorder" SkinID="up" />
                                                    <asp:ImageButton ID="lbDown" runat="server" CausesValidation="false" CommandName="Down"
                                                        CommandArgument='<%# Eval("CategoryId") %>' OnClick="Items_ItemReorder" SkinID="down" />
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="Name" />
                                            <asp:BoundColumn DataField="SortOrder" />
                                        </Columns>
                                    </CMS:DataGrid>
                                </div>
                            </div>
                        </CMS:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <CMS:Panel ID="pnlEditCategory" runat="server" Width="100%" SkinID="pnlBorder">
                            <div class="panelWrap">
                                <CMS:Label ID="lblCategoryId" runat="server" Visible="false" />
                                <CMS:Label ID="lblParentCategory" runat="server" CssClass="label" /><br />
                                <asp:DropDownList ID="ddlParentCategory" runat="server" CssClass="fwdropdownlist" />
                                &nbsp;<CMS:HelpLink ID="helpParentCategory" runat="server" NavigateUrl="javascript:void(0);" /><br />
                                <br />
                                <CMS:Label ID="lblName" runat="server" CssClass="label" /><br />
                                <asp:TextBox ID="txtName" runat="server" CssClass="textbox" />&nbsp;<CMS:HelpLink
                                    ID="helpCategoryName" runat="server" NavigateUrl="javascript:void(0);" /><br />
                                <br />
                                <CMS:Label ID="lblImageFile" runat="server" CssClass="label" /><br />
                                <asp:TextBox ID="txtImageFile" runat="server" CssClass="longtextbox" />&nbsp;<CMS:HyperLink
                                    ID="hlImageSelector" runat="server" CssClass="submodal-800-415" />&nbsp;<CMS:HelpLink
                                        ID="helpCategoryImageFile" runat="server" NavigateUrl="javascript:void(0);" /><br />
                                <br />
                                <div class="verticalalign">
                                    <CMS:Label ID="lblDescription" runat="server" CssClass="label" />&nbsp;<CMS:HelpLink
                                        ID="helpCategoryDescription" runat="server" NavigateUrl="javascript:void(0);" /><br />
                                </div>
                                <asp:TextBox ID="txtDescription" runat="server" CssClass="multilinetextbox" MaxLength="250"
                                    TextMode="MultiLine" /><br />
                                <br />
                                <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click" />&nbsp;&nbsp;<CMS:Button
                                    ID="btnReset" runat="server" CssClass="button" OnClick="btnReset_Click" />&nbsp;&nbsp;&nbsp;&nbsp;<CMS:Button
                                        ID="btnDelete" runat="server" CssClass="button" Visible="false" OnClick="btnDelete_Click" />
                            </div>
                        </CMS:Panel>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
