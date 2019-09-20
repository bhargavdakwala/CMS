<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeBehind="customerinformation.aspx.cs" EnableEventValidation="true" Inherits="Etech.CMS.Web.admin.customerinformation" %>
<%@ MasterType VirtualPath="~/admin/admin.master" %>
<%@ Register TagPrefix="CMS" TagName="AddressDisplay" Src="~/controls/addressdisplay.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div id="mainContentRegion">
    <div id="admin_centercontent">
      <div class="sectionHeader"><CMS:Label ID="lblCustomerInformation" runat="server" /></div><br />
      <asp:UpdatePanel ID="upWrapper" runat="server" UpdateMode="Always" RenderMode="Inline" >
          <ContentTemplate>
            <div><CMS:Label ID="lblCustomerId" runat="server" CssClass="label" />
                 <asp:DropDownList ID="ddlCustomer" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCustomer_SelectedIndexChanged" ></asp:DropDownList>
            </div>
            <br />
              <asp:TabContainer ID="tcMyAccount" runat="server" Height="300px" ScrollBars="Vertical" CssClass="ajax__tab_technorati-theme" Visible="false">
                <asp:TabPanel ID="tpUserInfo" runat="server" HeaderText="About" >
                  <ContentTemplate>                    
                      <CMS:Panel ID="pnlUser" runat="server">
                      <CMS:Label ID="lblUserName" runat="server" CssClass="label" /><br />
                      <CMS:Label ID="lblUserNameDisplay" runat="server" CssClass="label" /><br /><br />
                      <CMS:Label ID="lblPassword" runat="server" CssClass="label" /><br />
                      <CMS:LinkButton ID="lbChangePassword" runat="server" CssClass="label" OnClick="lbChangePassword_Click" /><br /><br />
                      <CMS:Label ID="lblEmail" runat="server" CssClass="label" /><br />
                      <CMS:Label ID="lblEmailDisplay" runat="server" CssClass="label" />&nbsp;&nbsp;<CMS:LinkButton ID="lbChangeEmail" runat="server" CssClass="label" OnClick="lbChangeEmail_Click" /><br /><br />
                    </CMS:Panel>
                    <!-- //TODO: CMC - This control needs localization -->
                    <CMS:Panel ID="pnlChangePassword" runat="server" Visible="false">
                      <asp:ChangePassword ID="cpChangePassword" runat="server" OnCancelButtonClick="HideChangePassword" OnContinueButtonClick="HideChangePassword" >
                        <CancelButtonStyle CssClass="button" />
                        <ContinueButtonStyle CssClass="button" />
                        <ChangePasswordButtonStyle CssClass="button" />
                      </asp:ChangePassword>
                    </CMS:Panel>
                    <CMS:Panel ID="pnlChangeEmail" runat="server" Visible="false">
                      <CMS:Label ID="lblPasswordChange" runat="server" CssClass="label" /><br />
                      <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="textbox" /><CMS:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="*" /><br /><br />
                      <CMS:Label ID="lblEmailChange" runat="server" CssClass="label" /><br />
                      <asp:TextBox ID="txtEmail" TextMode="SingleLine" runat="server" CssClass="textbox" /><CMS:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" /><br /><br />
                      <CMS:Label ID="lblEmailConfirmation" runat="server" CssClass="label" /><br />
                      <asp:TextBox ID="txtEmailConfirmation" TextMode="SingleLine" runat="server" CssClass="textbox" /><CMS:RequiredFieldValidator ID="rfvEmailConfirmation" runat="server" ControlToValidate="txtEmailConfirmation" ErrorMessage="*" /><br /><br />
                      <asp:CompareValidator ID="cvEmailAddresses" runat="server" ControlToCompare="txtEmailConfirmation" ControlToValidate="txtEmail" Type="String" CssClass="label" />
                      <CMS:Button ID="btnCancel" runat="server" CssClass="button" CausesValidation="False" OnClick="btnEmailCancel_Click" />&nbsp;
                      <CMS:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnEmailSave_Click" />
                    </CMS:Panel>            
                  </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="tpMyOrders" runat="server"  HeaderText="My Orders">
                  <ContentTemplate>
                   <CMS:Panel ID="pnlMyOrders" runat="server">
                      <CMS:DataGrid ID="dgOrders" runat="server" AutoGenerateColumns="false" SkinID="adminDataGridNoPage" Width="95%">
                        <Columns>
                          <asp:TemplateColumn>
                            <ItemTemplate>
                              <CMS:HyperLink ID="hlEditLink" runat="server" NavigateUrl='<%# FormatEditUrl(Eval("OrderId").ToString()) %>'  />
                            </ItemTemplate>
                          </asp:TemplateColumn>
                          <asp:BoundColumn DataField="OrderNumber" />
                          <asp:TemplateColumn>
                            <ItemTemplate>
                              <%# GetFormattedAmount(Eval("Total").ToString()) %>
                            </ItemTemplate>
                          </asp:TemplateColumn>
                          <asp:TemplateColumn>
                            <ItemTemplate>
                              <%# (Eval("OrderStatusDescriptor.Name")) %>
                            </ItemTemplate>
                          </asp:TemplateColumn>
                          <asp:BoundColumn DataField="CreatedOn" ItemStyle-Font-Size="XX-Small" />            
                        </Columns>
                      </CMS:DataGrid>
                    </CMS:Panel>
                  </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="tpAddresses" runat="server" HeaderText="My Addresses">
                  <ContentTemplate>
                    <CMS:Panel ID="pnlBillingAddresses" runat="server" CssClass="billingAddresses">&nbsp;    
                      <asp:Repeater ID="rptrBillingAddresses" runat="server" OnItemCommand="BillingEdits">
                        <ItemTemplate>
                          <CMS:AddressDisplay ID="dcBillingAddress" runat="server" />
                          <div>
                            <CMS:LinkButton ID="lbEditBilling" CommandName="Edit" runat="server" CommandArgument='<%# Eval("AddressId") %>' CssClass="button" Text="Edit"  CausesValidation="false" /> | 
                            <CMS:LinkButton ID="lbDeleteBilling" CommandName="Delete" runat="server" CommandArgument='<%# Eval("AddressId") %>' CssClass="button" Text="Delete"  CausesValidation="false" />
                          </div>
                          <hr />
                        </ItemTemplate>
                      </asp:Repeater>
                    </CMS:Panel>
                    <CMS:Panel ID="pnlShippingAddresses" runat="server" CssClass="shippingAddresses">&nbsp;    
                      <asp:Repeater ID="rptrShippingAddresses" runat="server" OnItemCommand="ShippingEdits" >
                        <ItemTemplate>
                          <CMS:AddressDisplay ID="dcShippingAddress" runat="server"  />
                          <div>
                            <CMS:LinkButton ID="lbEditShipping" CommandName="Edit" CommandArgument='<%# Eval("AddressId") %>' runat="server" CssClass="button" Text="Edit" CausesValidation="false" /> | 
                            <CMS:LinkButton ID="lbDeleteShipping" CommandName="Delete" CommandArgument='<%# Eval("AddressId") %>' runat="server" CssClass="button" Text="Delete" CausesValidation="false" />
                          </div>
                          <hr />
                        </ItemTemplate>
                      </asp:Repeater>
                    </CMS:Panel>
                    <CMS:Panel ID="pnlEditAddress" runat="server" Visible="false" CssClass="twelve">
                    <table>
                        <tr>
                          <td>
                            <CMS:Label ID="lblAddressId" runat="server" Visible="false" />
                            <CMS:Label ID="lblFirstName" runat="server" CssClass="label" /><br />
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="textbox" /><CMS:RequiredFieldValidator ID="rfvFirstName" runat="server" Display="Dynamic" ControlToValidate="txtFirstName" ErrorMessage="*" />
                          </td>
                          <td>
                            <CMS:Label ID="lblLastName" runat="server" CssClass="label" /><br />
                            <asp:TextBox ID="txtLastName" runat="server" CssClass="textbox" /><CMS:RequiredFieldValidator ID="rfvLastName" runat="server" Display="Dynamic" ControlToValidate="txtLastName" ErrorMessage="*" />    
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <CMS:Label ID="lblPhone" runat="server" CssClass="label" /><br />
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="textbox" /><CMS:RequiredFieldValidator ID="rfvPhone" runat="server" Display="Dynamic" ControlToValidate="txtPhone" ErrorMessage="*" />
                          </td>
                          <td>
                            <CMS:Label ID="lblEmailEdit" runat="server" CssClass="label" /><br />
                            <asp:TextBox ID="txtEmailEdit" runat="server" CssClass="textbox" /><CMS:RequiredFieldValidator ID="rfvEmailEdit" runat="server" Display="Dynamic" ControlToValidate="txtEmailEdit" ErrorMessage="*" />    
                          </td>
                        </tr>
                        <tr>
                          <td colspan="2">
                            <CMS:Label ID="lblAddress" runat="server" CssClass="label" /><br />
                            <asp:TextBox ID="txtAddress1" runat="server" CssClass="longtextbox" /><CMS:RequiredFieldValidator ID="rfvAddress1" runat="server" Display="Dynamic" ControlToValidate="txtAddress1" ErrorMessage="*" />    
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <asp:TextBox ID="txtAddress2" runat="server" CssClass="longtextbox" />    
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <CMS:Label ID="lblCity" runat="server" CssClass="label" /><br />
                            <asp:TextBox ID="txtCity" runat="server" CssClass="textbox" /><CMS:RequiredFieldValidator ID="rfvCity" runat="server" Display="Dynamic" ControlToValidate="txtCity" ErrorMessage="*" />
                          </td>
                          <td>
                            <CMS:Label ID="lblStateOrRegion" runat="server" CssClass="label" /><br />
                            <asp:TextBox ID="txtStateOrRegion" runat="server" CssClass="textbox" Visible="false" /><CMS:RequiredFieldValidator ID="rfvStateOrRegion" runat="server" Display="Dynamic" ControlToValidate="txtStateOrRegion" ErrorMessage="*" Enabled="false" />
                            <asp:DropDownList ID="ddlStateOrRegion" runat="server" CssClass="dropdownlist" Visible="true" />
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <CMS:Label ID="lblPostalCode" runat="server" CssClass="label" /><br />
                            <asp:TextBox ID="txtPostalCode" runat="server" CssClass="textbox" /><CMS:RequiredFieldValidator ID="rfvPostalCode" runat="server" ControlToValidate="txtPostalCode" Display="Dynamic" ErrorMessage="*" />
                          </td>
                          <td>
                            <CMS:Label ID="lblCountry" runat="server" CssClass="label" /><br />
                            <asp:DropDownList ID="ddlCountry" runat="server" CssClass="dropdownlist" AutoPostBack="true" OnSelectedIndexChanged="ddlCountry_Changed" /><CMS:RequiredFieldValidator ID="rfvCountry" runat="server" ControlToValidate="ddlCountry" Display="Dynamic" ErrorMessage="*" />    
                          </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:HiddenField ID="hfAddressId" runat="server" />
                                <asp:HiddenField ID="hfAddressType" runat="server" />
                                <CMS:LinkButton ID="lbUpdateAddress" runat="server" CssClass="button" OnClick="lbUpdateAddress_Click" Text="Update" /> |
                                <CMS:LinkButton ID="lbCancelAddressEdit" runat="server" CssClass="button" OnClick="lbCancelAddressEdit_Click" Text="Cancel" />                            
                            </td>
                        </tr>
                      </table>
                    </CMS:Panel>
                  </ContentTemplate>
                </asp:TabPanel>
              </asp:TabContainer>
          </ContentTemplate>
      </asp:UpdatePanel>
    </div>
  </div>  
</asp:Content>
