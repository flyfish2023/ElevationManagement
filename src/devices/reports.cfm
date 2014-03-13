<!DOCTYPE html>

<head>
<meta charset="utf-8" />
	<title>My Web Page</title>
<link rel="stylesheet" type="text/css" href="css/main.css"></head>

<body>
  	<div class="wrapper">
		<!--- Include header --->
		<cfinclude template="includes/header_inc.cfm">

		<!--- Include left navigation --->
		<cfinclude template="includes/leftNav_inc.cfm">

		<!--- Begin main column --->
		<div class="main_col">
			<h2>Reports</h2>
			<cfoutput>
				<table cellpadding="30" cellspacing="10">
					<tr>
						<td align="right">Location:</td>
						<td>
						<select name="location">
							<option>Select a location</option>
						</select></td>
					</tr>
					<tr>
						<td align="right">Device Type:</td>
						<td>
							<select name="deviceType">
								<option>Select a type of device</option>
							</select></td>
					</tr>
					<tr>
						<td align="right">Inventory Flow:</td>
						<td>
							<select name="location">
								<option>Select Store</option>
							</select></td>
					</tr>
					<tr>
						<td colspan="2"><input type="checkbox">&nbsp;Outstanding Only</td>
					</tr>
				</table>

<cfquery name="getBinData">
select d.esn
	,b.description
	,w.inDate
	,w.outDate
from workflow w
	left join device d
		on w.deviceID=d.deviceID
	left join bin b
		on w.binID=b.binID
order by d.esn,b.description,w.inDate
</cfquery>
	<table border="0" cellpadding="30" cellspacing="10">
		<tr>
			<th>esn</th>
			<th>Location (bin)</th>
			<th>Logged In</th>
			<th>Logged Out</th>
		</tr>		
<cfloop query="getBinData">
		<tr bgcolor="###iif(currentrow MOD 2,DE('efefef'),DE('ffffff'))#">
			<td >#getBinData.esn#</td>
			<td>#getBinData.description#</td>
			<td>#datetimeformat(getBinData.inDate,"mm/dd/yy HH:mm")#</td>
			<td>#datetimeformat(getBinData.outDate,"mm/dd/yy HH:mm")#</td>
		</tr>
</cfloop>
	</table>
<!--- <cfdump var="#getBinData#"> --->
			</cfoutput>
		</div>
		<br class="clearer" />
<cfinclude template="includes/footer_inc.cfm">


  	</div>



</body>

</html>
