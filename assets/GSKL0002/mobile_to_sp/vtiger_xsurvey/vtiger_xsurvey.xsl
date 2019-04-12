<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>customercode,salesmancode,productcode,prodhiercode,beatcode,reasoncode</prkey>
			<xsl:apply-templates select="/collections/documentcontent/NewDataSet/Table" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xsurveydocinfo>
			<fromid><xsl:value-of select="/collections/documentcontent/NewDataSet/Table/ForumCode" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>xSurvey</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_xsurveydocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/NewDataSet/Table">
		<vtiger_xsurvey>
			<surveycode><xsl:value-of select="surveycode" /></surveycode>
			<longitude><xsl:value-of select="longitude" /></longitude>
			<latitude><xsl:value-of select="latitude" /></latitude>
			<beatname>
				<beatcode><xsl:value-of select="beatname" /></beatcode>
			</beatname>
			<surveyremark><xsl:value-of select="surveyremark" /></surveyremark>
			<cf_xsurvey_distributor_id><xsl:value-of select="ForumCode" /></cf_xsurvey_distributor_id>
			<cf_salesman>
				<salesmancode><xsl:value-of select="cf_salesman" /></salesmancode>
				<salesman><xsl:value-of select="cf_salesman" /></salesman>
				<salesmanid><xsl:value-of select="cf_salesman" /></salesmanid>
			</cf_salesman>
			<cf_retailer>
				<customercode><xsl:value-of select="cf_retailer" /></customercode>
			</cf_retailer>
			<complaint><xsl:value-of select="complaint" /></complaint>
			<image_name><xsl:value-of select="image_name" /></image_name>
			<cf_product>
				<productcode><xsl:value-of select="cf_product" /></productcode>
			</cf_product>
			<cf_product_hierachy>
				<prodhiercode><xsl:value-of select="cf_product_hierachy" /></prodhiercode>
			</cf_product_hierachy>
			<distributor_id><xsl:value-of select="distid" /></distributor_id>
			<no_of_calls><xsl:value-of select="no_of_calls" /></no_of_calls>
			<productive_calls><xsl:value-of select="productive_calls" /></productive_calls>
			<lines_sold><xsl:value-of select="lines_sold" /></lines_sold>
			<secondary_sales><xsl:value-of select="secondary_sales" /></secondary_sales>
			<customer_type><xsl:value-of select="customer_type" /></customer_type>
			<transaction_start_time><xsl:value-of select="transaction_start_time" /></transaction_start_time>
			<transaction_end_time><xsl:value-of select="transaction_end_time" /></transaction_end_time>
			<session_id><xsl:value-of select="session_id" /></session_id>
			<cf_xsurvey_end_customer><xsl:value-of select="cf_xsurvey_end_customer" /></cf_xsurvey_end_customer>
			<surveyaction><xsl:value-of select="surveyaction" /></surveyaction>
			<cf_cpy_salesman>
				<cpysalesmancode><xsl:value-of select="cf_cpy_salesman" /></cpysalesmancode>
				<cpysalesman><xsl:value-of select="cf_cpy_salesman" /></cpysalesman>
			</cf_cpy_salesman>
			<xreasonid>
				<reasoncode><xsl:value-of select="ReasonCode" /></reasoncode>
				<reason><xsl:value-of select="ReasonCode" /></reason>
			</xreasonid>
			<formtype/>
		</vtiger_xsurvey>
	</xsl:template>
</xsl:stylesheet>