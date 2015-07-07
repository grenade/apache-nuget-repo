<?xml version="1.0" ?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
  <xsl:template match="/">
    <html lang="en" class="static">
      <head>
        <link href="style.css" rel="stylesheet" />
      </head>
      <body>
        <div id="content-wrapper">
          <header class="main">
            <!--
            <div id="logo"></div>
            -->
          </header>
            <nav class="main"></nav>
            <div id="body" role="main">
              <xsl:for-each select="//a:entry" xmlns:a="http://www.w3.org/2005/Atom" xmlns:d="http://schemas.microsoft.com/ado/2007/08/dataservices" xmlns:m="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata">
                <ol id="searchResults">
                  <li>
                    <section class="package ">
                      <div class="side">
                        <xsl:element name="a">
                          <xsl:attribute name="href"><xsl:value-of select="a:id"/>.<xsl:value-of select="m:properties/d:Version"/>.html</xsl:attribute>
                          <xsl:attribute name="title">View more about <xsl:value-of select="a:id"/></xsl:attribute>
                          <xsl:element name="img">
                            <xsl:attribute name="src"><xsl:value-of select="m:properties/d:IconUrl"/></xsl:attribute>
                            <xsl:attribute name="alt"><xsl:value-of select="a:id"/> icon</xsl:attribute>
                            <xsl:attribute name="style">width: 50px; height: 50px;</xsl:attribute>
                          </xsl:element>
                        </xsl:element>
                      </div>
                      <div class="main">
                        <header>
                          <div class="nuget-badge-small">
                            <code><span>C:\&gt; </span>choco install <xsl:value-of select="a:id"/></code>
                          </div>
                          <h1>
                            <xsl:element name="a">
                              <xsl:attribute name="href"><xsl:value-of select="a:id"/>.<xsl:value-of select="m:properties/d:Version"/>.html</xsl:attribute>
                              <xsl:value-of select="a:title"/>
                              <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
                              <xsl:value-of select="m:properties/d:Version"/>
                            </xsl:element>
                          </h1>
                          <h2>By:</h2>
                          <ul class="owners">
                            <!--
                            <li><a href="/profiles/ferventcoder" title="ferventcoder">ferventcoder</a></li>
                            -->
                          </ul>
                        </header>
                        <p><xsl:value-of select="a:summary"/></p>
                        <footer>
                          <div class="tags">
                            <h2>Tags</h2>
                            <ul class="tags">
                              <!--<li><a href="/packages?q=nuget" title="Search for nuget">nuget</a></li>-->
                            </ul>
                          </div>
                        </footer>
                      </div>
                    </section>
                  </li>
                </ol>
              </xsl:for-each>
              <div class="clear-fix"><!--Sad Panda--></div>
            </div>
        </div>
        <!--
        <div id="layout-footer" class="group">
          <footer id="footer"></footer>
        </div>
        -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
