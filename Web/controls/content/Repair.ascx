<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Repair.ascx.cs" Inherits="Etech.CMS.Web.controls.content.Repair" %>
<h2>
    BOOK A REPAIR</h2>
<table border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td align="right">
            Name
        </td>
        <td>
            <CMS:TextBox ID="txtFullName" runat="server"></CMS:TextBox><br />
            <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName"
                ErrorMessage="Please enter full name." CssClass="ErrorStar" Display="Dynamic"
                ToolTip="Please enter your full name." ValidationGroup="lnkQute">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regexFullName" runat="server" ControlToValidate="txtFullName"
                ErrorMessage="Please enter valid full name." ValidationGroup="lnkQute" SetFocusOnError="true"
                Display="Dynamic" ValidationExpression="^[a-zA-Z0-9()/' ?.-]+$">*</asp:RegularExpressionValidator>
        </td>
        <td align="right">
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td align="right">
            Phone
        </td>
        <td>
            <asp:TextBox ID="txtRPhone" runat="server" ToolTip="Please enter your Phone."></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="rfvRPhone" runat="server" ToolTip="Please Enter Phone Number."
                ValidationGroup="lnkQute" ControlToValidate="txtRPhone" CssClass="ErrorStar"
                ErrorMessage="Please enter phone number." Display="Dynamic">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator
                    ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtRPhone"
                    ErrorMessage="Please enter valid phone number." ValidationGroup="lnkQute" SetFocusOnError="true"
                    Display="None" ValidationExpression="^[0-9()/ ?.-]+$"></asp:RegularExpressionValidator>
        </td>
        <td align="right">
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td align="right" nowrap="nowrap">
            Email Address
        </td>
        <td>
            <asp:TextBox ID="txtREmailAddress" runat="server" ToolTip="Please enter your email address."></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="rfvREmailAddress" runat="server" ErrorMessage="Please enter your email address."
                ToolTip="Please enter your email address." ValidationGroup="lnkQute" ControlToValidate="txtREmailAddress"
                CssClass="ErrorStar" Display="Dynamic">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ValidationGroup="lnkQute"
                ErrorMessage="Please enter a valid email address." ToolTip="Please enter a valid email address."
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtREmailAddress"
                CssClass="ErrorStar" Display="None"></asp:RegularExpressionValidator>
        </td>
        <td align="right">
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td align="right">
            Address
        </td>
        <td>
            <CMS:TextBox ID="txtAddress1" runat="server"></CMS:TextBox><br />
            <asp:RequiredFieldValidator ID="rfvAddress1" runat="server" ControlToValidate="txtAddress1"
                ErrorMessage="Please enter address1." CssClass="ErrorStar" Display="Dynamic"
                ToolTip="Please enter address1." ValidationGroup="lnkQute">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regexAddress1" runat="server" ControlToValidate="txtAddress1"
                ErrorMessage="Please enter valid address1." ValidationGroup="lnkQute" SetFocusOnError="true"
                Display="None" ValidationExpression="^[a-zA-Z0-9()/&', ?.-]+$">*</asp:RegularExpressionValidator>
        </td>
        <td align="right">
            Suburb
        </td>
        <td>
            <CMS:TextBox ID="txtSurburb" runat="server"></CMS:TextBox>
            <asp:RequiredFieldValidator ID="rfvSurburb" runat="server" ControlToValidate="txtSurburb"
                ErrorMessage="Please enter Surburb." CssClass="ErrorStar" Display="Dynamic" ToolTip="Please enter Surburb."
                ValidationGroup="lnkQute">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regexSurburb" runat="server" ControlToValidate="txtSurburb"
                ErrorMessage="Please enter valid Surburb." ValidationGroup="lnkQute" SetFocusOnError="true"
                Display="None" ValidationExpression="^[a-zA-Z0-9()/', ?.-]+$">*</asp:RegularExpressionValidator>
        </td>
        <td>
            State
        </td>
        <td>
            <CMS:TextBox ID="txtState" runat="server" Text="WA" Width="30px" Enabled="false"></CMS:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">
            Car Model
        </td>
        <td>
            <CMS:TextBox ID="txtCarModel" runat="server"></CMS:TextBox>
            <asp:RequiredFieldValidator ID="rfvCarModel" runat="server" ControlToValidate="txtCarModel"
                ErrorMessage="Please enter car model." CssClass="ErrorStar" Display="Dynamic"
                ToolTip="Please enter car model." ValidationGroup="lnkQute">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regexCarModel" runat="server" ControlToValidate="txtCarModel"
                ErrorMessage="Please enter valid car model." ValidationGroup="lnkQute" SetFocusOnError="true"
                Display="None" ValidationExpression="^[a-zA-Z ?]+$">*</asp:RegularExpressionValidator>
        </td>
        <td align="left">
            Colour
        </td>
        <td align="left">
            <CMS:TextBox ID="txtColor" runat="server"></CMS:TextBox>
            <asp:RequiredFieldValidator ID="rfvColor" runat="server" ControlToValidate="txtColor"
                ErrorMessage="Please enter color." CssClass="ErrorStar" Display="Dynamic" ToolTip="Please enter color."
                ValidationGroup="lnkQute">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regexColor" runat="server" ControlToValidate="txtColor"
                ErrorMessage="Please enter valid color." ValidationGroup="lnkQute" SetFocusOnError="true"
                Display="None" ValidationExpression="^[a-zA-Z ?]+$">*</asp:RegularExpressionValidator>
        </td>
        <td>
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" align="right" valign="top">
            Type/s of Repair
        </td>
        <td align="left" colspan="5" class="radio">
            <asp:RadioButtonList ID="rbtnListRepairTypes" runat="server" RepeatDirection="Horizontal"
                RepeatLayout="Flow" TextAlign="Right" RepeatColumns="4">
                <asp:ListItem Value="1" Selected="True">Bumper Bar</asp:ListItem>
                <asp:ListItem Value="2">Alloy Wheels Repair</asp:ListItem>
                <asp:ListItem Value="3">Minor Dent Repair</asp:ListItem>
                <asp:ListItem Value="4">Surface Mark Repair</asp:ListItem>
                <asp:ListItem Value="5">Stone Chip Repair</asp:ListItem>
                <asp:ListItem Value="6">Side Mirror Repair</asp:ListItem>
                <asp:ListItem Value="7">Vinyl Repair</asp:ListItem>
                <asp:ListItem Value="8">Leather Repair</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" align="right">
            Send Us a Photo
        </td>
        <td class="radio">
            <%-- <asp:UpdatePanel ID="updatepanel" runat="server">
                <ContentTemplate>--%>
            <asp:RadioButtonList ID="rbtnPhoto" OnSelectedIndexChanged="rbtnPhoto_SelectedIndexChanged"
                runat="server" RepeatDirection="Horizontal" AutoPostBack="true">
                <asp:ListItem Value="1">Yes</asp:ListItem>
                <asp:ListItem Value="2" Selected="True">No</asp:ListItem>
            </asp:RadioButtonList>
            <%--</ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="rbtnPhoto" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>--%>
        </td>
        <td colspan="4" nowrap="nowrap">
            <asp:Label ID="lblChoosefile" runat="server" Text="Choose a File"></asp:Label>
            <asp:FileUpload ID="fUpload" runat="server" Width="200px" size="15" />
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" align="right" valign="top">
            Other Comments
        </td>
        <td style="width: 25px; padding-right: 0px" colspan="2">
            <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Columns="20" Rows="2"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="rfvComments" runat="server" ControlToValidate="txtComments"
                ErrorMessage="Please enter description." CssClass="ErrorStar" Display="Dynamic"
                ToolTip="Please enter description." ValidationGroup="lnkQute">*</asp:RequiredFieldValidator><br />
            <asp:RegularExpressionValidator ID="regexComments" runat="server" ControlToValidate="txtComments"
                ErrorMessage="Please enter valid description." ValidationGroup="lnkQute" SetFocusOnError="true"
                Display="None" ValidationExpression="^[a-zA-Z0-9()/:&' \s?.-]+$">*</asp:RegularExpressionValidator>
        </td>
        <td colspan="2">
            <CMS:Button ID="btnQuet" CssClass="Submit" runat="server" ValidationGroup="lnkQute"
                OnClick="btnQuet_Click" Text="SUBMIT" />
        </td>
    </tr>
    <tr>
        <td valign="middle">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true"
                ShowSummary="false" HeaderText="Please follow below Suggestion(s):" ValidationGroup="lnkQute" />
        </td>
    </tr>
</table>
