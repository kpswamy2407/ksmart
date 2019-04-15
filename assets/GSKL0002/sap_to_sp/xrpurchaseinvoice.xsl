<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="docinfo"/>
			<xsl:apply-templates select="documentcontent"/>
		</collections>
	</xsl:template>
	<xsl:template match="docinfo">
		<vtiger_xrpidocinfo>
			<clientid>
				<xsl:value-of select="clientid"/>
			</clientid>
			<transactionid>
				<xsl:value-of select="transactionid"/>
			</transactionid>
			<fromid>
				<xsl:value-of select="fromid"/>
			</fromid>
			<sourceapplication>
				<xsl:value-of select="sourceapplication"/>
			</sourceapplication>
			<createddate>
				<xsl:value-of select="createddate"/>
			</createddate>
			<documenttype>xrPurchaseInvoice</documenttype>
			<destapplication>
				<xsl:value-of select="destapplication"/>
			</destapplication>
		</vtiger_xrpidocinfo>
		<prkey>vendor_no,transactionseriescode,credittermcode,depotcode,godown_code,productcode</prkey>
	</xsl:template>
	<xsl:template match="documentcontent">
		<xsl:apply-templates select="st_xpurchaseinvoice"/>
	</xsl:template>
	<xsl:template match="st_xpurchaseinvoice">
		<vtiger_xrpi>
			<purchaseinvoice_no>
				<xsl:value-of select="invoice_no"/>
			</purchaseinvoice_no>
			<total>
				<xsl:value-of select="total"/>
			</total>
			<trntaxtype>
				<xsl:value-of select="trntaxtype"/>
			</trntaxtype>
			<is_taxfiled>0</is_taxfiled>
			<cf_purchaseinvoice_seller_id>
				<xsl:value-of select="/collections/docinfo/fromid"/>
			</cf_purchaseinvoice_seller_id>
			<subject>
				<xsl:value-of select="subject"/>
			</subject>
			<tracking_no>
				<xsl:value-of select="subject"/>
			</tracking_no>
			<buyer_state>
				<xsl:value-of select="buyer_state"/>
			</buyer_state>
			<cf_purchaseinvoice_credit_term>
				<credittermdescription>
					<xsl:value-of select="credit_term"/>
				</credittermdescription>
				<credittermcode>
					<xsl:value-of select="credit_term"/>
				</credittermcode>
			</cf_purchaseinvoice_credit_term>
			<purchaseorder_date>
				<xsl:value-of select="purchaseorder_date"/>
			</purchaseorder_date>
			<cf_purchaseinvoice_buyer_id>
				<xsl:value-of select="disctibutor_code"/>
			</cf_purchaseinvoice_buyer_id>
			<contactid/>
			<cf_purchaseinvoice_outstanding>
				<xsl:value-of select="net_value"/>
			</cf_purchaseinvoice_outstanding>
			<s_h_amount>
				<xsl:value-of select="frieght"/>
			</s_h_amount>
			<conversion_rate/>
			<cf_purchaseinvoice_transaction_series>
				<transactionseriescode>RPI</transactionseriescode>
				<transactionseriesname>RPI</transactionseriesname>
			</cf_purchaseinvoice_transaction_series>
			<duedate>
				<xsl:value-of select="payment_duedate"/>
			</duedate>
			<cf_purchaseinvoice_transaction_number>
				<xsl:value-of select="invoice_no"/>
			</cf_purchaseinvoice_transaction_number>
			<buyer_gstinno>
				<xsl:value-of select="buyer_gstinno"/>
			</buyer_gstinno>
			<taxtype>individual</taxtype>
			<cf_purchaseinvoice_bill_date>
				<xsl:value-of select="invoice_date"/>
			</cf_purchaseinvoice_bill_date>
			<cf_purchaseinvoice_next_stage_name>Publish</cf_purchaseinvoice_next_stage_name>
			<cf_purchaseinvoice_depot>
				<depotcode>
					<xsl:value-of select="depot"/>
				</depotcode>
			</cf_purchaseinvoice_depot>
			<status>Created</status>
			<xsl:apply-templates select="lineitems"/>
			<cf_purchaseinvoice_payment_date>
				<xsl:value-of select="payment_duedate"/>
			</cf_purchaseinvoice_payment_date>
			<cf_purchaseinvoice_purchase_invoice_date>
				<xsl:value-of select="purchase_invoice_date"/>
			</cf_purchaseinvoice_purchase_invoice_date>
			<subtotal>
				<xsl:value-of select="net_value"/>
			</subtotal>
			<discount_amount>
				<xsl:value-of select="discount_amount"/>
			</discount_amount>
			<pi_godown>
				<godown_code>
					<xsl:value-of select="godown_code"/>
				</godown_code>
			</pi_godown>
			<discount_percent>
				<xsl:value-of select="discount_percent"/>
			</discount_percent>
			<seller_gstinno>
				<xsl:value-of select="seller_gstinno"/>
			</seller_gstinno>
			<requisition_no>
				<xsl:value-of select="odn_refno"/>
			</requisition_no>
			<vendorid>
				<vendorname>9010</vendorname>
				<vendor_no>9010</vendor_no>
			</vendorid>
			<purchaseorder_no>
				<xsl:value-of select="purchaseorder_no"/>
			</purchaseorder_no>
			<seller_state>
				<xsl:value-of select="seller_state"/>
			</seller_state>
		</vtiger_xrpi>
	</xsl:template>
	<xsl:template match="lineitems">
		<lineitems>
			<xsl:apply-templates select="st_xpurchaseinvoicedetail"/>
		</lineitems>
	</xsl:template>
	<xsl:template match="st_xpurchaseinvoicedetail">
		<vtiger_xrpiproductrel>
			<tax2/>
			<tax1>
				<xsl:value-of select="tax_amt"/>
			</tax1>
			<sequence_no>
				<xsl:value-of select="item_sno"/>
			</sequence_no>
			<tuom>
				<uomname>
					<xsl:value-of select="tuom"/>
				</uomname>
			</tuom>
			<mrp>
				<xsl:value-of select="mrp"/>
			</mrp>
			<listprice>
				<xsl:value-of select="listprice"/>
			</listprice>
			<serialnumber>
				<xsl:value-of select="serial_number"/>
			</serialnumber>
			<pkd>
				<xsl:value-of select="pkd"/>
			</pkd>
			<recd_qty>
				<xsl:value-of select="uom_qty"/>
			</recd_qty>
			<recd_free>
				<xsl:value-of select="salable_free"/>
			</recd_free>
			<tax3/>
			<discount_amount>
				<xsl:value-of select="discount_amount"/>
			</discount_amount>
			<discount_percent>
				<xsl:value-of select="discount_percent"/>
			</discount_percent>
			<expiry>
				<xsl:value-of select="expiry"/>
			</expiry>
			<baseqty>
				<xsl:value-of select="qty"/>
			</baseqty>
			<uom_price>
				<xsl:value-of select="uom_price"/>
			</uom_price>
			<productid>
				<productcode>
					<xsl:value-of select="productcode"/>
				</productcode>
				<productname>
					<xsl:value-of select="productcode"/>
				</productname>
			</productid>
			<taxs>
				<xsl:apply-templates select="st_taxs/st_tax"/>
			</taxs>
			<salable_free>
				<xsl:value-of select="salable_free"/>
			</salable_free>
			<grossamt>
				<xsl:value-of select="gross_amt"/>
			</grossamt>
			<quantity>
				<xsl:value-of select="salable_qty"/>
			</quantity>
			<stock_type>
				<xsl:value-of select="stock_type"/>
			</stock_type>
			<salable_qty>
				<xsl:value-of select="salable_qty"/>
			</salable_qty>
			<batch_no>
				<xsl:value-of select="batch_no"/>
			</batch_no>
			<ptr>
				<xsl:value-of select="ptr"/>
			</ptr>
			<pts>
				<xsl:value-of select="listprice"/>
			</pts>
			<hsncode>
				<xsl:value-of select="hsncode"/>
			</hsncode>
		</vtiger_xrpiproductrel>
	</xsl:template>
	<xsl:template match="st_taxs/st_tax">
		<tax>
			<tax_type>
				<xsl:value-of select="tax_type"/>
			</tax_type>
			<tax_amt>
				<xsl:value-of select="tax_amt"/>
			</tax_amt>
			<taxable_amt>
				<xsl:value-of select="taxable_amt"/>
			</taxable_amt>
			<tax_group_type>
				<xsl:value-of select="tax_group_type"/>
			</tax_group_type>
			<tax_percentage>
				<xsl:value-of select="lst_per"/>
			</tax_percentage>
			<cst_tax_percentage>
				<xsl:value-of select="cst_per"/>
			</cst_tax_percentage>
		</tax>
	</xsl:template>
</xsl:stylesheet>