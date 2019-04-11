<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>customercode,beatcode,salesmancode,transactionseriescode,productcode,reasoncode</prkey>
			<xsl:apply-templates select="/collections/documentcontent/salesreturn/header/NewDataSet/Table" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xrsrdocinfo>
			<fromid>
				<xsl:value-of select="/collections/documentcontent/salesreturn/header/NewDataSet/Table/ForumCode" />
			</fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>xrSalesReturn</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_xrsrdocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/salesreturn/header/NewDataSet/Table">
		<vtiger_xrsr>
			<return_type><xsl:value-of select="ReturnType" /></return_type>
			<invoice_ref><xsl:value-of select="InvoiceRef" /></invoice_ref>
			<latitude><xsl:value-of select="latitude" /></latitude>
			<longitude><xsl:value-of select="longitude" /></longitude>
			<distributor_id><xsl:value-of select="xdistId" /></distributor_id>
			<rsales_return_type>Without Ref</rsales_return_type>
			<cf_xrsr_next_stage_name>Creation</cf_xrsr_next_stage_name>
			<cf_xrsr_status>Draft</cf_xrsr_status>
			<cf_xrsr_adjustable_amount />
			<cf_xrsr_amount />
			<cf_xrsr_tax_amoount />
			<cf_xrsr_transaction_no><xsl:value-of select="UID" /></cf_xrsr_transaction_no>
			<cf_xrsr_intiated_date><xsl:value-of select="/collections/docinfo/createddate" /></cf_xrsr_intiated_date>
			<cf_xrsr_internal_ref />
			<cf_xrsalesreturn_beat>
				<beatcode><xsl:value-of select="BeatID" /></beatcode>
			</cf_xrsalesreturn_beat>
			<cf_xrsalesreturn_salesman>
				<salesmancode><xsl:value-of select="SalesmanCode" /></salesmancode>
				<salesman><xsl:value-of select="SalesmanID" /></salesman>
				<salesmanid><xsl:value-of select="SalesmanId" /></salesmanid>
			</cf_xrsalesreturn_salesman>
			<cf_xrsalesreturn_cpy_salesman>
				<cpysalesmancode><xsl:value-of select="CompanySalesmanCode" /></cpysalesmancode>
				<cpysalesman><xsl:value-of select="CompanySalesmanCode" /></cpysalesman>
			</cf_xrsalesreturn_cpy_salesman>
			<cf_xrsr_customer>
				<customercode><xsl:value-of select="CustomerID" /></customercode>
				<customername><xsl:value-of select="CustomerID" /></customername>
				<crmid />
			</cf_xrsr_customer>
			<reason>
				<reasoncode><xsl:value-of select="ReasonCode" /></reasoncode>
			</reason>
			<cf_xrsr_transaction_series>
				<transactionseriescode />
				<transactionseriesname>RSalesReturn</transactionseriesname>
			</cf_xrsr_transaction_series>
			<rsrcode><xsl:value-of select="SRID" /></rsrcode>
			<xdistributorid><xsl:value-of select="ForumCode" /></xdistributorid>
			<customer_type><xsl:value-of select="customer_type" /></customer_type>
			<transaction_start_time><xsl:value-of select="transaction_start_time" /></transaction_start_time>
			<transaction_end_time><xsl:value-of select="transaction_end_time" /></transaction_end_time>
			<session_id><xsl:value-of select="VisitUID" /></session_id>
			<xsl:apply-templates select="/collections/documentcontent/salesreturn/detail/NewDataSet/Table" />
		</vtiger_xrsr>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/salesreturn/detail/NewDataSet/Table">
		<lineitems>
			<vtiger_xrsritems>
				<xrsrid />
				<salesinvoiceid />
				<salesinvoice_no><xsl:value-of select="InvoiceID" /></salesinvoice_no>
				<stockid>
					<cf_xproduct_reporting_uom_conversion />
					<cf_xproduct_price_at_uom />
					<cf_xproduct_description><xsl:value-of select="Reason" /></cf_xproduct_description>
					<cf_xproduct_flavour />
					<cf_xproduct_pack />
					<cf_xproduct_contect />
					<cf_xproduct_forum_code />
					<cf_xproduct_purchase_tax />
					<cf_xproduct_sales_tax />
					<cf_xproduct_uom2_conversion />
					<cf_xproduct_uom2><xsl:value-of select="UOMID" /></cf_xproduct_uom2>
					<cf_xproduct_uom1_conversion />
					<cf_xproduct_uom1><xsl:value-of select="UOMID" /></cf_xproduct_uom1>
					<cf_xproduct_conversion_factor />
					<cf_xproduct_conversion_unit />
					<cf_xproduct_reporting_unit />
					<cf_xproduct_reporting_uom />
					<cf_xproduct_base_uom><xsl:value-of select="UOMID" /></cf_xproduct_base_uom>
					<cf_xproduct_mrp><xsl:value-of select="Price" /></cf_xproduct_mrp>
					<cf_xproduct_pts><xsl:value-of select="Price" /></cf_xproduct_pts>
					<cf_xproduct_minimum_order_quantity />
					<cf_xproduct_stock_norm />
					<cf_xproduct_vat />
					<cf_xproduct_category><xsl:value-of select="ProdCtgryID" /></cf_xproduct_category>
					<cf_xproduct_division />
					<cf_xproduct_ecp />
					<cf_xproduct_ptr />
					<cf_xproduct_track_pkd />
					<cf_xproduct_track_batch />
					<cf_xproduct_manufacturer />
					<productcode><xsl:value-of select="ProductCode" /></productcode>
					<productname><xsl:value-of select="ProductCode" /></productname>
					<crmid />
				</stockid>
				<tuom>
					<uomname><xsl:value-of select="UOMID" /></uomname>
				</tuom>
				<saleable_qty><xsl:value-of select="SaleableQuantity" /></saleable_qty>
				<free_qty><xsl:value-of select="FreeQuantity" /></free_qty>
				<dam_saleable_qty><xsl:value-of select="DamagedQuantity" /></dam_saleable_qty>
				<dam_free_qty><xsl:value-of select="DamagedFreeQuantity" /></dam_free_qty>
				<tax_amount />
				<batch_no><xsl:value-of select="BatchNo" /></batch_no>
				<rate><xsl:value-of select="Price" /></rate>
				<amount><xsl:value-of select="Amount" /></amount>
				<reason>
					<reasoncode><xsl:value-of select="Reason" /></reasoncode>
				</reason>
				<tax1 />
				<tax2 />
				<tax3 />
			</vtiger_xrsritems>
		</lineitems>
	</xsl:template>
</xsl:stylesheet>