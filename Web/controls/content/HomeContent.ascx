<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeContent.ascx.cs"
    Inherits="Etech.CMS.Web.controls.content.HomeContent" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%--<script src="../../JavaScript/jquery.js" type="text/javascript" charset="utf-8"></script>

<script src="../../JavaScript/jquery.wslide.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript" src="../../JavaScript/s3Slider.js"></script>

<script type="text/javascript" charset="utf-8">
    $(document).ready(function() {
        /*====================== Exemple 2 ======================*/
        $("#parent2").wslide({
            width: 350,
            height: 210,
            pos: 1,
            horiz: true
        });
        $('#slider1').s3Slider({
            timeOut: 4000
        });

    });
</script>


<div class="flashBanner floatLeft">
    <div id="slider1">
        <ul id="slider1Content">
            <li class="slider1Image">
                <img src="../../images/ist-banner1.jpg" alt="1" />
                <span class="bnrRight">
                    <h3>
                        Logo design</h3>
                    <p>
                        Customised Website Design and Development</p>
                    <div class="viewProject">
                        <a href="https://www.randd-solutions.com.au" target="_blank" class="">View Project</a></div>
                </span></li>
            <li class="slider1Image">
                <img src="../../images/bnr-home-webdevelopment.jpg" alt="3" />
                <span class="bnrRight">
                    <h3>
                        Web development</h3>
                    <p>
                        Customised Website Design and Development</p>
                    <div class="viewProject">
                        <a href="https://www.golfsalesaustralia.com.au" target="_blank">View Project</a></div>
                </span></li>
            <li class="slider1Image">
                <img src="../../images/bnr-home-seo.jpg" alt="3" />
                <span class="bnrRight">
                    <h3>
                        SEO</h3>
                    <p>
                        Customised Website Design and Development</p>
                    <div class="viewProject">
                        <a href="https://www.ahscawa.com.au" target="_blank">View Project</a></div>
                </span></li>
            <li class="slider1Image">
                <img src="../../images/bnr-home-online-marketing.jpg" alt="3" />
                <span class="bnrRight">
                    <h3>
                        Online marketing
                    </h3>
                    <p>
                        Customised Website Design and Development</p>
                    <div class="viewProject">
                        <a href="https://www.pjwrightandassociates.com.au" target="_blank">View Project</a></div>
                </span></li>
            <li class="slider1Image">
                <img src="../../images/bnr-home-web-maintenance.jpg" alt="2" />
                <span class="bnrRight">
                    <h3>
                        Web maintenance</h3>
                    <p>
                        Customised Website Design and Development</p>
                    <div class="viewProject">
                        <a href="https://www.globalairenergy.com" target="_blank">View Project</a></div>
                </span></li>
            <div class="clear slider1Image">
            </div>
        </ul>
    </div>
</div>
<div class="floatLeft Services">
    <div class="ServicesLeft floatLeft">
    </div>
    <div class="ServicesRight floatRight">
    </div>
    <div class="ServicesBox floatLeft">
        <a href="#" class="WebSolutionsIcon floatLeft" title="Web Solutions"></a>
        <div class="floatLeft ServicesText">
            <h1 class="Orange">
                Web Solutions</h1>
            <p class="Gray">
                iST web solutions made easy. If its web design, an online store, logo design or
                a content management system..,</p>
            <div class="ServicesReadmore floatLeft">
                <a href="#">read more...</a></div>
        </div>
    </div>
    <div class="ServicesDivider floatLeft">
    </div>
    <div class="ServicesBox floatLeft">
        <a href="#" class="WebSeo floatLeft" title="Web Solutions"></a>
        <div class="floatLeft ServicesText">
            <h1 class="Orange">
                Web Presence</h1>
            <p class="Gray">
                Be seen online today. iST offers page optimisation so you can be seen on the web!
                This includes SEO, online media, Newsletters & Blogs.</p>
            <div class="ServicesReadmore floatLeft">
                <a href="#">read more...</a></div>
        </div>
    </div>
    <div class="ServicesDivider floatLeft">
    </div>
    <div class="ServicesBox floatLeft">
        <a href="#" class="Webdomains floatLeft" title="Web Solutions"></a>
        <div class="floatLeft ServicesText">
            <h1 class="Orange">
                Web Products</h1>
            <p class="Gray">
                iST web solutions made easy. If its payment online payments, web hosting, domain
                name registration, online security..,</p>
            <div class="ServicesReadmore floatLeft">
                <a href="#">read more...</a></div>
        </div>
    </div>
