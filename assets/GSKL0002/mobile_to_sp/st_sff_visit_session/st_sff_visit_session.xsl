<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<xsl:apply-templates select="/collections/documentcontent/st_sff_visit_sessions/st_sff_visit_session" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<st_sff_visit_sessiondocinfo>
			<fromid><xsl:value-of select="fromid" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>xSFFvisitsession</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
		</st_sff_visit_sessiondocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/st_sff_visit_sessions/st_sff_visit_session">
		<st_sff_visit_sessions>
			<st_sff_visit_session>
				<distributorcode><xsl:value-of select="distributorcode" /></distributorcode>
				<salesmancode><xsl:value-of select="SalesmanCode" /></salesmancode>
				<customercode><xsl:value-of select="customercode" /></customercode>
				<beatcode><xsl:value-of select="beatcode" /></beatcode>
				<transaction_date><xsl:value-of select="transaction_date" /></transaction_date>
				<visit_session_id><xsl:value-of select="visit_session_id" /></visit_session_id>
				<in_time><xsl:value-of select="in_time" /></in_time>
				<out_time><xsl:value-of select="out_time" /></out_time>
				<duration><xsl:value-of select="duration" /></duration>
				<uid><xsl:value-of select="UID" /></uid>
				<createddate><xsl:value-of select="createddate" /></createddate>
				<distributor_id><xsl:value-of select="distid" /></distributor_id>
				<salesman_id><xsl:value-of select="salesid" /></salesman_id>
				<customer_id><xsl:value-of select="custid" /></customer_id>
				<beat_id><xsl:value-of select="beatid" /></beat_id>
			</st_sff_visit_session>
		</st_sff_visit_sessions>
	</xsl:template>
</xsl:stylesheet>