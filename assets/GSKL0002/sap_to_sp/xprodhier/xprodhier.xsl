<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>prodhiercode,levelname</prkey>
			<xsl:apply-templates select="/collections/documentcontent/st_xprodhier" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xprodhierdocinfo>
			<fromid><xsl:value-of select="fromid" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication>sap</sourceapplication>
			<destapplication>sp</destapplication>
			<documenttype>xProdHier</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_xprodhierdocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/st_xprodhier">
		<vtiger_xprodhier>
			<prodhiername><xsl:value-of select="prodhiername" /></prodhiername>
			<prodhiercode><xsl:value-of select="prodhiercode" /></prodhiercode>
			<cf_xprodhier_parent>
				<prodhiercode><xsl:value-of select="parent" /></prodhiercode>
			</cf_xprodhier_parent>
			<cf_xprodhier_level>
				<levelcode><xsl:value-of select="level" /></levelcode>
				<levelname><xsl:value-of select="level" /></levelname>
			</cf_xprodhier_level>
			<cf_xprodhier_active><xsl:value-of select="active" /></cf_xprodhier_active>
			<cf_xprodhier_track_inventory>Yes</cf_xprodhier_track_inventory>
		</vtiger_xprodhier>
	</xsl:template>
</xsl:stylesheet>