</div>
<div class="floatLeft DomainRegistration">
    <span><strong>Domain</strong> Registration</span>
    <p class="Black">
        Get a web address now! $69 / 2 years</p>
    <table width="100%" border="0" cellspacing="5" cellpadding="0">
        <tr>
            <td class="Black">
                www.
            </td>
            <td  colspan="2" nowrap="nowrap">
                <asp:TextBox ID="txtDomainName" runat="server"  ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDomainName" runat="server" ControlToValidate="txtDomainName"
                    ToolTip="Please enter Domain Name" Display="Dynamic" ValidationGroup="lnkcheckavailability">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regexDomainName" runat="server" 
                    ControlToValidate="txtDomainName" ToolTip="Spaces are not allowed" Display="Dynamic"
                    ValidationExpression="[\w]+" ValidationGroup="lnkcheckavailability">*</asp:RegularExpressionValidator>    
            </td>
           <td colspan="1"><asp:Image ID="imgCheck" Visible="false"  runat="server"/></td>   
            
        </tr>
        <tr>
            <td >
                &nbsp;
            </td>
            <td >
                <asp:DropDownList ID="ddlASAP" runat="server" >
                    <asp:ListItem Value="all">------</asp:ListItem>
                    <asp:ListItem Value="all">Search All</asp:ListItem>
                    <asp:ListItem Value=".com.au" Selected="True">.com.au</asp:ListItem>
                    <asp:ListItem Value=".net.au">.net.au</asp:ListItem>
                    <asp:ListItem Value=".org.au">.org.au</asp:ListItem>
                    <asp:ListItem Value=".id.au">.id.au</asp:ListItem>
                    <asp:ListItem Value=".com">.com</asp:ListItem>
                    <asp:ListItem Value=".net">.net</asp:ListItem>
                    <asp:ListItem Value=".asia">.asia</asp:ListItem>
                    <asp:ListItem Value=".in">.in</asp:ListItem>
                    <asp:ListItem Value=".info">.info</asp:ListItem>
                    <asp:ListItem Value=".org">.org</asp:ListItem>
                    <asp:ListItem Value=".tel">.tel</asp:ListItem>
                    <asp:ListItem Value=".mobi">.mobi</asp:ListItem>
                    <asp:ListItem Value=".biz">.biz</asp:ListItem>
                    <asp:ListItem Value=".tv">.tv</asp:ListItem>
                    <asp:ListItem Value=".cc">.cc</asp:ListItem>
                    <asp:ListItem Value=".co.nz">.co.nz</asp:ListItem>
                    <asp:ListItem Value=".net.nz">.net.nz</asp:ListItem>
                    <asp:ListItem Value=".eu">.eu</asp:ListItem>
                    <asp:ListItem Value=".be">.be</asp:ListItem>
                    <asp:ListItem Value=".it">.it</asp:ListItem>
                    <asp:ListItem Value=".co.uk">.co.uk</asp:ListItem>
                </asp:DropDownList>
               
            </td>
            
            <td width="157" align="left"  valign="top" class="checkAvailability"  >
               <asp:LinkButton ID="lnkCheck" Text="check availability" onclick="lnkCheck_Click" ValidationGroup="lnkcheckavailability"  runat="server" ></asp:LinkButton>
            </td>
        </tr>
    </table>
    <div class="floatLeft paymentSolution">
        <p class="Orange">
            <strong>All in One Online payment Solution</strong></p>
        <p>
            iST is working with NAB to offer our clients an easy and streamlined process for
            applying for an online payment account & transacting online.</p>
    </div>
