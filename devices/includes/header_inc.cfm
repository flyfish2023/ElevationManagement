		<div class="header">
			<br />

			<h1>Elevation Management</h1>



			(980px wide + 10px padding)

			<br /><br />
		</div>
<div class="logout">
    <cfif GetAuthUser() NEQ ""> 
        <cfoutput> 
                <!--- <form action="securitytest.cfm" method="Post"> --->
				#GetAuthUser()#<form action="logout.cfm" method="Post"> 
                <input type="submit" Name="Logout" value="Logout"> 
            </form> 
        </cfoutput> 
    </cfif>
</div>
<div style="float: right;"><cfoutput>#DateFormat(now(), 'Long')#</cfoutput></div>
