<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:urlRewrite="dc:urlRewrite">
  <xsl:output method="xml" indent="yes" encoding="utf-8" omit-xml-declaration="yes"/>
  <!-- Find the root node called Menus 
       and call MenuListing for its children -->
  <xsl:template match="/Menus">
    <MenuItems>
      <xsl:call-template name="MenuListing" />
    </MenuItems>
  </xsl:template>

  <!-- Allow for recusive child node processing -->
  <xsl:template name="MenuListing">

    <xsl:apply-templates select="Menu" />

  </xsl:template>


  <xsl:template match="Menu">

    <!--<html>
      <body>
        <table>
          <MenuItem>
            <tr>
              <td>

                <xsl:attribute name="Text">
                  <xsl:value-of select="Name"/>
                </xsl:attribute>
                <xsl:attribute name="ToolTip">
                  <xsl:value-of select="Description"/>
                </xsl:attribute>
                <xsl:attribute name="NavigateUrl">
                  <xsl:value-of select="urlRewrite:CatalogUrl(CategoryId, Name)"/>
                </xsl:attribute>
                <xsl:attribute name="Value">
                  <xsl:value-of select="CategoryId"/>
                </xsl:attribute>
              </td>
            </tr>
            <tr>
              <td>
                <xsl:if test="count(Menu) > 0">

                  <xsl:call-template name="MenuListing" />


                </xsl:if>
              </td>
            </tr>
          </MenuItem>
        </table>
      </body>
    </html>-->
    <MenuItem>

      <!-- Convert Menu child elements to MenuItem attributes -->

      <xsl:attribute name="Text">
        <xsl:value-of select="Name"/>
      </xsl:attribute>
      <xsl:attribute name="ToolTip">
        <xsl:value-of select="Description"/>
      </xsl:attribute>
      <xsl:attribute name="NavigateUrl">
        <xsl:value-of select="urlRewrite:CatalogUrl(CategoryId, Name)"/>
      </xsl:attribute>
      <xsl:attribute name="Value">
        <xsl:value-of select="CategoryId"/>
      </xsl:attribute>


      <!-- Call MenuListing if there are child Menu nodes -->

      <xsl:if test="count(Menu) > 0">
        <xsl:call-template name="MenuListing" />
      </xsl:if>
    </MenuItem>
  </xsl:template>
</xsl:stylesheet>
