<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductItem.ascx.cs" 
    Inherits="Etech.CMS.Web.controls.content.products.ProductItem" EnableViewState="false" %>
<!-- InstanceBeginEditable name="RightText" -->
<!-- SERVICES Div01 Start -->
<div class="floatLeft servicesbckground">
<div class="floatLeft servicesimg">

    <CMS:HyperLink ID="hlImageLink" runat="server" NavigateUrl='<%# GetNavigateUrl(CurrentProduct.ProductId.ToString(), CurrentProduct.URLTitle) %>'></CMS:HyperLink>
    <p>
        <a id="A1" href='<%# GetNavigateUrl(CurrentProduct.ProductId.ToString(), CurrentProduct.URLTitle) %>'
            runat="server">DETAILS</a>
    </p>
</div>
<div class="floatLeft servicesText">
    <h3>
        <asp:Label ID="lblTitle" Text='<%#CurrentProduct.Name %>' runat="server"></asp:Label></h3>
    <p>
        <CMS:Label ID="lblAllow" runat="server" /><br />
        <CMS:Label ID="lblCarFrom" runat="server" />
        <br />
        <CMS:Label ID="lblFourWDFrom" runat="server" />
    </p>
</div>
</div>
<!-- SERVICES Div01 End -->
