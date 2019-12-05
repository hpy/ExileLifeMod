/**
                    * ExilelifeServer_system_jobs_util_vehicle_add
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

                    private["_playerObject","_items","_weGood","_canFit","_canFitChck","_vehicleNetID","_vehicle","_type","_package","_itemClassname","_itemQuantity","_i","_playerUID","_sessionID"];
_playerObject = _this select 0;
_items = _this select 1;
_weGood = false;
_canFit = false;
_canFitChck = -1;
_vehicleNetID = _playerObject getVariable ["ExileLifeJobVehicle",""];
_vehicle = objectFromNetId _vehicleNetID;
if (isNull _vehicle) exitWith {};
if !(alive _vehicle) exitWith {};
{
	_type = _x select 0;
	_package = _x select 1;
	switch (_type) do
	{
		case ("PHYSICAL"):
		{
			_itemClassname = _package select 0;
			_itemQuantity = _package select 1;
			for "_i" from 1 to _itemQuantity do
			{
				_canFit = [_vehicle,_itemClassname] call ExileLifeClient_util_containerCargo_addOrDrop;
				if !(_canFit) then
				{
					_canFitChck = _canFitChck + 1;
				};
			};
		};
	};
	if !(_weGood) exitWith {};
}
forEach _items;
if (_canFitChck > -1) then
{
	_playerUID = getPlayerUID _playerObject;
	_sessionID = _playerUID call ExileLifeServer_system_session_getIDfromUID;
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["NOTICE!", "You didn't have enough room in your vehicle, items have been dropped on the ground!"]]] call ExileServer_system_network_send_to;
};
_weGood
