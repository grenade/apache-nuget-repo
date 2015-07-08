<?xml version="1.0" ?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
  <xsl:template match="/">
    <html lang="en" class="static">
      <head>
        <link href="style.css" rel="stylesheet" />
        <xsl:for-each select="p:package/p:metadata" xmlns:p="http://schemas.microsoft.com/packaging/2010/07/nuspec.xsd">
          <title>
            <xsl:value-of select="p:title"/>
            <xsl:value-of select="p:version"/>
          </title>
        </xsl:for-each>
        <xsl:for-each select="p:package/p:metadata" xmlns:p="http://schemas.microsoft.com/packaging/2011/08/nuspec.xsd">
          <title>
            <xsl:value-of select="p:title"/>
            <xsl:value-of select="p:version"/>
          </title>
        </xsl:for-each>
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
              <xsl:for-each select="p:package/p:metadata" xmlns:p="http://schemas.microsoft.com/packaging/2010/07/nuspec.xsd">
                <div id="sideColumn">
                  <xsl:element name="img">
                    <xsl:attribute name="class">logo</xsl:attribute>
                    <xsl:attribute name="src"><xsl:value-of select="p:iconUrl"/></xsl:attribute>
                    <xsl:attribute name="alt"><xsl:value-of select="p:title"/> icon</xsl:attribute>
                  </xsl:element>
                  <nav>
                    <ul class="links">
                      <li>
                        <xsl:element name="a">
                          <xsl:attribute name="href"><xsl:value-of select="p:projectUrl"/></xsl:attribute>
                          <xsl:attribute name="title">
                            Visit the software site to learn more about the software this package installs. Nuspec reference: <projectUrl><xsl:value-of select="p:projectUrl"/></projectUrl>
                          </xsl:attribute>
                          Software Site
                        </xsl:element>
                      </li>
                      <li><span>Package Specific</span></li>
                      <li>
                        <xsl:element name="a">
                          <xsl:attribute name="href">../api/v2/package/<xsl:value-of select="p:id"/>/<xsl:value-of select="p:version"/></xsl:attribute>
                          <xsl:attribute name="title">Download the raw nupkg file.</xsl:attribute>
                          Download
                        </xsl:element>
                      </li>
                    </ul>
                  </nav>
                </div>
                <div id="mainColumn" role="main">
                  <div class="package-page">
                    <div class="hgroup page-heading">
                        <xsl:element name="h1">
                          <xsl:attribute name="title">Nuspec reference: <title><xsl:value-of select="p:title"/></title></xsl:attribute>
                          <xsl:value-of select="p:title"/>
                        </xsl:element>
                        <xsl:element name="h2">
                          <xsl:attribute name="title">Nuspec reference: <version><xsl:value-of select="p:version"/></version></xsl:attribute>
                          <xsl:value-of select="p:version"/>
                        </xsl:element>
                    </div>
                    
                    <!--
                    <a name="description" id="description" title="Nuspec reference: description"></a>
                    -->
                    <p><xsl:value-of select="p:description"/></p>

                    <p>To install <xsl:value-of select="p:id"/>, run the following command from the command line or from PowerShell: </p>
                    <div class="nuget-badge">
                        <p><code><span>C:\&gt; </span>choco install <xsl:value-of select="p:id"/></code></p>
                    </div>

                    <p>To upgrade <xsl:value-of select="p:id"/>, run the following command from the command line or from PowerShell: </p>
                    <div class="nuget-badge">
                        <p><code><span>C:\&gt; </span>choco upgrade <xsl:value-of select="p:id"/></code></p>
                    </div>

                    <!--
                    <a name="authors" id="authors"></a>
                    -->
                    <h3 title="Software authors. Nuspec reference: authors | Specified as comma-separated">Sofware Author(s)</h3>
                    <ul class="authors">
                      <li><xsl:value-of select="p:authors"/></li>
                    </ul>
                    <div class="clear-fix"><!--Sad Panda--></div>

                    <!--
                    <a name="tags" id="tags"></a>
                    -->
                    <h3 title="Nuspec reference: tags | Specified as space-separated">Tags</h3>
                    <ul class="tags">
                      <li><xsl:value-of select="p:tags"/></li>
                    </ul>
                    <div class="clear-fix"><!--Sad Panda--></div>
                    
                    <!--
                    <a name="releasenotes" id="releasenotes"></a>
                    -->
                    <h3 title="Nuspec reference: releaseNotes">Release Notes</h3>
                    <p><xsl:value-of select="p:releaseNotes"/></p>
                    <div class="clear-fix"><!--Sad Panda--></div>
                  </div>
                </div>
              </xsl:for-each>
              <xsl:for-each select="p:package/p:metadata" xmlns:p="http://schemas.microsoft.com/packaging/2011/08/nuspec.xsd">
                <div id="sideColumn">
                  <xsl:element name="img">
                    <xsl:attribute name="class">logo</xsl:attribute>
                    <xsl:attribute name="src"><xsl:value-of select="p:iconUrl"/></xsl:attribute>
                    <xsl:attribute name="alt"><xsl:value-of select="p:title"/> icon</xsl:attribute>
                  </xsl:element>
                  <nav>
                    <ul class="links">
                      <li>
                        <xsl:element name="a">
                          <xsl:attribute name="href"><xsl:value-of select="p:projectUrl"/></xsl:attribute>
                          <xsl:attribute name="title">
                            Visit the software site to learn more about the software this package installs. Nuspec reference: <projectUrl><xsl:value-of select="p:projectUrl"/></projectUrl>
                          </xsl:attribute>
                          Software Site
                        </xsl:element>
                      </li>
                      <li><span>Package Specific</span></li>
                      <li>
                        <xsl:element name="a">
                          <xsl:attribute name="href">../package/<xsl:value-of select="p:id"/>/<xsl:value-of select="p:version"/></xsl:attribute>
                          <xsl:attribute name="title">Download the raw nupkg file.</xsl:attribute>
                          Download
                        </xsl:element>
                      </li>
                    </ul>
                  </nav>
                </div>
                <div id="mainColumn" role="main">
                  <div class="package-page">
                    <div class="hgroup page-heading">
                        <xsl:element name="h1">
                          <xsl:attribute name="title">Nuspec reference: <title><xsl:value-of select="p:title"/></title></xsl:attribute>
                          <xsl:value-of select="p:title"/>
                        </xsl:element>
                        <xsl:element name="h2">
                          <xsl:attribute name="title">Nuspec reference: <version><xsl:value-of select="p:version"/></version></xsl:attribute>
                          <xsl:value-of select="p:version"/>
                        </xsl:element>
                    </div>
                    
                    <!--
                    <a name="description" id="description" title="Nuspec reference: description"></a>
                    -->
                    <p><xsl:value-of select="p:description"/></p>

                    <p>To install <xsl:value-of select="p:id"/>, run the following command from the command line or from PowerShell: </p>
                    <div class="nuget-badge">
                        <p><code><span>C:\&gt; </span>choco install <xsl:value-of select="p:id"/></code></p>
                    </div>

                    <p>To upgrade <xsl:value-of select="p:id"/>, run the following command from the command line or from PowerShell: </p>
                    <div class="nuget-badge">
                        <p><code><span>C:\&gt; </span>choco upgrade <xsl:value-of select="p:id"/></code></p>
                    </div>

                    <!--
                    <a name="authors" id="authors"></a>
                    -->
                    <h3 title="Software authors. Nuspec reference: authors | Specified as comma-separated">Sofware Author(s)</h3>
                    <ul class="authors">
                      <li><xsl:value-of select="p:authors"/></li>
                    </ul>
                    <div class="clear-fix"><!--Sad Panda--></div>

                    <!--
                    <a name="tags" id="tags"></a>
                    -->
                    <h3 title="Nuspec reference: tags | Specified as space-separated">Tags</h3>
                    <ul class="tags">
                      <li><xsl:value-of select="p:tags"/></li>
                    </ul>
                    <div class="clear-fix"><!--Sad Panda--></div>
                    
                    <!--
                    <a name="releasenotes" id="releasenotes"></a>
                    -->
                    <h3 title="Nuspec reference: releaseNotes">Release Notes</h3>
                    <p><xsl:value-of select="p:releaseNotes"/></p>
                    <div class="clear-fix"><!--Sad Panda--></div>
                  </div>
                </div>
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
