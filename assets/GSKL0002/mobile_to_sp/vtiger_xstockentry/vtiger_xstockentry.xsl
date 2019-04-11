<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>customercode,salesmancode,beatcode,transactionseriescode,productcode,prodhiercode,reasoncode</prkey>
			<xsl:apply-templates select="/collections/documentcontent/stockentry/header/NewDataSet/Table" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xstockentrydocinfo>
			<fromid>
				<xsl:value-of select="/collections/documentcontent/stockentry/header/NewDataSet/Table/ForumCode" />
			</fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>xStockEntry</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_xstockentrydocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/stockentry/header/NewDataSet/Table">
		<vtiger_xstockentry>
			<stockentry_no><xsl:value-of select="UID" /></stockentry_no>
			<sales_man>
				<salesmancode><xsl:value-of select="SalesmanCode" /></salesmancode>
				<salesman><xsl:value-of select="SalesmanCode" /></salesman>
				<salesmanid><xsl:value-of select="SalesmanId" /></salesmanid>
			</sales_man>
			<cpy_sales_man>
				<cpysalesmancode><xsl:value-of select="CompanySalesmanCode" /></cpysalesmancode>
				<cpysalesman><xsl:value-of select="CompanySalesmanId" /></cpysalesman>
			</cpy_sales_man>
			<vendorid>
				<customercode><xsl:value-of select="CustomerID" /></customercode>
			</vendorid>
			<beat>
				<beatcode><xsl:value-of select="BeatID" /></beatcode>
			</beat>
			<stockentry_date><xsl:value-of select="CreationDate" /></stockentry_date>
			<transaction_series>
				<transactionseriescode/>
				<transactionseriesname>Stock Entry</transactionseriesname>
			</transaction_series>
			<transaction_number><xsl:value-of select="UID" /></transaction_number>
			<distributorid><xsl:value-of select="ForumCode" /></distributorid>
			<distributor_id><xsl:value-of select="distid" /></distributor_id>
			<latitude><xsl:value-of select="latitude" /></latitude>
			<longitude><xsl:value-of select="longitude" /></longitude>
			<customer_type><xsl:value-of select="customer_type" /></customer_type>
			<transaction_start_time><xsl:value-of select="transaction_start_time" /></transaction_start_time>
			<transaction_end_time><xsl:value-of select="transaction_end_time" /></transaction_end_time>
			<session_id><xsl:value-of select="VisitUID" /></session_id>
			<xreasonid>
				<reasoncode><xsl:value-of select="ReasonCode" /></reasoncode>
				<reason><xsl:value-of select="ReasonCode" /></reason>
			</xreasonid>
			<xsl:apply-templates select="/collections/documentcontent/stockentry/detail/NewDataSet/Table" />
		</vtiger_xstockentry>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/stockentry/detail/NewDataSet/Table">
		<lineitems>
			<vtiger_xstockentryitems>
				<xstockentryid/>
				<prodhierid>
					<prodhiercode><xsl:value-of select="prdCtgId" /></prodhiercode>
				</prodhierid>
				<stockid>
					<productcode><xsl:value-of select="ItemID" /></productcode>
					<productname><xsl:value-of select="ItemID" /></productname>
				</stockid>
				<batch_no>-</batch_no>
				<uom>
					<uomname><xsl:value-of select="Uomid" /></uomname>
				</uom>
				<saleable_qty><xsl:value-of select="Quantity" /></saleable_qty>
				<rate><xsl:value-of select="Price" /></rate>
				<manufacture_date><xsl:value-of select="OMFDATE" /></manufacture_date>
			</vtiger_xstockentryitems>
		</lineitems>
	</xsl:template>
</xsl:stylesheet>