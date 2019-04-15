<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="docinfo" />
			<xsl:apply-templates select="documentcontent" />
		</collections>
	</xsl:template>
	<xsl:template match="docinfo">
		<vtiger_xrpurchaseorderdocinfo>
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
			<documenttype>xrPurchaseOrder</documenttype>
			<clientid>
				<xsl:value-of select="clientid" />
			</clientid>
			<createddate>
				<xsl:value-of select="createddate" />
			</createddate>
		</vtiger_xrpurchaseorderdocinfo>
		<prkey>vendor_no,transactionseriescode,credittermcode,depotcode,godown_code,productcode</prkey>
	</xsl:template>
	<xsl:template match="documentcontent">
		<xsl:apply-templates select="purchaseorder" />

	</xsl:template>
	<xsl:template match="purchaseorder">

		<vtiger_xrpurchaseorder>
			<xsl:apply-templates select="header/NewDataSet/Table" />
			<lineitems>
				<xsl:apply-templates select="detail/NewDataSet/Table" />
			</lineitems>
		</vtiger_xrpurchaseorder >
	</xsl:template>
	<xsl:template match="header/NewDataSet/Table">
		<purchaseorder_no>
				<xsl:value-of select="order_no"/>
			</purchaseorder_no>
			<subject>
				<xsl:value-of select="order_no"/>
			</subject>
			<vendorid>
				<vendor_no>
					<xsl:value-of select="vendor_no"/>
				</vendor_no>
				<vendorname>
					<xsl:value-of select="vendor_no"/>
				</vendorname>
			</vendorid>
			<seller_state>
				<statename>
					<xsl:value-of select="seller_state"/>
				</statename>
				<statecode>
					<xsl:value-of select="seller_state"/>
				</statecode>
			</seller_state>
			<buyer_state>
				<statename>
					<xsl:value-of select="buyer_state"/>
				</statename>
				<statecode>
					<xsl:value-of select="buyer_state"/>
				</statecode>
			</buyer_state>
			<requisition_no>
				<xsl:value-of select="invoice_no"/>
			</requisition_no>
			<tracking_no>
				<xsl:value-of select="invoice_no"/>
			</tracking_no>
			<buyer_gstinno>
				<xsl:value-of select="buyer_gstinno"/>
			</buyer_gstinno>
			<seller_gstinno>
				<xsl:value-of select="seller_gstinno"/>
			</seller_gstinno>
			<contactid />
			<duedate>
				<xsl:value-of select="payment_duedate"/>
			</duedate>
			<total>
				<xsl:value-of select="net_value"/>
			</total>
			<subtotal>
				<xsl:value-of select="gross_amt"/>
			</subtotal>
			<taxtype>individual</taxtype>
			<discount_percent>
				<xsl:value-of select="discount_percent"/>
			</discount_percent>
			<discount_amount>
				<xsl:value-of select="discount_value"/>
			</discount_amount>
			<s_h_amount>
				<xsl:value-of select="s_h_amount"/>
			</s_h_amount>
			<status>Draft</status>
			<next_stage_name>Creation</next_stage_name>
			<conversion_rate>
				<xsl:value-of select="conversion_rate"/>
			</conversion_rate>
			<purchase_order_date>
				<xsl:value-of select="order_date"/>
			</purchase_order_date>
			<transaction_series>
				<transactionseriesname>RPO</transactionseriesname>
				<transactionseriescode>RPO</transactionseriescode>
			</transaction_series>
			<transaction_number>
				<xsl:value-of select="order_no"/>
			</transaction_number>
			<buyer_id>
				<xsl:value-of select="/collections/docinfo/clientid"/>
			</buyer_id>
			<seller_id>
				<xsl:value-of select="/collections/docinfo/fromid"/>
			</seller_id>
			<cf_xrpurchaseorder_credit_term>
				<credittermcode>
					<xsl:value-of select="creaditterm"/>
				</credittermcode>
				<credittermdescription>
					<xsl:value-of select="creaditterm"/>
				</credittermdescription>
			</cf_xrpurchaseorder_credit_term>
			<cf_xrpurchaseorder_bill_date>
				<xsl:value-of select="invoice_date"/>
			</cf_xrpurchaseorder_bill_date>
			<billing_contact_person>
				<xsl:value-of select="billing_contact_person"/>
			</billing_contact_person>
			<shipping_contact_person>
				<xsl:value-of select="shipping_contact_person"/>
			</shipping_contact_person>
			<billing_address_pick>
				<xsl:value-of select="billing_address"/>
			</billing_address_pick>
			<shipping_address_pick>
				<xsl:value-of select="shipping_address"/>
			</shipping_address_pick>
			<depot>
				<depotcode>
					<xsl:value-of select="depot"/>
				</depotcode>
			</depot>
			<pi_godown>
				<godown_code>
					<xsl:value-of select="invoice_no"/>
				</godown_code>
			</pi_godown>
			<cf_xrpurchaseorder_outstanding>
				<xsl:value-of select="invoice_no"/>
			</cf_xrpurchaseorder_outstanding>
			<billing_pobox>
				<xsl:value-of select="billing_pobox"/>
			</billing_pobox>
			<shipping_pobox>
				<xsl:value-of select="shipping_pobox"/>
			</shipping_pobox>
	</xsl:template>
	<xsl:template match="detail/NewDataSet/Table">
		<vtiger_xrpurchaseorderproductrel>
			<productid>
				<productcode>
					<xsl:value-of select="product_code"/>
				</productcode>
				<productname>
					<xsl:value-of select="product_code"/>
				</productname>
			</productid>
			<productcode>
			<xsl:value-of select="product_code"/>
			</productcode>
			<sequence_no>
				<xsl:value-of select="item_sno"/>
			</sequence_no>
			<hsncode>
				<xsl:value-of select="hsncode"/>
			</hsncode>
			<quantity>
				<xsl:value-of select="uom_qty"/>
			</quantity>
			<suggested_reorder_qty>
				<xsl:value-of select="reorder_qty"/>
			</suggested_reorder_qty>
			<suggested_base_reorder_qty>
				<xsl:value-of select="base_reorder_qty"/>
			</suggested_base_reorder_qty>
			<baseqty>
				<xsl:value-of select="baseqty"/>
			</baseqty>
			<recd_qty>
				<xsl:value-of select="qty"/>
			</recd_qty>
			<recd_free />
			<salable_qty>
				<xsl:value-of select="qty"/>
			</salable_qty>
			<salable_free />
			<tuom>
				<uomname>
					<xsl:value-of select="purchaseorder_atuom"/>
				</uomname>
			</tuom>
			<listprice>
				<xsl:value-of select="purchaseorder_price"/>
			</listprice>
			<discount_percent>
				<xsl:value-of select="discount_percent"/>
			</discount_percent>
			<discount_amount>
				<xsl:value-of select="discount_value"/>
			</discount_amount>
			<tax1>
				<xsl:value-of select="tax_amt"/>
			</tax1>
			<tax2 />
			<tax3 />
			<tax_components>
				<xsl:apply-templates select="Tax_components"/>				
			</tax_components>
			<batch_no>
				<xsl:value-of select="batch_no"/>
			</batch_no>
			<pkd>
				<xsl:value-of select="pkd"/>
			</pkd>
			<expiry>
				<xsl:value-of select="expiry"/>
			</expiry>
			<stock_type>
				<xsl:value-of select="stock_type"/>
			</stock_type>
			<serialnumber>
				<xsl:value-of select="serial_number"/>
			</serialnumber>
			<grossamt>
				<xsl:value-of select="gross_amt"/>
			</grossamt>
			<net_amt>
				<xsl:value-of select="net_amt"/>
			</net_amt>
			<tax_percent>
				<xsl:value-of select="tax_percent"/>
			</tax_percent>
			<mrp>
				<xsl:value-of select="mrp"/>
			</mrp>
			<uom_price>
				<xsl:value-of select="uom_price"/>
			</uom_price>
			<ptr>
				<xsl:value-of select="ptr"/>
			</ptr>
			<taxs>
				<xsl:apply-templates select="taxs/tax"/>
			</taxs>
		</vtiger_xrpurchaseorderproductrel>
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
</xsl:stylesheet>