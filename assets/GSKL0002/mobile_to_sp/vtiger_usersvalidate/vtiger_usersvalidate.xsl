<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>user_name</prkey>
			<xsl:apply-templates select="/collections/documentcontent/NewDataSet/Table" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_usersdocinfo>
			<fromid><xsl:value-of select="/collections/documentcontent/NewDataSet/Table/dist_code" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>xUserValidate</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_usersdocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/NewDataSet/Table">
		<vtiger_users>
			<user_name><xsl:value-of select="username" /></user_name>
			<user_password><xsl:value-of select="password" /></user_password>
			<salesmancode><xsl:value-of select="SalesmanCode" /></salesmancode>
			<xsalesmanid><xsl:value-of select="SalesmanId" /></xsalesmanid>
			<distributorcode><xsl:value-of select="dist_code" /></distributorcode>
			<distributor_id><xsl:value-of select="distid" /></distributor_id>
			<validate>UserValidate</validate>
		</vtiger_users>
	</xsl:template>
</xsl:stylesheet>