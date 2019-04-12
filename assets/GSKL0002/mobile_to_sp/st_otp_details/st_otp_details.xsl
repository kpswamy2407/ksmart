<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<xsl:apply-templates select="/collections/documentcontent/st_otp_details" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<st_otp_detailsdocinfo>
			<fromid><xsl:value-of select="fromid" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>xOtpRequest</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
		</st_otp_detailsdocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/st_otp_details">
		<st_otp_detailss>
			<st_otp_details>
				<distributor_code>
					<xsl:value-of select="distributor_code" />
				</distributor_code>
				<salesman_code>
					<xsl:value-of select="salesman_code" />
				</salesman_code>
				<customercode>
					<xsl:value-of select="customercode" />
				</customercode>
				<uid>
					<xsl:value-of select="uid" />
				</uid>
				<createddate>
					<xsl:value-of select="createddate" />
				</createddate>
				<distributor_id>
					<xsl:value-of select="distributor_id" />
				</distributor_id>
				<salesman_id>
					<xsl:value-of select="salesman_id" />
				</salesman_id>
				<customer_id>
					<xsl:value-of select="customer_id" />
				</customer_id>
				<status>
					<xsl:value-of select="status" />
				</status>
				<mobile_number>
					<xsl:value-of select="mobile_number" />
				</mobile_number>
				<otp_hashvalue>
					<xsl:value-of select="otp_hashvalue" />
				</otp_hashvalue>
			</st_otp_details>
		</st_otp_detailss>
	</xsl:template>
</xsl:stylesheet>