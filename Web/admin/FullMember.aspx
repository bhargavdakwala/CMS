<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeBehind="FullMember.aspx.cs" Inherits="Etech.CMS.Web.admin.FullMember" %>

<%@ MasterType VirtualPath="~/admin/admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="Javascript" type="text/Javascript">
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;

        }

    </script>
    <CMS:Panel ID="pnlEditMember" runat="server" SkinID="pnlBorder" Width="695px">
        <div class="panelWrap">
            <table cellspacing="0" cellpadding="5" border="0" width="100%">
                <tr>
                    <td colspan="6" align="center" valign="middle">
                        <CMS:Label ID="lblId" runat="server" Visible="False" />
                    </td>
                </tr>
                <tr>
                    <td align="center" valign="middle">
                        <asp:Label ID="lblName" runat="server" CssClass="label">Name:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Please enter name."
                            SetFocusOnError="true" Display="None" ValidationGroup="vgFullMember"  ControlToValidate="txtName"></asp:RequiredFieldValidator>
                    </td>
                    <td align="center" valign="middle">
                        <asp:Label ID="lblCompany" runat="server" CssClass="label">Company:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCompany" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvCompany" runat="server" ErrorMessage="Please enter company."
                            SetFocusOnError="true" ControlToValidate="txtCompany"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td align="center" valign="middle">
                        <asp:Label ID="lblPhone" runat="server" CssClass="label">Phone:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                    </td>
                    <td>
                    </td>
                    <td align="center" valign="middle">
                        <asp:Label ID="lblMobile" runat="server" CssClass="label">Mobile:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                <br />
                <tr>
                    <td align="center" valign="middle">
                        <asp:Label ID="lblEmail" runat="server" CssClass="label">Email:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvEmail" Display="None" runat="server" ErrorMessage="Please enter email."
                            ValidationGroup="vgFullMember" SetFocusOnError="true" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regexEmail" Display="None" runat="server" ErrorMessage="Please enter valid email."
                            SetFocusOnError="true" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                    <td align="center" valign="middle">
                        <asp:Label ID="lblWeb" runat="server" CssClass="label">Web:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtWeb" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator Display="None" ID="RegularExpressionValidator1" ValidationGroup="vgFullMember"
                            runat="server" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"
                            ControlToValidate="txtWeb" ErrorMessage="Please Enter valid URL!"></asp:RegularExpressionValidator>
                 
                    </td>
                     <td></td>
                </tr>
            </table>
            <div>
                <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click"
                    ValidationGroup="vgFullMember" />
                <CMS:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="button"
                    OnClick="btnCancel_Click" />
                            
                    <asp:ValidationSummary ID="vgsFullMember" ValidationGroup="vgFullMember" runat="server"
                            DisplayMode="List" ShowSummary="false" ShowMessageBox="true" />
            </div>
        </div>
    </CMS:Panel>
    <br />
    <CMS:Panel ID="pnlCurrentFullMember" runat="server" SkinID="pnlBorder">
        <div class="panelWrap">
            <div class="gridBox">
                <div class="gridWrap">
                    <div align="right">
                        <CMS:LinkButton ID="lnkbtnAddMember" runat="server" CausesValidation="false" Font-Bold="true"
                            OnClick="lnkbtnAddMember_Click" Font-Underline="true"></CMS:LinkButton><br />
                    </div>
                    <CMS:DataGrid ID="dgBlogCategories" runat="server" AutoGenerateColumns="false" SkinID="adminDataGridNoPage"
                        OnItemCommand="dgBlogCategories_OnItemCommand" Width="655px" AllowPaging="true"
                        PageSize="10" OnPageIndexChanged="dgBlogCategories_PageIndexChanged">
                        <PagerStyle Mode="NumericPages" Position="Bottom" />
                        <Columns>
                            <asp:BoundColumn DataField="Name" HeaderText="Name" HeaderStyle-Width="150px" ItemStyle-Wrap="true">
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="Company" HeaderText="Company" HeaderStyle-Width="255px"
                                ItemStyle-Wrap="true" />
                            <asp:BoundColumn DataField="Email" HeaderText="Email" HeaderStyle-Width="255px" ItemStyle-Wrap="true" />
                            <asp:TemplateColumn HeaderText="Edit">
                                <ItemTemplate>
                                    <CMS:LinkButton runat="server" ID="lblEdit" CausesValidation="false" CommandName="Edit"
                                        CommandArgument='<%# Eval("Id") %>' SkinID="Edit"></CMS:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Delete">
                                <ItemTemplate>
                                    <CMS:LinkButton runat="server" ID="lbDelete" CausesValidation="false" CommandName="Delete"
                                        CommandArgument='<%# Eval("Id") %>' SkinID="delete" OnClientClick="return confirm('Do you want to Delete this record?');"></CMS:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                    </CMS:DataGrid>
                </div>
            </div>
        </div>
    </CMS:Panel>
</asp:Content>
