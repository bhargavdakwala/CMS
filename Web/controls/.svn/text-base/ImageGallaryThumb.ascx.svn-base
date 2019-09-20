<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImageGallaryThumb.ascx.cs"
    Inherits="Etech.CMS.Web.controls.ImageGallaryThumb" %>
    <h1>GALLERY</h1>
        <asp:ListView ID="lvPhotos" runat="server" DataKeyNames="ImageID" GroupItemCount="4">
            <LayoutTemplate>
                <table id="groupPlaceholderContainer" class="gallery" runat="server" border="0" cellpadding="0" cellspacing="0">
                    <tr id="groupPlaceholder" runat="server">
                    </tr>
                </table>
            </LayoutTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server">
                    </td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
              
                <td id="Td1" runat="server" align="center">
              
                    <a id="A1" href='<%# "ImageGallaryView.aspx?ImageID=" + Eval("ImageID") %>'>
                        <asp:Image runat="server" ID="imPhoto" ImageUrl='<%#Eval("ThumbImageFile") %>'/></a>
                    <%--<asp:LinkButton ID="LinkButton1" CommandName="AddToList"  CommandArgument='<%#Eval("ImageID" %>' 
                    runat="server">Link</asp:LinkButton>
    --%>
                      
                   <%--<asp:HyperLink ID="HyperLinkId" runat="server" NavigateUrl='<%# "~/ImageGallaryView.aspx?ImageID=" + Eval("ImageID") %>' ImageUrl='<%#Eval("ThumbImageFile") %>' >
                    </asp:HyperLink>--%>
                    
                </td>
            </ItemTemplate>
            
        </asp:ListView>

    
        <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lvPhotos" PageSize="12"
            OnPreRender="DataPager1_PreRender">
            <Fields>
                <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="<< " NextPageText=" >>" />
            </Fields>
        </asp:DataPager>
        
        
            
        


