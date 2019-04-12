<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>supplychainhiercode,generalclasscode,customergroupcode,geohiercode,potentialclasscode,collectionmethodcode,credittermcode,customercode,valueclasscode</prkey>
			<xsl:apply-templates select="/collections/documentcontent/NewDataSet/Table" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xsubretailerinfo>
			<fromid><xsl:value-of select="/collections/documentcontent/NewDataSet/Table/ForumCode" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>xsubretailer</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_xsubretailerinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/NewDataSet/Table">
		<vtiger_xsubretailer>
			<ret_store_name><xsl:value-of select="storename" /></ret_store_name>
			<cust_first_name><xsl:value-of select="firstname" /></cust_first_name>
			<cust_middle_name><xsl:value-of select="middlename" /></cust_middle_name>
			<cust_last_name><xsl:value-of select="lastname" /></cust_last_name>
			<gender><xsl:value-of select="gender" /></gender>
			<area_name><xsl:value-of select="area_name" /></area_name>
			<taluka_name><xsl:value-of select="taluka_name" /></taluka_name>
			<street_name><xsl:value-of select="street_name" /></street_name>
			<market_name><xsl:value-of select="market_name" /></market_name>
			<typeshopfirm><xsl:value-of select="typeshopfirm" /></typeshopfirm>
			<idcardtype><xsl:value-of select="idcardtype" /></idcardtype>
			<id_card_number><xsl:value-of select="id_card_number" /></id_card_number>
			<idproofimagename><xsl:value-of select="idproofimagename" /></idproofimagename>
			<std_code><xsl:value-of select="std_code" /></std_code>
			<plot_number><xsl:value-of select="plot_number" /></plot_number>
			<landmark><xsl:value-of select="landmark" /></landmark>
			<customercode><xsl:value-of select="CustomerCode" /></customercode>
			<customername><xsl:value-of select="Name" /></customername>
			<address_1><xsl:value-of select="Address1" /></address_1>
			<address_2><xsl:value-of select="Address2" /></address_2>
			<retailer_group><xsl:value-of select="retailer_group" /></retailer_group>
			<pin_code><xsl:value-of select="PIN" /></pin_code>
			<city><xsl:value-of select="City" /></city>
			<state><xsl:value-of select="State" /></state>
			<contact_person><xsl:value-of select="ContactPerson" /></contact_person>
			<phone><xsl:value-of select="PhoneNumber" /></phone>
			<mobile_no><xsl:value-of select="MobileNumber" /></mobile_no>
			<email><xsl:value-of select="EmailId" /></email>
			<active><xsl:value-of select="active" /></active>
			<district><xsl:value-of select="district" /></district>
			<location_area><xsl:value-of select="location_area" /></location_area>
			<alternative_name><xsl:value-of select="alternative_name" /></alternative_name>
			<xsubretailer_supply_chain_distributor>
				<supplychainhiername/>
				<supplychainhiercode><xsl:value-of select="ForumCode" /></supplychainhiercode> 
			</xsubretailer_supply_chain_distributor>
			<tin_number><xsl:value-of select="tin_number" /></tin_number>
			<fssai><xsl:value-of select="fssai" /></fssai>
			<gstinno><xsl:value-of select="gstinno" /></gstinno>
			<panno><xsl:value-of select="panno" /></panno>
			<typeofservices><xsl:value-of select="typeofservices" /></typeofservices>
			<channel_type><xsl:value-of select="channel_type" /></channel_type>
			<xsubretailer_distributor>
				<distributorname/>
				<distributorcode><xsl:value-of select="dist_code" /></distributorcode> 
			</xsubretailer_distributor>
			<xsubretailer_value_classification>
				<valueclasscode><xsl:value-of select="valueclasscode" /></valueclasscode>
				<valueclassdescription><xsl:value-of select="valueclasscode" /></valueclassdescription>
			</xsubretailer_value_classification>
			<xsubretailer_geography>
				<geohiername><xsl:value-of select="GeoHier" /></geohiername>
				<geohiercode><xsl:value-of select="GeoHier" /></geohiercode>
			</xsubretailer_geography>
			<xgeneralclassification>
				<generalclasscode><xsl:value-of select="GenClass" /></generalclasscode>
				<generalclassdescription><xsl:value-of select="GenClass" /></generalclassdescription>	
			</xgeneralclassification>
			<xsubretailer_customergroup>
				<customergroupname/>
				<customergroupcode><xsl:value-of select="customergroup" /></customergroupcode>
			</xsubretailer_customergroup>
			<xsubretailer_potentialclass>
				<potentialclassdesc><xsl:value-of select="PotClass" /></potentialclassdesc>
				<potentialclasscode><xsl:value-of select="PotClass" /></potentialclasscode>
			</xsubretailer_potentialclass>
			<xsubretailer_collectionmethod>
				<collectionmethoddescription><xsl:value-of select="PaymentMode" /></collectionmethoddescription>
				<collectionmethodcode><xsl:value-of select="PaymentMode" /></collectionmethodcode>
			</xsubretailer_collectionmethod>
			<cash_discount><xsl:value-of select="cash_discount" /></cash_discount>
			<xsubretailer_creditterm>
				<credittermcode><xsl:value-of select="CreditDays" /></credittermcode>
				<credittermdescription><xsl:value-of select="CreditDays" /></credittermdescription>
			</xsubretailer_creditterm>
			<creditbills><xsl:value-of select="CreditBills" /></creditbills>
			<outstanding_validation><xsl:value-of select="outstanding" /></outstanding_validation>
			<creditamount><xsl:value-of select="creditamount" /></creditamount>
			<internal_ref_no><xsl:value-of select="internal_ref_no" /></internal_ref_no>
			<retailerimagename><xsl:value-of select="retailerimagename" /></retailerimagename>
			<addressproof><xsl:value-of select="addressproof" /></addressproof>
			<region><xsl:value-of select="region" /></region>
			<mobile_application><xsl:value-of select="mobile_application" /></mobile_application>
			<distance><xsl:value-of select="distance" /></distance>
			<cf_registration_date><xsl:value-of select="RegDate" /></cf_registration_date>
			<dob><xsl:value-of select="DOB" /></dob>
			<doa><xsl:value-of select="DOA" /></doa>
			<latitude><xsl:value-of select="Latitude" /></latitude>
			<longitude><xsl:value-of select="Longitude" /></longitude>
			<non_confi_frieght_rate><xsl:value-of select="non_confi_frieght_rate" /></non_confi_frieght_rate>
			<confi_frieght_rate><xsl:value-of select="confi_frieght_rate" /></confi_frieght_rate>
			<bank_name><xsl:value-of select="bank_name" /></bank_name>
			<branch_name><xsl:value-of select="branch_name" /></branch_name>
			<bank_account_number><xsl:value-of select="bank_account_number" /></bank_account_number>
			<ifsc_code><xsl:value-of select="ifsc_code" /></ifsc_code>
			<distributor_id><xsl:value-of select="DistId" /></distributor_id>
			<xsubretailer_retailer>
				<customercode><xsl:value-of select="retailercode" /></customercode>
				<customername><xsl:value-of select="retailercode" /></customername>
			</xsubretailer_retailer>
			<district_code><xsl:value-of select="district_code" /></district_code>
			<unique_retailer_code><xsl:value-of select="unique_retailer_code" /></unique_retailer_code>
			<customer_cd_key><xsl:value-of select="customer_cd_key" /></customer_cd_key>
			<counter_sales_customer><xsl:value-of select="counter_sales_customer" /></counter_sales_customer>
			<creditterm><xsl:value-of select="creditterm" /></creditterm>
			<sales_man><xsl:value-of select="sales_man" /></sales_man>
			<beat><xsl:value-of select="beat" /></beat>
			<status>Draft</status>
			<next_stage_name>Create</next_stage_name>
			<credit_limit><xsl:value-of select="credit_limit" /></credit_limit>
		</vtiger_xsubretailer>
	</xsl:template>
</xsl:stylesheet>