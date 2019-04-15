<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:template match="/*">
      <collections>
         <xsl:apply-templates select="docinfo"/>
         <xsl:apply-templates select="documentcontent"/>
      </collections>
   </xsl:template>
   <xsl:template match="docinfo">
      <prkey>distributorcode,customercode,bankmastercode,salesmancode,collectionmethodcode,beatcode,transactionseriescode,reasoncode</prkey>
      <vtiger_xrcodocinfo>
         <fromid>
            <xsl:value-of select="fromid"/>
         </fromid>
         <transactionid>
            <xsl:value-of select="transactionid"/>
         </transactionid>
         <sourceapplication>
            <xsl:value-of select="sourceapplication"/>
         </sourceapplication>
         <destapplication>
            <xsl:value-of select="destapplication"/>
         </destapplication>
         <documenttype>xrCollection</documenttype>
         <clientid>
            <xsl:value-of select="clientid"/>
         </clientid>
         <createddate>
            <xsl:value-of select="createddate"/>
         </createddate>
      </vtiger_xrcodocinfo>
   </xsl:template>
   <xsl:template match="documentcontent">
      <xsl:apply-templates select="col"/>
   </xsl:template>
   <xsl:template match="col">
      <vtiger_xrco>
         <xsl:apply-templates select="header/Table"/>
         <lineitems>
            <xsl:apply-templates select="detail/Table"/>
         </lineitems>
      </vtiger_xrco>
   </xsl:template>
   <xsl:template match="header/Table">
      <cf_xrco_distributor>
         <distributorcode>
            <xsl:value-of select="/collections/docinfo/fromid"/>
         </distributorcode>
      </cf_xrco_distributor>
      <cf_xrco_cheque_date>
         <xsl:value-of select="cheque_date"/>
      </cf_xrco_cheque_date>
      <cf_xrco_customer_id>
         <customercode>
            <xsl:value-of select="customer_code"/>
         </customercode>
      </cf_xrco_customer_id>
      <cf_xrco_collection_date>
         <xsl:value-of select="collection_date"/>
      </cf_xrco_collection_date>
      <cf_xrco_amount_available>
         <xsl:value-of select="amount_available"/>
      </cf_xrco_amount_available>
      <cf_xcollection_reason>
         <reasoncode>
            <xsl:value-of select="reason"/>
         </reasoncode>
      </cf_xcollection_reason>
      <cf_xrco_next_stage_name>Creation</cf_xrco_next_stage_name>
      <cf_xrco_amount_adjusted>
         <xsl:value-of select="amount_adjusted"/>
      </cf_xrco_amount_adjusted>
      <cf_xrco_transaction_series>
         <transactionseriescode/>
      </cf_xrco_transaction_series>
      <cf_xrco_status>Draft</cf_xrco_status>
      <collectioncode>
         <xsl:value-of select="transaction_number"/>
      </collectioncode>
      <cf_xrco_cheque_no>
         <xsl:value-of select="cheque_no"/>
      </cf_xrco_cheque_no>
      <cf_xrco_bank_details>
         <bankmastercode>
            <xsl:value-of select="bankcode"/>
         </bankmastercode>
         <bankmasterbranch>
            <xsl:value-of select="bankcode"/>
         </bankmasterbranch>
      </cf_xrco_bank_details>
      <cf_xrco_salesman>
         <salesmancode>
            <xsl:value-of select="salesman_code"/>
         </salesmancode>
      </cf_xrco_salesman>
      <cf_xrco_payment_mode>
         <collectionmethodcode>
            <xsl:value-of select="payment_mode"/>
         </collectionmethodcode>
      </cf_xrco_payment_mode>
      <cf_xrco_cash_balance>
         <xsl:value-of select="current_balance"/>
      </cf_xrco_cash_balance>
      <cf_xrco_transaction_number>
         <xsl:value-of select="transaction_number"/>
      </cf_xrco_transaction_number>
      <cf_xrco_amount_received>
         <xsl:value-of select="amount_received"/>
      </cf_xrco_amount_received>
      <cf_xrco_additional_information>
         <xsl:value-of select="additional_information"/>
      </cf_xrco_additional_information>
      <cf_xrco_beat>
         <beatcode>
            <xsl:value-of select="beat_code"/>
         </beatcode>
      </cf_xrco_beat>
      <cf_xrco_recieved_balance>
         <xsl:value-of select="recieved_balance"/>
      </cf_xrco_recieved_balance>
   </xsl:template>
   <xsl:template match="detail/Table">
      <vtiger_xrcodocrel>
         <loadtype>
            <xsl:value-of select="loadtype"/>
         </loadtype>
         <recordid>
            <xsl:value-of select="recordid"/>
         </recordid>
         <amount_adjust>
            <xsl:value-of select="amount_adjust"/>
         </amount_adjust>
         <addl_adjust>
            <xsl:value-of select="addl_adjust"/>
         </addl_adjust>
         <discount>
            <xsl:value-of select="discount"/>
         </discount>
      </vtiger_xrcodocrel>
   </xsl:template>
</xsl:stylesheet>