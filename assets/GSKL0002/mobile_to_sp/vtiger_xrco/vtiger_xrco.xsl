<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>distributorcode,customercode,bankmastercode,salesmancode,collectionmethodcode,beatcode,transactionseriescode,reasoncode</prkey>
			<xsl:apply-templates select="/collections/documentcontent/col/header/NewDataSet/Table" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xrcodocinfo>
		<fromid><xsl:value-of select="fromid" /></fromid>
		<transactionid><xsl:value-of select="transactionid" /></transactionid>
		<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
		<destapplication><xsl:value-of select="destapplication" /></destapplication>
		<documenttype>xrCollection</documenttype>
		<clientid><xsl:value-of select="clientid" /></clientid>
		<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_xrcodocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/col/header/NewDataSet/Table">
		<vtiger_xrco>
			<cf_xrco_balance />
			<latitude><xsl:value-of select="latitude" /></latitude>
			<longitude><xsl:value-of select="longitude" /></longitude>
			<cf_xrco_distributor>
				<distributorcode><xsl:value-of select="ForumCode" /></distributorcode>
			</cf_xrco_distributor>
			<cf_xrco_cheque_date><xsl:value-of select="ChqOrDDdate" /></cf_xrco_cheque_date>
			<cf_xrco_customer_name>
				<customercode><xsl:value-of select="Customer" /></customercode>
			</cf_xrco_customer_name>
			<cf_xrco_customer_id>
				<customercode><xsl:value-of select="Customer" /></customercode>
			</cf_xrco_customer_id>
			<cf_xrco_collection_date><xsl:value-of select="/collections/docinfo/createddate" /></cf_xrco_collection_date>
			<cf_xrco_amount_available />
			<cf_xrco_next_stage_name>Creation</cf_xrco_next_stage_name>
			<cf_xrco_transaction_series>
				<transactionseriescode />
				<transactionseriesname>RCollection</transactionseriesname>
			</cf_xrco_transaction_series>
			<cf_xrco_amount_adjusted />
			<cf_xrco_status>Draft</cf_xrco_status>
			<collectioncode><xsl:value-of select="UID" /></collectioncode>
			<cf_xrco_cheque_no><xsl:value-of select="ChqOrDDNo" /></cf_xrco_cheque_no>
			<cf_xrco_bank_details>
				<bankmastercode><xsl:value-of select="BankCode" /></bankmastercode>
				<bankmasterbranch><xsl:value-of select="BankCode" /></bankmasterbranch>
			</cf_xrco_bank_details>
			<cf_xrco_cpy_sales_man>
				<cpysalesmancode><xsl:value-of select="CompanySalesmanCode" /></cpysalesmancode>
				<cpysalesman><xsl:value-of select="CompanySalesmanId" /></cpysalesman>
			</cf_xrco_cpy_sales_man>
			<cf_xrco_salesman>
				<salesmancode><xsl:value-of select="SalesmanCode" /></salesmancode>
				<salesman><xsl:value-of select="SalesmanCode" /></salesman>
				<salesmanid><xsl:value-of select="SalesmanId" /></salesmanid>
			</cf_xrco_salesman>
			<cf_xrco_payment_mode>
				<collectionmethodcode><xsl:value-of select="PayType" /></collectionmethodcode>
			</cf_xrco_payment_mode>
			<cf_xrco_cash_balance />
			<cf_xrco_transaction_number><xsl:value-of select="UID" /></cf_xrco_transaction_number>
			<crmid />
			<cf_xrco_amount_received><xsl:value-of select="AmtRecvd" /></cf_xrco_amount_received>
			<cf_xrco_additional_information />
			<cf_xrco_beat>
				<beatcode><xsl:value-of select="BeatID" /></beatcode>
				<beatname />
			</cf_xrco_beat>
			<xreasonid>
				<reasoncode><xsl:value-of select="ReasonCode" /></reasoncode>
				<reason><xsl:value-of select="ReasonCode" /></reason>
			</xreasonid>
			<cf_xrco_recieved_balance><xsl:value-of select="recieved_adjusted" /></cf_xrco_recieved_balance>
			<customer_type><xsl:value-of select="customer_type" /></customer_type>
			<transaction_start_time><xsl:value-of select="transaction_start_time" /></transaction_start_time>
			<transaction_end_time><xsl:value-of select="transaction_end_time" /></transaction_end_time>
			<session_id><xsl:value-of select="VisitUID" /></session_id>
			<xsl:apply-templates select="/collections/documentcontent/col/detail/NewDataSet/Table" />
		</vtiger_xrco>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/col/detail/NewDataSet/Table">
		<lineitems>
			<vtiger_xrcodocrel>
				<xrcoid />
				<loadtype><xsl:value-of select="DocType" /></loadtype>
				<recordid><xsl:value-of select="ID" /></recordid>
				<amount_adjust><xsl:value-of select="AmtAdjusted" /></amount_adjust>
				<addl_adjust />
				<discount />
			</vtiger_xrcodocrel>
		</lineitems>
	</xsl:template>
</xsl:stylesheet>