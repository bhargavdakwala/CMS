<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeBehind="ProjectEdit.aspx.cs" Inherits="Etech.CMS.Web.admin.ProjectEdit" %>

<%@ MasterType VirtualPath="~/admin/admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="javascript" type="text/javascript">
        function ValidateFCKAText(source, args) {
            var fckText = FCKeditorAPI.GetInstance('<%=txtDescriptor.ClientID %>');
            args.IsValid = fckText.GetXHTML(true) != "";
        }
        
      
    </script>
    <div id="mainContentRegion">
        <div id="admin_centercontent">
            <CMS:Panel ID="pnlEditProject" runat="server" SkinID="pnlBorder" Width="695px">
                <div class="panelWrap">
                    <table>
                        <tr align="left">
                            <td>
                                <CMS:Label ID="lblBlogTitle" runat="server" Visible="True" />
                                <CMS:Label ID="lblBlogId" runat="server" Visible="False" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:TextBox ID="txtBlogTitle" runat="server" MaxLength="100" Width="200px" CssClass="longtextbox" /><br />
                                <asp:RequiredFieldValidator ID="rfvBlogTile" runat="server" ErrorMessage="Title is Required."
                                    Display="Dynamic" ControlToValidate="txtBlogTitle" ValidationGroup="vgblogs"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="rfvBlogTitle" runat="server" ControlToValidate="txtBlogTitle"
                                    ErrorMessage="Please enter valid Title." SetFocusOnError="true" Display="Dynamic"
                                    ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&!.\-/]+$" ValidationGroup="vgblogs"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td colspan="2">
                                <br />
                                <CMS:Label ID="lblDate" runat="server" Visible="True" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <CMS:TextBox ID="txtDate" runat="server"></CMS:TextBox>
                                <asp:CalendarExtender ID="CalendarExtender1" Animated="true" FirstDayOfWeek="Default"
                                    TargetControlID="txtDate" Format="dd/MM/yyyy" runat="server">
                                </asp:CalendarExtender>
                                <br />
                                <asp:RequiredFieldValidator ID="rfvDate" runat="server" ErrorMessage="Date is Required."
                                    Display="Dynamic" ControlToValidate="txtDate" ValidationGroup="vgblogs"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regDate" runat="server" ControlToValidate="txtDate"
                                    ErrorMessage="Please enter valid Date." SetFocusOnError="true" Display="Dynamic"
                                    ValidationExpression="^(((((0[1-9])|(1\d)|(2[0-8]))\/((0[1-9])|(1[0-2])))|((31\/((0[13578])|(1[02])))|((29|30)\/((0[1,3-9])|(1[0-2])))))\/((20[0-9][0-9])|(19[0-9][0-9])))|((29\/02\/(19|20)(([02468][048])|([13579][26]))))$"
                                    ValidationGroup="vgblogs"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr align="left">
                            <td colspan="2">
                                <br />
                                <CMS:Label ID="lblBlogDescriptions" runat="server" Visible="True" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <FCKeditorV2:FCKeditor ID="txtDescriptor" BasePath="~/FCKeditor/" runat="server"
                                    Height="300px" Width="660px" UseBROnCarriageReturn="true" ToolbarStartExpanded="false" />
                                <br />
                                <asp:CustomValidator ID="cvcfckAText" runat="server" ErrorMessage="Description is required"
                                    Display="None" ControlToValidate="txtDescriptor" ClientValidationFunction="ValidateFCKAText"
                                    ValidateEmptyText="True" />
                                <%--<asp:RequiredFieldValidator ID="rfvBlogDescriptions" runat="server" ErrorMessage="Descriptions is blank"
                                            Display="None" ControlToValidate="txtDescriptor"></asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>
                    </table>
                    <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click"
                        ValidationGroup="vgblogs" />
                    <CMS:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="button"
                        OnClick="btnCancel_Click" />
                </div>
            </CMS:Panel>
            <%--<CMS:Button ID="btnAddBlog" CssClass="button" runat="server" OnClick="btnAddBlog_Click" />--%>
            <CMS:Panel ID="pnlCurrentProjct" runat="server" SkinID="pnlBorder">
                <div class="panelWrap">
                    <div class="gridBox">
                        <div class="gridWrap">
                            <div style="padding: 0 10px 10px 0;" class="floatRight">
                                <CMS:LinkButton Font-Underline="true" Font-Bold="true" ID="lnkProject" OnClick="lnkProject_Click"
                                    runat="server">        
                                </CMS:LinkButton>
                            </div>
                            <CMS:DataGrid ID="dgBlogCategories" runat="server" AutoGenerateColumns="false" SkinID="adminDataGridNoPage"
                                OnItemCommand="dgBlogCategories_OnItemCommand" Width="655px" AllowPaging="true"
                                PageSize="10" OnPageIndexChanged="dgBlogCategories_PageIndexChanged">
                                <PagerStyle Mode="NumericPages" Position="Bottom" />
                                <Columns>
                                    <asp:BoundColumn DataField="ProjectTitle" HeaderText="Title" HeaderStyle-Width="150px"
                                        ItemStyle-Wrap="true" ItemStyle-Width="70%"></asp:BoundColumn>
                                    <asp:TemplateColumn HeaderText="Edit">
                                        <ItemTemplate>
                                            <CMS:LinkButton runat="server" ID="lblEdit" CausesValidation="false" CommandName="Edit"
                                                CommandArgument='<%# Eval("ProjectId") %>' SkinID="Edit"></CMS:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="Delete">
                                        <ItemTemplate>
                                            <CMS:LinkButton runat="server" ID="lbDelete" CausesValidation="false" CommandName="Delete"
                                                CommandArgument='<%# Eval("ProjectId") %>' SkinID="delete" OnClientClick="return confirm('Do you want to Delete this record?');"></CMS:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                </Columns>
                            </CMS:DataGrid>
                        </div>
                    </div>
                </div>
            </CMS:Panel>
        </div>
    </div>
</asp:Content>
