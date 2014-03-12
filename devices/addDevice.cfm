<cfajaximport/>
<!DOCTYPE html>

<head>
<meta charset="utf-8" />
	<title>My Web Page</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<!-- <script language="javascript">
	String.prototype.trim=function(){return this.replace(/^\s+|\s+$/g,"");}
	
	function resultHandler(result){
		console.log('result handler ran...');
		console.log(result.trim());
	}
	
	function checkValidation(){
		console.log('running...');
		/*ColdFusion.Ajax.submitForm('deviceForm','addDevice.cfm',resultHandler);*/
		ColdFusion.Ajax.submitForm('deviceForm','addDevice.cfm');
		console.log('done...');
	}
</script> -->
</head>

<body>
<cfparam name="form.device" default="0">
<cfset local.device = form.device>
<!--- <cfif isDefined("local.device") and local.device GT 0>
	<cfquery datasource="ElevationManagement" name="qDeviceType">
		SELECT *
		FROM deviceType
	</cfquery>
	</cfif> --->
<div class="wrapper">
<!--- Include header --->
<cfinclude template="includes/header_inc.cfm">

<!--- Include left navigation --->
<cfinclude template="includes/leftNav_inc.cfm">

<!--- Begin main column --->
<div class="main_col">
	<h2>Purchase</h2>

<cfoutput>
<form action="addDevice_action.cfm" method="post">
<cfquery datasource="ElevationManagement" name="qDeviceType">
	SELECT *
	FROM deviceType
</cfquery>
<cfquery datasource="ElevationManagement" name="qBin">
	SELECT *
	FROM bin
</cfquery>
<cfquery datasource="ElevationManagement" name="qCarriers">
	SELECT *
	FROM carriers
</cfquery>

	<P>ESN: <input type="text" name="esn"></P><br/>
	<P>Description: <input type="text" name="description"></P><br/>
	<P>Device:
		<select name="device">
			<option value="">Select a device</option>
			<cfloop query="#qDeviceType#">
				<option value="#qDeviceType.deviceTypeID#"
						<cfif local.device EQ qDeviceType.deviceTypeID>
							selected
						</cfif>
						>#qDeviceType.manufacturer# - #qDeviceType.make# - #qDeviceType.model# - #qDeviceType.storageSize# (#NumberFormat(qDeviceType.conditionPerfect,'999')#/#NumberFormat(qDeviceType.conditionGood,'999')#/#NumberFormat(qDeviceType.conditionFair,'999')#/#NumberFormat(qDeviceType.conditionPoor,'999')#)</option>
			</cfloop>
		</select></P><br/>
	<P>Location:
		<select name="store">
			<cfloop query="#qBin#">
				<option value="#qBin.binID#"
						<cfif qBin.binID EQ session.user.bin>selected</cfif>>#qBin.Description# (#qBin.location#)</option>
			</cfloop>
		</select></P><br/>
	<P>Carrier:
		<select name="carrier">
			<cfloop query="#qCarriers#">
				<option value="#qCarriers.carrierID#">#qCarriers.carrierName#</option>
			</cfloop>
		</select></P><br/>
	<P>Price Paid: <input type="text" name="price"></P><br/>
	
	<cfquery name="getChecklistItems">
		select checkListID, description
		from checkList
	</cfquery>
	<table><tr><td colspan="2">Check that this is working</td></tr>
		<cfloop query="getChecklistItems">
			<tr>
				<td align="right">#ucase(getChecklistItems.description)#</td>
				<td align="left"><input type="checkbox" name="checkedItems" value="#getChecklistItems.checkListID#"></td>
			</tr>
		</cfloop>
		<tr>
			<td align="right">Notes:</td>
			<td align="left"><textarea name="condition" rows="10" cols="50">Write something here</textarea></td>
		</tr>
	</table>
	
	<input type= "hidden" name="addBy" value="#GetAuthUser()#">
	<input type= "hidden" name="addDate" value="#now()#">
	
	<input type="submit" value="Save">
	<input type="button" value="Cancel" onclick="location.href='index.cfm'">
</form>
</cfoutput>
		</div>
		<br class="clearer" />
<cfinclude template="includes/footer_inc.cfm">


  	</div>



</body>

</html>

