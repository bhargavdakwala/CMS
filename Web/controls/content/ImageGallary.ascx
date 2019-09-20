<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImageGallary.ascx.cs"
    Inherits="Etech.CMS.Web.controls.content.ImageGallary" %>

    

<%@ Import Namespace="System.Data" %>
<p id="pre" runat="server">
    At Made to Move Physiotherapy Glengarry we have a highly experienced team of Physiotherapists,
    most of whom have completed postgraduate qualifications in Sports Physiotherapy,
    Manipulative Physiotherapy or Women's Health Physiotherapy.
</p>
<asp:Repeater ID="rptParent" runat="server" OnItemDataBound="rptParent_ItemDataBound">
    
    <ItemTemplate>
        <div class="TherapistsBlock">
            <h3>
                <asp:Label ID="lblCategoryTitle" CssClass="green" runat="server" Text='<%#Eval("ImgCategoryTitle") %>'></asp:Label></h3>
            <asp:Label ID="lblImgCategoryID" CssClass="green" runat="server" Text='<%#Eval("ImgCategoryID") %>'
                Visible="false"></asp:Label>
                <div class="floatLeft" style="width:100%;">
            <asp:Repeater ID="rptChild" runat="server" OnItemCommand="OnMyCommand2" >
                <ItemTemplate>
                    <div class="floatLeft Therapists">
                       <asp:Label ID="lblUrlTitle" runat="server" Text='<%# Eval("URLTitle") %>' Visible="false"></asp:Label>
                       
                       
                        <%--<a id="imgUrl" href='<%# Eval("URLTitle") + ".aspx" %> ' runat="server" ><img src='<%#Eval("ImageFile") %>' alt="" runat="server" id="img" /></a>--%>
                        <%--<asp:ImageButton ID="imgUrl" runat="server"  PostBackUrl='<%# Comment(Eval("URLTitle")) %>' />--%>
                        <asp:HyperLink id="imgUrl" runat="server" NavigateUrl='<%#Eval("URLTitle") + ".aspx" %> '  ImageUrl='<%#Eval("ImageFile") %>'></asp:HyperLink><br />
                        
                        <%--<asp:ImageButton ID="imgUrl"   runat="server"  PostBackUrl='<%# Eval("URLTitle") + ".aspx" %>' ImageUrl='<%#Eval("ImageFile") %>' CommandArgument='<%#Eval("ImageID") %>' CommandName="Detail" /><br />--%>
                        <asp:Label ID="lblTherapistsName" runat="server" CssClass="green" Text='<%#Eval("TherapistsName") %>'></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            </div>
        </div>
    </ItemTemplate>
    
</asp:Repeater>



