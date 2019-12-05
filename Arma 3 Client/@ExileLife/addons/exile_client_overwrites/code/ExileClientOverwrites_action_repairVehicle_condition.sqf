/**
                    * ExileClientOverwrites_action_repairVehicle_condition
                    *
                    * Exile Mod
                    * www.exilemod.com
                    * © 2016 Exile Mod Team
                    *
                    * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
                    * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
                    * 
                    * Permission granted to ExileLife Dev Team to overwrite files and redistribute them
                    *
                    */

                    private["_vehicle","_result","_availableHitpoints","_canBeReparied"];
_vehicle = _this;
_result = "";
try 
{
	if ((vehicle player) isEqualTo _vehicle) then 
	{
		throw "Are you serious?";
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
	_availableHitpoints = (getAllHitPointsDamage _vehicle) select 0;
	_canBeReparied = false;
	{
		if ((_vehicle getHitPointDamage _x) > 0) exitWith
		{
			_canBeReparied = true;
		};
	}
	forEach _availableHitpoints;
	if !(_canBeReparied) then 
	{
		throw "This vehicle looks fine.";
	}; 
	if !(local _vehicle) then
	{
		throw "Please get in as driver/pilot first.";
	};
	if !("Exile_Item_Foolbox" in (magazines player)) then
	{
		throw "You need a tool box to be able to repair this!";
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