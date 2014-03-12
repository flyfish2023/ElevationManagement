<cfquery datasource="ElevationManagement" name="addDevice" result="addDeviceResult">
INSERT INTO device(
	description
	,esn
	,deviceTypeID
--	,customerID
	,originationLocation
	,pricePaid
	,checkedItems
	,addBy
	,addDate)
VALUES ('#form.description#'
	,'#form.esn#'
	,#form.device#
--	,form.customerID
	,#form.store#
	,#form.price#
	,'#form.checkedItems#'
	,'#form.addBy#'
	,GETDATE());
</cfquery>
<cfquery datasource="ElevationManagement" name="addWorkflow">
INSERT INTO workflow(
	deviceID
	,binID
	,statusID
	,addBy
	,addDate
	,inDate)
VALUES (#addDeviceResult.IDENTITYCOL#
	,'#session.user.bin#'
	,1
	,#session.user.personID#
	,GETDATE()
	,GETDATE());
</cfquery>

<cflocation url="index.cfm"> 