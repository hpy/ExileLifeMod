/**
                    * ExileClientOverwrites_object_lock_scan
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

                    private["_object","_door","_result"];
_object = _this select 0;
_door = _this select 1;
_result = "";
try
{ 
	if !("Exile_Item_ThermalScannerPro" in (magazines player)) then
	{
		throw "You need a thermal scanner!";
	};
	if ((_object distance player) > 20) then 
	{
		throw "You are too far away!";
	};
	if ((_this select 1) > -1) then
	{
		if !([_object, _door, 1] call ExileLifeClient_util_housing_doorStatusRequest) then 
		{
			throw "This door is not locked!";
		};
		["scanHouseLockRequest", [netID (_this select 0),(_this select 1)]] call ExileClient_system_network_send;
	}
	else
	{
		switch (locked _object) do 
		{
			case 0:	{ throw "Vehicle is not locked!"; };
			case 1:	{ throw "Vehicle does not have a lock!"; };
		};
		if (isNull ExileClientInteractionObject) then 
		{
			throw "Object doesnt exist";
		};
		["scanCodeLockRequest", [netId ExileClientInteractionObject]] call ExileClient_system_network_send;
	};
}
catch
{
	_result = _exception;
};
