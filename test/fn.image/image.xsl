<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ocr="http://github.com/kba/ocr-fileformat/xmlns"
    exclude-result-prefixes="#all"
    version="2.0">
    <xsl:output 
        media-type="text/plain"
        omit-xml-declaration="yes"/>
    <xsl:param name="format"/>
    <xsl:param name="id"/>
    <xsl:strip-space elements="*"/>
    <xsl:include href="../../xsl-functions/ocr.image.xsl"/>
    <xsl:template match="*[@id = $id] | *[@ID = $id]">
#<xsl:value-of select="@id"/><xsl:value-of select="@ID"/>
image: <xsl:value-of select="ocr:image($format, .)"/>
    </xsl:template>
    <xsl:template match="/">
        <xsl:apply-templates select="//*[@id = $id] | //*[@ID = $id]"/>
    </xsl:template>
</xsl:stylesheet>
