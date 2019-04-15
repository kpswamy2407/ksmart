<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>distributorcode,statecode,customergroupcode,credittermcode,collectionmethodcode,geohiercode,generalclasscode,valueclasscode,channelhierarchycode,potentialclasscode</prkey>
			<xsl:apply-templates select="/collections/documentcontent/NewDataSet/Table" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xretailerdocinfo>
			<fromid><xsl:value-of select="/collections/documentcontent/NewDataSet/Table/ForumCode" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>xRetailer</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_xretailerdocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/NewDataSet/Table">
		<vtiger_xretailer>
			<customername><xsl:value-of select="Name" /></customername>
			<customercode><xsl:value-of select="CustomerCode" /></customercode>
			<cf_xretailer_address_1><xsl:value-of select="Address1" /></cf_xretailer_address_1>
			<cf_xretailer_address_2><xsl:value-of select="Address2" /></cf_xretailer_address_2>
			<cf_xretailer_city><xsl:value-of select="City" /></cf_xretailer_city>
			<cf_xretailer_contact_person><xsl:value-of select="ContactPerson" /></cf_xretailer_contact_person>
			<cf_xretailer_email><xsl:value-of select="EmailId" /></cf_xretailer_email>
			<cf_xretailer_phone><xsl:value-of select="PhoneNumber" /></cf_xretailer_phone>
			<cf_xretailer_pin_code><xsl:value-of select="PIN" /></cf_xretailer_pin_code>
			<cf_xretailer_mobile_no><xsl:value-of select="MobileNumber" /></cf_xretailer_mobile_no>
			<cf_xretailer_supply_chain_distributor>
				<distributorname></distributorname>
				<distributorcode><xsl:value-of select="ForumCode" /></distributorcode> 
			</cf_xretailer_supply_chain_distributor>
			<cf_xretailer_distance>0</cf_xretailer_distance>
			<cf_xretailer_confi_frieght_rate>0</cf_xretailer_confi_frieght_rate>
			<cf_xretailer_tin_number><xsl:value-of select="TIN" /></cf_xretailer_tin_number>
			<cf_xretailer_state>
				<statename><xsl:value-of select="State" /></statename>
				<statecode><xsl:value-of select="State" /></statecode>
			</cf_xretailer_state>
			<cf_xretailer_outstanding_validation>0</cf_xretailer_outstanding_validation>
			<cf_xretailer_active>1</cf_xretailer_active>
			<cf_xretailer_non_confi_frieght_rate/>
			<distributor_id><xsl:value-of select="DistId" /></distributor_id>
			<cf_xretailer_credit_limit>0</cf_xretailer_credit_limit>
			<cf_xpayment_payment_mode>
				<collectionmethoddescription><xsl:value-of select="PaymentMode" /></collectionmethoddescription>
				<collectionmethodcode><xsl:value-of select="PaymentMode" /></collectionmethodcode>
			</cf_xpayment_payment_mode>
			<registration_date><xsl:value-of select="RegDate" /></registration_date>
			<cash_discount>0</cash_discount>
			<cf_xretailer_geography>
				<geohiername><xsl:value-of select="GeoHier" /></geohiername>
				<geohiercode><xsl:value-of select="GeoHier" /></geohiercode>
			</cf_xretailer_geography>
			<xretailer_general_classification>
				<generalclassdescription><xsl:value-of select="GenClass" /></generalclassdescription>
				<generalclasscode><xsl:value-of select="GenClass" /></generalclasscode>
			</xretailer_general_classification>
			<xretailer_value_classification>
				<valueclasscode><xsl:value-of select="ValClass" /></valueclasscode>
				<valueclassdescription><xsl:value-of select="ValClass" /></valueclassdescription>
			</xretailer_value_classification>
			<cf_xretailer_channel_type>
				<channelhierarchycode><xsl:value-of select="ChnHier" /></channelhierarchycode>
				<channel_hierarchy><xsl:value-of select="ChnHier" /></channel_hierarchy>
			</cf_xretailer_channel_type>
			<cf_xretailer_customer_group>
				<customergroupname/>
				<customergroupcode/>
			</cf_xretailer_customer_group>
			<cf_xretailer_potential>
				<potentialclassdesc><xsl:value-of select="PotClass" /></potentialclassdesc>
				<potentialclasscode><xsl:value-of select="PotClass" /></potentialclasscode>
			</cf_xretailer_potential>
			<cf_xretailer_creditdays>
				<credittermcode><xsl:value-of select="CreditDays" /></credittermcode>
				<credittermdescription><xsl:value-of select="CreditDays" /></credittermdescription>
			</cf_xretailer_creditdays>
			<cf_xretailer_creditbills><xsl:value-of select="CreditBills" /></cf_xretailer_creditbills>
			<cf_xretailer_creditamount><xsl:value-of select="creditamount" /></cf_xretailer_creditamount>
			<doa><xsl:value-of select="DOA" /></doa>
			<dob><xsl:value-of select="DOB" /></dob>
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
			<store_layout><xsl:value-of select="store_layout" /></store_layout>
			<store_type><xsl:value-of select="store_type" /></store_type>
			<store_size><xsl:value-of select="store_size" /></store_size>		
			<shelves_count><xsl:value-of select="shelves_count" /></shelves_count>
			<retailer_drug_no_20b><xsl:value-of select="retailer_drug_no_20b" /></retailer_drug_no_20b>
			<retailer_drug_no_21b><xsl:value-of select="retailer_drug_no_21b" /></retailer_drug_no_21b>
		</vtiger_xretailer>
	</xsl:template>
</xsl:stylesheet>