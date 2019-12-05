/**
                    * ExilelifeClient_object_player_event_onSeatSwitchedMan
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_unit","_unit2","_vehicle","_position"];
_unit = _this select 0;
_unit2 = _this select 1;
_vehicle = _this select 2;
try
{
	if (ExileClientIsHandcuffed) then
	{
		if (_unit getVariable "ExileLifeIsForcedGetIn") then
		{
			_unit assignAsCargoIndex [_vehicle, ExileLifeHandcuffAssignedSeat];
			_unit moveInCargo _vehicle;
			throw "How did u think you were going to swap seats?"
		};
	};
	_position = (assignedVehicleRole _unit) select 0;
	if (_vehicle getVariable ["ExileLifeOldManVehicle",false]) then
	{
		if (_position isEqualTo "driver") then
		{
			if !((netID _unit) in (_vehicle getVariable ["ExileLifePermittedDrivers",[]])) then
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
	["ErrorTitleAndText", ["Error!", _exception]] call ExileClient_gui_toaster_addTemplateToast;
};
true
