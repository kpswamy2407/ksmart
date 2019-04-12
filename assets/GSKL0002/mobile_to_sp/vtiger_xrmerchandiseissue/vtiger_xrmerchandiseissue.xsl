<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>customercode,salesmancode,beatcode,transactionseriescode,merchand_code,prodhiercode,godown_code,reasoncode</prkey>
			<xsl:apply-templates select="/collections/documentcontent/merchandise/header/NewDataSet/Table" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xrmerchandiseissuedocinfo>
			<fromid><xsl:value-of select="fromid" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>xrMerchandiseIssue</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_xrmerchandiseissuedocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/merchandise/header/NewDataSet/Table">
		<vtiger_xrmerchandiseissue>
			<subject><xsl:value-of select="merchandiseid" /></subject>
			<merchandise_issue_code><xsl:value-of select="merchandiseid" /></merchandise_issue_code>
			<xcustomersalesmanid>			
				<cpysalesmancode><xsl:value-of select="companysalesmancode" /></cpysalesmancode>
				<cpysalesman><xsl:value-of select="companysalesmanid" /></cpysalesman>
			</xcustomersalesmanid>
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
			<xgodownid>
				<godown_name><xsl:value-of select="locationid" /></godown_name>
				<godown_code><xsl:value-of select="locationid" /></godown_code>
				<crmid/>
			</xgodownid>
			<xreasonid>
				<reason><xsl:value-of select="reasonid" /></reason>
				<reasoncode><xsl:value-of select="reasonid" /></reasoncode>
				<crmid/>
			</xreasonid>
			<transaction_start_time><xsl:value-of select="transaction_start_time" /></transaction_start_time>
			<session_id><xsl:value-of select="session_id" /></session_id>
			<transaction_end_time><xsl:value-of select="transaction_end_time" /></transaction_end_time>
			<customer_type><xsl:value-of select="customer_type" /></customer_type>
			<xdistributorid>
				<distributorcode><xsl:value-of select="dist_code" /></distributorcode>
			</xdistributorid>
			<xprodhierid>
				<prodhiername><xsl:value-of select="prodhiercode" /></prodhiername>
				<prodhiercode><xsl:value-of select="prodhiercode" /></prodhiercode>
			</xprodhierid>
			<dist_code><xsl:value-of select="dist_code" /></dist_code>
			<customer_type>
				<xsl:value-of select="/collections/documentcontent/salesorder/header/NewDataSet/Table/customer_type" />
			</customer_type>
			<xsl:apply-templates select="/collections/documentcontent/merchandise/detail/NewDataSet/Table" />
		</vtiger_xrmerchandiseissue>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/merchandise/detail/NewDataSet/Table">
		<lineitems>
			<vtiger_xrmerchandiseissuerel>
				<merchandise_product>
					<productcode><xsl:value-of select="ProductCode" /></productcode>
					<productname><xsl:value-of select="ProductCode" /></productname>
					<crmid/>
				</merchandise_product>
				<merchandise_type><xsl:value-of select="merchandise_type" /></merchandise_type>
				<display_type><xsl:value-of select="display_type" /></display_type>
				<to_be_return><xsl:value-of select="to_be_return" /></to_be_return>
				<date_of_return><xsl:value-of select="date_of_return" /></date_of_return>
				<avl_qty><xsl:value-of select="avl_qty" /></avl_qty>
				<issue_qty><xsl:value-of select="issue_qty" /></issue_qty>
				<sequence_no><xsl:value-of select="sequence_no" /></sequence_no>
				<qr_code><xsl:value-of select="qr_code" /></qr_code>
				<image_name><xsl:value-of select="image_name" /></image_name>
			</vtiger_xrmerchandiseissuerel>
		</lineitems>
	</xsl:template>
</xsl:stylesheet>