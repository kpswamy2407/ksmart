<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/*">
		<collections>
			<xsl:apply-templates select="/collections/docinfo" />
			<prkey>salesmancode,reasoncode,distributorcode</prkey>
			<xsl:apply-templates select="/collections/documentcontent/attendance/NewDataSet/Table" />
		</collections>
	</xsl:template>
	<xsl:template match="/collections/docinfo">
		<vtiger_xattendanceregisterinfo>
			<fromid><xsl:value-of select="fromid" /></fromid>
			<transactionid><xsl:value-of select="transactionid" /></transactionid>
			<sourceapplication><xsl:value-of select="sourceapplication" /></sourceapplication>
			<destapplication><xsl:value-of select="destapplication" /></destapplication>
			<documenttype>xAttendanceRegister</documenttype>
			<clientid><xsl:value-of select="clientid" /></clientid>
			<createddate><xsl:value-of select="createddate" /></createddate>
		</vtiger_xattendanceregisterinfo>
	</xsl:template>
	<xsl:template match="/collections/documentcontent/attendance/NewDataSet/Table">
		<vtiger_xattendanceregister>
			<referencenumber><xsl:value-of select="referencenumber" /></referencenumber>
			<xattendance_type><xsl:value-of select="xattendance_type" /></xattendance_type>
			<xattendance_status><xsl:value-of select="xattendance_status" /></xattendance_status>
			<reason>
				<reasoncode><xsl:value-of select="reason" /></reasoncode>
			</reason>
			<remarks><xsl:value-of select="remarks" /></remarks>
			<register_date><xsl:value-of select="register_date" /></register_date>
			<xattendance_date><xsl:value-of select="xattendance_date" /></xattendance_date>
			<salesman_or_staff_name>
				<salesmancode><xsl:value-of select="salesman_or_staff_name" /></salesmancode>
			</salesman_or_staff_name>
			<xattendance_in_time><xsl:value-of select="xattendance_in_time" /></xattendance_in_time>
			<xattendance_out_time><xsl:value-of select="xattendance_out_time" /></xattendance_out_time>
			<xdistributorid>
				<distributorcode><xsl:value-of select="/collections/docinfo/fromid" /></distributorcode>
				<distributorname><xsl:value-of select="/collections/docinfo/fromid" /></distributorname>
			</xdistributorid>
			<image_name><xsl:value-of select="image_name" /></image_name>
		</vtiger_xattendanceregister>
	</xsl:template>
</xsl:stylesheet>