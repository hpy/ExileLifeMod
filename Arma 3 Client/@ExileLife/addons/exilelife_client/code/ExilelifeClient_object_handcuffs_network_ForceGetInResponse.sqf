/**
                    * ExilelifeClient_object_handcuffs_network_ForceGetInResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_victimNetID","_vehicleNetID","_ExileLifeNearestAction","_vehicle","_victim"];
_victimNetID = _this select 0;
_vehicleNetID = _this select 1;
_ExileLifeNearestAction = _this select 2;
_vehicle = objectFromNetId _vehicleNetID;
_victim = objectFromNetId _victimNetID;
try 
{
	if !(ExileClientIsHandcuffed) then 
	{
		throw "You cannot force a free person into a car!"; 
	};
	if !(isPlayer _victim) then
	{
		throw "You cannot force an unknown person into a car!"; 
	};	
	if !(alive _victim) then
	{
		throw "You cannot force a dead person into a car!"; 
	};
	if (isNull _vehicle) then {
		throw "You cannot force someone into a car that doesnt exist!"; 
	};
[_ExileLifeNearestAction,_vehicle] call ExileLifeClient_gui_hud_VehicleActionSel;
player switchCamera "Internal"; 
}
catch 
{
["ErrorTitleAndText", ["Error!", _exception]] call ExileClient_gui_toaster_addTemplateToast;
};
