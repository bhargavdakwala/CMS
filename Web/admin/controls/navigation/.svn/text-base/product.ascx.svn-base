<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="product.ascx.cs" Inherits="Etech.CMS.Web.admin.controls.navigation.product" %>
<asp:Menu ID="productMenu" runat="server" Orientation="Horizontal" DataSourceID="productDataSource"
    StaticDisplayLevels="2" StaticSubMenuIndent="0px" CssClass="navigationTable">
    
                    <StaticItemTemplate>
                    
                    
                    
                            <span class="floatLeft left"></span>
                            <span class="floatLeft right"><%# DataBinder.Eval(Container.DataItem, "Text") %></span>
                        
                    
                        <%--<div id="left">
                        </div>
                        <div id="mid">
                            <span id="text">
                                </span></div>
                        <div id="right">
                        </div>--%>
                    </StaticItemTemplate>
                    
    
    <StaticSelectedStyle CssClass="current" />
    <%--<StaticMenuItemStyle CssClass="menuItem" />
    <StaticHoverStyle CssClass="" />--%>
</asp:Menu>
<asp:SiteMapDataSource ID="productDataSource" runat="server" SiteMapProvider="ProductXmlSiteMapProvider" />
