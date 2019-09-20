<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeBehind="manufacturers.aspx.cs" Inherits="Etech.CMS.Web.admin.manufacturers"
    Title="Untitled Page"%>

<%@ MasterType VirtualPath="~/admin/admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="mainContentRegion">
        <div id="admin_centercontent">
            <%-- <div class="sectionHeader">
                <CMS:Label ID="lblManufacturerAdministration" runat="server" /></div>--%>
            <CMS:Panel ID="pnlManufacturerList" runat="server" DefaultButton="btnSave" SkinID="pnlBorder">
                <div class="gridBox">
                    <div class="gridWrap">
                        <CMS:DataGrid ID="dgManufacturers" runat="server" AutoGenerateColumns="false" SkinID="adminDataGrid"
                            OnPageIndexChanged="dgManufacturer_PageIndexChanging">
                            <Columns>
                                <asp:TemplateColumn>
                                    <ItemTemplate>
                                        <CMS:LinkButton ID="lbDelete" runat="server" CausesValidation="false" CommandName="mydelete"
                                            CommandArgument='<%# Eval("ManufacturerId") %>' OnCommand="lbDelete_Click" SkinID="delete" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="Name" />
                            </Columns>
                        </CMS:DataGrid>
                    </div>
                </div>
            </CMS:Panel>
            <br />
            <CMS:Panel ID="pnlAddManufacturer" runat="server" SkinID="pnlBorder">
                <div class="panelWrap">
                    <CMS:Label ID="lblName" runat="server" CssClass="label" />&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtName" runat="server" CssClass="textbox" />&nbsp;<CMS:HelpLink
                        ID="helpManufacturerName" runat="server" NavigateUrl="javascript:void(0);" /><br />
                    <br />
                    <CMS:Button ID="btnSave" runat="server" OnClick="btnSave_Click" />
                    <CMS:RequiredFieldValidator ID="rfvName" runat="server" Display="None" ControlToValidate="txtName" />
                </div>
            </CMS:Panel>
        </div>
    </div>
</asp:Content>
