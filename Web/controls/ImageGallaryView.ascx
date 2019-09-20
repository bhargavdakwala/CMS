<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImageGallaryView.ascx.cs"
    Inherits="Etech.CMS.Web.controls.ImageGallaryView" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
                    <asp:ListView ID="lvPhotoViewer" runat="server" GroupItemCount="1">
                        <LayoutTemplate>
                            <table id="groupPlaceholderContainer" runat="server" class="galleryView">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td id="Td4" align="center" colspan="3">
                                    <asp:Image runat="server" CssClass="viewImg" ID="imPhoto" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "ImageFile")%>' />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td ><a href="#" id="hrefPrevious" onserverclick="ShowPrevious" runat="server">
                                <img src="../App_Themes/SiteTheme/images/arrow-left.jpg" />
                                </a> 
                                </td>
                                <td>
                                    <asp:Label ID="lblCamption" runat="server" Text='<%# Eval("Caption") %>' class="caption" ></asp:Label>
                                </td>
                                <td><a href="#" id="hrefNext" onserverclick="ShowNext" runat="server">
                                 <img src="../App_Themes/SiteTheme/images/arrow-right.jpg" />   </a></td>
                            </tr>
                        </ItemTemplate>
                        <GroupTemplate>
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server">
                                </td>
                            </tr>
                        </GroupTemplate>
                    </asp:ListView>
        
</ContentTemplate>
</asp:UpdatePanel>        

