<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<xsl:apply-templates select="/collections/documentcontent/st_extrnlanlt" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<sify_external_analytic_indocinfo>
			<fromid><xsl:value-of select="fromid" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>external_analytic</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</sify_external_analytic_indocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/st_extrnlanlt">
		<sify_external_analytic_ins>
			<sify_external_analytic_in>
				<operating_cycle><xsl:value-of select="operating_cycle" /></operating_cycle>
				<operating_cycle_year><xsl:value-of select="operating_cycle_year" /></operating_cycle_year>
				<operating_cycle_month><xsl:value-of select="operating_cycle_month" /></operating_cycle_month>
				<region_code><xsl:value-of select="region_code" /></region_code>
				<area_code><xsl:value-of select="area_code" /></area_code>
				<territory_code><xsl:value-of select="territory_code" /></territory_code>
				<distributor_code><xsl:value-of select="distributor_code" /></distributor_code>
				<channel_name><xsl:value-of select="channel_name" /></channel_name>
				<outlet_code><xsl:value-of select="outlet_code" /></outlet_code>
				<sub_category_code><xsl:value-of select="sub_category_code" /></sub_category_code>
				<brand_code><xsl:value-of select="brand_code" /></brand_code>
				<brand_variant_code><xsl:value-of select="brand_variant_code" /></brand_variant_code>
				<sku_code><xsl:value-of select="sku_code" /></sku_code>
				<ms_rating><xsl:value-of select="ms_rating" /></ms_rating>
				<oos_flag><xsl:value-of select="oos_flag" /></oos_flag>
				<fb_flag><xsl:value-of select="fb_flag" /></fb_flag>
				<cs_flag><xsl:value-of select="cs_flag" /></cs_flag>
				<cs_rating><xsl:value-of select="cs_rating" /></cs_rating>
				<order_quantity><xsl:value-of select="ms_rating" /></order_quantity>
			</sify_external_analytic_in>
		</sify_external_analytic_ins>
	</xsl:template>
</xsl:stylesheet>