/**
                    * ExilelifeServer_system_jobs_util_vehicle_nonPersistent
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

                    private["_playerObject","_vehicleClass","_jobClassname","_position","_vehicleObject","_playerUID","_sessionID","_PlayerUID"];
_playerObject = _this select 0;
_vehicleClass = _this select 1;
_jobClassname = _this select 2;
if (_vehicleClass isKindOf "Ship") then
{
	_position = [(getPosATL _playerObject), 50, 20] call ExileClient_util_world_findWaterPosition;
	_vehicleObject = [_vehicleClass, _position, random 360, true] call ExileServer_object_vehicle_createNonPersistentVehicle;
}
else
{
	_position = (getPos _playerObject) findEmptyPosition [10, 100, _vehicleClass];
	if (_position isEqualTo []) then
	{
		_position = (getPos _playerObject) findEmptyPosition [10, 200, _vehicleClass];
	};
	_vehicleObject = [_vehicleClass, _position, random 360, true] call ExileServer_object_vehicle_createNonPersistentVehicle;
};
if (isNull _vehicleObject) exitWith {};
_vehicleObject addEventHandler ["engine", {_this call ExileLifeServer_util_vehicle_engineChk}];
_vehicleObject addMPEventHandler ["MPKilled", {_this call ExileLifeServer_system_jobs_util_vehicle_destroyed}];
_vehicleObject setVariable ["ExileOwnerUID", (getPlayerUID _playerObject)];
_vehicleObject setVariable ["ExileLifeJobName", _jobClassname,true];
_vehicleObject lock 0;
_vehicleObject setVariable ["ExileLifeOldManVehicle",true,true]; 
_vehicleObject setVariable ["ExileLifePermittedDrivers",[(netID _playerObject)],true];
_playerObject setVariable ["ExileLifeJobVehicle",netId _vehicleObject,true];
_playerUID = getPlayerUID _playerObject;
_sessionID = _PlayerUID call ExileLifeServer_system_session_getIDfromUID;
[_sessionID, "setPinCodeRequest", [netId _vehicleObject]] call ExileServer_system_network_send_to;
[_sessionID, "vehicleHireResponse", [0, netId _vehicleObject, 0]] call ExileServer_system_network_send_to;
_vehicleObject
