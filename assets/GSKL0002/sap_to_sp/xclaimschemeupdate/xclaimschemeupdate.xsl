<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<xsl:apply-templates select="/collections/documentcontent/st_xdistributor" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xclaimschemedocinfo>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<fromid><xsl:value-of select="fromid" /></fromid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<createddate><xsl:value-of select="documentdate" /></createddate>
			<documenttype>ClaimUpdate</documenttype>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
		</vtiger_xclaimschemedocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/st_xdistributor">
		<vtiger_xclaimscheme>
			<next_stage_name>Sent</next_stage_name>
			<xclaimschemeid><xsl:value-of select="internal_reference" /></xclaimschemeid>
		</vtiger_xclaimscheme>
	</xsl:template>
</xsl:stylesheet>