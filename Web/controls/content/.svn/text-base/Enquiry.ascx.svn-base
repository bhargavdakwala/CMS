<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Enquiry.ascx.cs" Inherits="Etech.CMS.Web.controls.content.Enquiry" %>
<h2>
    Make an Enquiry</h2>
<table width="85%" border="0" cellspacing="0" cellpadding="5">
    <tr>
        <td width="29%" align="left" valign="top">
            Name
        </td>
        <td align="left" valign="top">
            <asp:TextBox ID="txtname" runat="server" ToolTip="Please enter your name."></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtname"
                ErrorMessage="Please enter name." CssClass="ErrorStar" Display="Dynamic" ToolTip="Please enter your name."
                ValidationGroup="lnkFeedAdd">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regexPageName" runat="server" ControlToValidate="txtname"
                ErrorMessage="Please enter valid name." SetFocusOnError="true" Display="Dynamic"
                ValidationExpression="^[a-zA-Z0-9()/' ?.-]+$"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td align="left" valign="top">
            Phone
        </td>
        <td align="left" valign="top">
            <asp:TextBox ID="txtPhonenumber" runat="server" ToolTip="Please enter your Phone."></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ToolTip="Please Enter Phone Number."
                ValidationGroup="lnkFeedAdd" ControlToValidate="txtPhonenumber" CssClass="ErrorStar"
                ErrorMessage="Please enter phone number." Display="Dynamic">*</asp:RequiredFieldValidator>&nbsp;<asp:RegularExpressionValidator
                    ID="regexPhoneNumber" runat="server" ControlToValidate="txtPhonenumber" ErrorMessage="Please enter valid phone number."
                    ValidationGroup="lnkFeedAdd" SetFocusOnError="true" Display="Dynamic" ValidationExpression="^[0-9()/ ?.-]+$"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td align="left" valign="top">
            Email Address
        </td>
        <td align="left" valign="top">
            <asp:TextBox ID="txtemailAddress" runat="server" ToolTip="Please enter your email address."></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredEmail" runat="server" ErrorMessage="Please enter your email address."
                ToolTip="Please enter your email address." ValidationGroup="lnkFeedAdd" ControlToValidate="txtemailAddress"
                CssClass="ErrorStar" Display="Dynamic">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionEmailValidator" runat="server"
                ValidationGroup="lnkFeedAdd" ErrorMessage="Please enter a valid email address."
                ToolTip="Please enter a valid email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="txtemailAddress" CssClass="ErrorStar" Display="Dynamic"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td align="left" valign="top">
            Message Subject
        </td>
        <td align="left" valign="top">
            <asp:TextBox ID="txtMessageSubject" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMessageSubject"
                ErrorMessage="Please enter subject." CssClass="ErrorStar" Display="Dynamic" ToolTip="Please enter subject."
                ValidationGroup="lnkFeedAdd">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ValidationGroup="lnkFeedAdd" ID="regexMessageSubject"
                runat="server" ControlToValidate="txtMessageSubject" ErrorMessage="Please enter valid subject."
                SetFocusOnError="true" Display="Dynamic" ValidationExpression="^[a-zA-Z0-9()/:&' \s?.-]+$">*</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td align="left" valign="top">
            Message / Request
        </td>
        <td align="left" valign="top">
            <asp:TextBox ID="txtMessage" TextMode="MultiLine" runat="server" CssClass="message"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtMessage"
                ErrorMessage="Please enter Message." CssClass="ErrorStar" Display="Dynamic" ToolTip="Please enter Message."
                ValidationGroup="lnkFeedAdd">*</asp:RequiredFieldValidator><br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtMessage"
                ErrorMessage="Please enter valid Message." ValidationGroup="lnkFeedAdd" SetFocusOnError="true"
                Display="Dynamic" ValidationExpression="^[a-zA-Z0-9()/:&' \s?.-]+$">*</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td align="left" valign="middle">
            &nbsp;
        </td>
        <td align="right" valign="middle">
            <asp:Button ID="btnSubmit" CssClass="submit" runat="server" ValidationGroup="lnkFeedAdd"
                OnClick="btnSubmit_Click" Text="Submit" />
            <asp:ValidationSummary ID="vdsRS" runat="server" ShowMessageBox="true" ShowSummary="false"
                HeaderText="Please follow below Suggestion(s):" ValidationGroup="lnkFeedAdd" />
        </td>
    </tr>
</table>
