<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:ocr="http://github.com/kba/ocr-fileformat/xmlns"
    exclude-result-prefixes="#all"
    version="2.0"
    xpath-default-namespace="http://www.w3.org/1999/xhtml"
    xmlns="http://www.tei-c.org/ns/1.0">

    <xsl:function name="ocr:get_bbox_x0" as="xs:integer">
        <xsl:param name="elem" as="xs:string"/>
        <xsl:variable name="preStrip" select="replace($inTitle, '^.*bbox ', '')"/>
        <xsl:variable name="postStrip" select="replace($preStrip, ';.*', '')"/>
        <xsl:sequence select="for $x in tokenize($postStrip, '\s+') return xs:integer($x)"/>
    </xsl:function>

    <xsl:function name="ocr:get_hocr_bbox" as="xs:integer*">
        <xsl:param name="inTitle" as="xs:string"/>
        <xsl:variable name="preStrip" select="replace($inTitle, '^.*bbox ', '')"/>
        <xsl:variable name="postStrip" select="replace($preStrip, ';.*', '')"/>
        <xsl:sequence select="for $x in tokenize($postStrip, '\s+') return xs:integer($x)"/>
    </xsl:function>

    <xsl:function name="ocr:get_imgName" as="xs:string">
        <xsl:param name="titleAtt" as="xs:string"/>
        <xsl:value-of select="translate(tokenize($titleAtt, '\s+')[2], '&quot;;', '')"/>
    </xsl:function>
</xsl:stylesheet>
