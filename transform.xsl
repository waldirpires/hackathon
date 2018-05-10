<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>
<xsl:template match="/">

<topic id="Sample Page">
<!--<xsl:for-each select="./body/chl/*">-->
         <title><xsl:value-of select="./book"/></title>
<!--</xsl:for-each> -->         
    
</topic>

</xsl:template>

<xsl:template match="chl">
    <li>Name - <xsl:value-of select="."/> </li>
</xsl:template>

</xsl:stylesheet>