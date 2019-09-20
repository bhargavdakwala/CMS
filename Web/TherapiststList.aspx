<%@ Page Title="" Language="C#" MasterPageFile="~/Therapists.Master" AutoEventWireup="true"
    CodeBehind="TherapiststList.aspx.cs" Inherits="Etech.CMS.Web.TherapiststList" %>

<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="MainContent">
        <div class="contentGroup">
            <div class="floatLeft header_title_img" runat="server" id="divPageTitleImage">
                <img id="imgPageTitleImage" src="" alt="" runat="server" />
            </div>
            <h1 id="h1BreadCums" runat="server">
                <span id="Span1" class="floatRight breadCrumbs" runat="server"></span>
            </h1>
        </div>
        <div class="contentGroup">
            <asp:Repeater ID="rptDetail" runat="server">
                <ItemTemplate>
                    <div class="floatLeft Therapists_photo">
                        <asp:Image ID="imgDetail" runat="server" ImageUrl='<%#Eval("ImageFile") %>' /><br />
                        <%--<asp:ImageButton ID="imgDetail" runat="server" ImageUrl='<%#Eval("ImageFile") %>' /><br />--%>
                        <asp:Label ID="lblTherapistsName" CssClass="green" runat="server" Text='<%#Eval("TherapistsName") %> '></asp:Label>
                    </div>
                    <div class="floatRight Therapists_text">
                        <%#Eval("BlogDescription")%>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
