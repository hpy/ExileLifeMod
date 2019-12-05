/**
                    * ExilelifeServer_system_jobs_util_vehicle_persistent
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

                    private["_playerObject","_vehicleClass","_position","_pincode","_vehicleObject","_jobClassname"];
_playerObject = _this select 0;
_vehicleClass = _this select 1;
_position = _this select 2;
_pincode = str(floor(random [0000,4999,9999])); 
if (_vehicleClass isKindOf "Ship") then
{
	_position = [_position, 2, 20] call ExileClient_util_world_findWaterPosition;
	_vehicleObject = [_vehicleClass, _position, random 360, true,_pincode] call ExileServer_object_vehicle_createPersistentVehicle;
}
else
{
	_position = _position findEmptyPosition [2, 20, _vehicleClass];
	if (_position isEqualTo []) then
	{
		_position = _position findEmptyPosition [2, 40, _vehicleClass];
	};
	_vehicleObject = [_vehicleClass, _position, random 360, true,_pincode] call ExileServer_object_vehicle_createPersistentVehicle;
};
if (isNull _vehicleObject) exitWith {};
_vehicleObject enableRopeAttach false;
_vehicleObject setVariable ["ExileOwnerUID", (getPlayerUID _playerObject)];
_vehicleObject setVariable ["ExileLifeOwnerPID",_playerObject getVariable ["ExileLifePID",-1]];
_vehicleObject setVariable ["ExileLifeJobName", _jobClassname,true];
_vehicleObject setVariable ["ExileIsLocked",0];
_vehicleObject lock 2;
_vehicleObject addEventHandler ["engine", {_this call ExileLifeServer_util_vehicle_engineChk}];
_vehicleObject addMPEventHandler ["MPKilled", {_this call ExileLifeServer_system_jobs_util_vehicle_destroyed}];
_vehicleObject call ExileServer_object_vehicle_database_insert;
_vehicleObject call ExileServer_object_vehicle_database_update;
_vehicleObject setVariable ["ExileLifeOldManVehicle",true,true];
_vehicleObject setVariable ["ExileLifePermittedDrivers",[(netID _playerObject)],true];
_vehicleObject setVariable ["ExileLifeJobVehicle",(netID _playerObject),true];
_vehicleObject
