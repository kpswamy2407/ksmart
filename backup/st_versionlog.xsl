<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<xsl:apply-templates select="/collections/documentcontent/st_versionlog" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<st_synclogdocinfo>
			<fromid><xsl:value-of select="fromid" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>st_versionlog</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
		</st_synclogdocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/st_versionlog">
		<st_synclogs>
			<st_synclog>
				<dist_id>
					<xsl:value-of select="dist_id" />
				</dist_id>
				<dist_code>
					<xsl:value-of select="dist_code" />
				</dist_code>
				<salesman_id>
					<xsl:value-of select="salesman_id" />
				</salesman_id>
				<salesman_code>
					<xsl:value-of select="salesman_code" />
				</salesman_code>
				<transaction_start_time>
					<xsl:value-of select="transaction_start_time" />
				</transaction_start_time>
				<transaction_end_time>
					<xsl:value-of select="transaction_end_time" />
				</transaction_end_time>
				<version>
					<xsl:value-of select="version" />
				</version>
				<logtype>
					<xsl:value-of select="logtype" />
				</logtype>
				<log>
					<xsl:value-of select="log" />
				</log>
				<uid>
					<xsl:value-of select="uid" />
				</uid>
				<sync_completed>
					<xsl:value-of select="sync_completed" />
				</sync_completed>
				<sync_completed_count>
					<xsl:value-of select="sync_completed_count" />
				</sync_completed_count>
			</st_synclog>
		</st_synclogs>
	</xsl:template>
</xsl:stylesheet>