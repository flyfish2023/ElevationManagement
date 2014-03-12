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
			<cfquery name="getUsers">
			select * from loginInfo l
				left join person p
					on l.personID=p.personID
			ORDER BY l.userID, p.lastname, p.firstname
			</cfquery>
			<table border="0">
			<cfloop query="getUsers">
				<tr><td><a href="editUser.cfm?u=#getUsers.userID#">#getUsers.userID#</a> - #getUsers.lastname#, #getUsers.firstname#</td></tr>
			</cfloop>
			</table>
			</cfoutput>
		</div>
		<br class="clearer" />
<cfinclude template="includes/footer_inc.cfm">


  	</div>



</body>

</html>
