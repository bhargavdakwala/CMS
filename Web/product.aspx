<%@ Page Language="C#" MasterPageFile="~/Inner.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs"
    Inherits="Etech.CMS.Web.product" Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/Inner.Master" %>
<%--<%@ Register TagPrefix="CMS" TagName="Navigation" Src="~/controls/navigation/storenavigation.ascx" %>--%>
<%@ Register TagPrefix="CMS" TagName="Attributes" Src="~/controls/attributeSelector.ascx" %>
<%@ Register TagPrefix="CMS" TagName="CrossSells" Src="~/controls/catalogList.ascx" %>
<%--<%@ Register TagPrefix="CMS" TagName="Review" Src="~/controls/navigation/review.ascx" %>--%>
<asp:Content ContentPlaceHolderID="head" runat="server" ID="phHeader">

    <%--<script type="text/javascript" src="resources/jquery/jquery-1.3.2.min.js"></script>--%>
    

    <script type="text/javascript" src="resources/jquery/jquery.thickbox.js"></script>

    <link type="text/css" rel="stylesheet" href="resources/jquery/jquery.thickbox.css"  media="screen" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--  <div id="threeColumnLeftContent">
        <CMS:Navigation ID="navigation" runat="server" />
    </div>--%>
    <div class="floatRight RightSide">
        <div id="threeColumnRightContent">
            <asp:UpdatePanel ID="cart" runat="server">
                <ContentTemplate>
                    <CMS:Panel ID="pnlAddToCart" runat="server" Visible="false">
                        <table style="height: 100px; width: 100%;">
                            <tr>
                                <td style="height: 80%; vertical-align: top;">
                                    <asp:UpdatePanel ID="upCart" runat="server">
                                        <ContentTemplate>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="verticalalign">
                                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="smalltextbox" Visible="false"
                                            Text="1" EnableViewState="false" /><CMS:RequiredFieldValidator ID="rfvQuantity" runat="server"
                                                ControlToValidate="txtQuantity" Display="None" Visible="false" />
                                        <asp:FilteredTextBoxExtender ID="ftbeQuantity" runat="server" TargetControlID="txtQuantity"
                                            FilterType="Numbers" />
                                        <asp:DropDownList ID="ddlQuantity" runat="server" CssClass="dropdownlist" />
                                        <CMS:Button ID="btnAddToCart" runat="server" OnClick="btnAddToCart_Click" />
                                        <CMS:Panel ID="pnlValidation" runat="server">
                                            <asp:ValidationSummary ID="vsAttributes" runat="server" DisplayMode="BulletList"
                                                CssClass="validationSummary" />
                                        </CMS:Panel>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </CMS:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
            <CMS:Panel ID="pnlReview" runat="server" Visible="false">
                <br />
                <%--<CMS:Review ID="review" runat="server" />--%>
            </CMS:Panel>
        </div>
        <div id="threeColumnMainContent">
            <div class="productSummary">
                <table class="defaultTable">
                    <tr>
                        <td colspan="2">
                            <%--  <asp:Menu ID="categoryCrumbs" runat="server" SkinID="breadcrumbs" DataSourceID="xmlDataSource"
                            Orientation="Horizontal" StaticDisplayLevels="1" EnableViewState="false">
                            <DataBindings>
                                <asp:MenuItemBinding DataMember="MenuItem" NavigateUrlField="NavigateUrl" TextField="Text"
                                    ValueField="Value" ToolTipField="ToolTip" />
                            </DataBindings>
                        </asp:Menu>--%>
                            <asp:XmlDataSource ID="xmlDataSource" TransformFile="~/transforms/catalogNavigation.xslt"
                                XPath="MenuItems/MenuItem" runat="server" />
                            <div class="paging">
                            <%--    <div class="pagingLeft">
                                </div>
                                <div class="pagingMid">--%>
                                 <div class="floatLeft title">
                                    <%--<div class="productName">--%>
                                        <h1>
                                            <CMS:Label ID="lblProductName" runat="server" EnableViewState="false" />  </h1>
                                            <div class="titleArrow floatRight">
                                        </div>
                                            &nbsp;<% if (Page.User.IsInRole("Administrator"))
                                                                                                                             {%>
                                            <CMS:HyperLink ID="lblEdit" runat="server" EnableViewState="false" /><%}%>
                                      
                                    </div>
                               <%-- </div>--%>
                                <div class="pagingRight">
                                </div>
                            </div>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <asp:DataList ID="dlImages" runat="server" EnableViewState="false" RepeatColumns="3"
                                RepeatLayout="Table" RepeatDirection="Horizontal" CssClass="productImageList">
                                <ItemTemplate>
                                    <div class="imageBox" style="margin: 10px 10px 10px 10px">
                                        <CMS:HyperLink ID="hlImage" runat="server" EnableViewState="false" CssClass="thickbox"
                                            Target="_blank" NavigateUrl='<%# Eval("Attributes[BigImageUrl]") %>' rel='<%# Eval("Attributes[rel]") %>'
                                            title='<%# Eval("Attributes[title]") %>'>
                 <asp:Image ID="img" runat="server" EnableViewState="false" ImageUrl='<%# Eval("ImageUrl") %>' AlternateText='<%# Eval("Attributes[title]") %>' Height='<%# Eval("Height") %>' Width='<%# Eval("Width") %>' />
                                        </CMS:HyperLink>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                        <td>
                            <CMS:Panel ID="pnlRetailPrice" runat="server" Visible="false" EnableViewState="false">
                                <CMS:Label ID="lblRetialPrice" runat="server" CssClass="retailPriceLabel" />&nbsp;<CMS:Label
                                    ID="lblRetailPriceAmount" runat="server" CssClass="retailPrice" />
                                </h1>
                            </CMS:Panel>
                            <CMS:Label ID="lblOurPrice" runat="server" CssClass="ourPriceLabel" EnableViewState="false" />&nbsp;<CMS:Label
                                ID="lblOurPriceAmount" runat="server" CssClass="ourPrice" EnableViewState="false" />&nbsp;<CMS:Label
                                    ID="lblTaxApplied" Visible="false" runat="server" /><br />
                            <CMS:Panel ID="pnlYouSave" runat="server" Visible="false" EnableViewState="false">
                                <CMS:Label ID="lblYouSave" runat="server" CssClass="label" />&nbsp;<CMS:Label ID="lblYouSaveAmount"
                                    runat="server" CssClass="label" />
                            </CMS:Panel>
                            <%--<asp:Rating ID="ajaxRating" runat="server" SkinID="rating" ReadOnly="true" EnableViewState="false" />--%>
                            <CMS:Label ID="lblShortDescription" runat="server" CssClass="label" EnableViewState="false" />&nbsp;
                            <CMS:Label ID="lblShrtDescp" runat="server" CssClass="label" EnableViewState="false" /><br />
                            <CMS:Attributes ID="productAttributes" runat="server" />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:PlaceHolder ID="phDescriptors" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                            <asp:Panel ID="pnlDownloadsTitle" runat="server" CssClass="accordionHeaderGray">
                                <div class="cpeTitle">
                                    <CMS:Label ID="lblDownloadsTitle" runat="server" />
                                </div>
                                <div class="cpeImage">
                                    <asp:Image ID="imgTogglee" runat="server" />
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="pnlDownloads" runat="server" Width="97%">
                                <br />
                                <asp:DataList ID="dlDownloads" runat="server" RepeatColumns="2" RepeatDirection="horizontal"
                                    RepeatLayout="Table">
                                    <ItemTemplate>
                                        <asp:Image ID="imgIcon" runat="server" SkinID="noImage" />&nbsp;<asp:HyperLink ID="hlDownload"
                                            runat="server" Target="_blank" />
                                    </ItemTemplate>
                                </asp:DataList>
                            </asp:Panel>
                            <asp:CollapsiblePanelExtender ID="cpeFiles" runat="server" TargetControlID="pnlDownloads"
                                ExpandControlID="pnlDownloadsTitle" CollapseControlID="pnlDownloadsTitle" ImageControlID="imgTogglee"
                                ExpandDirection="Vertical" Collapsed="true" SkinID="withImage" />
                        </td>
                    </tr>
                    <tr>
                        <% if (SiteSettings.DisplayRatings)
                           { %>
                        <td colspan="2">
                            <br />
                    <%--        <CMS:Panel ID="pnlReviewsTitle" runat="server" CssClass="accordionHeaderGray" EnableViewState="false">
                                <div class="cpeTitle">
                                    <CMS:Label ID="lblReviewsTitle" runat="server" />
                                </div>
                                <div class="cpeImage">
                                    <asp:Image ID="imgToggle" runat="server" />
                                </div>
                            </CMS:Panel>
                            <CMS:Panel ID="pnlReviews" runat="server" EnableViewState="false">
                                <br />
                                <asp:Repeater ID="rptrReviews" runat="server">
                                    <ItemTemplate>
                                        <CMS:Label ID="lblTitle" runat="server" CssClass="title" Text='<%# Eval("Title") %>' /><br />
                                        <asp:Rating ID="reviewRating" runat="server" SkinID="rating" ReadOnly="true" CurrentRating='<%# Eval("Rating") %>' />
                                        <br />
                                        <br />
                                        <CMS:Label ID="lblBody" runat="server" CssClass="label" Text='<%# Eval("Body") %>' /><br />
                                        <hr />
                                        <br />
                                    </ItemTemplate>
                                </asp:Repeater>
                                <CMS:Label ID="lblNoReviews" runat="server" CssClass="label" Visible="false" />
                            </CMS:Panel>
                            <asp:CollapsiblePanelExtender ID="cpeReviews" runat="server" TargetControlID="pnlReviews"
                                ExpandControlID="pnlReviewsTitle" CollapseControlID="pnlReviewsTitle" ImageControlID="imgToggle"
                                ExpandDirection="Vertical" Collapsed="true" SkinID="withImage" />--%>
                        </td>
                        <%} %>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                            <div class="paging">
                                <div class="pagingLeft">
                                </div>
                                <div class="pagingMid">
                                    <div class="productName">
                                        <%--<CMS:Label ID="lblCrossSells" runat="server" CssClass="label" EnableViewState="false" />--%>
                                    </div>
                                </div>
                                <div class="pagingRight">
                                </div>
                            </div>
                            <br />
                            <%--<CMS:CrossSells ID="crossSells" runat="server" />--%>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
