<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopMenuNavigation.ascx.cs"
    Inherits="Etech.CMS.Web.controls.navigation.TopMenuNavigation" %>
<asp:Repeater ID="rptSubMenu" runat="server" OnItemDataBound="rptSubMenu_ItemDataBound">
    <HeaderTemplate>
        <ul>
    </HeaderTemplate>
    <ItemTemplate>
        <li id="liPage" runat="server">
            <asp:Label ID="lblPageID" runat="server" Visible="false" Text='<%# Eval("PageId") %>'></asp:Label>
            <asp:HyperLink ID="lnkPage" runat="server" Text='<%# Eval("Text") %>' NavigateUrl='<%# Eval("NavigateUrl") %>'></asp:HyperLink></li></ItemTemplate>
    <FooterTemplate>
        </ul></FooterTemplate>
</asp:Repeater>
<asp:XmlDataSource ID="xmlDataSource" TransformFile="~/transforms/subMenu.xslt" XPath="MenuItems/MenuItem"
    runat="server" />
