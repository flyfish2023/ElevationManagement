<cfoutput><cfquery name="devices">
				select d.deviceID
					,d.esn
					,d.description
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
				where d.deviceID=#url.d#
			</cfquery>
<table border=0>
	<tr><td colspan="6"><img src="http://www.barcodesinc.com/generator/image.php?code=#devices.esn#&style=197&type=C128B&width=200&height=50&xres=1&font=3"></td></tr>
	<tr><td colspan="6">&nbsp;</td></tr>
	<tr>
		<td>#devices.manufacturer#</td>
		<td>#devices.make#</td>
		<td>#devices.model#</td>
		<td>#devices.name#</td>
		<td>#devices.description#</td>
		<td>#devices.location#</td>
	</tr>
</table>
<!--- <cfdump var="#devices#"> --->

<!--- <cfhttp method="get" url="http://www.barcodesinc.com/generator/image.php?code=123456789&style=197&type=C128B&width=200&height=50&xres=1&font=3"> --->

<!--- <cfdump var="#cfhttp.filecontent#"> --->

</cfoutput>
<!--- <input type="button" name="Close" onclick="location.href='devices.cfm'"> --->