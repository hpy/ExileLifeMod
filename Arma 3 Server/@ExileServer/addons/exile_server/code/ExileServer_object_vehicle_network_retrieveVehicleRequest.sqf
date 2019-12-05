/**
                    * ExileServer_object_vehicle_network_retrieveVehicleRequest
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

                    private["_sessionID","_parameters","_nickname","_playerObject","_flagObject","_territoryID","_vehicleInfo","_buildRights","_storedVehicles","_index","_spawnInfo"];
_sessionID = _this select 0;
_parameters = _this select 1;
_nickname = _parameters select 0;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then 
	{
		throw "Player is null";
	};
	if (_playerObject getVariable ["ExileMutex",false]) then
	{
		throw "Player is Mutex";
	};
	_playerObject setVariable ["ExileMutex", true];
	_flagObject = _playerObject call ExileClient_util_world_getTerritoryAtPosition;
	if (isNull _flagObject) then 
	{
		throw "Invalid Flag";
	};
	if (_flagObject getVariable [format["Exile%1Mutex", toLower(_nickname)], false]) then 
	{
		throw "Vehicle is being processed by another player.";
	};
	_flagObject setVariable [format["Exile%1Mutex", toLower(_nickname)], true];
	_territoryID = _flagObject getVariable ["ExileDatabaseID", -1];
	_vehicleInfo = format["confirmVehicleOwnership:%1", _nickname] call ExileServer_system_database_query_selectSingle;
	if !((_vehicleInfo select 1) isEqualTo _territoryID) then 
	{
		throw "Vehicle does not belong to this territory!";
	};
	_buildRights = _flagObject getVariable ["ExileTerritoryBuildRights", []];
	if !((getPlayerUID _playerObject) in _buildRights) then 
	{
		throw "You do not have rights to access this Virtual Garage";
	};
	_storedVehicles = _flagObject getVariable ["ExileTerritoryStoredVehicles", []];
	_index = -1;
	{
		if (toLower(_x select 1) isEqualTo toLower(_nickname)) exitWith 
		{
			_index = _forEachIndex;	
		};
	}
	forEach _storedVehicles;
	if (_index isEqualTo -1) then 
	{
		throw "Unable to find vehicle in stored vehicles";
	};
	_storedVehicles deleteAt _index;
	_flagObject setVariable ["ExileTerritoryStoredVehicles", _storedVehicles, true];
	format["retrieveVehicle:%1", _vehicleInfo select 0] call ExileServer_system_database_query_fireAndForget;
	_spawnInfo = (_vehicleInfo select 0) call ExileServer_object_vehicle_database_loadFromVirtualGarage;
	[_sessionID, "retrieveVehicleResponse", [true, _spawnInfo]] call ExileServer_system_network_send_to;
}
catch
{
	[_sessionID, "retrieveVehicleResponse", [false,[_exception]]] call ExileServer_system_network_send_to;
	_exception call ExileServer_util_log;	
};
_flagObject setVariable [format["Exile%1Mutex", toLower(_nickname)], nil];
_playerObject setVariable ["ExileMutex", false];
true