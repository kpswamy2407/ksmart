<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="docinfo" />
			<xsl:apply-templates select="documentcontent" />
		</collections>
	</xsl:template>
	<xsl:template match="docinfo">
		<vtiger_xtransactionseriesdocinfo>
			<fromid>
				<xsl:value-of select="fromid" />
			</fromid>
			<transactionid>
				<xsl:value-of select="transactionid" />
			</transactionid>
			<sourceapplication>
				<xsl:value-of select="sourceapplication" />
			</sourceapplication>
			<destapplication>
				<xsl:value-of select="destapplication" />
			</destapplication>
			<documenttype>xTransactionSeries</documenttype>
			<clientid>
				<xsl:value-of select="clientid" />
			</clientid>
			<createddate>
				<xsl:value-of select="createddate" />
			</createddate>
		</vtiger_xtransactionseriesdocinfo>
	</xsl:template>
	<xsl:template match="documentcontent">
		<xsl:apply-templates select="transactionseriess" />
	</xsl:template>
	<xsl:template match="transactionseriess">
		<vtiger_xtransactionseries>
			<xsl:apply-templates select="transactionseries" />
		</vtiger_xtransactionseries>
	</xsl:template>
	<xsl:template match="transactionseries">
		<transactionseriesname>
			<xsl:value-of select="transactionseriesname" />
		</transactionseriesname>
		<transactionseriescode>
			<xsl:value-of select="transactionseriescode" />
		</transactionseriescode>
		<cf_xtransactionseries_reset_current_value>
			<xsl:value-of select="current_value" />
		</cf_xtransactionseries_reset_current_value>
		<xdistributorid>
			<xsl:value-of select="distributor_code" />
		</xdistributorid>
		<xtransactionseriesid>
			<xsl:value-of select="xtransactionseriesid" />
		</xtransactionseriesid>
	</xsl:template>
</xsl:stylesheet>