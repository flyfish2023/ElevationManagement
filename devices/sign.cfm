

<!--- 
<cfmodule template="/somePage.cfm" pageName="Sign Example">
 --->


<cfscript>
/**
 * 
 * @param str
 * @return Returns a boolean. 
 */

function IsSomeMethod(str) {

	return true;
}
</cfscript>

<cfif not IsSomeMethod("Some Value")>

	<p>
        Press the Sign button to sign. Press the Clear button to erase the signature and re-sign. Press the Display Signature String button to turn the tablet off and display the signature string that is to be passed back to the server after signing is complete.
	</p>
<cfelse>
	<cfoutput>
	<p>
        Press the Sign button to sign. Press the Clear button to erase the signature and re-sign. Press the Display Signature String button to turn off the tablet and display the signature string that is to be passed back to the server after signing is complete.
	</p>
	</p>
	</cfoutput>
</cfif>


<DIV STYLE="position:absolute; top:200px; left:225px;">
<TABLE height=150 cellPadding=0 width=286 border=1>
  <TR>
    <TD>
      <OBJECT id=SigPlus1 
      style="LEFT: 250px; WIDTH: 300px; TOP: 350px; HEIGHT: 150px" height=150 
      width=300 classid=clsid:69A40DA3-4D42-11D0-86B0-0000C025864A name=SigPlus1 
      VIEWASTEXT><PARAM NAME="_Version" VALUE="131095">
     <PARAM NAME="_ExtentX" VALUE="4842">
     <PARAM NAME="_ExtentY" VALUE="1323">
     <PARAM NAME="_StockProps" VALUE="0">
      </OBJECT>
    </TD>
  </TR>
</TABLE>
</DIV>

<input id="DoneBtn" name="DoneBtn" type="button" value="Sign" onclick="javascript:SigPlus1.TabletState(1);">


<input id="ClearBtn" name="ClearBtn" type="button" value="Clear" onclick="javascript:SigPlus1.ClearTablet();">

<input id="SigBtn" name="SigBtn" type="button" value="Display Signature String" onclick="javascript:
SigPlus1.TabletState(0);
SigPlus1.SigCompressionMode(1);
alert(SigPlus1.SigString());">

<!--- 
</cfmodule>
 --->