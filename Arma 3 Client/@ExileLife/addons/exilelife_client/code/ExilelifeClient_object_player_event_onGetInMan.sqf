/**
                    * ExilelifeClient_object_player_event_onGetInMan
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_unit","_position","_vehicle","_drivers"];
_unit = _this select 0; 
_position = _this select 1;
_vehicle = _this select 2; 
try
{
	if !(ExileLifeClientEscortPlayerChk isEqualTo -1) then
	{
		_unit action ["getOut", _vehicle];
		throw "Stop escorting your hostage first!";
	};
	if (ExileClientIsHandcuffed) then
	{
		if !(_unit getVariable "ExileLifeIsForcedGetIn") then
		{
			_unit action ["getOut", _vehicle];
			throw "You are handcuffed!";
		};
	};
	if (_vehicle getVariable ["ExileLifeOldManVehicle",false]) then
	{
		if (_position isEqualTo "driver") then
		{
			_drivers = _vehicle getVariable ["ExileLifePermittedDrivers",[]];
			if !((netID _unit) in _drivers) then
			{
				if (isNil "VehicleDisableThread" && (!((_vehicle getHit "engine") < 1) || !((_vehicle getHit "motor") < 1))) then
				{
					VehicleDisableThread = [10, ExileLifeClient_system_vehicle_network_vehicleDisabledResponse, [netid _vehicle], false,"Hire Vehicle Remote Disable"] call ExileClient_system_thread_addtask;
				};
				throw "This vehicle is owned by the Old Man! You are not a permitted driver!";
			};
		}
		else
		{
			if !(isNil "VehicleDisableThread") then
			{
				[VehicleDisableThread] call ExileClient_system_thread_removeTask;
				VehicleDisableThread = nil;
			};
		};
	};
}
catch
{
	["ErrorTitleAndText", ["Warning!", _exception]] call ExileClient_gui_toaster_addTemplateToast;
};
true
