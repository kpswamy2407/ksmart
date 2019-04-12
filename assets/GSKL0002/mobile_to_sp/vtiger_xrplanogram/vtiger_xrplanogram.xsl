<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>customercode,salesmancode,beatcode,transactionseriescode,productcode,prodhiercode,godown_code,reasoncode</prkey>
			<xsl:apply-templates select="/collections/documentcontent/planogram/NewDataSet/Table" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xrplanograminfo>
			<fromid><xsl:value-of select="fromid" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>xrplanogram</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_xrplanograminfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/planogram/NewDataSet/Table">
		<vtiger_xrplanogram>
			<subject><xsl:value-of select="planogramid" /></subject>
			<compliance_type_1><xsl:value-of select="compliance_type_1" /></compliance_type_1>
			<compliance_type_2><xsl:value-of select="compliance_type_2" /></compliance_type_2>
			<compliance_type_3><xsl:value-of select="compliance_type_3" /></compliance_type_3>
			<compliance_type_4><xsl:value-of select="compliance_type_4" /></compliance_type_4>
			<compliance_type_5><xsl:value-of select="compliance_type_5" /></compliance_type_5>
			<xcomsalesmanid>			
				<cpysalesmancode><xsl:value-of select="companysalesmancode" /></cpysalesmancode>
				<cpysalesman><xsl:value-of select="companysalesmanid" /></cpysalesman>
			</xcomsalesmanid>
			<xsalesmanid>
				<cf_xsalesman_distributor/>
				<salesmancode><xsl:value-of select="salesmancode" /></salesmancode>
				<salesman><xsl:value-of select="salesmancode" /></salesman>
				<salesmanid><xsl:value-of select="salesmanid" /></salesmanid>
				<crmid/>
			</xsalesmanid>
			<xbeatid>
				<beatcode><xsl:value-of select="beatid" /></beatcode>
				<beatname><xsl:value-of select="beatid" /></beatname>
				<crmid/>
			</xbeatid>
			<xretailerid>
				<customername><xsl:value-of select="customerid" /></customername>
				<customercode><xsl:value-of select="customerid" /></customercode>
				<crmid/>
			</xretailerid>
			<customer_type><xsl:value-of select="customer_type" /></customer_type>
			<distributorcode><xsl:value-of select="dist_code" /></distributorcode>
			<transaction_start_time><xsl:value-of select="transaction_start_time" /></transaction_start_time>
			<status>Draft</status>
			<next_stage_name>Create</next_stage_name>
			<planogram_image><xsl:value-of select="planogram_image" /></planogram_image>
			<planogram_image_transaction><xsl:value-of select="planogram_image_transaction" /></planogram_image_transaction>
			<session_id><xsl:value-of select="session_id" /></session_id>
			<transaction_end_time><xsl:value-of select="transaction_end_time" /></transaction_end_time>
			<xdistributorid>
				<distributorcode><xsl:value-of select="dist_code" /></distributorcode>
				<distributorname><xsl:value-of select="dist_code" /></distributorname>
			</xdistributorid>
		</vtiger_xrplanogram>
	</xsl:template>
</xsl:stylesheet>