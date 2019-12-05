/**
                    * ExileServer_object_vehicle_database_load
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

                    private["_vehicleID","_data","_position","_vectorDirection","_vectorUp","_pinCode","_texture","_vehicleObject","_lock","_unlockInSafeZonesAfterRestart","_isLocked","_hitpoints","_cargoContainers"];
_vehicleID = _this;
_data = format ["loadVehicle:%1", _vehicleID] call ExileServer_system_database_query_selectSingle;
_position = [_data select 8, _data select 9, _data select 10];
_vectorDirection = [_data select 11, _data select 12, _data select 13];
_vectorUp = [_data select 14, _data select 15, _data select 16];
_pinCode = _data select 20;
_texture = _data select 21;
try 
{
	if !((vectorMagnitude _vectorUp) isEqualTo 1) then 
	{
		throw true;
	};
	if ((_vectorUp select 0) > 0.95) then 
	{
		throw true;
	};
	if ((_vectorUp select 1) > 0.95) then 
	{
		throw true;
	};
	if ((_vectorUp select 2) isEqualTo 0) then 
	{
		throw true;
	};
}
catch
{
	_vectorUp = [0, 0, 1];
};
_vehicleObject = [(_data select 1), _position, [_vectorDirection, _vectorUp], true,_pinCode] call ExileServer_object_vehicle_createPersistentVehicle;
_vehicleObject setVariable ["ExileDatabaseID", _vehicleID];
_vehicleObject setVariable ["ExileOwnerUID", (_data select 3)];
_vehicleObject setVariable ["ExileLifeOwnerPID", (_data select 25)];
_vehicleObject setVariable ["ExileMoney", (_data select 23), true];
_lock = (_data select 4);
_unlockInSafeZonesAfterRestart = (getNumber (configFile >> "CfgSettings" >> "VehicleSpawn" >> "unlockInSafeZonesAfterRestart")) isEqualTo 1;
_isLocked = (_lock isEqualTo -1);
if (_isLocked) then 
{
	if (_unlockInSafeZonesAfterRestart) then 
	{
		if (_position call ExileClient_util_world_isInTraderZone) then 
		{
			_isLocked = false;
		};
	};
};
if (_isLocked) then
{
	_vehicleObject setVariable ["ExileIsLocked", -1];
	_vehicleObject lock 2;
	_vehicleObject enableRopeAttach false;
}
else
{
	_vehicleObject setVariable ["ExileIsLocked", 0];
	_vehicleObject lock 0;
	_vehicleObject enableRopeAttach true;
};
_vehicleObject setFuel (_data select 5);
_vehicleObject setDamage (_data select 6);
_hitpoints = _data select 7;
if ((typeName _hitpoints) isEqualTo "ARRAY") then 
{
	{
		_vehicleObject setHitPointDamage [_x select 0, _x select 1];
	}
	forEach _hitpoints;
};
[_vehicleObject, (_data select 17)] call ExileServer_util_fill_fillItems;
[_vehicleObject, (_data select 18)] call ExileServer_util_fill_fillMagazines;
[_vehicleObject, (_data select 19)] call ExileServer_util_fill_fillWeapons;
_cargoContainers = format ["loadVehicleContainer:%1", _vehicleID] call ExileServer_system_database_query_selectSingle;
if ((typeName _cargoContainers) isEqualTo "ARRAY") then 
{
	if !(_cargoContainers isEqualTo []) then
	{
		[_vehicleObject, (_cargoContainers select 0)] call ExileServer_util_fill_fillContainers;
	};
};
if !(_texture isEqualTo "") then
{
	{
		_vehicleObject setObjectTextureGlobal [_forEachIndex, _texture select _forEachIndex];
	}
	forEach _texture;
};
_vehicleObject enableSimulationGlobal false;
if (getNumber(missionConfigFile >> "CfgSimulation" >> "enableDynamicSimulation") isEqualTo 1) then 
{
	_vehicleObject enableDynamicSimulation true;
}
else
{
	_vehicleObject call ExileServer_system_simulationMonitor_addVehicle;
};
if (_vehicleObject call ExileClient_util_world_isInTraderZone) then 
{
	_vehicleObject allowDamage false;
};
_vehicleObject
