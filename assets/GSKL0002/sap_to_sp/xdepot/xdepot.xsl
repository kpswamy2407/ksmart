<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>geohiercode,statecode</prkey>
			<xsl:apply-templates select="/collections/documentcontent/st_xdepot" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xdepotdocinfo>
			<fromid><xsl:value-of select="fromid" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication>sap</sourceapplication>
			<destapplication>sp</destapplication>
			<documenttype>xDepot</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_xdepotdocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/st_xdepot">
		<vtiger_xdepot>
			<supplylocation><xsl:value-of select="supplylocation" /></supplylocation>
			<depotcode><xsl:value-of select="depotcode" /></depotcode>
			<cf_xdepot_location_address><xsl:value-of select="location_address" /></cf_xdepot_location_address>
			<cf_xdepot_geographical_category>
				<geohiername><xsl:value-of select="geohiercode" /></geohiername>
				<geohiercode><xsl:value-of select="geohiercode" /></geohiercode>
			</cf_xdepot_geographical_category>
			<cf_xdepot_city_name><xsl:value-of select="city_name" /></cf_xdepot_city_name>
			<cf_xdepot_state>
				<statename><xsl:value-of select="state" /></statename>
				<statecode><xsl:value-of select="state" /></statecode>
			</cf_xdepot_state>
			<cf_xdepot_postal_code><xsl:value-of select="pin_code" /></cf_xdepot_postal_code>
			<cf_xdepot_depot_fax><xsl:value-of select="depot_fax" /></cf_xdepot_depot_fax>
			<cf_xdepot_sales_organisation_code>
				<organisationhiername><xsl:value-of select="salesorg_code" /></organisationhiername>
				<organisationhiercode><xsl:value-of select="salesorg_code" /></organisationhiercode>
			</cf_xdepot_sales_organisation_code>
			<gstinno><xsl:value-of select="gstinno" /></gstinno>
			<panno><xsl:value-of select="panno" /></panno>
			<cf_xdepot_st_vat_tin/>
			<cf_xdepot_cst_tin/>
			<cf_xdepot_service_tax_reg_no/>
			<cf_xdepot_status><xsl:value-of select="active" /></cf_xdepot_status>
			<cf_xdepot_depot_type><xsl:value-of select="depot_type" /></cf_xdepot_depot_type>
		</vtiger_xdepot>
	</xsl:template>
</xsl:stylesheet>