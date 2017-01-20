<?xml version="1.0" encoding="UTF-8"?>
<!--
    | ### `ocr.bbox.xsl`
    |
    | * [source](__CURFILE__)
    |
    | Retrieve the bounding box of an element
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
        | #### `ocr:bbox($format, $element, $coord)`
        |
        | * `$format`: A valid [OCR format](#ocr-formats)
        | * `$element`: The element to bound
        | * `$coord`: A valid [box coordinate](#box-coordinates)
        |
        -->
    <xsl:function name="ocr:bbox" as="xs:integer">
        <xsl:param name="format" as="xs:string"/>
        <xsl:param name="elem" as="item()"/>
        <xsl:param name="coord" as="xs:string"/>
        <xsl:choose>
            <xsl:when test="$format = 'hocr'"><xsl:value-of select="ocr:hocr-bbox($elem, $coord)"/></xsl:when>
            <xsl:when test="$format = 'alto'"><xsl:value-of select="ocr:alto-bbox($elem, $coord)"/></xsl:when>
            <xsl:when test="$format = 'abbyy'"><xsl:value-of select="ocr:abbyy-bbox($elem, $coord)"/></xsl:when>
            <xsl:otherwise>
              <xsl:message terminate="yes">
                Invalid format: '<xsl:value-of select="$format"/>
              </xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <!--
        |
        | #### `ocr:hocr-bbox($element, $coord)`
        | 
        | * `$element`: The element to bound
        | * `$coord`: A valid [box coordinate](#box-coordinates)
        |
        -->
    <xsl:function name="ocr:hocr-bbox" as="xs:integer">
        <xsl:param name="elem" as="item()"/>
        <xsl:param name="coord" as="xs:string"/>
        <xsl:variable name="preStrip" select="replace(normalize-space($elem/@title), '^.*bbox ', '')"/>
        <xsl:variable name="postStrip" select="replace($preStrip, ';.*', '')"/>
        <!-- <xsl:variable name="positions" select="ocr:hocr-bbox($elem)" /> -->
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
            <xsl:otherwise>
              <xsl:message terminate="yes">
                Invalid box coordinate: '<xsl:value-of select="$coord"/>
              </xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <!--
        |
        | #### `ocr:abbyy-bbox($slement, $coord)`
        |
        | * `$element`: The element to bound
        | * `$coord`: A valid [box coordinate](#box-coordinates)
        |
        -->
    <xsl:function name="ocr:abbyy-bbox" as="xs:integer">
        <xsl:param name="elem"/>
        <xsl:param name="coord" as="xs:string"/>
        <xsl:choose>
            <xsl:when test="$coord = 'left'"  ><xsl:value-of select="$elem/@l"            /></xsl:when>
            <xsl:when test="$coord = 'top'"   ><xsl:value-of select="$elem/@t"            /></xsl:when>
            <xsl:when test="$coord = 'right'" ><xsl:value-of select="$elem/@r"            /></xsl:when>
            <xsl:when test="$coord = 'bottom'"><xsl:value-of select="$elem/@b"            /></xsl:when>
            <xsl:when test="$coord = 'width'" ><xsl:value-of select="$elem/@r - $elem/@l" /></xsl:when>
            <xsl:when test="$coord = 'height'"><xsl:value-of select="$elem/@b - $elem/@t" /></xsl:when>
            <xsl:otherwise>
              <xsl:message terminate="yes">
                Invalid box coordinate: '<xsl:value-of select="$coord"/>
              </xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>


    <!--
        |
        | #### `ocr:alto-bbox($slement, $coord)`
        |
        | * `$element`: The element to bound
        | * `$coord`: A valid [box coordinate](#box-coordinates)
        |
        -->
    <xsl:function name="ocr:alto-bbox" as="xs:integer">
        <xsl:param name="elem"/>
        <xsl:param name="coord" as="xs:string"/>
        <xsl:choose>
            <xsl:when test="$coord = 'left'"  ><xsl:value-of select="$elem/@HPOS"                 /></xsl:when>
            <xsl:when test="$coord = 'top'"   ><xsl:value-of select="$elem/@VPOS"                 /></xsl:when>
            <xsl:when test="$coord = 'right'" ><xsl:value-of select="$elem/@WIDTH + $elem/@HPOS"  /></xsl:when>
            <xsl:when test="$coord = 'bottom'"><xsl:value-of select="$elem/@HEIGHT + $elem/@VPOS" /></xsl:when>
            <xsl:when test="$coord = 'width'" ><xsl:value-of select="$elem/@WIDTH"                /></xsl:when>
            <xsl:when test="$coord = 'height'"><xsl:value-of select="$elem/@HEIGHT"               /></xsl:when>
            <xsl:otherwise>
              <xsl:message terminate="yes">
                Invalid box coordinate: '<xsl:value-of select="$coord"/>
              </xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

</xsl:stylesheet>
