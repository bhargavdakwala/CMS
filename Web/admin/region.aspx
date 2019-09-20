<%@ Page Language="C#" MasterPageFile="~/admin/modal.master" ValidateRequest="false"
    AutoEventWireup="true" CodeBehind="region.aspx.cs" Inherits="Etech.CMS.Web.admin.region"
    Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/admin/modal.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <CMS:Panel ID="pnlAddRegion" runat="server" SkinID="pnlBorder">
        <div class="panelWrap">
            <CMS:Label ID="lblRegionTitle" runat="server" CssClass="label" /><br />
            <asp:TextBox ID="txtTitle" runat="server" MaxLength="50" CssClass="textbox" />&nbsp;<CMS:HelpLink
                ID="helpRegionTitle" runat="server" NavigateUrl="javascript:void(0);" /><br />
            <br />
            <CMS:Label ID="lblShowTitle" runat="server" CssClass="label" /><br />
            <CMS:CheckBox ID="chkShowTitle" runat="server" />&nbsp;<CMS:HelpLink ID="helpShowTitle"
                runat="server" NavigateUrl="javascript:void(0);" /><br />
            <br />
            <CMS:Label ID="lblSortOrder" runat="server" CssClass="label" /><br />
            <asp:TextBox ID="txtSortOrder" runat="server" MaxLength="3" CssClass="smalltextbox" />&nbsp;<CMS:HelpLink
                ID="helpSortOrder" runat="server" NavigateUrl="javascript:void(0);" /><asp:FilteredTextBoxExtender
                    ID="ftbeQuantity" runat="server" TargetControlID="txtSortOrder" FilterType="Numbers" />
            <br />
            <br />
            <CMS:Label ID="lblProvider" runat="server" CssClass="label" /><br />
            <asp:DropDownList ID="ddlProvider" runat="server" CssClass="dropdownlist" />
            &nbsp;<CMS:HelpLink ID="helpProvider" runat="server" NavigateUrl="javascript:void(0);" /><br />
            <br />
            <CMS:Label ID="lblTemplateRegion" runat="server" CssClass="label" /><br />
            <asp:DropDownList ID="ddlTemplateRegion" runat="server" CssClass="dropdownlist" />
            &nbsp;<CMS:HelpLink ID="helpTemplateRegion" runat="server" NavigateUrl="javascript:void(0);" /><br />
            <br />
            <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click" />
        </div>
    </CMS:Panel>
</asp:Content>
