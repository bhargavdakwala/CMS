<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PlatinumSponsorsGallery.ascx.cs" 
Inherits="Etech.CMS.Web.controls.content.PlatinumSponsorsGallery" %>

    <div id="slides">
        <div class="slides_container">
            <asp:Repeater ID="rptPlatinumSponsorsGallery" runat="server" >

                <ItemTemplate>
                    
                   <%-- <asp:ImageButton ID="lnkURL" runat="server" AlternateText=""  width="189px" height="158px" ImageUrl='<%# ImagePath(Eval("ImageFile")) %>' CommandArgument='<%# Eval("keywords") %>' CommandName="URLTitle" />--%>
                    <%--<asp:ImageButton ID="lnkURL" runat="server" CommandName="URL"  CommandArgument='<%# Eval("keywords") %>' --%>
                    
                    <a href='<%# Eval("keywords") %>' id="title" target="_blank" runat="server" >
                    <asp:Image ID="imgMenuImage" runat="server" width="189px" height="158px" ImageUrl='<%# ImagePath(Eval("ImageFile")) %>'  AlternateText="img" />
                    </a>
                </ItemTemplate>
            
            </asp:Repeater> 
            
            
        </div>
        <a href="#" class="prev">
            <img src="../../images/sponsors-arrow-rightside.png" width="26" height="29" alt="Arrow Prev" /></a>
        <a href="#" class="next">
            <img src="../../images/sponsors-arrow-leftside.png" width="26" height="29" alt="Arrow Next" /></a>
    </div>

