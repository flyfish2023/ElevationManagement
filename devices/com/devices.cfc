<cfcomponent output="false">
<cffunction name="getDevicesNotCheckedIn" access="public">
	<cfset local.devices="">
	<cfquery name="local.devices">
		SELECT d.deviceID
			,d.esn
			,d.description
			,dt.manufacturer
			,dt.make
			,dt.model
			,s.name
			,s.location
		FROM device d
			left join deviceType dt
				on d.deviceTypeID=dt.deviceTypeID
			left join store s
				on d.originationLocation=s.storeID
		WHERE checkedIn IS NULL OR checkedIn = 'N'
		ORDER BY d.esn
	</cfquery>
	<cfreturn local.devices>
</cffunction>

<cffunction name="getDeviceDetail" access="public">
	<cfargument name="esn" type="string" required="true">
	<cfset local.deviceDetail="">
	<cfquery name="local.deviceDetail">
		SELECT d.deviceID
			,d.esn
			,d.description
			,d.originationLocation
			,d.checkedItems
			,dt.manufacturer
			,dt.make
			,dt.model
			,s.name
			,s.location
		FROM device d
			left join deviceType dt
				on d.deviceTypeID=dt.deviceTypeID
			left join store s
				on d.originationLocation=s.storeID
		WHERE d.esn = '#arguments.esn#'
		ORDER BY d.esn
	</cfquery>
	<cfreturn local.deviceDetail>
</cffunction>

</cfcomponent>