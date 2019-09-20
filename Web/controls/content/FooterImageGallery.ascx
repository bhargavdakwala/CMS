<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FooterImageGallery.ascx.cs"
    Inherits="Etech.CMS.Web.controls.content.FooterImageGallery" %>
<asp:Repeater ID="rptFooterImageGallery" runat="server">
    <HeaderTemplate>
        <div id="makeMeScrollable">
            <div class="scrollingHotSpotLeft">
            </div>
            <div class="scrollingHotSpotRight">
            </div>
            <div class="scrollWrapper">
                <div class="scrollableArea">
    </HeaderTemplate>
    <ItemTemplate>
        <%--<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Geturl(Eval("URLTitle")) %>'>
            <asp:Image ID="Image1" runat="server" Width="134" Height="56" ImageUrl='<%# ImagePath(Eval("ThumbImageFile")) %>'
                AlternateText="img" /></asp:HyperLink>--%>
        <asp:HyperLink ID="lnkSubMenu" runat="server" NavigateUrl='<%# Eval("URLTitle") %>' Target="_blank"> 
            <asp:Image ID="imgMenuImage" runat="server" Width="134" Height="56" ImageUrl='<%# ImagePath(Eval("ThumbImageFile")) %>'
                AlternateText="img" /></asp:HyperLink>
    </ItemTemplate>
    <FooterTemplate>
        </div> </div> </div>
    </FooterTemplate>
</asp:Repeater>
