<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<xsl:apply-templates select="/collections/documentcontent/st_retailer_image" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<st_retailer_imagedocinfo>
			<fromid><xsl:value-of select="fromid" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>xRetailerImage</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
		</st_retailer_imagedocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/st_retailer_image">
		<st_retailer_images>
			<st_retailer_image>
				<dist_id><xsl:value-of select="dist_id" /></dist_id>
				<dist_code><xsl:value-of select="dist_code" /></dist_code>
				<salesman_id><xsl:value-of select="SalesmanId" /></salesman_id>
				<salesman_code><xsl:value-of select="SalesmanCode" /></salesman_code>
				<retailer_id><xsl:value-of select="ret_id" /></retailer_id>
				<retailer_code><xsl:value-of select="ret_code" /></retailer_code>
				<beat_id><xsl:value-of select="beat_id" /></beat_id>
				<beat_code><xsl:value-of select="beat_code" /></beat_code>
				<retailer_image><xsl:value-of select="image_name" /></retailer_image>
				<latitude><xsl:value-of select="latitude" /></latitude>
				<longitude><xsl:value-of select="longitude" /></longitude>
				<remarks><xsl:value-of select="remarks" /></remarks>
			</st_retailer_image>
		</st_retailer_images>
	</xsl:template>
</xsl:stylesheet>