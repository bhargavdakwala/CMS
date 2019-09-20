<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ServicesList.ascx.cs"
    Inherits="Etech.CMS.Web.controls.content.ServicesList" %>
    <div class="mainContentinner">
    <h3>Services</h3>


    <asp:Repeater ID="rptServiceList" runat="server" >
        <ItemTemplate>
            <p>
                <asp:Label ID="lblServiceTitle" runat="server" Text='<%#  DataBinder.Eval(Container.DataItem, "MenuTitle") %> '></asp:Label>
                <%#  DataBinder.Eval(Container.DataItem, "Html")%>
            </p>
            
        </ItemTemplate>
    </asp:Repeater>
     <a href="#" name="Back" id="Back" class="floatRight backtoTop"> BACK TO TOP</a>

    </div>