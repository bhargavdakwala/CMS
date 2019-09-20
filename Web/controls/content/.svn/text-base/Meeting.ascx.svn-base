<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Meeting.ascx.cs" Inherits="Etech.CMS.Web.controls.content.Meeting" %>
<div class="mainContentinner">
    <h3>
        Upcoming AHSCA WA Meetings</h3>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td align="left" valign="top">
                <asp:Repeater ID="rptMeeting" runat="server">
                    <HeaderTemplate>
                        <table width="60%" border="0" cellspacing="4" cellpadding="0">
                            <tr>
                                <td colspan="2" align="left" valign="top" style="padding-bottom: 10px;">
                                    <strong>Future Meeting Dates</strong>
                                </td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%--<tr>
                            <td align="left" valign="top">
                                <%#  DataBinder.Eval(Container.DataItem, "MeetingDate", "{0:dddd}")%>
                            </td>
                            <td align="left" valign="top">
                                <%#  DataBinder.Eval(Container.DataItem, "MeetingDate", "{0:dd'th of' MMMM yyyy}")%>
                            </td>
                        </tr>--%>
                        <tr>
                            <td align="left" valign="top">
                                <%#  DataBinder.Eval(Container.DataItem, "ProjectTitle")%>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </td>
            <td align="left" valign="top" class="monthlyMeetings">
                <div class="monthlyMeetingsDiv">
                    <p>
                        <strong>Each meeting is held at the offices of:</strong></p>
                    <p>
                        Hydraulics Design Australia<br />
                        1/ 300 Fitzgerald Street,
                        <br />
                        Perth Western Australia 6000</p>
                </div>
            </td>
        </tr>
    </table>
</div>
