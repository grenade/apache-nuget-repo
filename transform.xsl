<?xml version="1.0" ?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
  <xsl:template match="/">
    <feed>
      <xsl:for-each select="p:package/p:metadata" xmlns:p="http://schemas.microsoft.com/packaging/2010/07/nuspec.xsd">
        <xsl:element name="entry">
          <xsl:element name="id"><xsl:value-of select="p:id"/></xsl:element>
          <xsl:element name="title">
            <xsl:attribute name="type">text</xsl:attribute>
            <xsl:value-of select="p:title"/>
          </xsl:element>
          <xsl:element name="summary">
            <xsl:attribute name="type">text</xsl:attribute>
            <xsl:value-of select="p:summary"/></xsl:element>
          <xsl:element name="author">
            <xsl:element name="name"><xsl:value-of select="p:authors"/></xsl:element>
          </xsl:element>
          <xsl:element name="link">
            <xsl:attribute name="rel">edit-media</xsl:attribute>
            <xsl:attribute name="title">V2FeedPackage</xsl:attribute>
            <xsl:attribute name="href">Packages(Id='<xsl:value-of select="p:id"/>',Version='<xsl:value-of select="p:version"/>')/$value</xsl:attribute>
          </xsl:element>
          <xsl:element name="link">
            <xsl:attribute name="rel">edit</xsl:attribute>
            <xsl:attribute name="title">V2FeedPackage</xsl:attribute>
            <xsl:attribute name="href">Packages(Id='<xsl:value-of select="p:id"/>',Version='<xsl:value-of select="p:version"/>')</xsl:attribute>
          </xsl:element>
          <xsl:element name="category">
            <xsl:attribute name="term">NuGetGallery.V2FeedPackage</xsl:attribute>
            <xsl:attribute name="scheme">http://schemas.microsoft.com/ado/2007/08/dataservices/scheme</xsl:attribute>
          </xsl:element>
          <xsl:element name="content">
            <xsl:attribute name="type">application/zip</xsl:attribute>
            <xsl:attribute name="src">http://chocolatey.org/api/v2/package/<xsl:value-of select="p:id"/>/<xsl:value-of select="p:version"/></xsl:attribute>
          </xsl:element>
        </xsl:element>
        <m:properties xmlns:m="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata" xmlns:d="http://schemas.microsoft.com/ado/2007/08/dataservices">
          <d:Version><xsl:value-of select="p:version"/></d:Version>
          <d:Copyright><xsl:value-of select="p:copyright"/></d:Copyright>
          <!--
          <d:Created m:type="Edm.DateTime"></d:Created>
          <d:Dependencies></d:Dependencies>
          -->
          <d:Description><xsl:value-of select="p:description"/></d:Description>
          <!--
          <d:DownloadCount m:type="Edm.Int32"></d:DownloadCount>
          -->
          <d:GalleryDetailsUrl>http://gallery-host/packages/<xsl:value-of select="p:id"/>/<xsl:value-of select="p:version"/></d:GalleryDetailsUrl>
          <d:IconUrl><xsl:value-of select="p:iconUrl"/></d:IconUrl>
          <!--
          <d:IsLatestVersion m:type="Edm.Boolean"></d:IsLatestVersion>
          <d:IsAbsoluteLatestVersion m:type="Edm.Boolean"></d:IsAbsoluteLatestVersion>
          <d:IsPrerelease m:type="Edm.Boolean"></d:IsPrerelease>
          <d:Language m:null="true"></d:Language>
          <d:Published m:type="Edm.DateTime"></d:Published>
          -->
          <d:LicenseUrl><xsl:value-of select="p:licenseUrl"/></d:LicenseUrl>
          <!--
          <d:PackageHash></d:PackageHash>
          <d:PackageHashAlgorithm></d:PackageHashAlgorithm>
          <d:PackageSize m:type="Edm.Int64"></d:PackageSize>
          -->
          <d:ProjectUrl><xsl:value-of select="p:projectUrl"/></d:ProjectUrl>
          <!--
          <d:ProjectSourceUrl m:null="true"></d:ProjectSourceUrl>
          <d:PackageSourceUrl m:null="true"></d:PackageSourceUrl>
          <d:DocsUrl m:null="true"></d:DocsUrl>
          <d:MailingListUrl m:null="true"></d:MailingListUrl>
          <d:BugTrackerUrl m:null="true"></d:BugTrackerUrl>
          -->
          <d:ReportAbuseUrl>http://gallery-host/package/ReportAbuse/<xsl:value-of select="p:id"/>/<xsl:value-of select="p:version"/></d:ReportAbuseUrl>
          <d:ReleaseNotes><xsl:value-of select="p:releaseNotes"/></d:ReleaseNotes>
          <!--
          <d:PackageStatus></d:PackageStatus>
          <d:PackageSubmittedStatus m:null="true"></d:PackageSubmittedStatus>
          <d:RequireLicenseAcceptance m:type="Edm.Boolean"></d:RequireLicenseAcceptance>
          -->
          <d:Tags xml:space="preserve"><xsl:value-of select="p:tags"/></d:Tags>
          <d:Title><xsl:value-of select="p:title"/></d:Title>
          <!--
          <d:VersionDownloadCount m:type="Edm.Int32"></d:VersionDownloadCount>
          -->
        </m:properties>
      </xsl:for-each>
      <xsl:for-each select="p:package/p:metadata" xmlns:p="http://schemas.microsoft.com/packaging/2011/08/nuspec.xsd">
        <xsl:element name="entry">
          <xsl:element name="id"><xsl:value-of select="p:id"/></xsl:element>
          <xsl:element name="title">
            <xsl:attribute name="type">text</xsl:attribute>
            <xsl:value-of select="p:title"/>
          </xsl:element>
          <xsl:element name="summary">
            <xsl:attribute name="type">text</xsl:attribute>
            <xsl:value-of select="p:summary"/></xsl:element>
          <xsl:element name="author">
            <xsl:element name="name"><xsl:value-of select="p:authors"/></xsl:element>
          </xsl:element>
          <xsl:element name="link">
            <xsl:attribute name="rel">edit-media</xsl:attribute>
            <xsl:attribute name="title">V2FeedPackage</xsl:attribute>
            <xsl:attribute name="href">Packages(Id='<xsl:value-of select="p:id"/>',Version='<xsl:value-of select="p:version"/>')/$value</xsl:attribute>
          </xsl:element>
          <xsl:element name="link">
            <xsl:attribute name="rel">edit</xsl:attribute>
            <xsl:attribute name="title">V2FeedPackage</xsl:attribute>
            <xsl:attribute name="href">Packages(Id='<xsl:value-of select="p:id"/>',Version='<xsl:value-of select="p:version"/>')</xsl:attribute>
          </xsl:element>
          <xsl:element name="category">
            <xsl:attribute name="term">NuGetGallery.V2FeedPackage</xsl:attribute>
            <xsl:attribute name="scheme">http://schemas.microsoft.com/ado/2007/08/dataservices/scheme</xsl:attribute>
          </xsl:element>
          <xsl:element name="content">
            <xsl:attribute name="type">application/zip</xsl:attribute>
            <xsl:attribute name="src">http://chocolatey.org/api/v2/package/<xsl:value-of select="p:id"/>/<xsl:value-of select="p:version"/></xsl:attribute>
          </xsl:element>
        </xsl:element>
        <m:properties xmlns:m="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata" xmlns:d="http://schemas.microsoft.com/ado/2007/08/dataservices">
          <d:Version><xsl:value-of select="p:version"/></d:Version>
          <d:Copyright><xsl:value-of select="p:copyright"/></d:Copyright>
          <!--
          <d:Created m:type="Edm.DateTime"></d:Created>
          <d:Dependencies></d:Dependencies>
          -->
          <d:Description><xsl:value-of select="p:description"/></d:Description>
          <!--
          <d:DownloadCount m:type="Edm.Int32"></d:DownloadCount>
          -->
          <d:GalleryDetailsUrl>http://gallery-host/packages/<xsl:value-of select="p:id"/>/<xsl:value-of select="p:version"/></d:GalleryDetailsUrl>
          <d:IconUrl><xsl:value-of select="p:iconUrl"/></d:IconUrl>
          <!--
          <d:IsLatestVersion m:type="Edm.Boolean"></d:IsLatestVersion>
          <d:IsAbsoluteLatestVersion m:type="Edm.Boolean"></d:IsAbsoluteLatestVersion>
          <d:IsPrerelease m:type="Edm.Boolean"></d:IsPrerelease>
          <d:Language m:null="true"></d:Language>
          <d:Published m:type="Edm.DateTime"></d:Published>
          -->
          <d:LicenseUrl><xsl:value-of select="p:licenseUrl"/></d:LicenseUrl>
          <!--
          <d:PackageHash></d:PackageHash>
          <d:PackageHashAlgorithm></d:PackageHashAlgorithm>
          <d:PackageSize m:type="Edm.Int64"></d:PackageSize>
          -->
          <d:ProjectUrl><xsl:value-of select="p:projectUrl"/></d:ProjectUrl>
          <!--
          <d:ProjectSourceUrl m:null="true"></d:ProjectSourceUrl>
          <d:PackageSourceUrl m:null="true"></d:PackageSourceUrl>
          <d:DocsUrl m:null="true"></d:DocsUrl>
          <d:MailingListUrl m:null="true"></d:MailingListUrl>
          <d:BugTrackerUrl m:null="true"></d:BugTrackerUrl>
          -->
          <d:ReportAbuseUrl>http://gallery-host/package/ReportAbuse/<xsl:value-of select="p:id"/>/<xsl:value-of select="p:version"/></d:ReportAbuseUrl>
          <d:ReleaseNotes><xsl:value-of select="p:releaseNotes"/></d:ReleaseNotes>
          <!--
          <d:PackageStatus></d:PackageStatus>
          <d:PackageSubmittedStatus m:null="true"></d:PackageSubmittedStatus>
          <d:RequireLicenseAcceptance m:type="Edm.Boolean"></d:RequireLicenseAcceptance>
          -->
          <d:Tags xml:space="preserve"><xsl:value-of select="p:tags"/></d:Tags>
          <d:Title><xsl:value-of select="p:title"/></d:Title>
          <!--
          <d:VersionDownloadCount m:type="Edm.Int32"></d:VersionDownloadCount>
          -->
        </m:properties>
      </xsl:for-each>
    </feed>
  </xsl:template>
</xsl:stylesheet>
