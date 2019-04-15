<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>beatcode,customercode,distributorcode,salesmancode,reasoncode</prkey>
			<xsl:apply-templates select="/collections/documentcontent/NewDataSet/Table" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xreasonnottakedocinfo>
			<fromid><xsl:value-of select="/collections/documentcontent/NewDataSet/Table/ForumCode" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>xReasonNotTake</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_xreasonnottakedocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/NewDataSet/Table">
		<vtiger_xreasonnottake>
			<latitude><xsl:value-of select="latitude" /></latitude>
			<longitude><xsl:value-of select="longitude" /></longitude>
			<reasonnottake_code><xsl:value-of select="UID" /></reasonnottake_code>
			<reasonnottake_date><xsl:value-of select="CreationDate" /></reasonnottake_date>
			<xbeatid>
				<beatcode><xsl:value-of select="BeatID" /></beatcode>
			</xbeatid>
			<xretailerid>
				<customercode><xsl:value-of select="CustomerID" /></customercode>
			</xretailerid>
			<xdistributorid>
				<distributorcode><xsl:value-of select="ForumCode" /></distributorcode>
			</xdistributorid>
			<xcustomersalesmanid>
				<cpysalesmancode><xsl:value-of select="CompanySalesmanCode" /></cpysalesmancode>
				<cpysalesman><xsl:value-of select="CompanySalesmanId" /></cpysalesman>
			</xcustomersalesmanid>
			<xsalesmanid>
				<salesmancode><xsl:value-of select="SalesmanCode" /></salesmancode>
				<salesman><xsl:value-of select="SalesmanCode" /></salesman>
				<salesmanid><xsl:value-of select="SalesmanId" /></salesmanid>
			</xsalesmanid>
			<xreasonid>
				<reasoncode><xsl:value-of select="ReasonID" /></reasoncode>
			</xreasonid>
			<comment><xsl:value-of select="Remarks" /></comment>
			<customer_type><xsl:value-of select="customer_type" /></customer_type>
			<transaction_start_time><xsl:value-of select="transaction_start_time" /></transaction_start_time>
			<transaction_end_time><xsl:value-of select="transaction_end_time" /></transaction_end_time>
			<session_id><xsl:value-of select="VisitUID" /></session_id>
			<reasonnottake_type><xsl:value-of select="VisitType" /></reasonnottake_type>
		</vtiger_xreasonnottake>
	</xsl:template>
</xsl:stylesheet>