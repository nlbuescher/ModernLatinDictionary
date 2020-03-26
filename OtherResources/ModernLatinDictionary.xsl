<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:d="http://www.apple.com/DTDs/DictionaryService-1.0.rng"
                version="1.0">

    <xsl:output method="xml" encoding="UTF-8" indent="no"
        doctype-public="-//W3C//DTD XHTML 1.1//EN"
        doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" />

    <xsl:variable name="small_j">
        <xsl:if test="$orthography = '0'"><xsl:text>i</xsl:text></xsl:if>
        <xsl:if test="$orthography = '1'"><xsl:text>i</xsl:text></xsl:if>
        <xsl:if test="$orthography = '2'"><xsl:text>j</xsl:text></xsl:if>
    </xsl:variable>

    <xsl:variable name="big_j">
        <xsl:if test="$orthography = '0'"><xsl:text>I</xsl:text></xsl:if>
        <xsl:if test="$orthography = '1'"><xsl:text>I</xsl:text></xsl:if>
        <xsl:if test="$orthography = '2'"><xsl:text>J</xsl:text></xsl:if>
    </xsl:variable>

    <xsl:variable name="small_v">
        <xsl:if test="$orthography = '0'"><xsl:text>u</xsl:text></xsl:if>
        <xsl:if test="$orthography = '1'"><xsl:text>v</xsl:text></xsl:if>
        <xsl:if test="$orthography = '2'"><xsl:text>v</xsl:text></xsl:if>
    </xsl:variable>

    <xsl:variable name="big_u">
        <xsl:if test="$orthography = '0'"><xsl:text>V</xsl:text></xsl:if>
        <xsl:if test="$orthography = '1'"><xsl:text>U</xsl:text></xsl:if>
        <xsl:if test="$orthography = '2'"><xsl:text>U</xsl:text></xsl:if>
    </xsl:variable>


    <!-- Default rule -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="*[@d:pr='cl']">
        <xsl:if test="$pronunciation = '0'">
            <xsl:copy>
                <xsl:apply-templates select="@*|node()" />
            </xsl:copy>
        </xsl:if>
    </xsl:template>

    <xsl:template match="*[@d:pr='va']">
        <xsl:if test="$pronunciation = '1'">
            <xsl:copy>
                <xsl:apply-templates select="@*|node()" />
            </xsl:copy>
        </xsl:if>
    </xsl:template>

    <xsl:template match="j">
        <xsl:value-of select="$small_j"/>
    </xsl:template>

    <xsl:template match="J">
        <xsl:value-of select="$big_j"/>
    </xsl:template>

    <xsl:template match="v">
        <xsl:value-of select="$small_v"/>
    </xsl:template>

    <xsl:template match="U">
        <xsl:value-of select="$big_u"/>
    </xsl:template>


<!--    <xsl:template name="string-replace-all">-->
<!--        <xsl:param name="text" />-->
<!--        <xsl:param name="replace" />-->
<!--        <xsl:param name="by" />-->
<!--        <xsl:choose>-->
<!--            <xsl:when test="$text = '' or $replace = ''or not($replace)" >-->
<!--                &lt;!&ndash; Prevent this routine from hanging &ndash;&gt;-->
<!--                <xsl:value-of select="$text" />-->
<!--            </xsl:when>-->
<!--            <xsl:when test="contains($text, $replace)">-->
<!--                <xsl:value-of select="substring-before($text,$replace)" />-->
<!--                <xsl:value-of select="$by" />-->
<!--                <xsl:call-template name="string-replace-all">-->
<!--                    <xsl:with-param name="text" select="substring-after($text,$replace)" />-->
<!--                    <xsl:with-param name="replace" select="$replace" />-->
<!--                    <xsl:with-param name="by" select="$by" />-->
<!--                </xsl:call-template>-->
<!--            </xsl:when>-->
<!--            <xsl:otherwise>-->
<!--                <xsl:value-of select="$text" />-->
<!--            </xsl:otherwise>-->
<!--        </xsl:choose>-->
<!--    </xsl:template>-->

</xsl:stylesheet>
