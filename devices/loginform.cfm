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
<H2>Please Log In</H2> 
<cfoutput> 
    <form action="#CGI.script_name#?#CGI.query_string#" method="Post"> 
        <table> 
            <tr> 
                <td>user name:</td> 
                <td><input type="text" name="j_username"></td> 
            </tr> 
            <tr> 
                <td>password:</td> 
                <td><input type="password" name="j_password"></td> 
            </tr> 
        </table> 
        <br> 
        <input type="submit" value="Log In">
		<a href="login/createIdentity.cfm">Create ID</a>
    </form> 
</cfoutput>
		</div>
		<br class="clearer" />
<cfinclude template="includes/footer_inc.cfm">


  	</div>



</body>

</html>
