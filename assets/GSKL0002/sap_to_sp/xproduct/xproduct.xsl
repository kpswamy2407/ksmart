<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>prodhiercode,uomname,packname</prkey>
			<xsl:apply-templates select="/collections/documentcontent/st_xproduct" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xproductdocinfo>
			<fromid><xsl:value-of select="fromid" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication>sap</sourceapplication>
			<destapplication>sp</destapplication>
			<documenttype>xProduct</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_xproductdocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/st_xproduct">
		<vtiger_xproduct>
			<productname><xsl:value-of select="productname" /></productname>
			<productcode><xsl:value-of select="productcode" /></productcode>
			<cf_xproduct_track_batch><xsl:value-of select="track_batch" /></cf_xproduct_track_batch>
			<cf_xproduct_track_pkd><xsl:value-of select="track_pkd" /></cf_xproduct_track_pkd>
			<cf_xproduct_ptr><xsl:value-of select="product_ptr" /></cf_xproduct_ptr>
			<cf_xproduct_ecp><xsl:value-of select="product_ecp" /></cf_xproduct_ecp>
			<cf_xproduct_category>
				<prodhiername><xsl:value-of select="category" /></prodhiername>
				<prodhiercode><xsl:value-of select="category" /></prodhiercode>
			</cf_xproduct_category>
			<cf_xproduct_vat><xsl:value-of select="TrackTax" /></cf_xproduct_vat>
			<cf_xproduct_pts><xsl:value-of select="product_pts" /></cf_xproduct_pts>
			<cf_xproduct_mrp><xsl:value-of select="product_mrp" /></cf_xproduct_mrp>
			<cf_xproduct_base_uom>
				<uomname><xsl:value-of select="base_uom" /></uomname>
			</cf_xproduct_base_uom>
			<cf_xproduct_reporting_uom>
				<uomname><xsl:value-of select="reporting_uom" /></uomname>
			</cf_xproduct_reporting_uom>
			<cf_xproduct_reporting_unit><xsl:value-of select="reporting_unit" /></cf_xproduct_reporting_unit>
			<cf_xproduct_reporting_uom_conversion><xsl:value-of select="reporting_uom_conversion" /></cf_xproduct_reporting_uom_conversion>
			<cf_xproduct_conversion_unit><xsl:value-of select="conversion_unit" /></cf_xproduct_conversion_unit>
			<cf_xproduct_conversion_factor><xsl:value-of select="conversion_factor" /></cf_xproduct_conversion_factor>
			<cf_xproduct_description><xsl:value-of select="description" /></cf_xproduct_description>
			<cf_xproduct_uom1>
				<uomname><xsl:value-of select="uom1" /></uomname>
			</cf_xproduct_uom1>
			<cf_xproduct_uom1_conversion><xsl:value-of select="uom1_conversion" /></cf_xproduct_uom1_conversion>
			<cf_xproduct_uom2>
				<uomname><xsl:value-of select="uom2" /></uomname>
			</cf_xproduct_uom2>
			<cf_xproduct_uom2_conversion><xsl:value-of select="uom2_conversion" /></cf_xproduct_uom2_conversion>
			<uom3>
				<uomname><xsl:value-of select="uom3" /></uomname>
			</uom3>
			<uom3_conversion><xsl:value-of select="uom3_conversion" /></uom3_conversion>
			<uom4>
				<uomname><xsl:value-of select="uom4" /></uomname>
			</uom4>
			<uom4_conversion><xsl:value-of select="uom4_conversion" /></uom4_conversion>
			<uom5>
				<uomname><xsl:value-of select="uom5" /></uomname>
			</uom5>
			<uom5_conversion><xsl:value-of select="uom5_conversion" /></uom5_conversion>
			<uom6>
				<uomname><xsl:value-of select="uom6" /></uomname>
			</uom6>
			<uom6_conversion><xsl:value-of select="uom6_conversion" /></uom6_conversion>
			<uom7>
				<uomname><xsl:value-of select="uom7" /></uomname>
			</uom7>
			<uom7_conversion><xsl:value-of select="uom7_conversion" /></uom7_conversion>
			<cf_xproduct_pack>
				<packname><xsl:value-of select="pack" /></packname>
				<packcode><xsl:value-of select="pack" /></packcode>
			</cf_xproduct_pack>
			<cf_xproduct_active>1</cf_xproduct_active>
			<gross_weight><xsl:value-of select="gross_weight" /></gross_weight>
			<net_weight><xsl:value-of select="net_weight" /></net_weight>
			<xproduct_default_purchase_uom><xsl:value-of select="default_purchase_uom" /></xproduct_default_purchase_uom>
			<xproduct_default_sales_uom><xsl:value-of select="default_sales_uom" /></xproduct_default_sales_uom>
			<xproduct_default_inventory_uom><xsl:value-of select="default_inventory_uom" /></xproduct_default_inventory_uom>
			<xproduct_available_stock_disp_uom><xsl:value-of select="available_stock_disp_uom" /></xproduct_available_stock_disp_uom>
			<cf_xproduct_minimum_stock_level><xsl:value-of select="minimum_stock_level" /></cf_xproduct_minimum_stock_level>
			<cf_xproduct_maximum_stock_level><xsl:value-of select="maximum_stock_level" /></cf_xproduct_maximum_stock_level>
			<cf_xproduct_re_order_level><xsl:value-of select="re_order_level" /></cf_xproduct_re_order_level>
			<xproductgroupid>
				<productgroupname><xsl:value-of select="ProductGroup" /></productgroupname>
			</xproductgroupid>
			<producttaxtype><xsl:value-of select="producttaxtype" /></producttaxtype>
			<cf_xproduct_manufacturer><xsl:value-of select="manufacturer" /></cf_xproduct_manufacturer>
			<shotname><xsl:value-of select="shotname" /></shotname>
			<hsncode><xsl:value-of select="hsncode" /></hsncode>
			<erp_status><xsl:value-of select="erp_status" /></erp_status>
			<cf_xproduct_status>Created</cf_xproduct_status>
			<cf_xproduct_next_stage_name>Publish</cf_xproduct_next_stage_name>
			<length_of_serial_number><xsl:value-of select="length_of_serial_number" /></length_of_serial_number>
			<track_serial_number><xsl:value-of select="track_serial_number" /></track_serial_number>
			<type_of_serial_number><xsl:value-of select="type_of_serial_number" /></type_of_serial_number>
			<track_refresh_cycle><xsl:value-of select="track_refresh_cycle" /></track_refresh_cycle>
			<track_refresh_noofdays><xsl:value-of select="track_refresh_noofdays" /></track_refresh_noofdays>
		</vtiger_xproduct>
	</xsl:template>
</xsl:stylesheet>