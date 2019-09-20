<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImageGallaryOTSD.ascx.cs"
    Inherits="Etech.CMS.Web.controls.content.ImageGallaryOTSD"%>

<link rel="stylesheet" type="text/css" href="http://onthespotdetailing.com.au/App_Themes/css/jquery.ad-gallery.css" />

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>

<script type="text/javascript" src="http://onthespotdetailing.com.au/JavaScript/jquery.ad-gallery.js"></script>

<script type="text/javascript" src="http://onthespotdetailing.com.au/JavaScript/s3Slider.js"></script>

<script type="text/javascript">
    $(function() {
        $('img.image1').data('ad-desc', 'Whoa! This description is set through elm.data("ad-desc") instead of using the longdesc attribute.<br>And it contains <strong>H</strong>ow <strong>T</strong>o <strong>M</strong>eet <strong>L</strong>adies... <em>What?</em> That aint what HTML stands for? Man...');
        $('img.image1').data('ad-title', 'Title through $.data');
        $('img.image4').data('ad-desc', 'This image is wider than the wrapper, so it has been scaled down');
        $('img.image5').data('ad-desc', 'This image is higher than the wrapper, so it has been scaled down');
        var galleries = $('.ad-gallery').adGallery();
        $('#switch-effect').change(
      function() {
          galleries[0].settings.effect = $(this).val();
          return false;
      }
    );
        $('#toggle-slideshow').click(
      function() {

          galleries[0].slideshow.toggle();
          return false;
      }
    );
        $('#toggle-description').click(
      function() {
          if (!galleries[0].settings.description_wrapper) {
              galleries[0].settings.description_wrapper = $('#descriptions');
          } else {
              galleries[0].settings.description_wrapper = false;
          }
          return false;
      }
    );
    });
  </script>

<style type="text/css">
    .example
    {
        border: 1px solid #CCC;
        background: #f2f2f2;
        padding: 10px;
    }
    ul
    {
        list-style-image: url(list-style.gif);
    }
    pre
    {
        font-family: "Lucida Console" , "Courier New" , Verdana;
        border: 1px solid #CCC;
        background: #f2f2f2;
        padding: 10px;
    }
    code
    {
        font-family: "Lucida Console" , "Courier New" , Verdana;
        margin: 0;
        padding: 0;
    }
    #gallery
    {
        padding: 30px; /*background: #e1eef5;*/
    }
    #descriptions
    {
        position: relative;
        height: 50px;
        background: #EEE;
        margin-top: 10px;
        width: 640px;
        padding: 10px;
        overflow: hidden;
    }
    #descriptions .ad-image-description
    {
        position: absolute;
    }
    #descriptions .ad-image-description .ad-description-title
    {
        display: block;
    }
</style>

<div id="container">
    <h1>
        GALLERY</h1>
    <div id="gallery" class="ad-gallery">
        <%--<div class="ad-controls">
        </div>--%>
        <div class="ad-nav">
            <div class="ad-thumbs">
                <ul class="ad-thumb-list">
                    <asp:Repeater ID="rptImageGallary" runat="server">
                        <ItemTemplate>
                            <li><a href='<%# DataBinder.Eval(Container.DataItem, "ImageFile")%>'>
                                <img src='<%# DataBinder.Eval(Container.DataItem, "ThumbImageFile")%>'
                                    style="height: 77px; width: 77px;"/>
                                <%--<asp:Label ID="lblCaption" CssClass="galleryCaption" Text='<%# DataBinder.Eval(Container.DataItem, "Caption")%>'
                                    runat="server"></asp:Label>--%>
                            </a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>
        <div class="ad-image-wrapper">
        </div>
    </div>
</div>
