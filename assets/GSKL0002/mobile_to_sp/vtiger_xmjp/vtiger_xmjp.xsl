<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>distributorcode,salesmancode,beatcode,customercode</prkey>
			<xsl:apply-templates select="/collections/documentcontent/xmjp/header/NewDataSet/Table" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xmjpdocinfo>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<fromid><xsl:value-of select="/collections/documentcontent/xmjp/header/NewDataSet/Table/ForumCode" /></fromid>
			<createddate><xsl:value-of select="createddate" /></createddate>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<documenttype>xMJP</documenttype>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
		</vtiger_xmjpdocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/xmjp/header/NewDataSet/Table">
		<vtiger_xmjp>
			<mjpcode><xsl:value-of select="mjpcode" /></mjpcode>
			<cf_xmjp_distributor><xsl:value-of select="distid" /></cf_xmjp_distributor>
			<distributor_id><xsl:value-of select="xdistId" /></distributor_id>
			<fromdate><xsl:value-of select="fromdate" /></fromdate>
			<active>1</active>
			<cf_mjp_status>Created</cf_mjp_status>
			<cf_mjp_next_stage_name>Approval</cf_mjp_next_stage_name>
			<todate><xsl:value-of select="todate" /></todate>
			<cf_xmjp_salesman>
				<salesman><xsl:value-of select="SalesmanCode" /></salesman>
				<salesmanid><xsl:value-of select="SalesmanId" /></salesmanid>
				<salesmancode><xsl:value-of select="SalesmanCode" /></salesmancode>
			</cf_xmjp_salesman>
			<xsl:apply-templates select="/collections/documentcontent/xmjp/detail/NewDataSet/Table" />
		</vtiger_xmjp>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/xmjp/detail/NewDataSet/Table">
		<lineitems>
			<vtiger_xmjpdetail>
				<mjpday><xsl:value-of select="mjpday" /></mjpday>
				<beatcode><xsl:value-of select="beatcode" /></beatcode>
				<xretailerid><xsl:value-of select="xretailerid" /></xretailerid>
				<mjpdate><xsl:value-of select="mjpdate" /></mjpdate>
				<beatname><xsl:value-of select="beatname" /></beatname>
				<noofretailers><xsl:value-of select="noofretailers" /></noofretailers>
			</vtiger_xmjpdetail>
		</lineitems>
	</xsl:template>
</xsl:stylesheet>