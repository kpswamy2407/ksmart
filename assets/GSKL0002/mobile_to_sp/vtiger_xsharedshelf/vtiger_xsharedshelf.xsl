<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>customercode,salesmancode,beatcode,transactionseriescode,productcode,prodhiercode</prkey>
			<xsl:apply-templates select="/collections/documentcontent/sharedshelf/header/NewDataSet/Table" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xsharedshelfdocinfo>
			<fromid><xsl:value-of select="fromid" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>xSharedShelf</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_xsharedshelfdocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/sharedshelf/header/NewDataSet/Table">
		<vtiger_xsharedshelf>
			<subject><xsl:value-of select="sharedshelfid" /></subject>
			<xcustomersalesmanid>			
				<cpysalesmancode><xsl:value-of select="CompanySalesmanCode" /></cpysalesmancode>
				<cpysalesman><xsl:value-of select="CompanySalesmanId" /></cpysalesman>
			</xcustomersalesmanid>
			<xsalesmanid>
				<cf_xsalesman_distributor/>
				<salesmancode><xsl:value-of select="SalesmanCode" /></salesmancode>
				<salesman><xsl:value-of select="SalesmanCode" /></salesman>
				<salesmanid><xsl:value-of select="SalesmanId" /></salesmanid>
				<crmid/>
			</xsalesmanid>
			<xbeatid>
				<beatcode><xsl:value-of select="BeatID" /></beatcode>
				<beatname><xsl:value-of select="BeatID" /></beatname>
				<crmid/>
			</xbeatid>
			<xretailerid>
				<customername><xsl:value-of select="CustomerID" /></customername>
				<customercode><xsl:value-of select="CustomerID" /></customercode>
				<crmid/>
			</xretailerid>
			<transaction_start_time><xsl:value-of select="transaction_start_time" /></transaction_start_time>
			<session_id><xsl:value-of select="session_id" /></session_id>
			<transaction_end_time><xsl:value-of select="transaction_end_time" /></transaction_end_time>
			<customer_type><xsl:value-of select="customer_type" /></customer_type>
			<orig_image><xsl:value-of select="orig_image" /></orig_image>
			<distributorcode><xsl:value-of select="dist_code" /></distributorcode>
			<dist_code><xsl:value-of select="dist_code" /></dist_code>
			<status>Draft</status>
			<next_stage_name>Creation</next_stage_name>
			<xsl:apply-templates select="/collections/documentcontent/sharedshelf/detail/NewDataSet/Table" />
		</vtiger_xsharedshelf>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/sharedshelf/detail/NewDataSet/Table">
		<lineitems>
			<vtiger_xsharedshelfrel>
				<xproductid>
					<productcode><xsl:value-of select="ProductCode" /></productcode>
					<productname><xsl:value-of select="ProductCode" /></productname>
					<crmid/>
				</xproductid>
				<productcode><xsl:value-of select="ProductCode" /></productcode>
				<sequence_no><xsl:value-of select="sequence_no" /></sequence_no>
				<xprodhierid>
					<prodhiername><xsl:value-of select="prodhiercode" /></prodhiername>
					<prodhiercode><xsl:value-of select="prodhiercode" /></prodhiercode>
				</xprodhierid>
				<occupy_percentage><xsl:value-of select="occupyPercentage" /></occupy_percentage>
				<crap_image><xsl:value-of select="crap_image" /></crap_image>
			</vtiger_xsharedshelfrel>
		</lineitems>
	</xsl:template>
</xsl:stylesheet>