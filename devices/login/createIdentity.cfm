<!DOCTYPE html>

<head>
<meta charset="utf-8" />
	<title>My Web Page</title>
<link rel="stylesheet" type="text/css" href="../css/main.css"></head>

<body>
  	<div class="wrapper">
		<!--- Include header --->
		<cfinclude template="../includes/header_inc.cfm">

		<!--- Include left navigation --->
		<cfinclude template="../includes/leftNav_inc.cfm">

		<!--- Begin main column --->
		<div class="main_col">
			<h2>Devices</h2>
			<cfoutput>
				<form action="createIdentity_action.cfm" method="post">
				<cfquery datasource="ElevationManagement" name="qDeviceType">
					SELECT *
					FROM deviceType
				</cfquery>
				<cfquery datasource="ElevationManagement" name="qStore">
					SELECT *
					FROM store
				</cfquery>
					First Name: <input type="text" name="fname"><br/>
					Last Name: <input type="text" name="lname"><br/>
					Middle Initial: <input type="text" name="mi"><br/>
					
					<p>Email: <input type="text" name="email"> (This will be your ID)<br/>
					Confirm Email: <input type="text" name="emailconfirm"></p>
					
					<p>Password: <input type="password" name="password"> (Case sensitive!)<br/>
					Confirm Password: <input type="password" name="passwordconfirm"></p>
					<input type="submit" value="Save"><input type="button" value="Cancel" onclick="location.href='../index.cfm'">
				</form>

			</cfoutput>
		</div>
		<br class="clearer" />
<cfinclude template="../includes/footer_inc.cfm">


  	</div>



</body>

</html>
