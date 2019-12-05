/**
                    * ExilelifeClient_gui_jobs_trader_hireVehicle_event_onReturnJobVehicleButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_requiredStage","_vehiclenetID","_vehicleObject"];
try
{ 
	if (ExileLifeCurrentJob isEqualTo []) then 
	{
		throw false;
	};
	_requiredStage = -1;
	if (getNumber(configFile >> "CfgJobs" >> ExileLifeCurrentJob select 0 >> "hireVehicle")==1) then
	{
	    _requiredStage = getNumber(configFile >> "CfgJobs" >> ExileLifeCurrentJob select 0 >> "returnVehicle"); 
	};
	if (_requiredStage < 0) then
	{
		throw false;
	};
	if !((ExileLifeCurrentJob select 1) isEqualTo _requiredStage) then
	{
		throw false;
	};
	_vehiclenetID = player getVariable ["ExileLifeJobVehicle",""];
	if (_vehiclenetID isEqualTo "") then
	{
		throw false;
	};	
	_vehicleObject = objectFromNetId _vehiclenetID;
	if (isNull _vehicleObject) then 
	{
		["overrideJobRequest",[netID player]] call ExileClient_system_network_send;
		["ErrorTitleAndText", ["WHAT THE F#$@?","Wheres the Car? The Old Man will hear of this!!!"]] call ExileClient_gui_toaster_addTemplateToast;
		[0.3] call ExileLifeClient_object_player_network_beatup;
		throw false;
	};
	if !(alive _vehicleObject) then 
	{
		["overrideJobRequest",[netID player]] call ExileClient_system_network_send;
		["ErrorTitleAndText", ["WHAT THE F#$@?","Wheres the Car? The Old Man will hear of this!!!"]] call ExileClient_gui_toaster_addTemplateToast;
		[0.3] call ExileLifeClient_object_player_network_beatup;
		throw false;
	};
	if ((player distance _vehicleObject) > 20) then 
	{
		["ErrorTitleAndText", ["Warning!","Park closer man! I need to check for damage first!"]] call ExileClient_gui_toaster_addTemplateToast;
		closeDialog 0;
		throw false;
	};
	["completeJobRequest",[]] call ExileClient_system_network_send;
	closeDialog 0;
}
catch
{
};
