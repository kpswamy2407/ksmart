<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>statename,productcode,prodhiercode,taxcode</prkey>
			<xsl:apply-templates select="/collections/documentcontent/st_xtaxmapping" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xtaxmappingdocinfo>
			<fromid><xsl:value-of select="fromid" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication>sap</sourceapplication>
			<destapplication>sp</destapplication>
			<documenttype>xTaxMapping</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_xtaxmappingdocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/st_xtaxmapping">
		<vtiger_xtaxmapping>
			<cf_xtaxmapping_from_date><xsl:value-of select="from_date" /></cf_xtaxmapping_from_date>
			<cf_xtaxmapping_to_date><xsl:value-of select="to_date" /></cf_xtaxmapping_to_date>
			<statename>
				<statename>India</statename>
				<statecode>00</statecode>
			</statename>
			<hsncode><xsl:value-of select="hsncode" /></hsncode>
			<cf_xtaxmapping_product>
				<productname><xsl:value-of select="productcode" /></productname>
				<productcode><xsl:value-of select="productcode" /></productcode>
			</cf_xtaxmapping_product>
			<cf_xtaxmapping_product_hierachy>
				<prodhiername><xsl:value-of select="product_hierachy" /></prodhiername>
				<prodhiercode><xsl:value-of select="product_hierachy" /></prodhiercode>
			</cf_xtaxmapping_product_hierachy>
			<cf_xtaxmapping_sales_tax>
				<taxcode><xsl:value-of select="sales_tax" /></taxcode>
				<taxdescription><xsl:value-of select="sales_tax" /></taxdescription>
			</cf_xtaxmapping_sales_tax>
			<cf_xtaxmapping_purchase_tax>
				<taxcode><xsl:value-of select="purchase_tax" /></taxcode>
				<taxdescription><xsl:value-of select="purchase_tax" /></taxdescription>
			</cf_xtaxmapping_purchase_tax>
			<incremental_flag><xsl:value-of select="incremental_flag" /></incremental_flag>
			<cf_xtaxmapping_active><xsl:value-of select="active" /></cf_xtaxmapping_active>
		</vtiger_xtaxmapping>
	</xsl:template>
</xsl:stylesheet>