</div>
<div class="floatLeft WebDesign">
    <div class="WebDesignLeft floatLeft">
    </div>
    <div class="WebDesignRight floatRight">
    </div>
    <div>
        <ul id="parent2">
            <li>
                <div class="WebDesignText floatLeft">
                    <h1 class="Orange">
                        iSolutions</h1>
                    <span class="Orange">Web Design</span>
                    <p>
                        Don't make me think! Great design allows your customers to find information they
                        need quickly and painlessly as well as being something pretty to look at. Our user
                        centric design approach ensures content is accessible and usable without impacting
                        on design flair!</p>
                </div>
                <div class="floatRight WebDesignIcon wactive">
                </div>
            </li>
            <li>
                <div class="WebDesignText floatLeft">
                    <h1 class="Orange">
                        iSolutions</h1>
                    <span class="Orange">Web Design</span>
                    <p>
                        Don't make me think! Great design allows your customers to find information they
                        need quickly and painlessly as well as being something pretty to look at. Our user
                        centric design approach ensures content is accessible and usable without impacting
                        on design flair!</p>
                </div>
                <div class="floatRight WebDesignIcon">
                </div>
            </li>
        </ul>
    </div>

</div>
<div class="floatRight QuickContact">
    <span><strong>Quick</strong> Contact</span>
    <asp:UpdatePanel ID="updatepanel" runat="server">
        <ContentTemplate>
            <table width="20%" border="0" cellspacing="2" cellpadding="1">
                <tr>
                    <td align="left" valign="top" colspan="2">
                        <asp:DropDownList ID="ddlQuote" runat="server" Style="border-bottom: #ccc 1px solid;
                            border-left: #ccc 1px solid; width: 189px; height: 26px; border-top: #ccc 1px solid;
                            border-right: #ccc 1px solid;">
                            <asp:ListItem Text="Quote" Value="Quote">For an instant quote</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvQuote" runat="server" ErrorMessage="Please Select Quote."
                            ToolTip="Please Select Quote." ControlToValidate="ddlQuote" CssClass="ErrorStar"
                            Display="Dynamic">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" colspan="2">
                        <label for="ContactForm3_txtName">
                            <asp:TextBox ID="name" runat="server" Width="180px" ToolTip="Please enter your name."
                                CssClass="TextBox"></asp:TextBox>
                        </label>
                        <cc1:TextBoxWatermarkExtender ID="AjaxtxtURLFeed" runat="server" TargetControlID="name"
                            WatermarkCssClass="watermarked" WatermarkText="Your name">
                        </cc1:TextBoxWatermarkExtender>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ToolTip="Please enter your name."
                            ControlToValidate="name" CssClass="ErrorStar" Display="Dynamic" ValidationGroup="lnkFeedAdd">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" colspan="2">
                        <!--Email:-->
                        <label for="ContactForm3_txtName">
                            <asp:TextBox ID="emailAddress" Width="180px" runat="server" ToolTip="Please enter your email address."
                                CssClass="TextBox"></asp:TextBox></label>
                        <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="emailAddress"
                            WatermarkCssClass="watermarked" WatermarkText="Your email">
                        </cc1:TextBoxWatermarkExtender>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredEmail" runat="server" ErrorMessage="Please enter your email address."
                            ToolTip="Please enter your email address." ValidationGroup="lnkFeedAdd" ControlToValidate="emailAddress"
                            CssClass="ErrorStar" Display="Dynamic">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                ID="RegularExpressionEmailValidator" ValidationGroup="lnkFeedAdd" runat="server"
                                ErrorMessage="Please enter a valid email address." ToolTip="Please enter a valid email address."
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="emailAddress"
                                CssClass="ErrorStar" Display="Dynamic">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td width="100px" align="left" valign="top">
                        <!--Address 1:-->
                        <label for="ContactForm3_txtName">
                            <asp:TextBox ID="addressLine1" Width="90px" runat="server" ToolTip="Please enter your Phone."
                                CssClass="TextBox"></asp:TextBox></label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ToolTip="Please Enter Phone."
                            ValidationGroup="lnkFeedAdd" ControlToValidate="addressLine1" CssClass="ErrorStar"
                            Display="Dynamic">*</asp:RequiredFieldValidator>
                        <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" TargetControlID="addressLine1"
                            WatermarkCssClass="watermarked" WatermarkText="Phone">
                        </cc1:TextBoxWatermarkExtender>
                    </td>
                    <td align="right" valign="top">
                        <asp:DropDownList ID="ddlPhone" Style="border-bottom: #ccc 1px solid; border-left: #ccc 1px solid;
                            padding-bottom: 0px; margin: 0px; padding-left: 0px; width: 65px; padding-right: 0px;
                            height: 25px; border-top: #ccc 1px solid; border-right: #ccc 1px solid; padding-top: 0px;"
                            runat="server">
                            <asp:ListItem>ASAP</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" colspan="2">
                        <!--Address 2:-->
                        <label for="ContactForm3_txtName">
                            <asp:TextBox ID="addressLine2" Width="180px" runat="server" CssClass="TextBox"></asp:TextBox></label>
                        <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" runat="server" TargetControlID="addressLine2"
                            WatermarkCssClass="watermarked" WatermarkText="Business name">
                        </cc1:TextBoxWatermarkExtender>
                        <label for="ContactForm3_txtMessage">
                            <!--Message-->
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter your message."
                                ToolTip="Please enter your message." ControlToValidate="message" CssClass="ErrorStar"
                                Display="Dynamic">*</asp:RequiredFieldValidator>
                            <!--<asp:TextBox Visible="false" ID="message" runat="server" TextMode="MultiLine" ToolTip="Please enter your message"
                                CssClass="TextArea"></asp:TextBox>-->
                        </label>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="2">
                        <asp:CheckBox ID="chkNewsletter" runat="server" class="checkbox floatLeft" /><label
                            for="chkNewsletter" class="checkboxLabel">&nbsp;Sign up for Newsletter</label>
                        <!-- <asp:Label ID="lblNewsletter" runat="server"></asp:Label> -->
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2" valign="top">
                        <asp:Button ID="btnSubmit" runat="server" class="QuickContactSend" ValidationGroup="lnkFeedAdd"
                            OnClick="btnSubmit_Click" Text="Submit" />
                        <asp:ValidationSummary ID="vdsRS" runat="server" ShowMessageBox="False" ShowSummary="False"
                            HeaderText="Please follow below Suggestion(s):" ValidationGroup="lnkFeedAdd" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
<div class="clearBoth NeedComplete">
    <div class="NeedCompleteText floatLeft" style="background: none;">
        <h1 class="Orange">
            <span class="Black"><strong>Our Shopping cart </strong></span>solution</h1>
        <p>
            iST designs ecommerce shopping cart websites that will have your business open 24/7.
            Our easy to manage solution means you can update your products any time of day..,
        </p>
        <div class="readMore floatLeft">
            <a href="#">Read More</a></div>
    </div>
    <div class="NeedCompleteText floatLeft">
        <h1 class="Orange">
            <span class="Black"><strong>Know what you’re </strong></span>getting</h1>
        <p>
            Not only do you own the code, but you own the solution. When consulting with a web
            agency make sure you know what you are getting!..
        </p>
        <div class="readMore floatLeft">
            <a href="#">Read More</a></div>
    </div>
    <div class="NeedCompleteText floatLeft">
        <h1 class="Orange">
            <span class="Black">Are you seen </span>online?</h1>
        <p>
            What is the point of having a website if your brand cant be seen? iST offers a range
            of solutions to get your online presence. Our solutions are your solution.
        </p>
        <div class="readMore floatLeft">
            <a href="#">Read More</a></div>
    </div>
    
</div>
--%>