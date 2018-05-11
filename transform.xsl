<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">

        <topic id="Sample Page">
            <xsl:for-each select="doc/body/chl">
                <title><xsl:value-of select="title"/></title>
            </xsl:for-each>        

            <xsl:for-each select="//p">
                <p><xsl:value-of select="."/></p>
            </xsl:for-each>        

            <body>
                <simpletable relcolwidth="1* 2*">
                    <sthead>

                        <xsl:for-each select="///thead/row/entry/tp">
                            <stentry><xsl:value-of select="."/></stentry>
                        </xsl:for-each>        

                    </sthead>

                    <xsl:for-each select="///tbody/row">
                        <strow>
                        <xsl:for-each select="entry">
                            <stentry><xsl:value-of select="tp"/></stentry>
                        </xsl:for-each>
                        </strow>

                    </xsl:for-each>        

                </simpletable>
<pre><xsl:value-of select="//preform"/></pre>

<p><xsl:value-of select="//doc/body/p"/></p>
<ul>
<xsl:for-each select="/doc/body/chl/list/list-item">
<li><xsl:value-of select="p"/></li>
                    </xsl:for-each>        
                    </ul>

                </body>              
                    
    <note type="tip"><xsl:value-of select="/doc/body/chl/note">
    
    </xsl:value-of></note>
        </topic>

    </xsl:template>


</xsl:stylesheet>