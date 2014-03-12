<!DOCTYPE html>

<head>
<meta charset="utf-8" />
	<title>Check-in devices</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script language="javascript">
	function submitDoc()
	{
		/*document.frm_checkInDevices.hid_SHOW_FORM.value = 'false';*/
		document.frm_checkInDevices.action="checkInDevices.cfm";
		document.frm_checkInDevices.submit();
	}
</script>
</head>

<body>
  	<div class="wrapper">
		<!--- Include header --->
		<cfinclude template="includes/header_inc.cfm">

		<!--- Include left navigation --->
		<cfinclude template="includes/leftNav_inc.cfm">

	<!--- =================================================== --->
	<!---       Set local variables for page refreshes.       --->
	<!--- =================================================== --->
		<cfparam name="FORM.sel_esn" default="">
		<cfset variables.esn = FORM.sel_esn>
		<cfif variables.esn NEQ "">
			<cfinvoke component="com.devices" method="getDevicesNotCheckedIn" returnvariable="getDevicesNotCheckedIn_Result">
				<cfinvokeargument name="esn" value="#variables.esn#"> 
			</cfinvoke>
		</cfif>
		<!--- <cfparam name="FORM.sel_AREA" default="0">
		<cfset variables.AREA = FORM.sel_AREA> --->


		<!--- Begin main column --->
		<div class="main_col">
			<h2>Check In</h2>
			<cfoutput>
			<form name="frm_checkInDevices" method="post" action="checkInDevices_action.cfm">
				<cfinvoke component="com.devices" method="getDevicesNotCheckedIn" returnvariable="getDevicesNotCheckedIn_Result">
				<!---  --->
				<P>esn: 
					<select name="sel_esn" size="5" onChange="Javascript:submitDoc();">
						<cfloop query="getDevicesNotCheckedIn_Result">
							<option value="#getDevicesNotCheckedIn_Result.esn#"
							<cfif #getDevicesNotCheckedIn_Result.esn# EQ #variables.esn#>SELECTED</cfif>
							>#getDevicesNotCheckedIn_Result.esn# (#getDevicesNotCheckedIn_Result.manufacturer# #getDevicesNotCheckedIn_Result.make# #getDevicesNotCheckedIn_Result.model#)</option>
						</cfloop>
					</select></P><br/>
					<cfif isDefined("variables.esn") AND variables.esn GT "">
						<cfquery name="checkListItems">
							select checkListID, description
							from checklist
						</cfquery>
						<cfinvoke component="com.devices" method="getDeviceDetail" returnvariable="getDeviceDetail_Result">
							<cfinvokeargument name="esn" value="#variables.esn#">
						</cfinvoke>
						<cfif isDefined("getDeviceDetail_Result")>
							<table>
								<tr>
									<th>ESN</th>
									<th>Description</th>
									<th>Manufacturer</th>
									<th>Make</th>
									<th>Model</th>
									<th>Name</th>
									<th>Location</th>
								</tr>
								<tr>
									<td>#getDeviceDetail_Result.esn#</td>
									<td>#getDeviceDetail_Result.description#</td>
									<td>#getDeviceDetail_Result.manufacturer#</td>
									<td>#getDeviceDetail_Result.make#</td>
									<td>#getDeviceDetail_Result.model#</td>
									<td>#getDeviceDetail_Result.name#</td>
									<td>#getDeviceDetail_Result.originationLocation#</td>
								</tr>
								<cfloop query="checkListItems">
									<tr><td>&nbsp;</td><td colspan="6"><input type="checkbox" name="item" value="#checkListItems.checkListID#"
											<cfif isDefined("getDeviceDetail_Result.checkedItems")
													AND listFindNocase(getDeviceDetail_Result.checkedItems,checkListItems.checkListID)>checked</cfif>>&nbsp;#checkListItems.description#</td></tr>
								</cfloop>
							</table>
							<input type="submit" value="Save">
							<!--- <cfdump var="#getDeviceDetail_Result#"> --->
						</cfif>
					</cfif>
			</form>
			</cfoutput>
		</div>
		<br class="clearer" />
<cfinclude template="includes/footer_inc.cfm">


  	</div>



</body>

</html>
