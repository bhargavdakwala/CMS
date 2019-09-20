<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Testimonials.ascx.cs"
    Inherits="Etech.CMS.Web.controls.content.Testimonials" %>
<h1>
    TESTIMONIALS</h1>
<p>
    Did you know? The tradition of wearing a wedding band on the third finger of the
    left hand began with the ancient Egyptians. They believed a vein ran through this
    finger and directly to the heart, the arbiter of Love. Even though today we know
    this to be medically incorrect, the sentiment is too charming to be discarded.</p>
    <p>&nbsp;</p>
    <h2>
    Write Testimonial</h2>
<p>
    <asp:TextBox ID="txtTestimonial" runat="server" BorderStyle="Solid" BorderWidth="2px"
        TextMode="MultiLine" BorderColor="#9AACB9" Rows="6" Width="250px"></asp:TextBox>&nbsp;
    <asp:RequiredFieldValidator ID="rfvTestimonial" runat="server" ControlToValidate="txtTestimonial" Display="Dynamic"
        ErrorMessage="Testimonial is required." ToolTip="Testimonial is required." ValidationGroup="vgTestimonial" SetFocusOnError="true" CssClass="floatLeft" Font-Size="12px">*</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="revTestimonial" runat="server" ControlToValidate="txtTestimonial"
        ErrorMessage="Please enter valid Testimonial." ToolTip="Please enter valid Testimonial." SetFocusOnError="true" Display="Dynamic" ValidationGroup="vgTestimonial"
        ValidationExpression="^[a-zA-Z0-9&quot;\s!@$&()*=+_{};?#~`|'\%^\,:|&!.\-/]+$" CssClass="floatLeft" Font-Size="12px">*</asp:RegularExpressionValidator>
</p>

<p style="text-align:right">
    <asp:ImageButton ID="imgSubmit" runat="server"  ImageUrl="~/images/btn-send.jpg" AlternateText="Send" 
        ValidationGroup="vgTestimonial" onclick="imgSubmit_Click" />
        <asp:ValidationSummary ID="vsInnerContactUS" runat="server" ValidationGroup="vgTestimonial" ShowMessageBox="true"
                            ShowSummary="false" HeaderText="Please follow below Suggestion(s):" /> 
</p>
