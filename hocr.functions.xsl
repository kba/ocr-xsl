<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:ocr="http://github.com/kba/ocr-fileformat/xmlns"
    exclude-result-prefixes="#all"
    version="2.0"
    xpath-default-namespace="http://www.w3.org/1999/xhtml"
    xmlns="http://www.tei-c.org/ns/1.0">

    <!--
        | ### ocr:get_bbox($element, $format, $coord)
        | * `$element`: The element to bound
        | * `$format`: One of `hocr` or `alto`
        | * `$coord`: One of `left`, `right`, `top`, `bottom`, `width`, `height`
        -->
    <xsl:function name="ocr:get_bbox" as="xs:integer">
        <xsl:param name="elem" as="item()"/>
        <xsl:param name="format" as="xs:string"/>
        <xsl:param name="coord" as="xs:string"/>
        <xsl:choose>
            <xsl:when test="$format = 'hocr'"><xsl:value-of select="ocr:get_hocr_bbox($elem, $coord)"/></xsl:when>
            <xsl:when test="$format = 'alto'"><xsl:value-of select="ocr:get_alto_bbox($elem, $coord)"/></xsl:when>
        </xsl:choose>
    </xsl:function>

    <!--
        | ### ocr:get_hocr_bbox($element, $coord)
        | * `$element`: The element to bound
        | * `$coord`: One of `left`, `right`, `top`, `bottom`, `width`, `height`
        -->
    <xsl:function name="ocr:get_hocr_bbox" as="xs:integer">
        <xsl:param name="elem" as="item()"/>
        <xsl:param name="coord" as="xs:string"/>
        <xsl:variable name="preStrip" select="replace(normalize-space($elem/@title), '^.*bbox ', '')"/>
        <xsl:variable name="postStrip" select="replace($preStrip, ';.*', '')"/>
        <!-- <xsl:variable name="positions" select="ocr:get_hocr_bbox($elem)" /> -->
        <xsl:variable name="positions" select="for $x in tokenize($postStrip, '\s+') return xs:integer($x)"/>
        <!-- <xsl:message> -->
        <!--     <xsl:value-of select="$coord"/> -->
        <!--     <xsl:value-of select="$positions"/> -->
        <!-- </xsl:message> -->
        <xsl:choose>
            <xsl:when test="$coord = 'left'"  ><xsl:value-of select="$positions[1]"                /></xsl:when>
            <xsl:when test="$coord = 'top'"   ><xsl:value-of select="$positions[2]"                /></xsl:when>
            <xsl:when test="$coord = 'right'" ><xsl:value-of select="$positions[3]"                /></xsl:when>
            <xsl:when test="$coord = 'bottom'"><xsl:value-of select="$positions[4]"                /></xsl:when>
            <xsl:when test="$coord = 'width'" ><xsl:value-of select="$positions[3] - $positions[1]"/></xsl:when>
            <xsl:when test="$coord = 'height'"><xsl:value-of select="$positions[4] - $positions[2]"/></xsl:when>
        </xsl:choose>
    </xsl:function>

    <!--
        | ### ocr:get_alto_bbox($slement, $coord)
        | * `$element`: The element to bound
        | * `$coord`: One of `left`, `right`, `top`, `bottom`, `width`, `height`
        -->
    <xsl:function name="ocr:get_alto_bbox" as="xs:integer">
        <xsl:param name="elem"/>
        <xsl:param name="coord" as="xs:string"/>
        <xsl:choose>
            <xsl:when test="$coord = 'left'"  ><xsl:value-of select="$elem/@HPOS"                 /></xsl:when>
            <xsl:when test="$coord = 'top'"   ><xsl:value-of select="$elem/@VPOS"                 /></xsl:when>
            <xsl:when test="$coord = 'right'" ><xsl:value-of select="$elem/@WIDTH - $elem/@HPOS"  /></xsl:when>
            <xsl:when test="$coord = 'bottom'"><xsl:value-of select="$elem/@HEIGHT - $elem/@VPOS" /></xsl:when>
            <xsl:when test="$coord = 'width'" ><xsl:value-of select="$elem/@WIDTH"                /></xsl:when>
            <xsl:when test="$coord = 'height'"><xsl:value-of select="$elem/@HEIGHT"               /></xsl:when>
        </xsl:choose>
    </xsl:function>

    <xsl:function name="ocr:get_imgName" as="xs:string">
        <xsl:param name="titleAtt" as="xs:string"/>
        <xsl:value-of select="translate(tokenize($titleAtt, '\s+')[2], '&quot;;', '')"/>
    </xsl:function>

</xsl:stylesheet>
