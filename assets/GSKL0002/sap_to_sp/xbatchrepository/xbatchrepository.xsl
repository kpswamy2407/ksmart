<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<xsl:apply-templates select="/collections/documentcontent/st_xbatchrepository" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<sify_batch_central_repositorydocinfo>
			<fromid><xsl:value-of select="fromid" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>batch_central_repository</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</sify_batch_central_repositorydocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/st_xbatchrepository">
		<sify_batch_central_repositorys>
			<sify_batch_central_repository>
				<xproductid><xsl:value-of select="xproductid" /></xproductid>
				<productcode><xsl:value-of select="productcode" /></productcode>
				<productname><xsl:value-of select="productname" /></productname>
				<xprodhierid><xsl:value-of select="xprodhierid" /></xprodhierid>
				<prodhiercode><xsl:value-of select="prodhiercode" /></prodhiercode>
				<prodhiername><xsl:value-of select="prodhiername" /></prodhiername>
				<batch_no><xsl:value-of select="batch_no" /></batch_no>
				<pkd><xsl:value-of select="pkd" /></pkd>
				<ptr><xsl:value-of select="ptr" /></ptr>
				<expiry><xsl:value-of select="expiry" /></expiry>
				<mrp><xsl:value-of select="mrp" /></mrp>
				<location><xsl:value-of select="location" /></location>
				<ch_plant><xsl:value-of select="ch_plant" /></ch_plant>
			</sify_batch_central_repository>
		</sify_batch_central_repositorys>
	</xsl:template>
</xsl:stylesheet>