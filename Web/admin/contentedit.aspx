<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeBehind="contentedit.aspx.cs" Inherits="Etech.CMS.Web.admin.contentedit" Title="Untitled Page" ValidateRequest="false"%>
<%@ MasterType VirtualPath="~/admin/admin.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="mainContentRegion">
  <div id="admin_centercontent">
   <%-- <div class="sectionHeader"><CMS:Label ID="lblContentManagement" runat="server" /></div><br />--%>
    <table id="pageTable">
      <tr>
        <td valign="top">
          <CMS:Panel ID="pnlCurrentPages" runat="server" Height="50%" SkinID="pnlBorder">
            <asp:TreeView ID="tvPages" runat="server" DataSourceID="xmlDataSource" ShowLines="true" OnSelectedNodeChanged="Page_Selected" ExpandDepth="FullyExpand" NodeStyle-ImageUrl="~/App_Themes/CMS/images/icons/page.gif">
              <DataBindings>
                <asp:TreeNodeBinding DataMember="MenuItem" NavigateUrlField="NavigateUrl" TextField="Text" ValueField="Value" ToolTipField="ToolTip" />
              </DataBindings>
            </asp:TreeView>
            <asp:XmlDataSource ID="xmlDataSource" TransformFile="~/transforms/pageMenu.xslt" XPath="MenuItems/MenuItem" runat="server" />
          </CMS:Panel>
         </td>
         <td valign="top">
          <CMS:Panel ID="pnlChildPages" runat="server" Height="50%" SkinID="pnlBorder">
            <CMS:DataGrid ID="dgChildren" runat="server" AutoGenerateColumns="false" SkinID="adminDataGridNoPage">
              <Columns>
                <asp:TemplateColumn>
                    <ItemTemplate>
                      <asp:ImageButton ID="lbUp" runat="server" CausesValidation="false" CommandName="Up" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PageId") %>' OnClick="Items_ItemReorder" SkinID="up" /> 
                      <asp:ImageButton ID="lbDown" runat="server" CausesValidation="false" CommandName="Down" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PageId") %>' OnClick="Items_ItemReorder" SkinID="down" />
                    </ItemTemplate>
                  </asp:TemplateColumn>
	                <asp:BoundColumn DataField="Title" />
                  <asp:BoundColumn DataField="SortOrder" />              
              </Columns>
            </CMS:DataGrid>
          </CMS:Panel>        
        </td>
       </tr>
       <tr>
        <td valign="top" colspan="2">
          <CMS:Panel ID="pnlEditPage" runat="server" SkinID="pnlBorder">
            <table style="width:100%">
            <tr>
              <td width="50%">
                <CMS:Label ID="lblPageId" runat="server" Visible="false" />
                <CMS:Label ID="lblParentPage" runat="server" CssClass="label" /><br />
                <asp:DropDownList ID="ddlParentPage" runat="server" CssClass="fwdropdownlist" />&nbsp;<CMS:HelpLink ID="helpParentPage" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
              </td>
              <td width="50%">
                <CMS:Label ID="lblTitle" runat="server" CssClass="label" /><br />
                <asp:TextBox ID="txtTitle" runat="server" CssClass="longtextbox" />&nbsp;<CMS:HelpLink ID="helpTitle" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
              </td>
             </tr>
             <tr>
             <td>
                <CMS:Label ID="lblBanner" runat="server" CssClass="label" /><br />
                <asp:TextBox ID="txtBanner" runat="server" CssClass="longtextbox" />&nbsp;<CMS:HelpLink ID="helpBanner" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
              </td>
              <td>
                <CMS:Label ID="lblMenuTitle" runat="server" CssClass="label" /><br />
                <asp:TextBox ID="txtMenuTitle" runat="server" CssClass="textbox" />&nbsp;<CMS:HelpLink ID="helpMenuTitle" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
              </td>
              
            </tr>
            <tr>
                <td>
                    <CMS:Label ID="lblPageRedirect" runat="server" CssClass="label" /><br />
                    <asp:DropDownList ID="ddlPageRedirect" runat="server" CssClass="fwdropdownlist" />&nbsp;<CMS:HelpLink ID="helpPageRedirect" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
                </td>
                <td>
                    <CMS:Label ID="lblPageTemplate" runat="server" CssClass="label" /><br />
                    <asp:DropDownList ID="ddlPageTemplate" runat="server" CssClass="fwdropdownlist" />&nbsp;<CMS:HelpLink ID="helpPageTemplate" runat="server" NavigateUrl="javascript:void(0);" /><br /><br />
                </td>
            </tr>
            <tr>
                <td>
                    <div class="verticalalign">
                    <CMS:Label ID="lblKeywords" runat="server" CssClass="label" />&nbsp;<CMS:HelpLink ID="helpKeywords" runat="server" NavigateUrl="javascript:void(0);" /><br />
                    </div>
                    <asp:TextBox ID="txtKeywords" runat="server" CssClass="multilinetextbox" MaxLength="250" TextMode="MultiLine" /><br /><br />
                </td>
                <td>
                    <div class="verticalalign">
                    <CMS:Label ID="lblDescription" runat="server" CssClass="label" />&nbsp;<CMS:HelpLink ID="helpDescription" runat="server" NavigateUrl="javascript:void(0);" /><br />
                    </div>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="multilinetextbox" MaxLength="250" TextMode="MultiLine" /><br /><br />
                </td>
              </tr>
            </table>
            <CMS:Panel ID="pnlRegions" runat="server" Visible="false">
              <CMS:DataGrid ID="dgRegions" runat="server" AutoGenerateColumns="false" SkinID="adminDataGridNoPage">
                <Columns>
