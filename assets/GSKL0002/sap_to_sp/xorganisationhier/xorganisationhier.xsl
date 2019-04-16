<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>organisationhiercode,levelname</prkey>
			<xsl:apply-templates select="/collections/documentcontent/st_xorganisationhier" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xorganisationhierdocinfo>
			<fromid><xsl:value-of select="fromid" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication>sap</sourceapplication>
			<destapplication>sp</destapplication>
			<documenttype>xOrganisationHier</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_xorganisationhierdocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/st_xorganisationhier">
		<vtiger_xorganisationhier>
			<organisationhiername><xsl:value-of select="organisationhiername" /></organisationhiername>
			<organisationhiercode><xsl:value-of select="organisationhiercode" /></organisationhiercode>
			<cf_xorganisationhier_parent>
				<organisationhiercode><xsl:value-of select="parent" /></organisationhiercode>
			</cf_xorganisationhier_parent>
			<cf_xorganisationhier_level>
				<levelcode><xsl:value-of select="level" /></levelcode>
				<levelname><xsl:value-of select="level" /></levelname>
			</cf_xorganisationhier_level>
			<cf_xorganisationhier_active>1</cf_xorganisationhier_active>
		</vtiger_xorganisationhier>
	</xsl:template>
</xsl:stylesheet>