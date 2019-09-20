<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeBehind="productlist.aspx.cs" Inherits="Etech.CMS.Web.admin.productlist" Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/admin/admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="mainContentRegion">
        <div id="admin_centercontent">
            <%-- <div class="sectionHeader"><CMS:Label ID="lblProductList" runat="server" /></div><br />--%>
            <CMS:Panel ID="pnlProductSearch" runat="server" SkinID="pnlBorder">
                <div class="panelWrap">
                    <CMS:Label ID="lblCategory" runat="server" CssClass="label" />&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlParentCategory" runat="server" CssClass="fwdropdownlist" />
                    &nbsp;&nbsp;
                    <CMS:Button ID="btnSearch" runat="server" CssClass="button" OnClick="btnSearch_Click" />
                </div>
            </CMS:Panel>
            <br />
            <CMS:Panel ID="pnlProductList" runat="server" SkinID="pnlBorder">
                <div class="gridBox">
                    <div class="gridWrap">
                        <div style="padding: 0 10px 10px 0;" class="floatRight">
                            <CMS:Label ID="lblTotalProducts" runat="server" CssClass="label" />&nbsp;<CMS:Label
                                ID="lblNumberOfTotalProducts" runat="server" />&nbsp;&nbsp;
                                <CMS:HyperLink ID="AddProduct" runat="server"
                                 NavigateUrl="~/admin/productedit.aspx?view=g&productId=-1" SkinID="addnew" />
                        </div>
                        <CMS:DataGrid ID="dgProducts" runat="server" AutoGenerateColumns="false" SkinID="adminDataGrid"
                            OnPageIndexChanged="dgProduct_PageIndexChanging">
                            <Columns>
                            
                                <asp:BoundColumn DataField="BaseSku" />
                                <asp:BoundColumn DataField="Name" />
                                <asp:BoundColumn DataField="IsEnabled" />
                                
                                <asp:BoundColumn DataField="IsDeleted" />
                                    <asp:TemplateColumn>
                                    <ItemTemplate>
                                        <CMS:HyperLink ID="hlEditLink" runat="server" SkinID="edit" NavigateUrl='<%# FormatEditUrl(DataBinder.Eval(Container.DataItem, "ProductId").ToString()) %>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                        </CMS:DataGrid>
                    </div>
                </div>
            </CMS:Panel>
        </div>
    </div>
</asp:Content>
