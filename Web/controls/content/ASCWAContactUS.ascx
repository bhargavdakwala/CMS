<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ASCWAContactUS.ascx.cs" Inherits="Etech.CMS.Web.controls.content.ASCWAContactUS" %>

<div class="mainContentinner">
    <h3>
        Fill in the form below to make a general enquiry</h3>
    
    <div class="floatLeft">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-family:Helvetica">
            <tr>
                <td align="left" valign="top" width="30%">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td align="left" valign="top">
                                <asp:TextBox ID="txtname" runat="server"  Text="Name" class="mailingList"
                                    onfocus="javascript:if(this.value=='Name')this.value='';"
                                     MaxLength="50" onblur="javascript:if(this.value=='')this.value='Name';"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtname"
                                    CssClass="ErrorStar" Display="Dynamic"  SetFocusOnError="true" InitialValue="Name" ToolTip="Please enter your Name." ErrorMessage="Please enter your Name."
                                    ValidationGroup="lnkContact">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexPageName" runat="server" ControlToValidate="txtname"
                                    ToolTip="Please enter valid Name." ErrorMessage="Please enter valid Name." SetFocusOnError="true"
                                    Display="Dynamic" ValidationGroup="lnkContact" ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&!.\-/]+$">*</asp:RegularExpressionValidator>
                                    
                            </td>
                        </tr>
                        <tr>
                            <td align="left" valign="top">
                                <asp:TextBox ID="txtemailAddress"  runat="server" Text="Email Address" class="mailingList"
                                    onfocus="javascript:if(this.value=='Email Address')this.value='';" onblur="javascript:if(this.value=='')this.value='Email Address';"
                                    MaxLength="50" ToolTip="Please enter your Email Address."></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredEmail" runat="server" ErrorMessage="Please enter your Email Address"
                                    ControlToValidate="txtemailAddress"  ValidationGroup="lnkContact" CssClass="ErrorStar" Display="Dynamic" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionEmailValidator" runat="server"
                                    ValidationGroup="lnkContact" ToolTip="Please enter a valid Email Address." ErrorMessage="Please enter a valid Email Address."
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="true"
                                    ControlToValidate="txtemailAddress" CssClass="ErrorStar" Display="Dynamic">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" valign="top">
                                <asp:TextBox ID="txtMessageSub"  class="mailingList" runat="server" MaxLength="50"
                                    Text="Message Subject" onfocus="javascript:if(this.value=='Message Subject')this.value='';"
                                    onblur="javascript:if(this.value=='')this.value='Message Subject';"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="rfvMessageSub" runat="server" ControlToValidate="txtMessageSub"
                                    CssClass="ErrorStar" Display="Dynamic" InitialValue="Message Subject" ToolTip="Please enter your Message Subject." ErrorMessage="Please enter your Message Subject."
                                    ValidationGroup="lnkContact">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revMeesageSub" runat="server" ControlToValidate="txtMessageSub"
                                    ToolTip="Please enter valid Message Subject." ErrorMessage="Please enter valid Message Subject." SetFocusOnError="true"
                                    Display="Dynamic" ValidationGroup="lnkContact" ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&!.\-/]+$">*</asp:RegularExpressionValidator>   
                            </td>
                        </tr>
                        <tr>
                            <td align="left" valign="top">
                                <asp:TextBox ID="txtDescription"  TextMode="MultiLine" class="messagebox"  style="overflow:hidden; font-size:16px;font-family:Arial;font-style:italic;"
                                    runat="server"  MaxLength="300" Rows="3" Text="Message"
                                    onfocus="javascript:if(this.value=='Message')this.value='';" onblur="javascript:if(this.value=='')this.value='Message';"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDescription"
                                    Display="Dynamic" ToolTip="Please enter Message." InitialValue="Message" ErrorMessage="Please enter Message."
                                    ValidationGroup="lnkContact">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtDescription"
                                    ErrorMessage="Please enter valid Message." ToolTip="Please enter valid Message."
                                    ValidationGroup="lnkContact" SetFocusOnError="true" Display="Dynamic" ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&!.\-/]+$">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox ID="chkSubscriber" runat="server" class="floatLeft checkbox" style="width:20px; height:20px;padding-top:5px;" />
                                <span class="floatLeft bluy" style="padding:5px 0px 2px 5px;">Subscribe to Mailing List</span>
                            </td>
                        
                        </tr>
                        <tr>
                            <td align="left" valign="top" style="padding-top:10px;">
                                <asp:LinkButton ID="lnkSubmit" runat="server" 
                                    class="clearBoth floatLeft button" ValidationGroup="lnkContact" Text="" 
                                    onclick="lnkSubmit_Click">SUBMIT<span class="nextArrow"></span></asp:LinkButton>
                                
                                <asp:ValidationSummary ID="vsInnerContactUS" runat="server" ValidationGroup="lnkContact"
                                    ShowMessageBox="true" ShowSummary="false" HeaderText="Please follow below Suggestion(s):" />
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr id="trMessage" runat="server" visible="false">
                            <td><h3>Contact submitted successfully</h3></td>
                        </tr>
                    </table>
                </td>
                <td align="left" valign="top" width="30%">
                    <div class="mailingAddress">
                        <p class="bluy">
                            <strong>Mailing Address</strong></p>
                        <p>
                            Po Box 335<br />
                            Mt Hawthorn WA 6915<br />
                            Australia</p>
                        <p>
                            contact@ahscawa.com.au</p>
                        <div class="floatLeft" style="margin-top:40px;">
                            <img src="http://www.ahscawa.com.au/images/google.png" alt="google puls" title="google puls" />
                            <img src="http://www.ahscawa.com.au/images/in.png" alt="Linkedin" title="Linkedin" />
                            <img src="http://www.ahscawa.com.au/images/fb.png" alt="Facebook" title="Facebook" />
                            <img src="http://www.ahscawa.com.au/images/like.png" alt="Like" title="Like" />
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</div>
