<?xml version="1.0" encoding="UTF-8"?>

<!--
    | ### `ocr.image.xsl`
    |
    | * [source](__CURFILE__)
    |
    | Retrieve the image for an element
    |
    -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:ocr="http://github.com/kba/ocr-fileformat/xmlns"
    exclude-result-prefixes="#all"
    xpath-default-namespace="http://www.w3.org/1999/xhtml"
    xmlns="http://www.tei-c.org/ns/1.0"
    version="2.0">

    <!--
        |
        | #### `ocr:image($format, $element)`
        |
        | * `$format`: A valid [OCR format](#ocr-formats)
        | * `$element`: The element with image
        |
        -->
    <xsl:function name="ocr:image" as="xs:string">
        <xsl:param name="format" as="xs:string"/>
        <xsl:param name="elem" as="item()"/>
        <xsl:choose>
            <xsl:when test="$format = 'hocr'">
                <xsl:value-of select="ocr:hocr-image($elem)"/>
            </xsl:when>
            <!-- TODO -->
            <xsl:when test="$format = 'alto'">
                <xsl:value-of select="ocr:hocr-alto($elem)"/>
            </xsl:when>
        </xsl:choose>
    </xsl:function>

    <!--
        |
        | #### `ocr:hocr-image($element)`
        |
        | * `$element`: The element with image
        |
        -->
    <xsl:function name="ocr:hocr-image" as="xs:string">
        <xsl:param name="elem" as="item()"/>
        <!-- TODO -->
        <xsl:value-of select="translate(tokenize($titleAtt, '\s+')[2], '&quot;;', '')"/>
    </xsl:function>

</xsl:stylesheet>

