<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>taxcode</prkey>
			<xsl:apply-templates select="/collections/documentcontent/st_xtax" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xtaxdocinfo>
			<fromid><xsl:value-of select="fromid" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication>sap</sourceapplication>
			<destapplication>sp</destapplication>
			<documenttype>xTax</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_xtaxdocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/st_xtax">
		<vtiger_xtax>
			<taxdescription><xsl:value-of select="taxdescription" /></taxdescription>
			<taxcode><xsl:value-of select="taxcode" /></taxcode>
			<cf_xtax_lst_percentage><xsl:value-of select="lst_percentage" /></cf_xtax_lst_percentage>
			<lst_tax_group><xsl:value-of select="lst_tax_group" /></lst_tax_group>
			<cf_xtax_cst_percentage><xsl:value-of select="cst_percentage" /></cf_xtax_cst_percentage>
			<cst_tax_group><xsl:value-of select="cst_tax_group" /></cst_tax_group>
			<cf_xtax_active><xsl:value-of select="active" /></cf_xtax_active>
			<cf_xtax_status>Approved</cf_xtax_status>
			<cf_xtax_next_stage_name>Publish</cf_xtax_next_stage_name>
		</vtiger_xtax>
	</xsl:template>
</xsl:stylesheet>