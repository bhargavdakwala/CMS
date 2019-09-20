<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="reviews.ascx.cs" Inherits="Etech.CMS.Web.admin.controls.product.reviews" %>


<CMS:Panel ID="pnlProductReviews" runat="server">
  <CMS:Panel ID="pnlGrid" runat="server">
    <CMS:DataGrid ID="dgReviews" runat="server" AutoGenerateColumns="false" SkinID="adminDataGrid">
      <Columns>
        <asp:TemplateColumn>
          <ItemTemplate>
            <CMS:LinkButton ID="lbEdit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("ReviewId") %>' OnCommand="lbEdit_Click" />
          </ItemTemplate>
        </asp:TemplateColumn>  
        <asp:TemplateColumn>
          <ItemTemplate>
            <CMS:Label ID="lblApproved" runat="server" Text='<%# Eval("IsApproved") %>' />
          </ItemTemplate>
        </asp:TemplateColumn>
        <asp:BoundColumn DataField="Title" />
        <asp:TemplateColumn>
          <ItemTemplate>
            <CMS:Label ID="lblBody" runat="server" Text='<%# GetBodySample(Eval("Body").ToString()) %>' />
          </ItemTemplate>
        </asp:TemplateColumn>
        <asp:BoundColumn DataField="CreatedBy" />
        <asp:BoundColumn DataField="CreatedOn" />
        <asp:TemplateColumn>
          <ItemTemplate>
            <CMS:LinkButton ID="lbDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("ReviewId") %>' OnCommand="lbDelete_Click" />
          </ItemTemplate>
        </asp:TemplateColumn>  
      </Columns>
    </CMS:DataGrid>
  </CMS:Panel><br />
  <CMS:Panel ID="pnlReview" runat="server" Visible="false">
    <CMS:Label ID="lblReviewId" runat="server" Visible="false" />
    <CMS:Label ID="lblTitle" runat="server" CssClass="label" /><br />
    <asp:TextBox ID="txtTitle" runat="server" CssClass="textbox" Enabled="false" /><br /><br />
    <CMS:Label ID="lblReview" runat="server" CssClass="label" /><br />
    <div id="txtReview" runat="server" style="overflow:auto;width:50%;height:105px;" />
    <CMS:Label ID="lblRating" runat="server" CssClass="label" /><br />
    <CMS:Label ID="lblRatingText" runat="server" CssClass="label" /><br /><br />
    <CMS:Label ID="lblIsApproved" runat="server" CssClass="label" /><br />
    <CMS:CheckBox ID="chkIsApproved" runat="server" /><br /><br />
    <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click" />
  </CMS:Panel>
</CMS:Panel>
