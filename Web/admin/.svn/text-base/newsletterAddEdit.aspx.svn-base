<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeBehind="newsletterAddEdit.aspx.cs" Inherits="Etech.CMS.Web.admin.newsletterAddEdit" %>
<%@ MasterType VirtualPath="~/admin/admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript" language="javascript">
        function ConfirmSendEmail() {

            var Title = document.getElementById('<%=txtNewLetterTitle.ClientID %>').value;

            var Subject = document.getElementById('<%=txtNewsLetterSubject.ClientID %>').value;

            var GroupName = document.getElementById('<%=lstNewsletterGroupName.ClientID %>').value;

            if (Title == "") {
                alert('Title is required.');
                document.getElementById('<%=txtNewLetterTitle.ClientID %>').focus();
                return false;
            }
            if (Title != "") {
                var reg = new RegExp("[<>:;/]");

                if (Title.match(reg)) {
                    alert('Please enter valid Title');
                    document.getElementById('<%=txtNewLetterTitle.ClientID %>').focus();
                    return false;
                }

            }
            if (Subject == "") {
                alert('Subject is required.');
                document.getElementById('<%=txtNewsLetterSubject.ClientID %>').focus();
                return false;
            }
            if (Subject != "") {

                var reg = new RegExp("[<>:;/]");

                if (Subject.match(reg)) {
                    alert('Please enter valid Subject.');
                    document.getElementById('<%=txtNewsLetterSubject.ClientID %>').focus();
                    return false;
                }
            }
            if (GroupName == "") {
                alert('Group name is required.');
                document.getElementById('<%=lstNewsletterGroupName.ClientID %>').focus();
                return false;
            }

            if (confirm("Do you want to send email?")) {
                var hdnValue = document.getElementById('ctl00_ContentPlaceHolder1_hdnEmailConfirmation');
                hdnValue.value = '1';
                //document.getElementById('btnSave').click(); 
            }
            else {
                var hdnValue = document.getElementById('ctl00_ContentPlaceHolder1_hdnEmailConfirmation');
                hdnValue.value = '0';
            }

        }

    </script>

    <style type="text/css">
        .linkButton
        {
            color: #CC9900;
            font-family: Verdana;
            font-weight: bold;
            font-size: 15px;
        }
    </style>
    <div id="mainContentRegion">
                        <CMS:Panel ID="pnlEditNewLetter" runat="server" SkinID="pnlBorder" Width="695px">
                        
                        <div class="panelWrap">
                            <table>
                               <tr>
                                    <td colspan="2"><CMS:Label ID="lblDuplicateMessage" runat="server" Visible="false" ForeColor="Red"
                            Font-Size="Small" /></td>
                               </tr>
                                <tr align="left">
                                    <td>
                                        <CMS:Label ID="lblNewLetterTitle" runat="server" Visible="True" />
                                        <CMS:Label ID="lblNewLetterId" runat="server" Visible="False" />
                                        <asp:HiddenField ID="hdnEmailConfirmation" runat="server" />
                                    </td>
                                    <td>
                                        <CMS:TextBox ID="txtNewLetterTitle"   runat="server" MaxLength="100" CssClass="longtextbox" Width="200px" />
                                        
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <CMS:Label ID="lblNewsLetterSubject" runat="server" Visible="True" />
                                    </td>
                                    <td>
                                        <CMS:TextBox ID="txtNewsLetterSubject" runat="server"   MaxLength="100" CssClass="longtextbox" Width="200px" />
                                         
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <CMS:Label ID="lblNewLetterGroupName" runat="server" Visible="True" />
                                    </td>
                                    <td>
                                        <CMS:Label ID="lblGroupNameId" runat="server" Visible="false" />
                                        <CMS:ListBox ID="lstNewsletterGroupName" Width="330px" SelectionMode="Multiple" runat="server"
                                            Rows="5">
                                        </CMS:ListBox>
                                        
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <CMS:Label ID="lblTemplate" runat="server" Visible="True" />
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlTemplates" runat="server" Width="200px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                            <CMS:Button ID="btnSave" runat="server" ValidationGroup="vgNewLetters" OnClientClick="return ConfirmSendEmail(this);" CssClass="button" 
                                OnClick="btnSave_Click" />
                            <CMS:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="button"
                                OnClick="btnCancel_Click" />
                                </div> 
                        </CMS:Panel>
              
                        <CMS:Panel  ID="pnlCurrentNewsLetter" runat="server" SkinID="pnlBorder">
                        <div class="panelWrap">
                          <div class="gridBox">
                                <div class="gridWrap">
                                    <div style="padding:0 10px 10px 0;" class="floatRight">
                                        <CMS:LinkButton ID="lnkAddNewsLetter" OnClick="lnkAddNewsLetter_Click" runat="server" Font-Underline="true" Font-Bold="true"></CMS:LinkButton>
                                    </div> 
                          
                            <CMS:DataGrid ID="dgNewsLetter" runat="server" AutoGenerateColumns="false" SkinID="adminDataGridNoPage"
                                Width="655px" OnItemCommand="dgNewsLetter_OnItemCommand" AllowPaging="true" PageSize="10"
                                OnPageIndexChanged="dgNewsLetter_PageIndexChanged">
                                <Columns>
                                    <asp:BoundColumn DataField="NewsLetterTitle"  HeaderText="Title" ItemStyle-Wrap="true" HeaderStyle-Width="140px" />
                                    <asp:BoundColumn DataField="NewsLetterSubject" HeaderText="Subject" ItemStyle-Wrap="true" HeaderStyle-Width="140px" />
                                    <asp:BoundColumn DataField="CreatedOn"  HeaderText="Date" />
                                    <asp:TemplateColumn HeaderText="Edit">
                                        <ItemTemplate>
                                            <CMS:LinkButton runat="server" ID="lblEdit" CommandName="Edit" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "NewsLetterID")%>'
                                                     SkinID="Edit" />    
                                        
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="Delete">
                                        <ItemTemplate>
                                              <CMS:LinkButton runat="server" ID="lbDelete" CommandName="Delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "NewsLetterID")%>'
                                                     SkinID="delete" OnClientClick="return confirm('Do you want to Delete this record?');" />   
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