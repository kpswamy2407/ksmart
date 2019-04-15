<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<xsl:apply-templates select="/collections/documentcontent/vtiger_xdistdeviceregistrations/vtiger_xdistdeviceregistration" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xdistdeviceregistrationdocinfo>
			<fromid><xsl:value-of select="fromid" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>vtiger_xdistdeviceregistrations</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_xdistdeviceregistrationdocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/vtiger_xdistdeviceregistrations/vtiger_xdistdeviceregistration">
		<vtiger_xdistdeviceregistrations>
			<vtiger_xdistdeviceregistration>
				<distributorid><xsl:value-of select="distributorid" /></distributorid>
				<salesmanid><xsl:value-of select="salesmanid" /></salesmanid>
				<clientid><xsl:value-of select="clientid" /></clientid>
				<cdkey><xsl:value-of select="cdkey" /></cdkey>
				<deviceuniquekey><xsl:value-of select="deviceuniquekey" /></deviceuniquekey>
				<access_token><xsl:value-of select="access_token" /></access_token>
				<client_version><xsl:value-of select="client_version" /></client_version>
				<imeino><xsl:value-of select="imeino" /></imeino>
			</vtiger_xdistdeviceregistration>
		</vtiger_xdistdeviceregistrations>
	</xsl:template>
</xsl:stylesheet>