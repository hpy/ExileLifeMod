/**
                    * ExileServer_object_container_database_load
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

                    private["_containerID","_data","_position","_vectorDirection","_vectorUp","_abandoned","_containerObject","_cargoContainers"];
_containerID = _this;
_data = format ["loadContainer:%1", _containerID] call ExileServer_system_database_query_selectSingle;
_position = [_data select 4, _data select 5, _data select 6];
_vectorDirection = [_data select 7, _data select 8, _data select 9];
_vectorUp = [_data select 10, _data select 11, _data select 12];
_abandoned = _data select 18;
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
_containerObject = [(_data select 1), _position, 0] call ExileServer_object_container_createContainer;
_containerObject setVectorDirAndUp [_vectorDirection, _vectorUp];
_containerObject setVariable ["ExileDatabaseID", _containerID];
_containerObject setVariable ["ExileOwnerUID", (_data select 2),true];
_containerObject setVariable ["ExileLifeOwnerPID", (_data select 22)];
_containerObject setVariable ["ExileAccessCode",(_data select 16)];
_containerObject setVariable ["ExileTerritoryID", (_data select 17)];
_containerObject setVariable ["ExileMoney", (_data select 20), true];
if(getNumber(configFile >> "CfgVehicles" >> typeOf _containerObject >> "exileIsLockable") isEqualTo 1)then
{
	_containerObject setVariable ["ExileIsLocked",(_data select 3),true];
	_containerObject setVariable ["ExileHackAttempts", 0];
	_containerObject setVariable ["ExileHackerUID", "", true];
};
[_containerObject, (_data select 13)] call ExileServer_util_fill_fillItems;
[_containerObject, (_data select 14)] call ExileServer_util_fill_fillMagazines;
[_containerObject, (_data select 15)] call ExileServer_util_fill_fillWeapons;
_cargoContainers = format ["loadContainerCargo:%1", _containerID] call ExileServer_system_database_query_selectSingle;
if !(_cargoContainers isEqualTo []) then
{
	[_containerObject, (_cargoContainers select 0)] call ExileServer_util_fill_fillContainers;
};
if !(_abandoned isEqualTo "") then
{
	format ["ExileServer - Adding Container %1 to Abandonded Safes", _containerID] call ExileClient_util_log;
	ExileAbandondedSafes pushBack _containerObject;
};
_containerObject enableSimulationGlobal false;
if (getNumber(missionConfigFile >> "CfgSimulation" >> "enableDynamicSimulation") isEqualTo 1) then 
{
	_containerObject enableDynamicSimulation true;
}
else
{
	_containerObject call ExileServer_system_simulationMonitor_addVehicle;
};
_containerObject addMPEventHandler ["MPKilled", { if !(isServer) exitWith {}; (_this select 0) call ExileServer_object_container_event_onMpKilled; }];
_containerObject
