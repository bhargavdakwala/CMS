<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ServiceHomeImages.ascx.cs" Inherits="Etech.CMS.Web.controls.content.ServiceHomeImages" %>

<asp:Repeater ID="rptServiceHomeImage" runat="server">

<HeaderTemplate>
    <ul>
</HeaderTemplate>

<ItemTemplate>
    <li>
        
        <asp:HyperLink ID="hlUrl" runat="server" NavigateUrl='<%# Geturl(Eval("URLTitle")) %>'>
           <%# Eval("MenuTitle")%>
        </asp:HyperLink> 

    </li>

</ItemTemplate>
<FooterTemplate>
    </ul>
</FooterTemplate>

</asp:Repeater> 
