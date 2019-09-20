<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InnerMailingList.ascx.cs"
    Inherits="Etech.CMS.Web.controls.content.InnerMailingList" %>
<div class="mainContentinner">
    <h3>
        Fill in the form below to join our AHSCA WA Mailing List</h3>
    <div class="floatLeft">
        <table width="100%" cellpadding="0" cellspacing="5px;">
            <tr>
                <td align="left" valign="top">
                    <asp:TextBox ID="txtname" runat="server" Text="Name" class="mailingList" onfocus="javascript:if(this.value=='Name')this.value='';"
                        MaxLength="50" onblur="javascript:if(this.value=='')this.value='Name';"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtname"
                        CssClass="ErrorStar" Display="Dynamic" InitialValue="Name" ToolTip="Please enter your Name." ErrorMessage="Please enter your Name."
                        ValidationGroup="lnkInnerMailListing" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regexPageName" runat="server" ControlToValidate="txtname"
                        ToolTip="Please enter valid name." ErrorMessage="Please enter valid Name." SetFocusOnError="true"
                        Display="Dynamic" ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&!.\-/]+$">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td align="left" valign="top">
                    <asp:TextBox ID="txtemailAddress" runat="server" Text="Email Address" class="mailingList"
                        onfocus="javascript:if(this.value=='Email Address')this.value='';" onblur="javascript:if(this.value=='')this.value='Email Address';"
                        MaxLength="50" ToolTip="Please enter your email address."></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredEmail" runat="server" ErrorMessage="Please enter your Email Address"
                        ControlToValidate="txtemailAddress" CssClass="ErrorStar" Display="Dynamic" ToolTip="Please enter your Email Address" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionEmailValidator" runat="server"
                        ValidationGroup="lnkInnerMailListing" ToolTip="Please enter a valid Email address." ErrorMessage="Please enter a valid Email Address."
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="true"
                        ControlToValidate="txtemailAddress" CssClass="ErrorStar" Display="Dynamic">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td align="left" valign="top">
                    <asp:DropDownList ID="ddlMemberStatus" runat="server" class="mailingList" Style="height: 30px;
                        width: 346px;">
                        <asp:ListItem Value="Select">Select Member Status</asp:ListItem>
                        <asp:ListItem Value="Corporate Member">Corporate Member</asp:ListItem>
                        <asp:ListItem Value="Full Member">Full Member</asp:ListItem>
                        <asp:ListItem Value="Affiliate Member">Affiliate Member</asp:ListItem>
                        <asp:ListItem Value="Student Member">Student Member</asp:ListItem>
                        <asp:ListItem Value="Other">Other</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvMemberStatus" runat="server" ControlToValidate="ddlMemberStatus"
                        Display="Dynamic" ErrorMessage="Select Member Status" ToolTip="Select Member Status"
                        SetFocusOnError="true" ValidationGroup="lnkInnerMailListing" InitialValue="Select">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBox ID="chkSubscriber" runat="server" class="floatLeft checkbox" Style="width: 20px;
                        height: 20px; padding-top:5px;" />
                    <span class="floatLeft bluy" style="padding: 5px 0px 2px 5px;">Unsubscribe to Mailing
                        List</span>
                </td>
            </tr>
            <tr>
                <td align="left" valign="top" style="padding-top: 10px;">
                    <asp:LinkButton ID="lnkSubmit" runat="server" class="clearBoth floatLeft button"
                        ValidationGroup="lnkInnerMailListing" Text="" OnClick="lnkSubmit_Click">SUBMIT<span class="nextArrow"></span></asp:LinkButton>
                    <asp:ValidationSummary ID="vsInnerContactUS" runat="server" ValidationGroup="lnkInnerMailListing"
                        ShowMessageBox="true" ShowSummary="false" HeaderText="Please follow below Suggestion(s):" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr id="trMessage" runat="server" visible="false">
                <td>
                    <h3>
                        Mailing List submitted successfully</h3>
                </td>
            </tr>
        </table>
    </div>
</div>
