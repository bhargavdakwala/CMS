<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GetFreeQuote.ascx.cs"
    Inherits="Etech.CMS.Web.controls.content.GetFreeQuote" %>

<table width="100%" border="0" cellspacing="0" cellpadding="5">
    <tr>
        <td>
            <h1>
                ONLINE QUOTATION
            </h1>
        </td>
    </tr>
    <tr>
        <td style="width: 50%">
            <table border="0" cellspacing="0" cellpadding="5" class="formTable">
                <tr style="color: #2d51a4; font-size: 12px;">
                    <td colspan="2">
                        Your Contact Information
                    </td>
                </tr>
                <tr>
                    <td style="width: 43%;" valign="top" align="left">
                        Full Name
                    </td>
                    <td>
                        <asp:TextBox ID="txtFullName" runat="server" Width="150px" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName"
                            ToolTip="Full Nmae is required." ErrorMessage="FullName is required." Display="Dynamic"
                            SetFocusOnError="true" ValidationGroup="vgQuote">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regexFullName" runat="server" ControlToValidate="txtFullName"
                            ErrorMessage="Please enter valid FullName." ToolTip="Please enter valid FullName."
                            SetFocusOnError="true" Display="Dynamic" ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&!.\-/]+$"
                            ValidationGroup="vgQuote">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 43%;" valign="top" align="left">
                        Company
                    </td>
                    <td>
                        <asp:TextBox ID="txtCompany" runat="server" Width="150px" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCompany" runat="server" ControlToValidate="txtCompany"
                            ToolTip="Company is required." Display="Dynamic" ErrorMessage="Company is required."
                            SetFocusOnError="true" ValidationGroup="vgQuote">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ValidationGroup="vgQuote" ID="regexMessageSubject"
                            runat="server" ControlToValidate="txtCompany" ErrorMessage="Please enter valid Company."
                            ToolTip="Please enter valid Company." SetFocusOnError="true" Display="Dynamic"
                            ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&!.\-/]+$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 43%;" valign="top" align="left">
                        Email
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" Width="150px" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                            ToolTip="Email is required." ErrorMessage="Email is required." Display="Dynamic"
                            SetFocusOnError="true" ValidationGroup="vgQuote">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionEmailValidator" runat="server"
                            ValidationGroup="vgQuote" ErrorMessage="Please enter a valid email address."
                            ToolTip="Please enter a valid email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ControlToValidate="txtEmail" SetFocusOnError="true" Display="Dynamic">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 43%;" valign="top" align="left">
                        Phone
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone" runat="server" Width="150px" MaxLength="10"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revPhone" runat="server" Display="Dynamic" ErrorMessage="Enter Only Number"
                            SetFocusOnError="true" ValidationGroup="vgQuote" ToolTip="Enter Only Number"
                            ControlToValidate="txtPhone" ValidationExpression="^[0-9]{1,18}$">*
                        </asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 43%;" valign="top" align="left">
                        Address
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress" TextMode="MultiLine" Rows="2" Height="60px" MaxLength="100"
                            Width="150px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress"
                            ToolTip="Address is required." Display="Dynamic" ErrorMessage="Address is required."
                            SetFocusOnError="true" ValidationGroup="vgQuote">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ValidationGroup="vgQuote" ID="reexAddress" runat="server"
                            ControlToValidate="txtAddress" ErrorMessage="Please enter valid Address." ToolTip="Please enter valid Address."
                            SetFocusOnError="true" Display="Dynamic" ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+;?#~`|'\%^\,:|&!.\-/]+$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
        </td>
        <td style="width: 50%">
            <table border="0" cellspacing="0" cellpadding="5" class="formTable">
                <tr style="color: #2d51a4; font-size: 12px;">
                    <td>
                        Scope Design & Documentation Required
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chkSanitary" runat="server" CssClass="chkStyle"  Text="Sanitary"  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chkWaterService" runat="server" CssClass="chkStyle"  Text="Water Services" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chkFireService" runat="server" CssClass="chkStyle"  Text="Fire Services" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chkGasServices" runat="server" CssClass="chkStyle"  Text="Gas Services" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chkStormwater" runat="server" CssClass="chkStyle"  Text="Stormwater" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chkIndustrialWaste" runat="server" CssClass="chkStyle"  Text="Industrial Waste" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chkRecyclingDesign" runat="server" CssClass="chkStyle"  Text="Recycling Design" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span style="margin-left: 22px;">Other</span>
                        <asp:TextBox ID="txtOther" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <hr />
        </td>
    </tr>
    <tr>
        <td style="width: 50%">
            <table border="0" cellspacing="0" cellpadding="5" class="formTable">
                <tr style="color: #2d51a4; font-size: 12px;">
                    <td colspan="2">
                        Project Detail
                    </td>
                </tr>
                <tr>
                    <td style="width: 43%;" valign="top" align="left">
                        Number of Stories
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlNumberOfStories" runat="server" Width="150px">
                             <asp:ListItem Value="Select">--Select--</asp:ListItem>
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="1 - 4">1 - 4</asp:ListItem>
                            <asp:ListItem Value="5 - 10">5 - 10</asp:ListItem>
                            <asp:ListItem Value="> 10">> 10</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvNumberofStoreis" runat="server" ControlToValidate="ddlNumberOfStories"
                            SetFocusOnError="true" Display="Dynamic" ErrorMessage="Please Select Number of Stories."
                            ToolTip="Please Select Number of Stories." ValidationGroup="vgQuote">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 43%;" valign="top" align="left">
                        Building Type
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlBuildingType" runat="server" Width="150px">
                            <asp:ListItem Value="Select">--Select--</asp:ListItem>
                            <asp:ListItem Value="Residential">Residential</asp:ListItem>
                            <asp:ListItem Value="Units">Units</asp:ListItem>
                            <asp:ListItem Value="Commercial">Commercial</asp:ListItem>
                            <asp:ListItem Value="Institutional">Institutional</asp:ListItem>
                            <asp:ListItem Value="Department of Housing">Department of Housing</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvBuildingType" runat="server" ControlToValidate="ddlNumberOfStories"
                            SetFocusOnError="true" Display="Dynamic" ErrorMessage="Please Select Building Type."
                            ToolTip="Please Select Building Type." ValidationGroup="vgQuote">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 43%;" valign="top" align="left">
                        Product Budget
                    </td>
                    <td>
                        <asp:TextBox ID="txtProductBudget" runat="server" Width="150px" MaxLength="10"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" Display="Dynamic"
                            ErrorMessage="Enter Only Number" SetFocusOnError="true" ValidationGroup="vgQuote"
                            ToolTip="Enter Only Number" ControlToValidate="txtProductBudget" ValidationExpression="^[0-9]{1,18}$">*
                        </asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                
            </table>
        </td>
        <td style="width: 50%">
            <table border="0" cellspacing="0" cellpadding="5" class="formTable">
                <tr style="color: #2d51a4; font-size: 12px;">
                    <td>
                        Limit of Commission
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chkSchematic" runat="server" CssClass="chkStyle"  Text="Schematic & Design Brief" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chkTenderDesign" runat="server" CssClass="chkStyle"  Text="Tender Design & Documentation" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chkConstruction" runat="server" CssClass="chkStyle"  Text="Construction (Shop Drawings)" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chkContract" runat="server" CssClass="chkStyle"  Text="Contract Administratin" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span style="margin-left: 22px;vertical-align:top;">Other</span>
                        <asp:TextBox ID="txtOtherLimit" TextMode="MultiLine" Rows="3" Width="190px" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <hr />
        </td>
    </tr>
    <tr>
        <td style="width: 50%">
            <table border="0" cellspacing="0" cellpadding="5" class="formTable">
                <tr style="color: #2d51a4; font-size: 12px;">
                    <td>
                        Please Describe Poject
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox ID="txtDescribeProject" runat="server" TextMode="MultiLine" Rows="6"
                            Width="310px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </td>
        <td style="width: 50%">
            <table border="0" cellspacing="0" cellpadding="5" class="formTable">
                <tr style="color: #2d51a4; font-size: 12px;">
                    <td style="width: 43%;" valign="top" align="right" colspan="2">
                        Time Frame to Begin Work
                    </td>
                </tr>
                <tr>
                    <td style="width: 43%;" valign="top" align="right" colspan="2">
                        <asp:DropDownList ID="ddlTimeFrame" runat="server" Width="170px">
                            <asp:ListItem Value="Select">--Select--</asp:ListItem>
                            <asp:ListItem Value="Urgent">Urgent</asp:ListItem>
                            <asp:ListItem Value="14 Days">14 Days</asp:ListItem>
                            <asp:ListItem Value="30 Days">30 Days</asp:ListItem>
                            <asp:ListItem Value="> 30 Days">> 30 Days</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <hr />
        </td>
    </tr>
    <tr>
        <td style="width: 50%">
            <table border="0" cellspacing="0" cellpadding="5" class="formTable">
                <tr style="color: #2d51a4; font-size: 12px;">
                    <td>
                        Project
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:FileUpload ID="fuProject1" runat="server" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ToolTip="Only pdf,doc,jpg files are allowed."
                            ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.doc|.docx|.jpg|.pdf|.DOC|.JPG|.PDF|.png|.PNG|.psd|.PSD|.dwg|.DWG)$"
                            ControlToValidate="fuProject1" ValidationGroup="vgQuote" Display="Dynamic">*</asp:RegularExpressionValidator>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:FileUpload ID="fuProject2" runat="server" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ToolTip="Only pdf,doc,jpg files are allowed."
                            ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.doc|.docx|.jpg|.pdf|.DOC|.JPG|.PDF|.png|.PNG|.psd|.PSD|.dwg|.DWG)$"
                            ControlToValidate="fuProject2" ValidationGroup="vgQuote" Display="Dynamic">*</asp:RegularExpressionValidator>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:FileUpload ID="fuProject3" runat="server" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ToolTip="Only pdf,doc,jpg files are allowed."
                            ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.doc|.docx|.jpg|.pdf|.DOC|.JPG|.PDF|.png|.PNG|.psd|.PSD|.dwg|.DWG)$"
                            ControlToValidate="fuProject3" ValidationGroup="vgQuote" Display="Dynamic">*</asp:RegularExpressionValidator>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </td>
        <td style="width: 50%">
            <table border="0" cellspacing="0" cellpadding="5" class="formTable">
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 43%;" valign="top" align="right" colspan="2">
                        <asp:Button ID="btnQute" runat="server" Text="Request Your Quote" OnClick="btnQute_Click"
                            ValidationGroup="vgQuote" CssClass="btn" />
                        <asp:ValidationSummary ID="vsQuote" runat="server" ValidationGroup="vgQuote" ShowMessageBox="true"
                            ShowSummary="false" HeaderText="Please follow below Suggestion(s):" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
