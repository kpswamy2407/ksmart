<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>statename,supplychainhiername,geohiername,channel_hierarchy,depotcode,customergroupname,user_name</prkey>
			<xsl:apply-templates select="/collections/documentcontent/st_xdistributor" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xdistributordocinfo>
			<fromid><xsl:value-of select="fromid" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication>sap</sourceapplication>
			<destapplication>sp</destapplication>
			<documenttype>xDistributor</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_xdistributordocinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/st_xdistributor">
		<vtiger_xdistributor>
			<distributorcode><xsl:value-of select="distributorcode" /></distributorcode>
			<distributorname><xsl:value-of select="distributorname" /></distributorname>
			<cf_xdistributor_street><xsl:value-of select="street" /></cf_xdistributor_street>
			<cf_xdistributor_city><xsl:value-of select="city" /></cf_xdistributor_city>
			<cf_xdistributor_district><xsl:value-of select="district" /></cf_xdistributor_district>
			<cf_xdistributor_state>
				<statename><xsl:value-of select="state" /></statename>
				<statecode><xsl:value-of select="state" /></statecode>
			</cf_xdistributor_state>
			<cf_xdistributor_region><xsl:value-of select="region" /></cf_xdistributor_region>
			<cf_xdistributor_country><xsl:value-of select="country" /></cf_xdistributor_country>
			<cf_xdistributor_contact_person><xsl:value-of select="contact_person" /></cf_xdistributor_contact_person>
			<cf_xdistributor_email><xsl:value-of select="email" /></cf_xdistributor_email>
			<cf_xdistributor_phone><xsl:value-of select="phone" /></cf_xdistributor_phone>
			<cf_xdistributor_pin_code><xsl:value-of select="pin_code" /></cf_xdistributor_pin_code>
			<cf_xdistributor_credit_limit><xsl:value-of select="credit_limit" /></cf_xdistributor_credit_limit>
			<cf_xdistributor_active><xsl:value-of select="active" /></cf_xdistributor_active>
			<xdistributorpicklist4><xsl:value-of select="xdistributorpicklist4" /></xdistributorpicklist4>
			<xdistributorpicklist5><xsl:value-of select="xdistributorpicklist5" /></xdistributorpicklist5>
			<xdistributorpicklist3><xsl:value-of select="xdistributorpicklist3" /></xdistributorpicklist3>
			<xdistributorpicklist6><xsl:value-of select="xdistributorpicklist6" /></xdistributorpicklist6>
			<xdistributorpicklist7><xsl:value-of select="xdistributorpicklist7" /></xdistributorpicklist7>
			<xdistributorpicklist1><xsl:value-of select="xdistributorpicklist1" /></xdistributorpicklist1>
			<xdistributorpicklist2><xsl:value-of select="xdistributorpicklist2" /></xdistributorpicklist2>
			<cf_xdistributor_status>Draft</cf_xdistributor_status>
			<cf_xdistributor_next_stage_name>Creation</cf_xdistributor_next_stage_name>
			<cf_xdistributor_supply_chain>
				<supplychainhiername>Distributor</supplychainhiername>
				<supplychainhiercode>Distributor</supplychainhiercode>
			</cf_xdistributor_supply_chain>
			<user_date_format>dd-mm-yyyy</user_date_format>
			<user_reports_to_id>
				<user_name>QCSE1009</user_name>
			</user_reports_to_id>
			<cf_xdistributor_tin_number/>
			<cf_xdistributor_st_reg_number/>
			<cf_xdistributor_cst_reg_number/>
			<cf_xdistributor_geography>
				<geohiername>India</geohiername>
				<geohiercode>India</geohiercode>
			</cf_xdistributor_geography>
			<cf_xdistributor_channel>
				<channelhierarchycode>CH2</channelhierarchycode>
				<channel_hierarchy>CH2</channel_hierarchy>
			</cf_xdistributor_channel>
			<cf_xdistributor_security_deposit>0</cf_xdistributor_security_deposit>
			<cf_xdistributor_default_depot>
				<depotcode><xsl:value-of select="depotcode" /></depotcode>
				<supplylocation><xsl:value-of select="depotcode" /></supplylocation>
			</cf_xdistributor_default_depot>
			<cf_xdistributor_customer_group>
				<customergroupcode>CGD5</customergroupcode>
				<customergroupname>Distributor</customergroupname>
			</cf_xdistributor_customer_group>
			<gstinno><xsl:value-of select="gstinno" /></gstinno>
			<panno><xsl:value-of select="panno" /></panno>
			<typeofservices><xsl:value-of select="typeofservices" /></typeofservices>
			<distributortaxtype>Registered</distributortaxtype>
		</vtiger_xdistributor>
	</xsl:template>
</xsl:stylesheet>