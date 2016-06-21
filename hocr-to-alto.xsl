<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:ocr="http://github.com/kba/ocr-fileformat/xmlns"
    exclude-result-prefixes="#all"
    version="2.0"
    >
    <!-- xpath-default-namespace="http://www.w3.org/1999/xhtml" -->
    <!-- xmlns="http://www.tei-c.org/ns/1.0" -->
    <xsl:output omit-xml-declaration="yes" />

    <xsl:include href="./hocr.functions.xsl"/>

    <xsl:template match="*[starts-with(@class, 'ocr_')][@title]">
        <xsl:variable name="format">hocr</xsl:variable>
        <!-- <xsl:message><xsl:value-of select="@*"/></xsl:message> -->
    #<xsl:value-of select="@id"/>
    :: Bounding box
    ::     left:   <xsl:value-of select="ocr:get_bbox(., $format, 'left')"/>
    ::     top:    <xsl:value-of select="ocr:get_bbox(., $format, 'top')"/>
    ::     right:  <xsl:value-of select="ocr:get_bbox(., $format, 'right')"/>
    ::     bottom: <xsl:value-of select="ocr:get_bbox(., $format, 'bottom')"/>
    ::     width:  <xsl:value-of select="ocr:get_bbox(., $format, 'width')"/>
    ::     height: <xsl:value-of select="ocr:get_bbox(., $format, 'height')"/>
    </xsl:template>

</xsl:stylesheet>
