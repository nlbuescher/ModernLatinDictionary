<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:d="http://www.apple.com/DTDs/DictionaryService-1.0.rng"
				xmlns="http://www.w3.org/1999/xhtml"
				version="1.0">
<xsl:output method="xml" encoding="UTF-8" indent="no"
	doctype-public="-//W3C//DTD XHTML 1.1//EN"
	doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" />
<xsl:variable name="la_pronunciation" select="'0'"></xsl:variable>
<xsl:variable name="la_text" select="'1'"></xsl:variable>

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

<xsl:template match="d:dictionary">
	<xsl:copy>
		<html>
			<head>
				<title>Modern Latin Dictionary</title>
			</head>
			<body>
				<xsl:apply-templates select="@*|node()" />
			</body>
		</html>
	</xsl:copy>
</xsl:template>

<xsl:template match="*[@d:pr='CL_IPA']">
	<xsl:if test="$la_pronunciation = '0'">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:if>
</xsl:template>

<xsl:template match="*[@d:pr='VA_IPA']">
    <xsl:if test="$la_pronunciation = '1'">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:if>
</xsl:template>

<xsl:template match="J">
	<xsl:if test="$la_text = '0'">
		<xsl:copy>I</xsl:copy>
	</xsl:if>
	<xsl:if test="$la_text = '1'">
		<xsl:copy>I</xsl:copy>
	</xsl:if>
	<xsl:if test="$la_text = '2'">
		<xsl:copy>J</xsl:copy>
	</xsl:if>
</xsl:template>

<xsl:template match="j">
	<xsl:if test="$la_text = '0'">
		<xsl:copy>i</xsl:copy>
	</xsl:if>
	<xsl:if test="$la_text = '1'">
		<xsl:copy>i</xsl:copy>
	</xsl:if>
	<xsl:if test="$la_text = '2'">
		<xsl:copy>j</xsl:copy>
	</xsl:if>
</xsl:template>

<xsl:template match="v">
	<xsl:if test="$la_text = '0'">
		<xsl:copy>u</xsl:copy>
	</xsl:if>
	<xsl:if test="$la_text = '1'">
		<xsl:copy>v</xsl:copy>
	</xsl:if>
	<xsl:if test="$la_text = '2'">
		<xsl:copy>v</xsl:copy>
	</xsl:if>
</xsl:template>

<xsl:template match="U">
	<xsl:if test="$la_text = '0'">
		<xsl:copy>V</xsl:copy>
	</xsl:if>
	<xsl:if test="$la_text = '1'">
		<xsl:copy>U</xsl:copy>
	</xsl:if>
	<xsl:if test="$la_text = '2'">
		<xsl:copy>U</xsl:copy>
	</xsl:if>
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
