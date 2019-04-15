<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<xsl:apply-templates select="/collections/documentcontent/sify_asr_open_order" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<sify_asr_open_orderdocinfo>
			<fromid><xsl:value-of select="fromid" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>sify_asr_open_order</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</sify_asr_open_orderdocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/sify_asr_open_order">
		<sify_asr_open_orders>
			<sify_asr_open_order>                               
				<area><xsl:value-of select="area" /></area>
				<dist_code><xsl:value-of select="dist_code" /></dist_code>
				<dist_name><xsl:value-of select="dist_name" /></dist_name>
				<town><xsl:value-of select="town" /></town>
				<order_no><xsl:value-of select="order_no" /></order_no>
				<order_type><xsl:value-of select="order_type" /></order_type>
				<created_date><xsl:value-of select="created_date" /></created_date>
				<psku><xsl:value-of select="psku" /></psku>
				<item_desc><xsl:value-of select="item_desc" /></item_desc>
				<qty><xsl:value-of select="qty" /></qty>
				<status><xsl:value-of select="status" /></status>
				<status_description><xsl:value-of select="status_description" /></status_description>
				<po_no><xsl:value-of select="po_no" /></po_no>
				<pick_slip_date><xsl:value-of select="pick_slip_date" /></pick_slip_date>
				<rate><xsl:value-of select="rate" /></rate>
				<ptd_cr><xsl:value-of select="ptd_cr" /></ptd_cr>
				<hold><xsl:value-of select="hold" /></hold>
				<uom_case_lot><xsl:value-of select="uom_case_lot" /></uom_case_lot>
				<uom_case><xsl:value-of select="uom_case" /></uom_case>
				<depot><xsl:value-of select="depot" /></depot>
			</sify_asr_open_order>
		</sify_asr_open_orders>
	</xsl:template>
</xsl:stylesheet>