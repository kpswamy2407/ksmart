<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>customercode</prkey>
			<xsl:apply-templates select="/collections/documentcontent/NewDataSet/Table" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xretailerdocinfo>
			<fromid><xsl:value-of select="/collections/documentcontent/NewDataSet/Table/ForumCode" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>xRetailerUpdate</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_xretailerdocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/NewDataSet/Table">
		<vtiger_xretailer>
			<latitude><xsl:value-of select="latitude" /></latitude>
			<longitude><xsl:value-of select="longitude" /></longitude>
			<customercode><xsl:value-of select="CustomerID" /></customercode>
			<distributorcode><xsl:value-of select="ForumCode" /></distributorcode>
			<distributor_id><xsl:value-of select="distid" /></distributor_id>
			<retailer>Retailer</retailer>
		</vtiger_xretailer>
	</xsl:template>
</xsl:stylesheet>