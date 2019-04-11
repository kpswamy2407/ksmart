<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>customercode,salesmancode,beatcode,transactionseriescode,productcode,reasoncode</prkey>
			<xsl:apply-templates select="/collections/documentcontent/salesorder/header/NewDataSet/Table" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xrsodocinfo>
			<fromid><xsl:value-of select="/collections/documentcontent/salesorder/header/NewDataSet/Table/ForumCode" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>xrSalesOrder</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_xrsodocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/salesorder/header/NewDataSet/Table">
		<vtiger_xrso>
			<cf_xrso_seller_id><xsl:value-of select="ForumCode" /></cf_xrso_seller_id>
			<distributor_id><xsl:value-of select="xdistId" /></distributor_id>
			<cf_xrso_buyer_id/>
			<latitude><xsl:value-of select="latitude" /></latitude>
			<longitude><xsl:value-of select="longitude" /></longitude>
			<cf_xrso_next_stage_name>Creation</cf_xrso_next_stage_name>
			<type>11</type>
			<cf_xrso_credit_term>
				<cf_xcreditterm_user_id/>
				<cf_xcreditterm_distributor><xsl:value-of select="CreditTerm" /></cf_xcreditterm_distributor>
				<cf_xcreditterm_number_of_days/>
				<credittermcode/>
				<credittermdescription/>
				<crmid/>
			</cf_xrso_credit_term>
			<cf_xrso_beat>
				<beatcode><xsl:value-of select="BeatID" /></beatcode>
				<beatname><xsl:value-of select="BeatID" /></beatname>
				<crmid/>
			</cf_xrso_beat>
			<cf_xrsalesorder_reason>
				<reasoncode><xsl:value-of select="ReasonCode" /></reasoncode>
				<reason><xsl:value-of select="ReasonCode" /></reason>
			</cf_xrsalesorder_reason>
			<cf_xrso_cpy_sales_man>			
				<cpysalesmancode><xsl:value-of select="CompanySalesmanCode" /></cpysalesmancode>
				<cpysalesman><xsl:value-of select="CompanySalesmanId" /></cpysalesman>
			</cf_xrso_cpy_sales_man>
			<cf_xrso_sales_man>
				<cf_xsalesman_distributor/>
				<salesmancode><xsl:value-of select="SalesmanCode" /></salesmancode>
				<salesman><xsl:value-of select="SalesmanCode" /></salesman>
				<salesmanid><xsl:value-of select="SalesmanId" /></salesmanid>
				<crmid/>
			</cf_xrso_sales_man>
			<cf_salesorder_send_to_buyer/>
			<cf_salesorder_transaction_number><xsl:value-of select="UID" /></cf_salesorder_transaction_number>
			<description>Mobile Sales Order Receive</description>
			<terms_conditions>Mobile Integration Distributor terms....</terms_conditions>
			<cf_salesorder_transaction_series>
				<transactionseriescode/>
				<transactionseriesname>RSALESORDER</transactionseriesname>
			</cf_salesorder_transaction_series>
			<cf_salesorder_sales_order_date><xsl:value-of select="OrderDate" /></cf_salesorder_sales_order_date>
			<conversion_rate/>
			<currency_id>
				<id/>
				<currency_code>INR</currency_code>
			</currency_id>
			<status>Draft</status>
			<s_h_amount/>
			<discount_amount/>
			<discount_percent/>
			<taxtype/>
			<subtotal/>
			<total><xsl:value-of select="Totllamt" /></total>
			<exciseduty/>
			<salescommission/>
			<adjustment/>
			<carrier/>
			<duedate><xsl:value-of select="DeliveryDate" /></duedate>
			<contactid/>
			<tracking_no><xsl:value-of select="UID" /></tracking_no>
			<requisition_no/>
			<customer_type><xsl:value-of select="customer_type" /></customer_type>
			<transaction_start_time><xsl:value-of select="transaction_start_time" /></transaction_start_time>
			<transaction_end_time><xsl:value-of select="transaction_end_time" /></transaction_end_time>
			<session_id><xsl:value-of select="VisitUID" /></session_id>
			<buyerid>
				<distributor_id/>
				<cf_xretailer_non_confi_frieght_rate/>
				<cf_xretailer_outstanding_validation/>
				<cf_xretailer_state/>
				<cf_xretailer_tin_number/>
				<cf_xretailer_confi_frieght_rate/>
				<cf_xretailer_distance/>
				<cf_xretailer_beat/>
				<cf_xretailer_sales_man/>
				<cf_xretailer_channel_type><xsl:value-of select="CustCtgryID" /></cf_xretailer_channel_type>
				<cf_xretailer_supply_chain_distributor/>
				<cf_xretailer_mobile_no/>
				<cf_xretailer_pin_code/>
				<cf_xretailer_phone/>
				<cf_xretailer_email/>
				<cf_xretailer_contact_person/>
				<cf_xretailer_city/>
				<cf_xretailer_address_2/>
				<cf_xretailer_address_1/>
				<customercode><xsl:value-of select="CustomerID" /></customercode>
				<customername><xsl:value-of select="CustomerID" /></customername>
				<crmid/>
			</buyerid>
			<subject><xsl:value-of select="OrderID" /></subject>
			<salesorder_no/>
			<crmid/>
			<bill_street/>
			<ship_street/>
			<bill_city/>
			<ship_city/>
			<bill_state/>
			<ship_state/>
			<bill_code/>
			<ship_code/>
			<bill_country/>
			<ship_country/>
			<bill_pobox/>
			<ship_pobox/>
			<xsl:apply-templates select="/collections/documentcontent/salesorder/detail/NewDataSet/Table" />
		</vtiger_xrso>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/salesorder/detail/NewDataSet/Table">
		<lineitems>
			<vtiger_xrsoproductrel>
				<productid>
					<cf_xproduct_reporting_uom_conversion/>
					<cf_xproduct_price_at_uom><xsl:value-of select="Price" /></cf_xproduct_price_at_uom>
					<cf_xproduct_description><xsl:value-of select="Remarks" /></cf_xproduct_description>
					<cf_xproduct_flavour/>
					<cf_xproduct_pack/>
					<cf_xproduct_contect/>
					<cf_xproduct_forum_code><xsl:value-of select="ForumCode" /></cf_xproduct_forum_code>
					<cf_xproduct_purchase_tax/>
					<cf_xproduct_sales_tax/>
					<cf_xproduct_uom2_conversion>1</cf_xproduct_uom2_conversion>
					<cf_xproduct_uom2><xsl:value-of select="UOMID" /></cf_xproduct_uom2>
					<cf_xproduct_uom1_conversion>1</cf_xproduct_uom1_conversion>
					<cf_xproduct_uom1><xsl:value-of select="UOMID" /></cf_xproduct_uom1>
					<cf_xproduct_conversion_factor/>
					<cf_xproduct_conversion_unit/>
					<cf_xproduct_reporting_unit/>
					<cf_xproduct_reporting_uom/>
					<cf_xproduct_base_uom><xsl:value-of select="UOMID" /></cf_xproduct_base_uom>
					<cf_xproduct_mrp><xsl:value-of select="Price" /></cf_xproduct_mrp>
					<cf_xproduct_pts/>
					<cf_xproduct_minimum_order_quantity/>
					<cf_xproduct_stock_norm/>
					<cf_xproduct_vat/>
					<cf_xproduct_category><xsl:value-of select="ProdCtgryID" /></cf_xproduct_category>
					<cf_xproduct_division/>
					<cf_xproduct_ecp/>
					<cf_xproduct_ptr/>
					<cf_xproduct_track_pkd/>
					<cf_xproduct_track_batch/>
					<cf_xproduct_manufacturer/>
					<productcode><xsl:value-of select="ProductCode" /></productcode>
					<productname><xsl:value-of select="ProductCode" /></productname>
					<crmid/>
				</productid>
				<productcode><xsl:value-of select="ProductCode" /></productcode>
				<sequence_no><xsl:value-of select="SNo" /></sequence_no>
				<quantity><xsl:value-of select="Quantity" /></quantity>
				<baseqty><xsl:value-of select="Baseqty" /></baseqty>
				<dispatchqty>0</dispatchqty>
				<siqty>0</siqty>
				<tuom>
					<uomname><xsl:value-of select="UOMID" /></uomname>
					<crmid><xsl:value-of select="UOMID" /></crmid>
				</tuom>
				<listprice><xsl:value-of select="Price" /></listprice>
				<discount_percent><xsl:value-of select="Discount" /></discount_percent>
				<discount_amount><xsl:value-of select="Discountamount" /></discount_amount>
				<description><xsl:value-of select="Remarks" /></description>
				<lineitem_id><xsl:value-of select="SNo" /></lineitem_id>
				<comment><xsl:value-of select="Remarks" /></comment>
				<ptr><xsl:value-of select="PTR" /></ptr>
				<mrp><xsl:value-of select="MRP" /></mrp>
				<incrementondel/>
				<tax1/>
				<tax2/>
				<tax3/>
			</vtiger_xrsoproductrel>
		</lineitems>
	</xsl:template>
</xsl:stylesheet>