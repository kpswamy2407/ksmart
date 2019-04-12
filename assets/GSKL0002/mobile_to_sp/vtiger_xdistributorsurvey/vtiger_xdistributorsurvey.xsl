<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>customercode,salesmancode,beatcode,reasoncode</prkey>
			<xsl:apply-templates select="/collections/documentcontent/NewDataSet/Table" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xdistributorsurveydocinfo>
			<fromid><xsl:value-of select="fromid" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>xDistributorSurvey</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_xdistributorsurveydocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/NewDataSet/Table">
		<vtiger_xdistributorsurvey>
			<distributorsurveycode><xsl:value-of select="distributorsurveycode" /></distributorsurveycode>
			<distributor_code><xsl:value-of select="distributor_code" /></distributor_code>
			<xsalesmanid>
				<salesmancode><xsl:value-of select="xsalesmanid" /></salesmancode>
				<salesman><xsl:value-of select="xsalesmanid" /></salesman>
				<salesmanid><xsl:value-of select="xsalesmanid" /></salesmanid>
			</xsalesmanid>
			<xretailerid>
				<customercode><xsl:value-of select="xretailerid" /></customercode>
			</xretailerid>
			<xbeatid>
				<beatcode><xsl:value-of select="xbeatid" /></beatcode>
			</xbeatid>
			<latitude><xsl:value-of select="latitude" /></latitude>
			<longitude><xsl:value-of select="longitude" /></longitude>
			<session_id><xsl:value-of select="session_id" /></session_id>
			<image_name><xsl:value-of select="image_name" /></image_name>
			<customer_type><xsl:value-of select="customer_type" /></customer_type>
			<transaction_start_time><xsl:value-of select="transaction_start_time" /></transaction_start_time>
			<transaction_end_time><xsl:value-of select="transaction_end_time" /></transaction_end_time>
			<remark><xsl:value-of select="remark" /></remark>
			<complaint><xsl:value-of select="complaint" /></complaint>
			<xreasonid>
				<reasoncode><xsl:value-of select="ReasonCode" /></reasoncode>
				<reason><xsl:value-of select="ReasonCode" /></reason>
			</xreasonid>
		</vtiger_xdistributorsurvey>
	</xsl:template>
</xsl:stylesheet>