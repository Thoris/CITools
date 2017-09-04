<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:preserve-space elements="th" />
	<xsl:template match="/">
		<html>
			<body>
				<table border="1" width="100%" cellSpacing="1" cellPadding="1" >
					<tr align="center">
						<th align="left">Name</th>
						<th>Id</th>
						<xsl:for-each select="//TestCase">
							<th>&lt;<xsl:value-of select="position()"/>&gt;</th>
						</xsl:for-each>
						<th/>
					</tr>
					<xsl:for-each select="//TestCase">
						<xsl:sort select="@name"/>
						<tr align="center">
							<th align="left">
								<xsl:value-of select="@name"/>
							</th>
							<xsl:variable name="name1" select="@name"/>
							<th>&lt;<xsl:value-of select="position()"/>&gt;</th>
							<xsl:for-each select="//TestCase">
								<xsl:sort select="@name"/>
								<xsl:variable name="name2" select="@name"/>
								<xsl:if test="$name1=$name2">
									<td bgColor="#cccccc">
										<xsl:value-of select="count(//KilledMutation/MutatedValue[FailedTestCase[@name=$name1] and count(*)=1])"/>
									</td>
								</xsl:if>
								<xsl:if test="$name1!=$name2">
									<td>
										<xsl:value-of select="count(//KilledMutation/MutatedValue[FailedTestCase[@name=$name1] and FailedTestCase[@name=$name2]])"/>
									</td>
								</xsl:if>
							</xsl:for-each>
							<th>
								<xsl:value-of select="count(//KilledMutation/MutatedValue[FailedTestCase[@name=$name1]])"/>
							</th>
						</tr>
					</xsl:for-each>
					<tr align="center">
						<th> </th>	
						<th/>
						<xsl:for-each select="//TestCase">
							<xsl:sort select="@name"/>
							<xsl:variable name="name1" select="@name"/>
							<th>
								<xsl:value-of select="count(//KilledMutation/MutatedValue[FailedTestCase[@name=$name1]])"/>
							</th>
						</xsl:for-each>
						<th>Total</th>
					</tr>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
