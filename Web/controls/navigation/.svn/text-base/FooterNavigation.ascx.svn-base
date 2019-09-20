<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FooterNavigation.ascx.cs"
    Inherits="Etech.CMS.Web.controls.navigation.FooterNavigation" %>
<asp:Repeater ID="rptTopMenu" runat="server" OnItemDataBound="rptTopMenu_ItemDataBound">
    <HeaderTemplate>
        <div class="floatLeft" style="width:120px;">
        <ul>
    </HeaderTemplate>
    <ItemTemplate>
        <li id="liPage" runat="server">
            <asp:Label ID="lblPageID" runat="server" Visible="false" Text='<%# Eval("PageId") %>'></asp:Label>
            <asp:HyperLink ID="lnkPage" runat="server" Text='<%# Eval("Text") %>' NavigateUrl='<%# Eval("NavigateUrl") %>'></asp:HyperLink></li>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
        </div>
    </FooterTemplate>
</asp:Repeater>

<asp:XmlDataSource ID="xmlDataSource" TransformFile="~/transforms/subMenu.xslt" XPath="MenuItems/MenuItem"
    runat="server" />




    <div style="width:550px; height:340px; float:left">

<asp:Repeater ID="rptSubMenu" runat="server" OnItemDataBound="rptSubMenu_ItemDataBound">
    <HeaderTemplate>
       
    </HeaderTemplate>
    <ItemTemplate>
         
            <ul id="lblTitle" runat="server">
                <li id="liPage" runat="server">
                    <asp:Label ID="lblPageID" runat="server" Visible="false" Text='<%# Eval("PageId") %>'></asp:Label>
                    <asp:Label ID="lblRedirectID" runat="server" Visible="false" Text='<%# Eval("RedirectId") %>'></asp:Label>
                    <asp:HyperLink ID="lnkPage" runat="server" Text='<%# Eval("MenuTitle") %>' NavigateUrl='<%# Geturl(Eval("URLTitle")) %>'></asp:HyperLink>
                    <asp:Repeater ID="rptChildMenu" runat="server">
                        <HeaderTemplate>
                            <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li id="liSubMenu" runat="server">
                                <asp:Label ID="lblPageID" runat="server" Visible="false" Text='<%# Eval("PageId") %>'></asp:Label>
                                <asp:HyperLink ID="lnkSubMenu" runat="server" NavigateUrl='<%# Geturl(Eval("URLTitle")) %>'>
                              <%# Eval("MenuTitle")%>
                                
                                </asp:HyperLink>
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul></FooterTemplate>
                    </asp:Repeater>
                </li>
            </ul>
         
    </ItemTemplate>
    <FooterTemplate>
       
    </FooterTemplate>
</asp:Repeater>
</div> 


