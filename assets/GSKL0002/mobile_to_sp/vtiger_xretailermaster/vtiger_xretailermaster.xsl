<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>distributorcode,statecode,customergroupcode,credittermcode,collectionmethodcode,geohiercode,generalclasscode,valueclasscode,channelhierarchycode,potentialclasscode</prkey>
			<xsl:apply-templates select="/collections/documentcontent/NewDataSet/Table" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xreceivecustomermasterdocinfo>
			<fromid><xsl:value-of select="/collections/documentcontent/NewDataSet/Table/ForumCode" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>xReceiveCustomerMaster</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_xreceivecustomermasterdocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/NewDataSet/Table">
		<vtiger_xreceivecustomermaster>
			<customername><xsl:value-of select="Name" /></customername>
			<customercode><xsl:value-of select="CustomerCode" /></customercode>
			<xretailer_address_1><xsl:value-of select="Address1" /></xretailer_address_1>
			<xretailer_address_2><xsl:value-of select="Address2" /></xretailer_address_2>
			<xretailer_city><xsl:value-of select="City" /></xretailer_city>
			<xretailer_contact_person><xsl:value-of select="ContactPerson" /></xretailer_contact_person>
			<xretailer_email><xsl:value-of select="EmailId" /></xretailer_email>
			<xretailer_phone><xsl:value-of select="PhoneNumber" /></xretailer_phone>
			<xretailer_pin_code><xsl:value-of select="PIN" /></xretailer_pin_code>
			<xretailer_mobile_no><xsl:value-of select="MobileNumber" /></xretailer_mobile_no>
			<xretailer_supply_chain_distributor>
				<distributorname></distributorname>
				<distributorcode><xsl:value-of select="ForumCode" /></distributorcode> 
			</xretailer_supply_chain_distributor>
			<xretailer_distance>0</xretailer_distance>
			<xretailer_confi_frieght_rate>0</xretailer_confi_frieght_rate>
			<xretailer_tin_number><xsl:value-of select="TIN" /></xretailer_tin_number>
			<xretailer_state>
				<statename><xsl:value-of select="State" /></statename>
				<statecode><xsl:value-of select="State" /></statecode>
			</xretailer_state>
			<xretailer_outstanding_validation>0</xretailer_outstanding_validation>
			<xretailer_active>1</xretailer_active>
			<xretailer_non_confi_frieght_rate/>
			<distributor_id><xsl:value-of select="DistId" /></distributor_id>

			<xretailer_credit_limit>0</xretailer_credit_limit>
			<xpayment_payment_mode>
				<collectionmethoddescription><xsl:value-of select="PaymentMode" /></collectionmethoddescription>
				<collectionmethodcode><xsl:value-of select="PaymentMode" /></collectionmethodcode>
			</xpayment_payment_mode>
			<registration_date><xsl:value-of select="RegDate" /></registration_date>
			<cash_discount>0</cash_discount>
			<xretailer_status>Draft</xretailer_status>
			<xretailer_next_stage_name>Creation</xretailer_next_stage_name>
			<xretailer_geography>
				<geohiername><xsl:value-of select="GeoHier" /></geohiername>
				<geohiercode><xsl:value-of select="GeoHier" /></geohiercode>
			</xretailer_geography>
			<xretailer_general_classification>
				<generalclassdescription><xsl:value-of select="GenClass" /></generalclassdescription>
				<generalclasscode><xsl:value-of select="GenClass" /></generalclasscode>
			</xretailer_general_classification>
			<xretailer_value_classification>
				<valueclasscode><xsl:value-of select="ValClass" /></valueclasscode>
				<valueclassdescription><xsl:value-of select="ValClass" /></valueclassdescription>
			</xretailer_value_classification>
			<xretailer_channel_type>
				<channelhierarchycode><xsl:value-of select="ChnHier" /></channelhierarchycode>
				<channel_hierarchy><xsl:value-of select="ChnHier" /></channel_hierarchy>
			</xretailer_channel_type>
			<xretailer_customer_group>
				<customergroupname/>
				<customergroupcode/>
			</xretailer_customer_group>
			<xretailer_potential>
				<potentialclassdesc><xsl:value-of select="PotClass" /></potentialclassdesc>
				<potentialclasscode><xsl:value-of select="PotClass" /></potentialclasscode>
			</xretailer_potential>
			<xretailer_creditdays>
				<credittermcode><xsl:value-of select="CreditDays" /></credittermcode>
				<credittermdescription><xsl:value-of select="CreditDays" /></credittermdescription>
			</xretailer_creditdays>
			<xretailer_creditbills><xsl:value-of select="CreditBills" /></xretailer_creditbills>
			<xretailer_creditamount><xsl:value-of select="creditamount" /></xretailer_creditamount>
			<doa><xsl:value-of select="DOA" /></doa>
			<gstinno><xsl:value-of select="gstinno" /></gstinno>
			<panno><xsl:value-of select="panno" /></panno>
			<typeofservices>Customer</typeofservices>
			<bank_name/>
			<branch_name/>
			<bank_account_number/>
			<ifsc_code/>

			<xretailer_beat><xsl:value-of select="BeatId" /></xretailer_beat>
			<xretailer_sales_man><xsl:value-of select="SalesId" /></xretailer_sales_man>

			<latitude><xsl:value-of select="Latitude" /></latitude>
			<longitude><xsl:value-of select="Longitude" /></longitude>
			
			<internal_ref_no><xsl:value-of select="UID" /></internal_ref_no>
		</vtiger_xreceivecustomermaster>
	</xsl:template>
</xsl:stylesheet>