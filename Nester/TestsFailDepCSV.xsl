<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-16" />
    <xsl:template match="/">
        <xsl:text>Name</xsl:text>
        <xsl:text disable-output-escaping="yes">&#9;</xsl:text>
        <xsl:text>Id</xsl:text>
        <xsl:for-each select="//TestCase">
            <xsl:text disable-output-escaping="yes">&#9;</xsl:text>
            <xsl:value-of select="position()"/>
        </xsl:for-each>
        <xsl:text disable-output-escaping="yes">&#13;</xsl:text>
        <xsl:for-each select="//TestCase">
            <xsl:sort select="@name"/>
            <xsl:value-of select="@name"/>
            <xsl:variable name="name1" select="@name"/>
            <xsl:text disable-output-escaping="yes">&#9;</xsl:text>
            <xsl:value-of select="position()"/>
            <xsl:for-each select="//TestCase">
                <xsl:sort select="@name"/>
                <xsl:variable name="name2" select="@name"/>
                <xsl:text disable-output-escaping="yes">&#9;</xsl:text>
                <xsl:if test="$name1=$name2">
                    <xsl:value-of select="count(//KilledMutation/MutatedValue[FailedTestCase[@name=$name1] and count(*)=1])"/>
                </xsl:if>
                <xsl:if test="$name1!=$name2">
                    <xsl:value-of select="count(//KilledMutation/MutatedValue[FailedTestCase[@name=$name1] and FailedTestCase[@name=$name2]])"/>
                </xsl:if>
            </xsl:for-each>
            <xsl:text disable-output-escaping="yes">&#9;</xsl:text>
            <xsl:value-of select="count(//KilledMutation/MutatedValue[FailedTestCase[@name=$name1]])"/>
        <xsl:text disable-output-escaping="yes">&#13;</xsl:text>
        </xsl:for-each>
        <xsl:text disable-output-escaping="yes">&#9;</xsl:text>
        <xsl:text disable-output-escaping="yes">&#9;</xsl:text>
        <xsl:for-each select="//TestCase">
            <xsl:sort select="@name"/>
            <xsl:variable name="name1" select="@name"/>
            <xsl:value-of select="count(//KilledMutation/MutatedValue[FailedTestCase[@name=$name1]])"/>
        <xsl:text disable-output-escaping="yes">&#9;</xsl:text>
        </xsl:for-each>
        <xsl:text>Total</xsl:text>
    </xsl:template>
</xsl:stylesheet>
