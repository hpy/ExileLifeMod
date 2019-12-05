/**
                    * ExilelifeClient_object_player_event_onGetOutMan
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_unit","_position","_vehicle","_victim"];
_unit = _this select 0;
_position = _this select 1;
_vehicle = _this select 2;
try
{
	if (ExileClientIsHandcuffed) then
	{
		if (_unit getVariable "ExileLifeIsForcedGetIn") then
		{
			_unit assignAsCargoIndex [_vehicle,ExileLifeHandcuffAssignedSeat];
			_unit action ["getInCargo",_vehicle,ExileLifeHandcuffAssignedSeat];
			ExileLifeHandcuffAssignedSeat = nil;
			throw "You think you can just get out?";
		};
			ExileLifeHandcuffAssignedSeat = nil;
	};
	if !(isNil "VehicleDisableThread") then
	{
		[VehicleDisableThread] call ExileClient_system_thread_removeTask;
		VehicleDisableThread = nil;
	};
	ExileLifeCurrentWeapon call ExileLifeClient_util_log;
	(currentWeapon player) call ExileLifeClient_util_log;
	if (player hasWeapon ExileLifeCurrentWeapon) then
    {
        [true] call ExileLifeClient_object_player_action_holsterweapon;
    };
}
catch
{
["ErrorTitleAndText", ["Error!", _exception]] call ExileClient_gui_toaster_addTemplateToast;
};
true
//_victim action ["getOut", _vehicle];