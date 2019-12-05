/**
                    * ExileServer_system_territory_database_load
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

                    private["_territoryID","_data","_id","_owner","_territoryZone","_position","_radius","_level","_flagTexture","_flagStolen","_flagStolenBy","_lastPayed","_buildRights","_moderators","_vectorDirection","_vectorUp","_ownerPID","_flagObject","_building","_houselocks"];
_territoryID = _this;
_data = format ["loadTerritory:%1", _territoryID] call ExileServer_system_database_query_selectSingle;
_id = _data select 0;
_owner = _data select 1;
_name = _data select 2;
_territoryZone = _data select 3;
_position =
[
	_data select 4,
	_data select 5,
	_data select 6
];
_radius = _data select 14;
_level = _data select 15;
_flagTexture = _data select 16;
_flagStolen = _data select 17;
_flagStolenBy = _data select 18;
_lastPayed = _data select 19;
_buildRights = _data select 20;
_moderators = _data select 21;
_vectorDirection = [_data select 7, _data select 8, _data select 9];
_vectorUp = [_data select 10, _data select 11, _data select 12];
_ownerPID = _data select 24;
if !(_flagTexture isEqualTo "house") exitWith {};
_flagObject = createVehicle ["ExileLife_Construction_SleepingBag_Static",_position, [], 0, "CAN_COLLIDE"];
_flagObject setposATL _position; 
_flagObject setVectorDirAndUp [_vectorDirection, _vectorUp];
_building = ((lineIntersectsSurfaces [ getPosWorld _flagObject vectorAdd [0, 0, 50],        getPosWorld _flagObject vectorAdd [0, 0, -50],      _flagObject, objNull, true, 1, "GEOM", "NONE"   ] select 0) select 3);
if !((typeof _building) in ExileLifeHouses) then
{
	_building = nearestBuilding _flagObject;
};
_building setVariable ["ExileLifeTerritoryClaimed", true, true];
_building setVariable ["ExileLifeTerritoryFlagID", (netID _flagObject)];
_flagObject setVariable ["ExileLifeTerritoryBuildingID", (netID _building), true];
_houselocks = _data select 13;
if ((count _houselocks) > 0) then
{
	{
		_building setVariable [format ["ExileLifeHasLock_%1",_x select 0],_x select 1,true];
	}
	forEach _houselocks;
};
_flagObject setVariable ["ExileTerritoryName", _name, true];
_flagObject setVariable ["ExileDatabaseID", _id];
_flagObject setVariable ["ExileOwnerUID", _owner, true];
_flagObject setVariable ["ExileLifeOwnerPID",_ownerPID];
_flagObject setVariable ["ExileTerritorySize", _radius, true];
_flagObject setVariable ["ExileTerritoryBuildRights", _buildRights, true];
_flagObject setVariable ["ExileTerritoryModerators", _moderators, true];
_flagObject setVariable ["ExileTerritoryLevel", _level, true];
_flagObject setVariable ["ExileTerritoryLastPayed", _lastPayed];
_flagObject call ExileServer_system_territory_maintenance_recalculateDueDate;
_flagObject setVariable ["ExileTerritoryNumberOfConstructions", _data select 23, true];
_flagObject setVariable ["ExileRadiusShown", false, true];
_flagObject setVariable ["ExileFlagStolen",_flagStolen,true];
_flagObject setVariable ["ExileLifeTerritoryZone",_territoryZone,true];
_flagObject setVariable ["ExileLifeDoorLocks", _houselocks];
if (getNumber(missionConfigFile >> "CfgVirtualGarage" >> "enableVirtualGarage") isEqualTo 1) then 
{
	_data = format["loadTerritoryVirtualGarage:%1", _territoryID] call ExileServer_system_database_query_selectFull;
	_flagObject setVariable ["ExileTerritoryStoredVehicles", _data, true];
};
true
