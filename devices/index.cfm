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
			<cfoutput>
			    <h2>Welcome #GetAuthUser()#!</h2> 
			</cfoutput> 
		    <cfif (IsUserInRole("Human Resources"))>
		        <P>Human Resources messages.....</cfif>
		    <cfif (IsUserInRole("Documentation"))>
		        <P>Documentation messages.....</cfif>
		    <cfif (IsUserInRole("Sales"))>
		        <P>Sales messages.....</cfif>
		    <cfif (IsUserInRole("Manager"))>
		        <P>Managers messages....</cfif>
		    <cfif (IsUserInRole("Employee"))>
		        <P>Employees messages.....</cfif>
		    <cfif (IsUserInRole("Contractor"))> 
		        <P>Contractors messages.....</P></cfif>
		</div>
		<br class="clearer" />
<cfinclude template="includes/footer_inc.cfm">


  	</div>



</body>

</html>
