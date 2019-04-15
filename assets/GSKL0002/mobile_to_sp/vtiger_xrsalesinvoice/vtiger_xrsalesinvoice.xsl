<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="docinfo" />
			<xsl:apply-templates select="documentcontent" />
		</collections>
	</xsl:template>
	<xsl:template match="docinfo">
		<vtiger_xrsalesinvoicedocinfo>
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
			<documenttype>xrSalesInvoice</documenttype>
			<clientid>
				<xsl:value-of select="clientid" />
			</clientid>
			<createddate>
				<xsl:value-of select="createddate" />
			</createddate>
		</vtiger_xrsalesinvoicedocinfo>
		<prkey>customercode,salesmancode,beatcode,vancode,transactionseriescode,productcode,reasoncode</prkey>
	</xsl:template>
	<xsl:template match="documentcontent">
		<xsl:apply-templates select="vansales" />

	</xsl:template>
	<xsl:template match="vansales">

		<vtiger_xrsalesinvoice>
			<xsl:apply-templates select="header/NewDataSet/Table" />
			<lineitems>
				<xsl:apply-templates select="detail/NewDataSet/Table" />
			</lineitems>
		</vtiger_xrsalesinvoice>


	</xsl:template>
	<xsl:template match="header/NewDataSet/Table">
		<salesinvoice_no />
		<subject>
			<xsl:value-of select="InvoiceId" />
		</subject>
		<terms_conditions>Mobile Integration Distributor terms....</terms_conditions>
		<description>Mobile Van Sales Receive</description>
		<latitude>
			<xsl:value-of select="latitude" />
		</latitude>
		<longitude>
			<xsl:value-of select="longitude" />
		</longitude>
		<vendor_id>
			<customercode>
				<xsl:value-of select="CustomerID" />
			</customercode>
			<customername>
				<xsl:value-of select="CustomerID" />
			</customername>
		</vendor_id>
		<cf_xrsalesinvoice_transaction_series>
			<transactionseriescode />
			<transactionseriesname>Receive Van Sales</transactionseriesname>
		</cf_xrsalesinvoice_transaction_series>
		<si_location>
			<vancode>
				<xsl:value-of select="VanCode" />
			</vancode>
		</si_location>
		<requisition_no />
		<tracking_no>
			<xsl:value-of select="UID" />
		</tracking_no>
		<duedate />
		<carrier />
		<txtAdjustment />
		<salescommission />
		<exciseduty />
		<hdnGrandTotal>
			<xsl:value-of select="Totalamount" />
		</hdnGrandTotal>
		<hdnSubTotal />
		<hdnTaxType />
		<hdnDiscountPercent />
		<hdnDiscountAmount />
		<hdnS_H_Amount />
		<status>Draft</status>
		<currency_id />
		<distributor_id>
			<xsl:value-of select="xdistId" />
		</distributor_id>
		<cf_xrsalesinvoice_transaction_number>
			<xsl:value-of select="UID" />
		</cf_xrsalesinvoice_transaction_number>
		<cf_xrsalesinvoice_trans_current_value />
		<cf_xrsalesinvoice_next_stage_name>Creation</cf_xrsalesinvoice_next_stage_name>
		<cf_xrsalesinvoice_buyer_id>
			<xsl:value-of select="CustomerID" />
		</cf_xrsalesinvoice_buyer_id>
		<cf_xrsalesinvoice_seller_id>
			<xsl:value-of select="ForumCode" />
		</cf_xrsalesinvoice_seller_id>
		<cf_xrsalesinvoice_sales_man>
			<cf_xsalesman_distributor />
			<salesmancode>
				<xsl:value-of select="SalesmanCode" />
			</salesmancode>
			<salesman>
				<xsl:value-of select="SalesmanCode" />
			</salesman>
			<salesmanid>
				<xsl:value-of select="SalesmanId" />
			</salesmanid>
		</cf_xrsalesinvoice_sales_man>
		<cf_xrsalesinvoice_cpy_sales_man>
			<cpysalesmancode>
				<xsl:value-of select="CompanySalesmanCode" />
			</cpysalesmancode>
			<cpysalesman>
				<xsl:value-of select="CompanySalesmanId" />
			</cpysalesman>
		</cf_xrsalesinvoice_cpy_sales_man>
		<cf_xrsalesinvoice_beat>
			<beatcode>
				<xsl:value-of select="BeatID" />
			</beatcode>
			<beatname />
		</cf_xrsalesinvoice_beat>
		<cf_xrsalesinvoice_payment_date />
		<cf_xrsalesinvoice_pay_mode>
			<collectionmethoddescription />
			<collectionmethodcode />
			<cf_xcollectionmethod_collection_type />
			<cf_xcollectionmethod_status />
		</cf_xrsalesinvoice_pay_mode>
		<cf_xrsalesinvoice_credit_term>
			<credittermdescription />
			<credittermcode />
			<cf_xcreditterm_number_of_days />
		</cf_xrsalesinvoice_credit_term>
		<cf_xrsalesinvoice_sales_invoice_date>
			<xsl:value-of select="invoicedate" />
		</cf_xrsalesinvoice_sales_invoice_date>
		<customer_type>0</customer_type>
		<transaction_start_time>
			<xsl:value-of select="transaction_start_time" />
		</transaction_start_time>
		<transaction_end_time>
			<xsl:value-of select="transaction_end_time" />
		</transaction_end_time>
		<session_id>
			<xsl:value-of select="VisitUID" />
		</session_id>
		<buyer_gstinno>
			<xsl:value-of select="buyer_gstinno" />
		</buyer_gstinno>
		<seller_gstinno>
			<xsl:value-of select="seller_gstinno" />
		</seller_gstinno>
		<seller_state>
			<statename>
				<xsl:value-of select="seller_state" />
			</statename>
			<statecode>
				<xsl:value-of select="seller_state" />
			</statecode>
		</seller_state>
		<cf_xrsalesinvoice_reason>
			<reasoncode>
				<xsl:value-of select="ReasonCode" />
			</reasoncode>
			<reason>
				<xsl:value-of select="ReasonCode" />
			</reason>
		</cf_xrsalesinvoice_reason>
		<buyer_state>
			<statename>
				<xsl:value-of select="buyer_state" />
			</statename>
			<statecode>
				<xsl:value-of select="buyer_state" />
			</statecode>
		</buyer_state>
		<is_taxfiled>
			<xsl:value-of select="is_taxfiled" />
		</is_taxfiled>
		<trntaxtype>GST</trntaxtype>
		<grand_roundoff>
			<xsl:value-of select="grand_roundoff" />
		</grand_roundoff>
		<invoice_scheme_discount>
			<xsl:value-of select="invoice_scheme_discount" />
		</invoice_scheme_discount>
		<invoice_scheme_description>
			<xsl:value-of select="invoice_scheme_description" />
		</invoice_scheme_description>
	</xsl:template>
	<xsl:template match="detail/NewDataSet/Table">
		<vtiger_rsiproductrel>
			<productid>
				<productcode>
					<xsl:value-of select="ItemID" />
				</productcode>
				<productname>
					<xsl:value-of select="ItemID" />
				</productname>
				<crmid />
			</productid>
			<productcode>
				<xsl:value-of select="ItemID" />
			</productcode>
			<product_type>
				<xsl:value-of select="product_type" />
			</product_type>
			<sequence_no />
			<quantity>
				<xsl:value-of select="Quantity" />
			</quantity>
			<baseqty>
				<xsl:value-of select="BaseQty" />
			</baseqty>
			<dispatchqty />
			<refid />
			<reflineid />
			<tuom>
				<uomname>
					<xsl:value-of select="Uomid" />
				</uomname>
			</tuom>
			<listprice>
				<xsl:value-of select="Price" />
			</listprice>
			<discount_percent>
				<xsl:value-of select="Discount" />
			</discount_percent>
			<discount_amount>
				<xsl:value-of select="Discountamount" />
			</discount_amount>
			<sch_disc_amount>
				<xsl:value-of select="sch_disc_amount" />
			</sch_disc_amount>
			<comment />
			<description />
			<tax1>
				<xsl:value-of select="Taxamount" />
			</tax1>
			<tax2 />
			<tax3 />
			<taxcode>
				<xsl:value-of select="Taxcode" />
			</taxcode>
			<taxdescription />
			<tax_percentage>
				<xsl:value-of select="Taxpercent" />
			</tax_percentage>
			<free_qty>
				<xsl:value-of select="Free_Quantity" />
			</free_qty>
			<dam_qty>
				<xsl:value-of select="Dam_Quantity" />
			</dam_qty>
			<batchcode>
				<xsl:value-of select="BatchCode" />
			</batchcode>
			<pkg>
				<xsl:value-of select="pkg" />
			</pkg>
			<expiry>
				<xsl:value-of select="expiry" />
			</expiry>
			<pts>
				<xsl:value-of select="pts" />
			</pts>
			<ptr>
				<xsl:value-of select="ptr" />
			</ptr>
			<mrp>
				<xsl:value-of select="mrp" />
			</mrp>
			<ecp>
				<xsl:value-of select="ecp" />
			</ecp>
			<sale_to_free />
			<scheme_code>
				<xsl:value-of select="scheme_code" />
			</scheme_code>
			<points>
				<xsl:value-of select="points" />
			</points>
			<schemes>
				<xsl:apply-templates select="schemes/scheme"/>
			</schemes>
			<taxs>
				<xsl:apply-templates select="taxs/tax"/>
			</taxs>
			<total_after_discount>
				<xsl:apply-templates select="total_after_discount"/>
			</total_after_discount>
		</vtiger_rsiproductrel>
	</xsl:template>
	<xsl:template match="taxs/tax">
		<tax>
			<tax_amt>
				<xsl:value-of select="Taxamount" />
			</tax_amt>
			<tax_percentage>
				<xsl:value-of select="Taxpercent" />
			</tax_percentage>
			<tax_group_type>
				<xsl:value-of select="tax_group_type" />
			</tax_group_type>
			<taxable_amt>
				<xsl:value-of select="taxable_amt" />
			</taxable_amt>
			<tax_type>
				<xsl:value-of select="tax_type" />
			</tax_type>
			<taxcode>
				<xsl:value-of select="Taxcode" />
			</taxcode>
			<tax_components>
				<xsl:apply-templates select="tax_components/tax_component"/>				
			</tax_components>
		</tax>
	</xsl:template>
	<xsl:template match="tax_components/tax_component">	
		<tax_component>
			<tax_amt>
				<xsl:value-of select="Taxamount" />
			</tax_amt>
			<tax_percentage>
				<xsl:value-of select="Taxpercent" />
			</tax_percentage>
			<tax_group_type>
				<xsl:value-of select="tax_group_type" />
			</tax_group_type>
			<taxable_amt>
				<xsl:value-of select="taxable_amt" />
			</taxable_amt>
			<tax_type>
				<xsl:value-of select="tax_type" />
			</tax_type>
			<taxcode>
				<xsl:value-of select="Taxcode" />
			</taxcode>
			<applicable_on>
				<xsl:value-of select="applicable_on" />
			</applicable_on>
		</tax_component>
	</xsl:template>
	<xsl:template match="schemes/scheme">
		<scheme>
			<scheme_code>
				<xsl:value-of select="scheme_code" />
			</scheme_code>
			<scheme_applied>
				<xsl:value-of select="scheme_applied" />
			</scheme_applied>
			<fqty>
				<xsl:value-of select="fqty" />
			</fqty>
			<pricevalue>
				<xsl:value-of select="pricevalue" />
			</pricevalue>
			<disc_value>
				<xsl:value-of select="disc_value" />
			</disc_value>
			<disc_every>
				<xsl:value-of select="disc_every" />
			</disc_every>
			<disc_amount>
				<xsl:value-of select="disc_amount" />
			</disc_amount>
			<stock_type>
				<xsl:value-of select="stock_type" />
			</stock_type>
			<fproductcode>
				<xsl:value-of select="fproductcode" />
			</fproductcode>
			<ftuom>
				<xsl:value-of select="ftuom" />
			</ftuom>
			<fbatchnumber>
				<xsl:value-of select="fbatchnumber" />
			</fbatchnumber>
			<fpkd>
				<xsl:value-of select="fpkd" />
			</fpkd>
			<fexpiry>
				<xsl:value-of select="fexpiry" />
			</fexpiry>
			<flistprice>
				<xsl:value-of select="flistprice" />
			</flistprice>
			<fptr>
				<xsl:value-of select="fptr" />
			</fptr>
			<fpts>
				<xsl:value-of select="fpts" />
			</fpts>
			<fmrp>
				<xsl:value-of select="fmrp" />
			</fmrp>
			<fecp>
				<xsl:value-of select="fecp" />
			</fecp>
			<fbaseqty>
				<xsl:value-of select="fbaseqty" />
			</fbaseqty>
			<scheme_type>
				<xsl:value-of select="scheme_type" />
			</scheme_type>
			<schemeable_amt>
				<xsl:value-of select="schemeable_amt" />
			</schemeable_amt>
		</scheme>
	</xsl:template>
</xsl:stylesheet>