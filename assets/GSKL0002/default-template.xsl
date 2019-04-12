<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<xsl:apply-templates select="/collections/documentcontent/st_otp_details" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		
	</xsl:template>
	<xsl:template match="/collections/documentcontent/st_otp_details">

	</xsl:template>
</xsl:stylesheet>