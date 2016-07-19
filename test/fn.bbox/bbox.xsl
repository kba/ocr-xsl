<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ocr="http://github.com/kba/ocr-fileformat/xmlns"
    exclude-result-prefixes="ocr"
    version="2.0">
    <xsl:output 
        indent="yes"
        omit-xml-declaration="yes"/>
    <xsl:param name="format"/>
    <xsl:param name="id"/>
    <xsl:include href="../../xsl-functions/ocr.bbox.xsl"/>
    <xsl:template match="*[@id = $id] | *[@ID = $id]">
      <bbox>
        <left><xsl:value-of select="ocr:bbox($format, ., 'left')"/></left>
        <right><xsl:value-of select="ocr:bbox($format, ., 'right')"/></right>
        <top><xsl:value-of select="ocr:bbox($format, ., 'top')"/></top>
        <bottom><xsl:value-of select="ocr:bbox($format, ., 'bottom')"/></bottom>
        <width><xsl:value-of select="ocr:bbox($format, ., 'width')"/></width>
        <height><xsl:value-of select="ocr:bbox($format, ., 'height')"/></height>
      </bbox>
    </xsl:template>
    <xsl:template match="/">
        <xsl:apply-templates select="//*[@id = $id] | //*[@ID = $id]"/>
    </xsl:template>
</xsl:stylesheet>
