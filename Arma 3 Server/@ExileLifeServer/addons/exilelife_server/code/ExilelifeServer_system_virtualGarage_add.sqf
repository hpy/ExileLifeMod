/**
                    * ExilelifeServer_system_virtualGarage_add
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

                    private["_sessionID","_playerObject","_vehicleObject","_position","_availableHitpoints","_vehicleHitpoints","_data","_extDB2Message","_vehicleID","_garage","_confirmationCode"];
_sessionID = _this select 0;
_playerObject = _this select 1;
_vehicleObject = objectFromnetID (_this select 2);
try
{
	_position = getPosATL _vehicleObject;
	_availableHitpoints = getAllHitPointsDamage _vehicleObject;
	_vehicleHitpoints = [];
	if!(_availableHitpoints isEqualTo [])then
	{
		{
			_vehicleHitpoints pushBack [_x ,_vehicleObject getHitPointDamage _x];
		}
		forEach (_availableHitpoints select 0);
	};
	_data =
	[
		typeOf _vehicleObject,
		_vehicleObject getVariable ["ExileOwnerUID", ""],
		_playerObject getVariable ["ExileLifePID",-1],
		fuel _vehicleObject,
		damage _vehicleObject,
		_vehicleHitpoints,
		_vehicleObject getVariable ["ExileAccessCode",""]
	];
	_extDB2Message = ["addVehicleVG", _data] call ExileServer_util_extDB2_createMessage;
	_vehicleID = _extDB2Message call ExileServer_system_database_query_insertSingle;
	_garage = _playerObject getVariable ["ExileLifeVirtualGarage",[]];
	_garage pushBack
	[
		_vehicleID,
		typeOf _vehicleObject,
		damage _vehicleObject,
		fuel _vehicleObject,
		_vehicleHitpoints,
		_vehicleObject getVariable ["ExileAccessCode",""],
		_vehicleObject getVariable ["ExileOwnerUID", ""]
	];
	_playerObject setVariable ["ExileLifeVirtualGarage",_garage];
	_vehicleObject call ExileServer_object_vehicle_remove;
	deleteVehicle _vehicleObject;
	_confirmationCode = [6,true,true] call ExileLifeClient_util_string_generate;
	[_sessionID, "addVehicleVGResponse",[_confirmationCode, _playerObject getVariable ["ExileLifeVirtualGarage",[]]]] call ExileServer_system_network_send_to;
}
catch
{
	_exception call ExileLifeServer_util_log;
};
