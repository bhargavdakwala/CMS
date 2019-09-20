<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="anonymoususer.ascx.cs" Inherits="Etech.CMS.Web.controls.authentication.anonymoususer" EnableViewState="false" %>
<%@ Register TagPrefix="CMS" TagName="Search" Src="~/controls/search.ascx" %>

<div class="loginView">
  <a href="<%=Page.ResolveUrl("~/cart.aspx")%>"><asp:Image ID="imgCart" runat="server" SkinID="cart" /> <CMS:Label ID="lblCart" runat="server" /> <CMS:Label ID="lblItemCount" runat="server" /></a> | <CMS:HyperLink ID="hlLogin" runat="server" NavigateUrl="~/login.aspx" /> | <CMS:HyperLink ID="hlRegister" runat="server" NavigateUrl="~/register.aspx" /> | <CMS:Search ID="dcSearch" runat="server" />
</div>