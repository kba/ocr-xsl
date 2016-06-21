<!-- Create numeric single-step range (for yearly date ranges) -->
<xsl:template name="poor-mans-from-to"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="fieldname" select="publishDate"/>
    <xsl:param name="from"/>
    <xsl:param name="to"/>
    <xsl:param name="suffix" select="''"/>
    <field>
        <xsl:attribute name="name">
            <xsl:value-of select="$fieldname"/>
        </xsl:attribute>
        <xsl:value-of select="concat($from, $suffix)"/>
    </field>
    <xsl:if test="$to - $from > 1">
        <xsl:call-template name="poor-mans-from-to">
            <xsl:with-param name="fieldname" select="$fieldname"/>
            <xsl:with-param name="from" select="$from + 1"/>
            <xsl:with-param name="to" select="$to"/>
            <xsl:with-param name="suffix" select="$suffix"/>
        </xsl:call-template>
    </xsl:if>
</xsl:template>
