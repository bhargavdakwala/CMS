<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="submenuNavigation.ascx.cs"
    Inherits="Etech.CMS.Web.controls.submenuNavigation" EnableViewState="false" %>

<div class="navigation">
<asp:Repeater ID="rptSubMenu" runat="server" OnItemDataBound="rptSubMenu_ItemDataBound">
    <HeaderTemplate>
        <ul>
    </HeaderTemplate>
    <ItemTemplate>
        <li id="liPage" runat="server">
            <asp:Label ID="lblPageID" runat="server" Visible="false" Text='<%# Eval("PageId") %>'></asp:Label>
            <asp:Label ID="lblRedirectID" runat="server" Visible="false" Text='<%# Eval("RedirectId") %>'></asp:Label>
            <asp:HyperLink ID="lnkPage" runat="server" Text='<%# Eval("MenuTitle") %>' NavigateUrl='<%# Geturl(Eval("URLTitle")) %>'></asp:HyperLink>
            <div   id="divSubmenu" runat="server">
            <div class="spacer"></div>
                    
                <asp:Repeater ID="rptChildMenu" runat="server" OnItemDataBound="rptChildMenu_ItemDataBound">
                    <HeaderTemplate>
                        <ul>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li id="liSubMenu" runat="server">
                        
                            <asp:Label ID="lblPageID" runat="server" Visible="false" Text='<%# Eval("PageId") %>'></asp:Label>
                            
                            <asp:HyperLink ID="lnkSubMenu" runat="server" NavigateUrl='<%# Geturl(Eval("URLTitle")) %>' style="background-image:none;">
                              <%# Eval("MenuTitle")%>
                                <%--<asp:Label ID="linkText" runat="server" Text='<%# Eval("MenuTitle") %>'></asp:Label>--%>
                            </asp:HyperLink>
                            <asp:Repeater ID="rptGrandChildPages" runat="server">
                                <HeaderTemplate>
                                    <div >
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPageID" runat="server" Visible="false" Text='<%# Eval("PageId") %>'></asp:Label>
                                    <asp:HyperLink ID="lnkSubMenu" runat="server" NavigateUrl='<%# Geturl(Eval("URLTitle")) %>'>
                                    <asp:Image ID="imgMenuImage" runat="server" ImageUrl='<%# ImaePath(Eval("PageTitleImage")) %>' 
                                        AlternateText="img" /></asp:HyperLink>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </div>
                                </FooterTemplate>
                            
                            </asp:Repeater>  
                        
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </li>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
    </FooterTemplate>
</asp:Repeater>
</div> 
<asp:XmlDataSource ID="xmlDataSource" TransformFile="~/transforms/subMenu.xslt" XPath="MenuItems/MenuItem"
    runat="server" />
