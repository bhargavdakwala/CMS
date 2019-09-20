<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeMailList.ascx.cs"
    Inherits="Etech.CMS.Web.controls.content.HomeMailList" %>
  
    
<div class="joinOur">
    <div class="floatLeft" style="padding-left: 20px;">
        <h3>
            Join Our Mailing List</h3>
        <asp:TextBox ID="txtname" runat="server" Text="Name" class="textbox" onfocus="javascript:if(this.value=='Name')this.value='';"
            MaxLength="50" onblur="javascript:if(this.value=='')this.value='Name';"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtname"
            CssClass="ErrorStar" Display="Dynamic" ToolTip="Please enter your Name." ErrorMessage="Please enter your Name."
            ValidationGroup="lnkFeedAdd" InitialValue="Name" SetFocusOnError="true">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regexPageName" runat="server" ControlToValidate="txtname"
            ToolTip="Please enter valid Name." ErrorMessage="Please enter valid Name." SetFocusOnError="true"
            Display="Dynamic" ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&!.\-/]+$">*</asp:RegularExpressionValidator>
        <asp:TextBox ID="txtemailAddress" runat="server" Text="Email Address" class="textbox"
            onfocus="javascript:if(this.value=='Email Address')this.value='';" onblur="javascript:if(this.value=='')this.value='Email Address';"
            MaxLength="50" ToolTip="Please enter your Email Address."></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredEmail" runat="server" ErrorMessage="Please enter your Email AddAdd"
            ControlToValidate="txtemailAddress" CssClass="ErrorStar" Display="Dynamic" SetFocusOnError="true">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionEmailValidator" runat="server"
            ValidationGroup="lnkFeedAdd" ToolTip="Please enter a valid Email Address." ErrorMessage="Please enter a valid Email Address."
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="true"
            ControlToValidate="txtemailAddress" CssClass="ErrorStar" Display="Dynamic">*</asp:RegularExpressionValidator>
           
        <asp:DropDownList ID="ddlMemberStatus" runat="server" class="status">
            <asp:ListItem Value="Select">Select Member Status</asp:ListItem>
            <asp:ListItem Value="Corporate Member">Corporate Member</asp:ListItem>
            <asp:ListItem Value="Full Member">Full Member</asp:ListItem>
            <asp:ListItem Value="Affiliate Member">Affiliate Member</asp:ListItem>
            <asp:ListItem Value="Student Member">Student Member</asp:ListItem>
            <asp:ListItem Value="Other">Other</asp:ListItem>
        </asp:DropDownList>
        
        <asp:RequiredFieldValidator ID="rfvMemberStatus" runat="server" ControlToValidate="ddlMemberStatus"
            Display="Dynamic" ErrorMessage="Select Member Status" ToolTip="Select Member Status"
            SetFocusOnError="true" ValidationGroup="lnkFeedAdd" InitialValue="Select">*</asp:RequiredFieldValidator>
        <div  style="width: 250px;padding-bottom:25px;">
            <asp:CheckBox ID="chkSubscriber" runat="server" class="floatLeft checkbox"  />
            <span class="floatLeft checkboxText">Unsubscribe to Mailing List</span>
        </div>
        <asp:LinkButton ID="lnkSubmit" runat="server" class="clearBoth floatLeft button"
            ValidationGroup="lnkFeedAdd" Text="" OnClick="lnkSubmit_Click">SUBMIT<span class="nextArrow"></span></asp:LinkButton>
        <asp:ValidationSummary ID="vsInnerContactUS" runat="server" ValidationGroup="lnkFeedAdd"
            ShowMessageBox="true" ShowSummary="false" HeaderText="Please follow below Suggestion(s):" />
        <br />
        <div style="width: 250px;" id="divMessage" runat="server" visible="false">
            <span class="floatLeft checkboxText">Mailing List submitted successfully</span>
        </div>
    </div>
</div>
