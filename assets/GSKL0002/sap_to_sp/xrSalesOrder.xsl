<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="docinfo" />
			<xsl:apply-templates select="documentcontent" />
		</collections>
	</xsl:template>
	<xsl:template match="docinfo">
		<vtiger_xrsodocinfo>
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
			<documenttype>xrSalesOrder</documenttype>
			<clientid>
				<xsl:value-of select="clientid" />
			</clientid>
			<createddate>
				<xsl:value-of select="createddate" />
			</createddate>
		</vtiger_xrsodocinfo>
		<prkey>customercode,salesmancode,beatcode,transactionseriescode,productcode,prodhiercode</prkey>
	</xsl:template>
	<xsl:template match="documentcontent">
		<xsl:apply-templates select="salesorder"/>
	</xsl:template>
	<xsl:template match="salesorder">
		<vtiger_xrso>
			<xsl:apply-templates select="header/NewDataSet/Table"/>
			<lineitems>
				<xsl:apply-templates select="detail/NewDataSet/Table"/>
			</lineitems>
		</vtiger_xrso>
	</xsl:template>
	<xsl:template match="header/NewDataSet/Table">
		<cf_xrso_seller_id>
			<xsl:value-of select="distributorcode" />
		</cf_xrso_seller_id>
		<dist_code>
			<xsl:value-of select="distributorcode" />
		</dist_code>
		<cf_xrso_buyer_id/>
		<latitude>
			<xsl:value-of select="latitude"/>
		</latitude>
		<longitude>
		<xsl:value-of select="longitude"/>
		</longitude>
		<cf_xrso_next_stage_name>Creation</cf_xrso_next_stage_name>
		<cf_xrso_type/>
		<cf_xrso_credit_term>
			<cf_xcreditterm_distributor>60</cf_xcreditterm_distributor>
		</cf_xrso_credit_term>
		<type>12</type>
		<cf_xrso_beat>
			<beatcode>
			<xsl:value-of select="beatcode"/>
			</beatcode>
			<beatname>
				<xsl:value-of select="beatcode"/>
			</beatname>
		</cf_xrso_beat>
		<cf_xrso_sales_man>
			<salesmancode>
			<xsl:value-of select="salesman_code"/>
			</salesmancode>
			<salesman>
				<xsl:value-of select="salesman_code"/>
			</salesman>
			<crmid/>
		</cf_xrso_sales_man>
		<customer_type>0</customer_type>
		<cf_salesorder_send_to_buyer/>
		<cf_salesorder_transaction_number>
			<xsl:value-of select="UID"/>
		</cf_salesorder_transaction_number>
		<description>Mobile Sales Order Receive</description>
		<terms_conditions>Mobile Integration Distributor terms....</terms_conditions>
		<cf_salesorder_transaction_series>
			<transactionseriescode/>
			<transactionseriesname>RSALESORDER</transactionseriesname>
		</cf_salesorder_transaction_series>
		<cf_salesorder_sales_order_date>
			<xsl:value-of select="orderdate"/>
		</cf_salesorder_sales_order_date>
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
		<total>
			<xsl:value-of select="Totllamt"/>
		</total>
		<exciseduty/>
		<salescommission/>
		<adjustment/>
		<carrier/>
		<duedate>
			<xsl:value-of select="duedate"/>
		</duedate>
		<contactid/>
		<tracking_no>
			<xsl:value-of select="UID"/>
		</tracking_no>
		<requisition_no/>
		<buyerid>
			<customercode>
				<xsl:value-of select="customercode"/>
			</customercode>
			<customername>
				<xsl:value-of select="customercode"/>
			</customername>
			<crmid/>
		</buyerid>
		<subject>
			<xsl:value-of select="orderid"/>
		</subject>
		<salesorder_no/>
		<transaction_end_time>
		<xsl:value-of select="transaction_end_time"/>
		</transaction_end_time>
	</xsl:template>
	<xsl:template match="detail/NewDataSet/Table">
		<vtiger_xrsoproductrel>
			<productid>
				<productcode>
					<xsl:value-of select="product_code" />
				</productcode>
				<productname>
					<xsl:value-of select="product_code" />
				</productname>
			</productid>
			<productcode>
				<xsl:value-of select="product_code" />
			</productcode>
			<sequence_no>
				<xsl:value-of select="SNo" />
			</sequence_no>
			<xprodhierid>
               <prodhiercode>
			  <xsl:value-of select="prod_ctgry_code" />
			  </prodhiercode>
            </xprodhierid>
			<product_category_code>
			<xsl:value-of select="prod_ctgry_code" />
			</product_category_code>
			<quantity>
				<xsl:value-of select="Quantity" />
			</quantity>
			<baseqty>
				<xsl:value-of select="Baseqty" />
			</baseqty>
			<dispatchqty>0</dispatchqty>
			<siqty>0</siqty>
			<tuom>
				<uomname>
					<xsl:value-of select="uom_code" />
				</uomname>
				<crmid>
					<xsl:value-of select="uom_code" />
				</crmid>
			</tuom>
			<listprice>
				<xsl:value-of select="listprice" />
			</listprice>
			<discount_percent>
				<xsl:value-of select="Discount" />
			</discount_percent>
			<discount_amount>
				<xsl:value-of select="Discountamount" />
			</discount_amount>
			<description>
				<xsl:value-of select="Remarks" />
			</description>
			<lineitem_id>
				<xsl:value-of select="SNo" />
			</lineitem_id>
			<comment>
				<xsl:value-of select="Remarks" />
			</comment>
			<ptr>
				<xsl:value-of select="PTR" />
			</ptr>
			<mrp>
				<xsl:value-of select="MRP" />
			</mrp>
			<incrementondel/>
			<tax1/>
			<tax2/>
			<tax3/>
		</vtiger_xrsoproductrel>
	</xsl:template>
</xsl:stylesheet>