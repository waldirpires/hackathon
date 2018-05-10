<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>
<xsl:template match="/">

<topic id="Sample Page">
    <title><xsl:value-of select="/body/chl/title"/></title>
</topic>

</xsl:template>
</xsl:stylesheet>