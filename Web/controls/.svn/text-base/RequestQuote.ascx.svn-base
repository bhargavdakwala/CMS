<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RequestQuote.ascx.cs"
    Inherits="Etech.CMS.Web.controls.RequestQuote" %>
<div class="floatRight rightPanle">
    <h2>
        ON THE SPOT DETAILING</h2>
    <div class="contact">
        <p>
            Please complete our enquiry form below, to be contacted within one business day.
            For immediate assistance please call Damian on 0410886225, for any further enquiries.</p>
    </div>
    <table border="0" cellspacing="10" cellpadding="1" class="formTable">
        <tr>
            <td valign="top" width="20%">
                <CMS:Label ID="lblFullName" runat="server"></CMS:Label>
            </td>
            <td>
                <CMS:TextBox ID="txtFullName" runat="server" Width="330px"></CMS:TextBox><br />
                <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName"
                    ErrorMessage="Please enter full name." CssClass="ErrorStar" Display="Dynamic"
                    ToolTip="Please enter your full name." ValidationGroup="lnkFeedAdd">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="regexFullName" runat="server" ControlToValidate="txtFullName"
                    ErrorMessage="Please enter valid full name." ValidationGroup="lnkFeedAdd" SetFocusOnError="true"
                    Display="Dynamic" ValidationExpression="^[a-zA-Z0-9()/' ?.-]+$">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <CMS:Label ID="lblAddress1" runat="server"></CMS:Label>
            </td>
            <td>
                <CMS:TextBox ID="txtAddress1" runat="server" TextMode="MultiLine" Width="330px"></CMS:TextBox><br />
                <asp:RequiredFieldValidator ID="rfvAddress1" runat="server" ControlToValidate="txtAddress1"
                    ErrorMessage="Please enter address1." CssClass="ErrorStar" Display="Dynamic"
                    ToolTip="Please enter address1." ValidationGroup="lnkFeedAdd">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="regexAddress1" runat="server" ControlToValidate="txtAddress1"
                    ErrorMessage="Please enter valid address1." ValidationGroup="lnkFeedAdd" SetFocusOnError="true"
                    Display="Dynamic" ValidationExpression="^[a-zA-Z0-9()/&', ?.-]+$">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <CMS:Label ID="lblAddress2" runat="server"></CMS:Label>
            </td>
            <td>
                <CMS:TextBox ID="txtAddress2" runat="server" TextMode="MultiLine" Width="330px"></CMS:TextBox><br />
                <asp:RequiredFieldValidator ID="rfvAddress2" runat="server" ControlToValidate="txtAddress2"
                    ErrorMessage="Please enter address2." CssClass="ErrorStar" Display="Dynamic"
                    ToolTip="Please enter address2." ValidationGroup="lnkFeedAdd">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="regexAddress2" runat="server" ControlToValidate="txtAddress2"
                    ErrorMessage="Please enter valid address2." ValidationGroup="lnkFeedAdd" SetFocusOnError="true"
                    Display="Dynamic" ValidationExpression="^[a-zA-Z0-9()/&', ?.-]+$">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <CMS:Label ID="lblSurburb" runat="server"></CMS:Label>
            </td>
            <td>
                <CMS:TextBox ID="txtSurburb" runat="server" Width="330px"></CMS:TextBox><br />
                <asp:RequiredFieldValidator ID="rfvSurburb" runat="server" ControlToValidate="txtSurburb"
                    ErrorMessage="Please enter Surburb." CssClass="ErrorStar" Display="Dynamic" ToolTip="Please enter Surburb."
                    ValidationGroup="lnkFeedAdd">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="regexSurburb" runat="server" ControlToValidate="txtSurburb"
                    ErrorMessage="Please enter valid Surburb." ValidationGroup="lnkFeedAdd" SetFocusOnError="true"
                    Display="Dynamic" ValidationExpression="^[a-zA-Z0-9()/', ?.-]+$">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <CMS:Label ID="lblPreferedContact" runat="server"></CMS:Label>
            </td>
            <td>
                <CMS:TextBox ID="txtPreferedContact" runat="server" Width="330px" MaxLength="10"></CMS:TextBox><br />
                <asp:RequiredFieldValidator ID="rfvContact" runat="server" ToolTip="Please Enter Prefered Contact."
                    ValidationGroup="lnkFeedAdd" ControlToValidate="txtPreferedContact" CssClass="ErrorStar"
                    ErrorMessage="Please enter prefered contact." Display="Dynamic">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="regexContact" runat="server" ControlToValidate="txtPreferedContact"
                    ErrorMessage="Please enter valid contact." ValidationGroup="lnkFeedAdd" SetFocusOnError="true"
                    Display="Dynamic" ValidationExpression="^[0-9()/ ?.-]+$">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <CMS:Label ID="lblEmail" runat="server"></CMS:Label>
            </td>
            <td>
                <CMS:TextBox ID="txtEmail" runat="server" Width="330px"></CMS:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredEmail" runat="server" ErrorMessage="Please enter your email address."
                    ToolTip="Please enter your email address." ValidationGroup="lnkFeedAdd" ControlToValidate="txtEmail"
                    CssClass="ErrorStar" Display="Dynamic">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="regexEmail" runat="server" ErrorMessage="Please enter a valid email address."
                    ToolTip="Please enter a valid email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ControlToValidate="txtEmail" ValidationGroup="lnkFeedAdd" SetFocusOnError="true"
                    CssClass="ErrorStar" Display="Dynamic">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td colspan="4" valign="top">
                <CMS:Label ID="lblMake" runat="server"></CMS:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <CMS:Label ID="lblModel" runat="server"></CMS:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <CMS:Label ID="lblYear" runat="server"></CMS:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <CMS:Label ID="lblColor" runat="server"></CMS:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <CMS:TextBox ID="txtMake" runat="server" Width="100px"></CMS:TextBox>
                <asp:RequiredFieldValidator ID="rfvmake" runat="server" ControlToValidate="txtMake"
                    ErrorMessage="Please enter make." CssClass="ErrorStar" Display="Dynamic" ToolTip="Please enter make."
                    ValidationGroup="lnkFeedAdd">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regexMake" runat="server" ControlToValidate="txtMake"
                    ErrorMessage="Please enter valid make." SetFocusOnError="true" Display="Dynamic"
                    ValidationExpression="^[a-zA-Z0-9()/&' ?.-]+$" ValidationGroup="lnkFeedAdd">*</asp:RegularExpressionValidator>
                &nbsp;&nbsp;
                <CMS:TextBox ID="txtModel" runat="server" Width="100px"></CMS:TextBox>
                <asp:RequiredFieldValidator ID="rfvMaodel" runat="server" ControlToValidate="txtModel"
                    ErrorMessage="Please enter model." CssClass="ErrorStar" Display="Dynamic" ToolTip="Please enter model."
                    ValidationGroup="lnkFeedAdd">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtModel"
                    ErrorMessage="Please enter valid model." ValidationGroup="lnkFeedAdd" SetFocusOnError="true"
                    Display="Dynamic" ValidationExpression="^[a-zA-Z0-9()/&' ?.-]+$">*</asp:RegularExpressionValidator>
                &nbsp;&nbsp;
                <CMS:TextBox ID="txtYear" runat="server" Width="100px" MaxLength="4"></CMS:TextBox>
                <asp:RequiredFieldValidator ID="rfvYear" runat="server" ControlToValidate="txtYear"
                    ErrorMessage="Please enter year." CssClass="ErrorStar" Display="Dynamic" ToolTip="Please enter year."
                    ValidationGroup="lnkFeedAdd">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regexYear" runat="server" ControlToValidate="txtYear"
                    ErrorMessage="Please enter valid year." ValidationGroup="lnkFeedAdd" SetFocusOnError="true"
                    Display="Dynamic" ValidationExpression="^[0-9]+$">*</asp:RegularExpressionValidator>
                &nbsp;&nbsp;
                <CMS:TextBox ID="txtColor" runat="server" Width="100px"></CMS:TextBox>
                <asp:RequiredFieldValidator ID="rfvColor" runat="server" ControlToValidate="txtColor"
                    ErrorMessage="Please enter color." CssClass="ErrorStar" Display="Dynamic" ToolTip="Please enter color."
                    ValidationGroup="lnkFeedAdd">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regexColor" runat="server" ControlToValidate="txtColor"
                    ErrorMessage="Please enter valid color." ValidationGroup="lnkFeedAdd" SetFocusOnError="true"
                    Display="Dynamic" ValidationExpression="^[a-zA-Z ?]+$">*</asp:RegularExpressionValidator><br />
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="4" valign="top">
                <CMS:Label ID="lblAppointment" runat="server"></CMS:Label><br />
            </td>
        </tr>
        <tr>
            <td colspan="2" width="20%">
                <CMS:Label ID="lblDate" runat="server"></CMS:Label>
                &nbsp;&nbsp;
                <CMS:TextBox ID="txtDate" runat="server" Width="100px"></CMS:TextBox>
                <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate"
                    ErrorMessage="Please enter date." CssClass="ErrorStar" Display="Dynamic" ToolTip="Please enter date."
                    ValidationGroup="lnkFeedAdd">*</asp:RequiredFieldValidator>
                <%--<asp:RegularExpressionValidator ID="regexDate" runat="server" ControlToValidate="txtDate"
                    ErrorMessage="Please enter valid date." ValidationGroup="lnkFeedAdd" SetFocusOnError="true"
                    Display="Dynamic" ValidationExpression="^[0-9/]+$">*</asp:RegularExpressionValidator>--%>
                <asp:RegularExpressionValidator ID="regexDate" runat="server" ControlToValidate="txtDate"
                    ToolTip="Date Format should be in MM-DD-YYYY or MM/DD/YYYY" Display="Dynamic"
                    SetFocusOnError="true" ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d+$"
                    Width="326px" ValidationGroup="lnkFeedAdd">*</asp:RegularExpressionValidator>
                &nbsp;&nbsp;
                <CMS:Label ID="lblTime" runat="server"></CMS:Label>
                &nbsp;&nbsp;
                <CMS:TextBox ID="txtTime" runat="server" Width="100px"></CMS:TextBox>
                <asp:RequiredFieldValidator ID="rfvTime" runat="server" ControlToValidate="txtTime"
                    ErrorMessage="Please enter time." CssClass="ErrorStar" Display="Dynamic" ToolTip="Please enter time."
                    ValidationGroup="lnkFeedAdd">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regexTime" runat="server" ControlToValidate="txtTime"
                    ErrorMessage="Please enter valid time." ValidationGroup="lnkFeedAdd" SetFocusOnError="true"
                    Display="Dynamic" ValidationExpression="^[a-zA-Z0-9()/: ?.-]+$">*</asp:RegularExpressionValidator><br />
                <br />
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="4">
                <CMS:Label ID="lblComments" runat="server"></CMS:Label>
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Columns="55" Rows="5"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="rfvComments" runat="server" ControlToValidate="txtComments"
                    ErrorMessage="Please enter description." CssClass="ErrorStar" Display="Dynamic"
                    ToolTip="Please enter description." ValidationGroup="lnkFeedAdd">*</asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="regexComments" runat="server" ControlToValidate="txtComments"
                    ErrorMessage="Please enter valid description." ValidationGroup="lnkFeedAdd" SetFocusOnError="true"
                    Display="Dynamic" ValidationExpression="^[a-zA-Z0-9()/&' ?.-]+$">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
             <td > <CMS:Button ID="btnSubmit" CssClass="submit" runat="server" ValidationGroup="lnkFeedAdd"
                    OnClick="btnSubmit_Click" /></td> 
            <td   align="right">
              &nbsp;
            </td>
           
        </tr>
        <tr>
         <td valign="middle">
                
                <asp:ValidationSummary ID="vdsRS" runat="server" ShowMessageBox="true" ShowSummary="false"
                    HeaderText="Please follow below Suggestion(s):" ValidationGroup="lnkFeedAdd" />
            </td>
        </tr>
    </table>
</div>
