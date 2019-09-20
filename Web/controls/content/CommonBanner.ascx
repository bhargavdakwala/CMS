<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommonBanner.ascx.cs"
    Inherits="Etech.CMS.Web.controls.content.CommonBanner" %>
<asp:Repeater ID="rptImageGallary" runat="server">
    <ItemTemplate>
        <a href='<%#Eval("ImageTitle")%>'><img src='<%# ImagePath(Eval("ImagePath"))%>' alt="" /></a>
    </ItemTemplate>
</asp:Repeater>
