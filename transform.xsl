<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="metadata">
    <entry>
      <id><xsl:value-of select="id"/></id>
      <title type="text"><xsl:value-of select="title"/></title>
      <summary type="text"><xsl:value-of select="summary"/></summary>
      <updated></updated>
      <author>
        <name><xsl:value-of select="authors"/></name>
      </author>
      <link rel="edit-media" title="V2FeedPackage">
        <xsl:attribute name="href">Packages(Id='<xsl:value-of select="id"/>',Version='<xsl:value-of select="version"/>')/$value</xsl:attribute>
      </link>
      <link rel="edit" title="V2FeedPackage">
        <xsl:attribute name="href">Packages(Id='<xsl:value-of select="id"/>',Version='<xsl:value-of select="version"/>')</xsl:attribute>
      </link>
      <category term="NuGetGallery.V2FeedPackage" scheme="http://schemas.microsoft.com/ado/2007/08/dataservices/scheme" />
      <content type="application/zip">
        <xsl:attribute name="src">http://chocolatey.org/api/v2/package/<xsl:value-of select="id"/>/<xsl:value-of select="version"/></xsl:attribute>
      </content>
      <m:properties xmlns:m="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata" xmlns:d="http://schemas.microsoft.com/ado/2007/08/dataservices">
        <d:Version><xsl:value-of select="version"/></d:Version>
        <d:Copyright><xsl:value-of select="copyright"/></d:Copyright>
        <!--
        <d:Created m:type="Edm.DateTime"></d:Created>
        <d:Dependencies></d:Dependencies>
        -->
        <d:Description><xsl:value-of select="description"/></d:Description>
        <!--
        <d:DownloadCount m:type="Edm.Int32"></d:DownloadCount>
        -->
        <d:GalleryDetailsUrl>http://gallery-host/packages/<xsl:value-of select="id"/>/<xsl:value-of select="version"/></d:GalleryDetailsUrl>
        <d:IconUrl><xsl:value-of select="iconUrl"/></d:IconUrl>
        <!--
        <d:IsLatestVersion m:type="Edm.Boolean"></d:IsLatestVersion>
        <d:IsAbsoluteLatestVersion m:type="Edm.Boolean"></d:IsAbsoluteLatestVersion>
        <d:IsPrerelease m:type="Edm.Boolean"></d:IsPrerelease>
        <d:Language m:null="true"></d:Language>
        <d:Published m:type="Edm.DateTime"></d:Published>
        -->
        <d:LicenseUrl><xsl:value-of select="licenseUrl"/></d:LicenseUrl>
        <!--
        <d:PackageHash></d:PackageHash>
        <d:PackageHashAlgorithm></d:PackageHashAlgorithm>
        <d:PackageSize m:type="Edm.Int64"></d:PackageSize>
        -->
        <d:ProjectUrl><xsl:value-of select="projectUrl"/></d:ProjectUrl>
        <!--
        <d:ProjectSourceUrl m:null="true"></d:ProjectSourceUrl>
        <d:PackageSourceUrl m:null="true"></d:PackageSourceUrl>
        <d:DocsUrl m:null="true"></d:DocsUrl>
        <d:MailingListUrl m:null="true"></d:MailingListUrl>
        <d:BugTrackerUrl m:null="true"></d:BugTrackerUrl>
        -->
        <d:ReportAbuseUrl>http://gallery-host/package/ReportAbuse/<xsl:value-of select="id"/>/<xsl:value-of select="version"/></d:ReportAbuseUrl>
        <d:ReleaseNotes><xsl:value-of select="releaseNotes"/></d:ReleaseNotes>
        <!--
        <d:PackageStatus></d:PackageStatus>
        <d:PackageSubmittedStatus m:null="true"></d:PackageSubmittedStatus>
        <d:RequireLicenseAcceptance m:type="Edm.Boolean"></d:RequireLicenseAcceptance>
        -->
        <d:Tags xml:space="preserve"><xsl:value-of select="tags"/></d:Tags>
        <d:Title><xsl:value-of select="title"/></d:Title>
        <!--
        <d:VersionDownloadCount m:type="Edm.Int32"></d:VersionDownloadCount>
        -->
      </m:properties>
    </entry>
  </xsl:template>
</xsl:stylesheet>