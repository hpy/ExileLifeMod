/**
                    * ExilelifeClient_action_patchRepairVehicle_condition
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_vehicle","_result"];
_vehicle = _this;
_result = "";
try 
{
	if (ExileClientPlayerIsInCombat) then
	{
		throw "You are in combat!";
	};
	if ((vehicle player) isEqualTo _vehicle) then 
	{
		throw "Are you seriously trying to do this?";
	};
	if (isPlayer _vehicle) then 
	{
		throw "Are you seriously trying to do this?";
	};	
	if (isEngineOn _vehicle) then 
	{
		throw "Turn off the engine first!";
	};
	if ((locked _vehicle) isEqualTo 2) then 
	{
		throw "Unlock the vehicle first!";
	};
	if !([_vehicle,'wheel',0.9] call ExileLifeClient_util_vehicle_isDamagedPart) then 
	{
		throw "This vehicles wheels look fine.";
	}; 
	if !(local _vehicle) then
	{
		throw "Please get in as driver/pilot first.";
	};
	if !("Exile_Item_DuctTape" in (magazines player)) then
	{
		throw "You need duct tape to do that!";
	};
	if ((_vehicle distance player) > 7) then 
	{
		throw "You are too far away!";
	};
}
catch 
{
	_result = _exception;
};
_result