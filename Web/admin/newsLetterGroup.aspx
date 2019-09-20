<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeBehind="newsLetterGroup.aspx.cs" Inherits="Etech.CMS.Web.admin.newsLetterGroup" %>
<%@ MasterType VirtualPath="~/admin/admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="mainContentRegion">
        <CMS:Panel ID="pnlNewsLetterEditGroup" runat="server" SkinID="pnlBorder" Width="695px">
            <div class="panelWrap">
                <table>
                    <tr>
                        <CMS:Label ID="lblDuplicateMessage" runat="server" Visible="false" ForeColor="Red"
                            Font-Size="Small" />
                        <input id="UserID" type="hidden" name="UserID" runat="server">
                        <input id="UserName" style="z-index: 101; left: 176px; width: 80px; position: absolute;
                            top: 8px; height: 15px" type="hidden" size="8" runat="server" name="UserName">
                    </tr>
                    <tr>
                        <td nowrap="nowrap" colspan="3">
                            <CMS:Label ID="lblGroupName" runat="server"></CMS:Label>
                            <CMS:Label ID="lblNewsLetterGroupId" runat="server" Visible="False" />
                            &nbsp;
                            <CMS:TextBox ID="txtGroupName" runat="server" MaxLength="50" Width="200px"></CMS:TextBox>
                            <CMS:RequiredFieldValidator ID="rfvGroupName" runat="server" ControlToValidate="txtGroupName"
                                ErrorMessage="Group Name is required." SetFocusOnError="true" Display="Dynamic" ValidationGroup="vgNewsLetterGroup">
                            </CMS:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="refGroupName" runat="server" ControlToValidate="txtGroupName"
                                ErrorMessage="Please enter valid Group Name." SetFocusOnError="true" Display="Dynamic"
                                ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&!.\-/]+$" ValidationGroup="vgNewsLetterGroup"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                 <%--   <tr>
                        <td>
                            <CMS:Label ID="lblAllUsers" runat="server"></CMS:Label>
                        </td>
                        <td>
                        </td>
                        <td>
                            <CMS:Label ID="lblSelectedUsers" runat="server"></CMS:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <tr>
                                <td rowspan="5">
                                    <asp:ListBox ID="lstNewsletterUserAll" Width="265px" Height="55px" SelectionMode="Multiple"
                                        runat="server"></asp:ListBox>
                                </td>
                                <td align="center">
                                    &nbsp;&nbsp;
                                    <CMS:Button ID="btnAddUser" runat="server" OnClick="btnAdd_Click" CausesValidation="false" />
                                    &nbsp;&nbsp;
                                </td>
                                <td class="Normal Inside" valign="top" rowspan="5">
                                    <asp:ListBox ID="lstNewsletterUserSelected" Width="265px" Height="55px" SelectionMode="Multiple"
                                        runat="server"></asp:ListBox><br />
                                        <asp:RequiredFieldValidator ID="rfvlstSelected" runat="server" ControlToValidate="lstNewsletterUserSelected"
                                        ErrorMessage="Please Select Users" ValidationGroup="vgNewsLetterGroup" SetFocusOnError="true"
                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                    
                                </td>
                                
                            </tr>
                           
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <CMS:Button ID="btnRemoveUser" runat="server" OnClick="btnRemove_Click" CausesValidation="false" />
                        </td>
                    </tr>--%>
                </table>
                <table>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <CMS:Button ID="btnSave" runat="server" CssClass="button" ValidationGroup="vgNewsLetterGroup"
                                OnClick="btnSave_Click" />
                            <CMS:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="button"
                                OnClick="btnCancel_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </CMS:Panel>
        <CMS:Panel ID="pnlNewsletterGroup" SkinID="pnlBorder" runat="server">
            <div class="panelWrap">
                <div class="gridBox">
                    <div class="gridWrap">
                        <div style="padding: 0 10px 10px 0;" class="floatRight">
                            <CMS:LinkButton ID="lnkAddNewGroup" OnClick="lnkAddNewGroup_Click" runat="server"
                                Font-Bold="true" Font-Underline="true"></CMS:LinkButton>
                        </div>
                        <CMS:DataGrid ID="dgBlogCategories" runat="server" AutoGenerateColumns="false" SkinID="adminDataGridNoPage"
                            OnItemCommand="dgBlogCategories_OnItemCommand" AllowPaging="true" OnPageIndexChanged="dgBlogCategories_PageIndexChanged"
                            PageSize="10" Width="655px">
                            <Columns>
                                <asp:BoundColumn DataField="GroupName" HeaderText="Group Name" ItemStyle-Wrap="true"
                                    HeaderStyle-Width="430px" />
                                <asp:TemplateColumn HeaderText="Edit">
                                    <ItemTemplate>
                                        <CMS:LinkButton runat="server" ID="lblEdit" CommandName="Edit" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "GroupId")%>'
                                            SkinID="Edit" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Delete">
                                    <ItemTemplate>
                                        <CMS:LinkButton runat="server" ID="lbDelete" CommandName="Delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "GroupId")%>'
                                            SkinID="delete" OnClientClick="return confirm('Do you want to Delete this record?');" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderStyle-Width="10px">
                                    <ItemTemplate>
                                        <CMS:Label ID="lblGroupID" runat="server" Visible="false"></CMS:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                        </CMS:DataGrid>
                    </div>
                </div>
            </div>
        </CMS:Panel>
    </div>
</asp:Content>

