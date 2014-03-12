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
			<h2>Some Title</h2>
			<cfoutput>
			<cfquery name="getDeviceTypes">
				SELECT deviceTypeID
			      ,manufacturer
			      ,make
			      ,model
			      ,storageSize
			      ,description
			      ,descriptionShort
			      ,conditionPerfect
			      ,conditionGood
			      ,conditionFair
			      ,conditionPoor
			      ,addBy
			      ,addDate
			      ,archiveBy
			      ,archiveDate
			  FROM deviceType
			  ORDER BY manufacturer,make,model,storageSize
			</cfquery>
			<table border="0">
			<tr style="bold">
				<td>&nbsp;</td>
				<td>Manufacturer</td>
				<td>Make</td>
				<td>Model</td>
				<td>Storage Size</td>
				<td>Description</td>
				<td>Perfect</td>
				<td>Good</td>
				<td>Fair</td>
				<td>Poor</td>
			</tr>

			<cfloop query="getDeviceTypes">
			<tr bgcolor="###iif(currentrow MOD 2,DE('efefef'),DE('ffffff'))#">
				<td><img src="images/delete.png"></td>
				<td>#getDeviceTypes.manufacturer#</td>
				<td>#getDeviceTypes.make#</td>
				<td>#getDeviceTypes.model#</td>
				<td>#getDeviceTypes.storageSize#</td>
				<td>#getDeviceTypes.descriptionShort#</td>
				<td>#dollarFormat(getDeviceTypes.conditionPerfect)#</td>
				<td>#dollarFormat(getDeviceTypes.conditionGood)#</td>
				<td>#dollarFormat(getDeviceTypes.conditionFair)#</td>
				<td>#dollarFormat(getDeviceTypes.conditionPoor)#</td>
			</tr>
			</cfloop>
			
			</table>
			
			<a href="addDevice.cfm">Add</a>
			
			</cfoutput>
		</div>
		<br class="clearer" />
<cfinclude template="includes/footer_inc.cfm">


  	</div>



</body>

</html>