<%--                  <asp:TemplateColumn>
                    <ItemTemplate>
                      <asp:ImageButton ID="lbRegionUp" runat="server" CausesValidation="false" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "RegionId") %>' OnClick="Regions_ItemReorder" SkinID="up" /> 
                      <asp:ImageButton ID="lbRegionDown" runat="server" CausesValidation="false" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "RegionId") %>' OnClick="Regions_ItemReorder" SkinID="down" />
                    </ItemTemplate>
                  </asp:TemplateColumn>--%>
                  <asp:TemplateColumn>
                    <ItemTemplate>
                      <CMS:HyperLink ID="hlEditRegion" runat="server" SkinId="submodal-640-500" />
                    </ItemTemplate>
                  </asp:TemplateColumn>
                  <asp:TemplateColumn>
                    <ItemTemplate>
                      <%# Eval("TemplateRegion.Name") %>  
                    </ItemTemplate>
                  </asp:TemplateColumn>
                  <asp:BoundColumn DataField="Title" />
                  <asp:BoundColumn DataField="SortOrder" />
                  <asp:TemplateColumn>
                    <ItemTemplate>
                      <CMS:HyperLink ID="hlEdit" runat="server" SkinId="submodal-640-500" />
                    </ItemTemplate>
                  </asp:TemplateColumn>
                  <asp:TemplateColumn>
                    <ItemTemplate>
                      <CMS:LinkButton ID="lbDelete" runat="server" CommandArgument='<%# Eval("RegionId") %>' OnCommand="lbDelete_Click" />
                    </ItemTemplate>
                  </asp:TemplateColumn>
                </Columns>
              </CMS:DataGrid>
              <br />
              <br />
              <CMS:HyperLink ID="hlAddRegion" runat="server" SkinId="submodal-640-500" />              
            </CMS:Panel>
            <br />
            <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click"/>&nbsp;&nbsp;<CMS:Button ID="btnReset" runat="server" CssClass="button" OnClick="btnReset_Click" />&nbsp;&nbsp;&nbsp;&nbsp;<CMS:Button ID="btnDelete" runat="server" CssClass="button" Visible="false" OnClick="btnDelete_Click" />
          </CMS:Panel>        
        </td>
      </tr>    
    </table>
  </div>
</div>
</asp:Content>
