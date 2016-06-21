<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    >
<!-- BEGIN-INCLUDE poor-mans-split.xsl -->

<!-- Tokenize a string field using 'separator' and output <field> with attribute 'fieldname' for each.  -->
<xsl:template name="poor-mans-split"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="text" select="."/>
    <xsl:param name="separator" select="','"/>
    <xsl:param name="fieldname"/>
    <xsl:choose>
        <xsl:when test="not(contains($text, $separator))">
            <field>
              <xsl:attribute name="name">
                <xsl:value-of select="$fieldname"/>
              </xsl:attribute>
              <xsl:value-of select="normalize-space($text)"/>
            </field>
        </xsl:when>
        <xsl:otherwise>
            <field>
              <xsl:attribute name="name">
                <xsl:value-of select="$fieldname"/>
              </xsl:attribute>
              <xsl:value-of select="normalize-space(substring-before($text, $separator))"/>
            </field>
            <xsl:call-template name="poor-mans-split">
                <xsl:with-param name="text" select="substring-after($text, $separator)"/>
                <xsl:with-param name="fieldname" select="$fieldname"/>
            </xsl:call-template>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<!-- END-INCLUDE -->
</xsl:stylesheet>
