/**
                    * ExileServer_object_vehicle_network_storeVehicleRequest
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

                    private["_sessionID","_parameters","_netID","_nickname","_playerObject","_vehicleObject","_alphabet","_forbiddenCharacter","_flagObject","_storedVehicles","_level","_maxNumberOfVehicles","_vehiclePosition","_items","_magazines","_weapons","_containers","_popTabs","_groundHolder","_popTabsObject"];
_sessionID = _this select 0;
_parameters = _this select 1;
_netID = _parameters select 0;
_nickname = _parameters select 1;
try
{
	if (getNumber(missionConfigFile >> "CfgVirtualGarage" >> "enableVirtualGarage") isEqualTo 0) then 
	{
		throw "Virtual Garage is disabled on this server";
	};
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
	_vehicleObject = objectFromNetID(_netID);
	if (isNull _vehicleObject) then 
	{
		throw "Vehicle is null";
	};
	if !(alive _vehicleObject) then 
	{
		throw "Vehicle has been destroyed";	
	};
	if (_vehicleObject getVariable ["ExileMutex",false]) then
	{
		throw "Vehicle is in the process of being stored";
	};
	_vehicleObject setVariable ["ExileMutex", true];
	if !(_vehicleObject getVariable ["ExileIsPersistent", false]) then 
	{
		throw "You cannot store non-persistent vehicles in the garage!";
	};
	_alphabet = getText (missionConfigFile >> "CfgClans" >> "clanNameAlphabet");
	_forbiddenCharacter = [_nickname, _alphabet] call ExileClient_util_string_containsForbiddenCharacter;
	if !(_forbiddenCharacter isEqualTo -1) then
	{
		throw "Invalid vehicle nickname";
	};
	_flagObject = _playerObject call ExileClient_util_world_getTerritoryAtPosition;
	_storedVehicles = _flagObject getVariable ["ExileTerritoryStoredVehicles", []];
	_level = _flagObject getVariable ["ExileTerritoryLevel", 1];
	_maxNumberOfVehicles = getArray(missionConfigFile >> "CfgVirtualGarage" >> "numberOfVehicles") select ((_level - 1) max 0);
	if (_maxNumberOfVehicles isEqualTo -1) then 
	{
		throw "Your territory isn't allowed to store any vehicles.<br />Upgrade your territory to gain access to Virtual Garage";
	};
	if (count(_storedVehicles) >= _maxNumberOfVehicles) then 
	{
		throw "You cannot store any more vehicles in your territory.<br />Upgrade your territory to store more vehicles!";
	};
	if ((getPosATL _vehicleObject) distance (getPosATL _flagObject) > (_flagObject getVariable ["ExileTerritorySize", 0])) then 
	{
		throw "Vehicle must be in your territory";
	};
	if (getNumber(missionConfigFile >> "CfgVirtualGarage" >> "clearInventoryOnStore") isEqualTo 1) then 
	{		
		_vehiclePosition = getPosATL _vehicleObject;
		_items = _vehicleObject call ExileServer_util_getItemCargo;
		_magazines = magazinesAmmoCargo _vehicleObject;
		_weapons = weaponsItemsCargo _vehicleObject;
		_containers =_vehicleObject call ExileServer_util_getObjectContainerCargo;
		_popTabs = _vehicleObject getVariable ["ExileMoney", 0];
		_groundHolder = createVehicle ["GroundWeaponHolder",_vehiclePosition, [], 0, "CAN_COLLIDE"];
		_groundHolder setPosATL _vehiclePosition;
		if (_popTabs > 0 ) then 
		{
			_popTabsObject = createVehicle ["Exile_PopTabs", _vehiclePosition, [], 0, "CAN_COLLIDE"];	
			_popTabsObject setVariable ["ExileMoney", _popTabs, true];
		};
		[_groundHolder,_items] call ExileServer_util_fill_fillItems;
		[_groundHolder,_magazines] call ExileServer_util_fill_fillMagazines;
		[_groundHolder,_weapons] call ExileServer_util_fill_fillWeapons;
		[_groundHolder,_containers] call ExileServer_util_fill_fillContainers;
		_vehicleObject call ExileClient_util_containerCargo_clear;
	};
	_storedVehicles pushBack [typeOf(_vehicleObject), _nickname];
	_flagObject setVariable ["ExileTerritoryStoredVehicles", _storedVehicles, true];
	_vehicleObject call ExileServer_object_vehicle_database_update;
	format["storeVehicle:%1:%2:%3", _flagObject getVariable ["ExileDatabaseID", -1], _nickname, _vehicleObject getVariable ["ExileDatabaseID", -1]] call ExileServer_system_database_query_fireAndForget;
	_vehicleObject call ExileServer_system_vehicleSaveQueue_removeVehicle;
	_vehicleObject call ExileServer_system_simulationMonitor_removeVehicle;
	deleteVehicle _vehicleObject;
	[_sessionID, "storeVehicleResponse", [true,_nickname]] call ExileServer_system_network_send_to;
}
catch
{
	[_sessionID, "storeVehicleResponse", [false,_exception]] call ExileServer_system_network_send_to;
	_exception call ExileServer_util_log;	
};
_playerObject setVariable ["ExileMutex", false];
if !(isNull _vehicleObject) then 
{
	_vehicleObject setVariable ["ExileMutex", false];
};
true