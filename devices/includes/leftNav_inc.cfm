		<div class="left_col">
			
			<ul>
<cfif IsUserInRole("VerizonClerk")>
				<li><h5>Store</h5>
					<ul>
						<li><a href="addDevice.cfm">Purchase</a></li>
						<li><a href="inventory.cfm">Inventory</a></li>
					</ul></li>
</cfif>

<cfif IsUserInRole("PSClerk")>
				<li><h5>Used Phone Group</h5>
					<ul>
						<li><a href="checkInDevices.cfm">Check-in</a></li>
					</ul></li>
</cfif>

<cfif IsUserInRole("Manager")>
					<li><h5>Management</h5>
					<ul>
						<li><a href="Reports.cfm">Reports</a></li>
						<li><a href="userManagement.cfm">Users</a></li>
						<li><a href="Devices.cfm">Devices</a></li>
					</ul></li>
</cfif>
			</ul>
		</div>
