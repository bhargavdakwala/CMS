<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="categories.ascx.cs"
    Inherits="Etech.CMS.Web.admin.controls.product.categories" %>
<asp:UpdateProgress ID="upDisplay" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="up"
    DisplayAfter="100" />
<asp:UpdatePanel ID="up" runat="server">
    <ContentTemplate>
        <CMS:Panel ID="pnlProductCategories" runat="server">
            <table id="categoryTable" width="100%">
                <tr>
                    <td width="30%" nowrap="nowrap">
                        <CMS:Panel ID="pnlCurrentCategories" runat="server">
                            <asp:TreeView ID="tvCategory" runat="server" DataSourceID="xmlDataSource" ShowLines="true"
                                OnSelectedNodeChanged="Add_Category" ExpandDepth="FullyExpand">
                                <DataBindings>
                                    <asp:TreeNodeBinding DataMember="MenuItem" NavigateUrlField="NavigateUrl" TextField="Text"
                                        ValueField="Value" ToolTipField="ToolTip" />
                                </DataBindings>
                            </asp:TreeView>
                            <asp:XmlDataSource ID="xmlDataSource" TransformFile="~/transforms/categoryMenu.xslt"
                                XPath="MenuItems/MenuItem" runat="server" />
                        </CMS:Panel>
                    </td>
                    <td valign="top" style="padding-left: 20px;">
                        <CMS:Panel ID="pnlAssociatedCategories" runat="server">
                            <div class="gridBox">
                                <div class="gridWrap">
                                    <CMS:DataGrid ID="dgProductCategories" runat="server" AutoGenerateColumns="false"
                                        SkinID="adminDataGrid">
                                        <HeaderStyle CssClass="adminTableHeader" />
                                        <Columns>
                                            <asp:BoundColumn DataField="Name" />
                                            <asp:TemplateColumn>
                                                <ItemTemplate>
                                                    <CMS:LinkButton ID="lbDelete" runat="server" CausesValidation="false" CommandName="myDelete"
                                                        CommandArgument='<%# Eval("CategoryId") %>' OnCommand="lbDelete_Click" />
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                        </Columns>
                                    </CMS:DataGrid>
                                </div>
                            </div>
                        </CMS:Panel>
                    </td>
                </tr>
            </table>
        </CMS:Panel>
    </ContentTemplate>
</asp:UpdatePanel>
