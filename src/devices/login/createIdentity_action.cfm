<cfIf (form.email NEQ form.emailconfirm)>
	<cflocation url="index.cfm?err='Email confirmation did not match"></cfif>
<cfIf (form.password NEQ form.passwordconfirm)>
	<cflocation url="index.cfm?err='Password confirmation did not match"></cfif>
<cfquery datasource="ElevationManagement" name="addRec">
INSERT INTO loginInfo(
	userid
	,password
	,roles	
	,addDate)
VALUES ('#form.email#'
	,'#form.password#'
	,'employee'
	,GETDATE());
</cfquery>

<cflocation url="../index.cfm">