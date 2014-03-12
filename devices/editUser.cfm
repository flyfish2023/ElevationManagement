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
			<h2>Edit User</h2>
			<cfoutput>
<cfquery name="getRoles">
	select * from loginRoles
	order by roleDescription
</cfquery>

<cfquery name="getUserDetail">
	select * from loginInfo l
	where l.userID='#url.u#'
</cfquery>
<form name="frm_editUser">
UserID: <input type="text" name="uid" value="#getUserDetail.userID#"><br/>
Roles: <br/>
	<table>
	<cfloop query="getRoles">
		<tr><td align="right">#ucase(getRoles.roleDescription)#</td>
		<td align="left"><input type="checkbox" name="r#getRoles.roleID#"
				<cfif ListFindNoCase(getUserDetail.roles, getRoles.roleDescription) NEQ 0>
					checked
				</cfif>></td></tr>
<!--- <cfinput type="checkbox" name="Contractor" value="Yes" checked>Yes --->		
	</cfloop>
	</table>
	<input type="submit" value="Save"><input type="button" value="Cancel" onclick="location.href='userManagement.cfm'">
</form>
			</cfoutput>
		</div>
		<br class="clearer" />
<cfinclude template="includes/footer_inc.cfm">


  	</div>



</body>

</html>