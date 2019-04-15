<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<xsl:apply-templates select="/collections/documentcontent/st_vsm" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<st_vsmdocinfo>
			<fromid><xsl:value-of select="fromid" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>st_vsm</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
		</st_vsmdocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/st_vsm">
		<st_vsms>
			<st_vsm>
				<dist_id><xsl:value-of select="dist_id" /></dist_id>
				<dist_code><xsl:value-of select="dist_code" /></dist_code>
				<salesman_id><xsl:value-of select="salesman_id" /></salesman_id>
				<salesman_code><xsl:value-of select="salesman_code" /></salesman_code>
				<transaction_date><xsl:value-of select="transaction_date" /></transaction_date>
				<first_level><xsl:value-of select="first_level" /></first_level>
				<second_level><xsl:value-of select="second_level" /></second_level>
				<third_level><xsl:value-of select="third_level" /></third_level>
				<image_name><xsl:value-of select="image_name" /></image_name>
			</st_vsm>
		</st_vsms>
	</xsl:template>
</xsl:stylesheet>