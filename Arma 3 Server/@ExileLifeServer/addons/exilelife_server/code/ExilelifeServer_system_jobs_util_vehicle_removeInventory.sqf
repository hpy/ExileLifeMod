/**
                    * ExilelifeServer_system_jobs_util_vehicle_removeInventory
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

                    private["_playerObject","_items","_weGood","_vehicleNetID","_vehicle","_type","_itemClassname","_itemQuantity"];
_playerObject = _this select 0;
_items = _this select 1;
_weGood = false;
try
{
	_vehicleNetID = _playerObject getVariable ["ExileLifeJobVehicle",""];
	if (_vehicleNetID == "") then {
		throw false;
	};
	if (isNull _playerObject) then {
		throw false;
	};
	_vehicle = objectFromNetId _vehicleNetID;
	if (isNull _vehicle) then {
		throw false;
	};
	if !(alive _vehicle) then {
		throw false;
	};
	{
		_type = _x select 0;
		_itemClassname = (_x select 1) select 0;
		_itemQuantity = (_x select 1) select 1;
		switch (_type) do
		{
			case ("PHYSICAL"):
			{
				_weGood = [_vehicle, _itemClassname,_itemQuantity] call ExilelifeClient_util_containerCargo_removeMultiple;
				if !(_weGood) exitWith {};
			};
		};
		if !(_weGood) exitWith {};
	}
	forEach _items;
}
catch
{
	_weGood = _exception;
};
_weGood
