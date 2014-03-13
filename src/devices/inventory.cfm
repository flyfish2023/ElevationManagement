<!DOCTYPE html>

<head>
<meta charset="utf-8" />
	<title>My Web Page</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script language="JavaScript">
function moveDevice(id)
{  alert(id);
/*var state=document.frm.getElementById(stateS)
if (state="Please select a state")
    {
    document.frm.Month.disable = true;
    }
else
    {
    document.frm.Month.enable = true;
    }   
*/
}
</script></head>

<body>
  	<div class="wrapper">
		<!--- Include header --->
		<cfinclude template="includes/header_inc.cfm">

		<!--- Include left navigation --->
		<cfinclude template="includes/leftNav_inc.cfm">

		<!--- Begin main column --->
		<div class="main_col">
			<h2>Inventory</h2>
			<cfoutput>
			<cfquery name="devices">
				select d.deviceID
					,d.esn
					,d.description
					,d.pricePaid
					,dt.manufacturer
					,dt.make
					,dt.model
					,s.name
					,s.location
				from device d
					left join deviceType dt
						on d.deviceTypeID=dt.deviceTypeID
					left join store s
						on d.originationLocation=s.storeID
			</cfquery>
			<cfquery name="qBins">
				select b.binID
					,b.description
					,b.location
				from bin b
			</cfquery>
			
			<table border="0" cellpadding="0" cellspacing="0">
			<tr style="bold">
				<!--- <td>Description</td> --->
				<td>ESN</td>
				<td>Manufacturer</td>
				<td>Make</td>
				<td>Model</td>
				<td>Store</td>
				<td>Price Paid</td>
				<!--- <td>Move To</td> --->
				<td>&nbsp;</td>
			</tr>
			<cfset bgclr=1>
			<cfloop query="devices">
			<cfif isDefined("url.d") AND url.d EQ devices.deviceID>
				<tr bgcolor="##ffff00">
			<cfelse>
				<tr bgcolor="###iif(currentrow MOD 2,DE('efefef'),DE('ffffff'))#">
			</cfif>
			
				<!--- <td>#devices.description#</td> --->
				<td><a href='inventory.cfm?d=#devices.deviceID#'>#devices.esn#</td>
				<td>#devices.manufacturer#</td>
				<td>#devices.make#</td>
				<td>#devices.model#</td>
				<td>#devices.name# - #devices.location#</td>
				<td>#devices.pricepaid#</td>
				<!--- <td>
					<select>
						<cfloop query="qBins">
							<option value="#qBins.binID#">#qBins.description#, #qBins.location#</option>
						</cfloop>
					</select></td> --->
				<!--- <td><img src="images/barcode.png" onclick="window.open('http://printout.cfm?d=#devices.deviceID#','','toolbar=no, scrollbars=no, resizable=no, top=500, left=500, width=300, height=300')"></td> --->
				<td><A HREF="javascript:void(0)" onClick="window.open('printout.cfm?d=#devices.deviceID#', 'MyPopUp',  'width=432,height=270,toolbar=no,scrollbars=no,resizable=no,screenX=200,screenY=200,left=200,top=200')"><img src="images/barcode.png" border=0> </A></td>
			</tr>
			</cfloop>
			
			</table>
			<cfif isdefined("url.d") and url.d GT 0>
				<cfquery name="getDeviceInfo">
					select w.dateTimeTracked
						,b.description,b.location
						,d.esn,d.deviceID
						,s.status
					from workflow w
						left join bin b
							on w.binID=b.binID
						left join device d
							on w.deviceID=d.deviceID
						left join status s
							on w.statusID=s.statusID
						
					where w.deviceID=#url.d#
					order by inDate
				</cfquery>
				<table cellpadding="5" cellspacing="20">
					<tr><th colspan="4"><h3>History: #getDeviceInfo.esn#</h3></th></tr>
					<tr><th>Description</th><th>Location</th><th>Date/Time</th><!--- <th>In</th><th>Out</th> ---><th>Status</th></tr>
					<cfloop query="getDeviceInfo">
						<tr>
							<td>#getDeviceInfo.description#</td>
							<td>#getDeviceInfo.location#</td>
							<td>#dateformat(getDeviceInfo.dateTimeTracked,"MM/DD/YYYY")# #timeformat(getDeviceInfo.dateTimeTracked,"HH:MM:SS")#</td>
							<!--- <cfif getDeviceInfo.outDate GT "">
								<td>#dateformat(getDeviceInfo.outDate,"MM/DD/YYYY")# #timeformat(getDeviceInfo.outDate,"HH:MM:SS")#</td>
							<cfelse>
								<td><select onchange="moveDevice(#getDeviceInfo.deviceID#)">
										<option value="0">Move to...</option>
										<cfloop query="qBins">
											<option value="#qBins.binID#">#qBins.description#, #qBins.location#</option>
										</cfloop>
									</select></td>
							</cfif> --->
							<td>#getDeviceInfo.status#</td>
						</tr>
					</cfloop>
				</table>
			</cfif>
			<a href="addDevice.cfm">Add</a>
			</cfoutput>
		</div>
		<br class="clearer" />
<cfinclude template="includes/footer_inc.cfm">


  	</div>



</body>

</html>
