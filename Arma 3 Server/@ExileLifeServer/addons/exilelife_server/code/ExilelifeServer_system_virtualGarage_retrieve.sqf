/**
                    * ExilelifeServer_system_virtualGarage_retrieve
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

                    private["_sessionID","_playerObject","_vehicleID","_vehicleData","_positionArray","_position","_direction","_vehicleObject","_hitpoints","_garage","_index"];
_sessionID = _this select 0;
_playerObject = _this select 1;
_vehicleID = _this select 2;
try
{
	format ["retrieveVehicleVG:%1:%2", _vehicleID,_playerObject getVariable ["ExileLifePID",-1]] call ExileLifeServer_util_debugLog;
	_vehicleData = format ["retrieveVehicleVG:%1:%2", _vehicleID,_playerObject getVariable ["ExileLifePID",-1]] call ExileServer_system_database_query_selectSingle;
	if (isNil "_vehicleData") then
	{
		throw 16;
	};
	_positionArray = [(_vehicleData select 0)] call ExileLifeServer_system_virtualGarage_findParkingSpot;
	if (_positionArray isEqualTo []) then
	{
		throw 13;
	};
	_position = _positionArray select 0;
	_direction = _positionArray select 1;
	_vehicleObject = [(_vehicleData select 0), _position, _direction, true,_vehicleData select 4] call ExileServer_object_vehicle_createPersistentVehicle;
	_vehicleObject setVariable ["ExileDatabaseID", _vehicleID];
	_vehicleObject setVariable ["ExileOwnerUID", _vehicleData select 5,true];
	_vehicleObject setVariable ["ExileLifeOwnerPID",_playerObject getVariable ["ExileLifePID",-1]];
	_vehicleObject setVariable ["ExileMoney", 0, true];
	_vehicleObject setVariable ["ExileIsLocked", 0];
	_vehicleObject lock 0;
	_vehicleObject enableRopeAttach true;
	_vehicleObject setFuel (_vehicleData select 2);
	_vehicleObject setDamage (_vehicleData select 1);
	_hitpoints = _vehicleData select 3;
	if ((typeName _hitpoints) isEqualTo "ARRAY") then
	{
		{
			_vehicleObject setHitPointDamage [_x select 0, _x select 1];
		}
		forEach _hitpoints;
	};
	_vehicleObject enableSimulationGlobal false;
	_vehicleObject call ExileServer_system_simulationMonitor_addVehicle;
	_garage = _playerObject getVariable ["ExileLifeVirtualGarage",[]];
	_index = -1;
	{
		if (_x select 0 isEqualTo _vehicleID) exitWith
		{
			_index = _forEachIndex;
		};
	}
	forEach _garage;
	if (_index < 0) then
	{
		throw 17;
	};
	_garage deleteAt _index;
	_playerObject setVariable ["ExileLifeVirtualGarage",_garage];
	format["removeVehicleVG:%1",_vehicleID] call ExileServer_system_database_query_fireAndForget;
	_vehicleObject call ExileServer_object_vehicle_database_insert;
	_vehicleObject call ExileServer_object_vehicle_database_update;
	[_sessionID,"retrieveVGResponse",[0,netID (_vehicleObject),_playerObject getVariable ["ExileLifeVirtualGarage",[]]]] call ExileServer_system_network_send_to;
}
catch
{
	[_sessionID,"retrieveVGResponse",[_exception,"",[]]] call ExileServer_system_network_send_to;
};