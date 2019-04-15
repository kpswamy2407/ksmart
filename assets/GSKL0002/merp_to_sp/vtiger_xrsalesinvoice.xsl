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
		<prkey>customercode,salesmancode,beatcode,godown_code,transactionseriescode,productcode,collectionmethodcode,credittermcode</prkey>
	</xsl:template>
	<xsl:template match="documentcontent">
		<xsl:apply-templates select="salesinvoice" />

	</xsl:template>
	<xsl:template match="salesinvoice">

		<vtiger_xrsalesinvoice>
			<xsl:apply-templates select="header/Table" />
			<lineitems>
				<xsl:apply-templates select="detail/Table" />
			</lineitems>
		</vtiger_xrsalesinvoice>


	</xsl:template>
	<xsl:template match="header/Table">
		<salesinvoice_no />
		<subject>
			<xsl:value-of select="reference_description" />
		</subject>
		<terms_conditions>
			<xsl:value-of select="term_Conditions" />
		</terms_conditions>
		<description>MERP Integration Distributor terms....</description>
		<vendor_id>
			<customercode>
				<xsl:value-of select="customercode" />
			</customercode>
			<customername>
				<xsl:value-of select="customercode" />
			</customername>
		</vendor_id>
		<cf_xrsalesinvoice_transaction_series>
			<transactionseriescode />
			<transactionseriesname>Receive Van Sales</transactionseriesname>
		</cf_xrsalesinvoice_transaction_series>
		<si_location>
			<godown_code>
				<xsl:value-of select="godown_code" />
			</godown_code>
		</si_location>
		<requisition_no />
		<tracking_no>
			<xsl:value-of select="tracking_no" />
		</tracking_no>
		<duedate>
			<xsl:value-of select="duedate" />
		</duedate>
		<carrier />
		<txtAdjustment />
		<salescommission />
		<exciseduty />
		<hdnGrandTotal>
			<xsl:value-of select="total" />
		</hdnGrandTotal>
		<hdnSubTotal>
			<xsl:value-of select="subtotal" />
		</hdnSubTotal>
		<hdnTaxType />
		<discount_percent>
			<xsl:value-of select="discount_percent" />
		</discount_percent>
		<discount_amount>
			<xsl:value-of select="discount_amount" />
		</discount_amount>
		<s_h_amount>
			<xsl:value-of select="s_h_amount" />
		</s_h_amount>
		<status>Draft</status>
		<currency_id />
		<cf_xrsalesinvoice_transaction_number>
			<xsl:value-of select="reference_description" />
		</cf_xrsalesinvoice_transaction_number>
		<cf_xrsalesinvoice_trans_current_value />
		<cf_xrsalesinvoice_next_stage_name>Creation</cf_xrsalesinvoice_next_stage_name>
		<cf_xrsalesinvoice_buyer_id>
			<xsl:value-of select="customercode" />
		</cf_xrsalesinvoice_buyer_id>
		<cf_xrsalesinvoice_seller_id>
			<xsl:value-of select="dist_code" />
		</cf_xrsalesinvoice_seller_id>
		<cf_xrsalesinvoice_sales_man>
			<salesmancode>
				<xsl:value-of select="salesman_code" />
			</salesmancode>
			<salesman>
				<xsl:value-of select="salesman_code" />
			</salesman>
		</cf_xrsalesinvoice_sales_man>
		<cf_xrsalesinvoice_beat>
			<beatcode>
				<xsl:value-of select="beat_code" />
			</beatcode>
			<beatname>
				<xsl:value-of select="beat_code" />
			</beatname>
		</cf_xrsalesinvoice_beat>
		<cf_xrsalesinvoice_payment_date>
			<xsl:value-of select="payment_date" />
		</cf_xrsalesinvoice_payment_date>
		<cf_xrsalesinvoice_pay_mode>
			<collectionmethoddescription />
			<collectionmethodcode>
				<xsl:value-of select="collection_code" />
			</collectionmethodcode>
			<cf_xcollectionmethod_collection_type />
			<cf_xcollectionmethod_status />
		</cf_xrsalesinvoice_pay_mode>
		<cf_xrsalesinvoice_credit_term>
			<credittermdescription />
			<credittermcode>
				<xsl:value-of select="credit_term" />
			</credittermcode>
			<cf_xcreditterm_number_of_days />
		</cf_xrsalesinvoice_credit_term>
		<cf_xrsalesinvoice_sales_invoice_date>
			<xsl:value-of select="sales_invoice_date" />
		</cf_xrsalesinvoice_sales_invoice_date>
		<buyer_gstinno>
			<xsl:value-of select="buyer_gstinno" />
		</buyer_gstinno>
		<seller_gstinno>
			<xsl:value-of select="seller_gstinno" />
		</seller_gstinno>
		<seller_state>
			<xsl:value-of select="seller_state" />
		</seller_state>
		<buyer_state>
			<xsl:value-of select="buyer_state" />
		</buyer_state>
		<is_taxfiled>
			<xsl:value-of select="is_taxfiled" />
		</is_taxfiled>
		<trntaxtype>
			<xsl:value-of select="trntaxtype" />
		</trntaxtype>
	</xsl:template>
	<xsl:template match="detail/Table">
		<vtiger_rsiproductrel>
			<productid>
				<productcode>
					<xsl:value-of select="productcode" />
				</productcode>
				<productname>
					<xsl:value-of select="productcode" />
				</productname>
				<crmid />
			</productid>
			<productcode>
				<xsl:value-of select="productcode" />
			</productcode>
			<product_type>
				<xsl:value-of select="product_type" />
			</product_type>
			<sequence_no />
			<quantity>
				<xsl:value-of select="quantity" />
			</quantity>
			<baseqty>
				<xsl:value-of select="baseqty" />
			</baseqty>
			<dispatchqty />
			<refid />
			<reflineid />
			<tuom>
				<uomname>
					<xsl:value-of select="tuom" />
				</uomname>
			</tuom>
			<listprice>
				<xsl:value-of select="listprice" />
			</listprice>
			<discount_percent>
				<xsl:value-of select="detail_discount_percent" />
			</discount_percent>
			<discount_amount>
				<xsl:value-of select="detail_discount_amount" />
			</discount_amount>
			<sch_disc_amount>
				<xsl:value-of select="sch_disc_amount" />
			</sch_disc_amount>
			<comment />
			<description />
			<tax1>
				<xsl:value-of select="tax_amount" />
			</tax1>
			<tax_group>
				<xsl:value-of select="tax_group" />
			</tax_group>
			<taxapplicable_amount>
				<xsl:value-of select="taxapplicable_amount" />
			</taxapplicable_amount>
			<tax2 />
			<tax3 />
			<taxcode>
				<xsl:value-of select="taxcode" />
			</taxcode>
			<taxdescription />
			<tax_percentage>
				<xsl:value-of select="tax_percentage" />
			</tax_percentage>
			<free_qty>
				<xsl:value-of select="free_qty" />
			</free_qty>
			<dam_qty>
				<xsl:value-of select="dam_qty" />
			</dam_qty>
			<batchcode>
				<xsl:value-of select="batchnumber" />
			</batchcode>
			<pkg>
				<xsl:value-of select="pkd" />
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
		</scheme>
	</xsl:template>
</xsl:stylesheet>
