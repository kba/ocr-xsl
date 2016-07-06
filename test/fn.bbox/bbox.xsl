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
    <xsl:include href="../../xsl-functions/ocr.bbox.xsl"/>
    <xsl:template match="*[@id = $id] | *[@ID = $id]">
#<xsl:value-of select="@id"/><xsl:value-of select="@ID"/>
left:   <xsl:value-of select="ocr:bbox($format, ., 'left')"/>
right:  <xsl:value-of select="ocr:bbox($format, ., 'right')"/>
top:    <xsl:value-of select="ocr:bbox($format, ., 'top')"/>
bottom: <xsl:value-of select="ocr:bbox($format, ., 'bottom')"/>
height: <xsl:value-of select="ocr:bbox($format, ., 'height')"/>
width:  <xsl:value-of select="ocr:bbox($format, ., 'width')"/>
    </xsl:template>
    <xsl:template match="/">
        <xsl:apply-templates select="//*[@id = $id] | //*[@ID = $id]"/>
    </xsl:template>
</xsl:stylesheet>
