<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:d="http://www.apple.com/DTDs/DictionaryService-1.0.rng"
                version="1.0">
<xsl:output method="xml" encoding="UTF-8" indent="no"
            doctype-public="-//W3C//DTD XHTML 1.1//EN"
            doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" />

<xsl:variable name="la_text" select="'2'"/>
<xsl:variable name="la_pronunciation" select="'0'"/>

<!--
    This XSL does the followings.
    - Add style to mask unwanted pronunciation formats.
    - $pronunciation is externally provided.
-->

<!--<xsl:template match="*[@d:pr='']">
    <xsl:if test="$pronunciation = '0'">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:if>
</xsl:template>-->

<xsl:template match="*[@d:pr='CL_IPA']">
    <xsl:if test="$la_pronunciation = '0'">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:if>
</xsl:template>

<xsl:template match="*[@d:pr='VA_IPA']">
    <xsl:if test="$la_pronunciation = '0'">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:if>
</xsl:template>

<xsl:template match="*[@id='J']">
    <xsl:message><xsl:value-of select="$la_text"/></xsl:message>
    <xsl:if test="$la_text = '0'"><xsl:text>I</xsl:text></xsl:if>
    <xsl:if test="$la_text = '1'"><xsl:text>I</xsl:text></xsl:if>
    <xsl:if test="$la_text = '2'"><xsl:text>J</xsl:text></xsl:if>
</xsl:template>

<xsl:template match="*[@id='j']">
    <xsl:message><xsl:value-of select="$la_text"/></xsl:message>
    <xsl:if test="$la_text = '0'"><xsl:text>i</xsl:text></xsl:if>
    <xsl:if test="$la_text = '1'"><xsl:text>i</xsl:text></xsl:if>
    <xsl:if test="$la_text = '2'"><xsl:text>j</xsl:text></xsl:if>
</xsl:template>

<xsl:template match="*[@id='v']">
    <xsl:message><xsl:value-of select="$la_text"/></xsl:message>
    <xsl:if test="$la_text = '0'"><xsl:text>u</xsl:text></xsl:if>
    <xsl:if test="$la_text = '1'"><xsl:text>v</xsl:text></xsl:if>
    <xsl:if test="$la_text = '2'"><xsl:text>v</xsl:text></xsl:if>
</xsl:template>

<xsl:template match="*[@id='U']">
    <xsl:message><xsl:value-of select="$la_text"/></xsl:message>
    <xsl:if test="$la_text = '0'"><xsl:text>V</xsl:text></xsl:if>
    <xsl:if test="$la_text = '1'"><xsl:text>U</xsl:text></xsl:if>
    <xsl:if test="$la_text = '2'"><xsl:text>U</xsl:text></xsl:if>
</xsl:template>

<!-- <xsl:template match="span[@class='column']">
    <xsl:if test="$display-column = '1'">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:if>
</xsl:template> -->

<xsl:template match="span[@class='picture']">
    <xsl:if test="$display-picture = '1'">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:if>
</xsl:template>


<!--
    Default rule for all other tags
-->
<xsl:template match="@*|node()">
    <xsl:copy>
        <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
</xsl:template>

</xsl:stylesheet>
