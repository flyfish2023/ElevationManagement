<cfcomponent> 
<cfset This.name = "Orders"> 
<cfset This.Sessionmanagement="True"> 
<cfset This.loginstorage="session"> 
<cfset This.datasource="elevationManagement"> 

<cffunction name="onApplicationStart">
	<cfset application.datasource = "elevationManagement">
</cffunction>

<cffunction name="OnRequestStart">
    <cfargument name = "request" required="true"/> 
    <cfif IsDefined("Form.logout")> 
        <cflogout> 
    </cfif> 
 
    <cflogin> 
        <cfif NOT IsDefined("cflogin")>
            <cfinclude template="loginform.cfm"> 
            <cfabort> 
        <cfelse> 
            <cfif cflogin.name IS "" OR cflogin.password IS ""> 
                <cfoutput> 
                    <h2>You must enter text in both the User Name and Password fields. 
                    </h2> 
                </cfoutput> 
                <cfinclude template="loginform.cfm"> 
                <cfabort> 
            <cfelse> 
                <cfquery name="loginQuery" dataSource="ElevationManagement"> 
                SELECT UserID, Roles, personID
                FROM LoginInfo 
                WHERE 
                    UserID = '#cflogin.name#' 
                    AND Password = '#cflogin.password#' 
                </cfquery> 
                <cfif loginQuery.Roles NEQ ""> 
                    <cfloginuser name="#cflogin.name#" Password = "#cflogin.password#" 
                        roles="#loginQuery.Roles#"><!--- <cfoutput>#isUserLoggedIn()# #isDefined("session.user")#<cfabort></cfoutput> --->
					<cfif not isDefined("session.user")>
						<cfquery name="getPersonInfo">
							select personID,firstname,lastname,defaultBin
							from person 
							where personID = '#loginQuery.personID#'
						</cfquery>
						<cfif getPersonInfo.recordCount GT 0>
							<cfset session.user=structNew()>
							<cfset session.user.personID=getPersonInfo.personID>
							<cfset session.user.firstname=getPersonInfo.firstname>
							<cfset session.user.lastname=getPersonInfo.lastname>
							<cfset session.user.bin=getPersonInfo.defaultBin>
						</cfif>
					</cfif>
						
                <cfelse> 
                    <cfoutput> 
                        <H2>Your login information is not valid.<br> 
                        Please Try again</H2> 
                    </cfoutput>     
                    <cfinclude template="loginform.cfm"> 
                    <cfabort> 
                </cfif> 
            </cfif>     
        </cfif> 
    </cflogin> 
 
 
</cffunction> 
</cfcomponent>