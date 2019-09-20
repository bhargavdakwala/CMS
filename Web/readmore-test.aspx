<%@ Page Title="" Language="C#" MasterPageFile="~/Inner.Master" AutoEventWireup="true"
    CodeBehind="readmore-test.aspx.cs" Inherits="Etech.CMS.Web.readmore_test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <asp:menu id="NavigationMenu"
        staticdisplaylevels="2"
        staticsubmenuindent="10" 
        orientation="Vertical"
        runat="server">
        
        <staticmenuitemstyle backcolor="LightSteelBlue"
          horizontalpadding="5"
          verticalpadding="2"
          font-names="Arial"   
          forecolor="Black"/>
        <statichoverstyle backcolor="LightSkyBlue"
          font-names="Arial"
          forecolor="Red"/>
        <dynamicmenuitemstyle backcolor="Black"
          horizontalpadding="10"
          verticalpadding="4"
          itemspacing="2"
          font-names="Arial"
          forecolor="Silver"/>
        <dynamichoverstyle backcolor="LightSkyBlue"
          font-names="Arial"
          forecolor="Red"/>
      
        <items>
          <asp:menuitem text="Home"
            tooltip="Home">
            <asp:menuitem text="Music"
              tooltip="Music">
              <asp:menuitem text="Classical"
                tooltip="Classical"/>
              <asp:menuitem text="Rock"
                tooltip="Rock"/>
              <asp:menuitem text="Jazz"
                tooltip="Jazz"/>
            </asp:menuitem>
            <asp:menuitem text="Movies"
              tooltip="Movies">
              <asp:menuitem text="Action"
                tooltip="Action"/>
              <asp:menuitem text="Drama"
                tooltip="Drama"/>
              <asp:menuitem text="Musical"
                tooltip="Musical"/>
            </asp:menuitem>
          </asp:menuitem>
        </items>
      
      </asp:menu>
</asp:Content>
