<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeNews.ascx.cs" Inherits="Etech.CMS.Web.controls.HomeNews" %>
<asp:Repeater ID="rptRecentNews" runat="server">
    <HeaderTemplate>
        <h2 class="white">
            Upcoming Affiliate Functions</h2>
        <br />
    </HeaderTemplate>
    <ItemTemplate>
        <p class="lighterBluy">
            <asp:Label ID="lblNewsTitle" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ServiceTitle").ToString().Length > 60 ? DataBinder.Eval(Container.DataItem, "ServiceTitle").ToString().Substring(0,DataBinder.Eval(Container.DataItem, "ServiceTitle").ToString().Substring(0,60).LastIndexOf(" ")) + " " : DataBinder.Eval(Container.DataItem, "ServiceTitle").ToString() %>'
            Width="345px" style="font-weight:normal;"></asp:Label>
<%--            <asp:Label ID="lblNewsDate" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "Createdon", "{0:dd/MM/yyyy}") %>'
            Width="80px" style="font-weight:normal;"></asp:Label>--%>
           
            <%--<%# DataBinder.Eval(Container.DataItem, "ServiceDescription").ToString().Length > 70 ? DataBinder.Eval(Container.DataItem, "ServiceDescription").ToString().Substring(0,DataBinder.Eval(Container.DataItem, "ServiceDescription").ToString().Substring(0,70).LastIndexOf(" ")) + " " : DataBinder.Eval(Container.DataItem, "ServiceDescription").ToString() %><br />--%>
            <%--...<%#  DataBinder.Eval(Container.DataItem, "Createdon", "{0:dd / MM / yy}") %>
            .Plese feel..--%>
        </p>
            
    </ItemTemplate>
    <FooterTemplate>
        
        <a href="http://www.ahscawa.com.au/upcoming-affiliate-functions.aspx" class="floatRight button">VIEW<span class="nextArrow"></span></a>
    </FooterTemplate>
</asp:Repeater>
