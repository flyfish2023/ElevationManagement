<cfoutput>
	#DateTimeFormat(Now())#
	<cfquery datasource="1068435_elevationManagement" name="test">
	select * from bin
	</cfquery>
	<cfdump var="#test#">
</cfoutput>