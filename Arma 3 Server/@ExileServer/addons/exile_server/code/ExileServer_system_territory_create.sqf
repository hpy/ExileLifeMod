/**
                    * ExileServer_system_territory_create
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

                    private["_flagObject","_territoryName","_flagTexture","_territorySize","_building","_territoryZone","_owner","_currentTimestamp"];
_flagObject = _this select 0;
_territoryName = _this select 1;
_flagTexture = _this select 2;
_territorySize = ((getArray(missionConfigFile >> "CfgTerritories" >> "prices")) select 0) select 1;
if !(_flagTexture isEqualTo "house") exitWith {};
_building = ((lineIntersectsSurfaces
	[
		getPosWorld _flagObject vectorAdd [0, 0, 50],
		getPosWorld _flagObject vectorAdd [0, 0, -50],
		_flagObject,
		objNull,
		 true,
		 1,
		 "GEOM",
		 "NONE"
	]
	select 0) select 3);
if !((typeof _building) in ExileLifeHouses) then
{
	_building = nearestBuilding _flagObject;
};
_territoryZone = [_flagObject] call ExileLifeClient_util_world_findGangTerritory;
if (_territoryZone isEqualTo "none") then
{
	_territoryZone = "Guard";
};
_building setVariable ["ExileLifeTerritoryClaimed", true, true];
_building setVariable ["ExileLifeTerritoryFlagID", netID _flagObject];
_owner = _flagObject getVariable ["ExileOwnerUID", ""];
_flagObject setVariable ["ExileTerritorySize", 15, true];
_flagObject setVariable ["ExileOwnerUID",_owner,true];
_flagObject setVariable ["ExileLifeTerritoryBuildingID", (netID _building), true];
_flagObject setVariable ["ExileTerritoryBuildRights", [_owner], true];
_flagObject setVariable ["ExileTerritoryModerators", [_owner], true];
_flagObject setVariable ["ExileTerritoryLevel", 1, true];
_flagObject setVariable ["ExileTerritoryName", _territoryName, true];
_flagObject setVariable ["ExileRadiusShown", false, true];
_flagObject setVariable ["ExileFlagStolen", 0, true];
_flagObject setVariable ["ExileLifeTerritoryZone",_territoryZone,true];
_currentTimestamp = call ExileServer_util_time_currentTime;
_flagObject setVariable ["ExileTerritoryLastPayed", _currentTimestamp];
_flagObject call ExileServer_system_territory_maintenance_recalculateDueDate;
[_flagObject,_territoryName,_flagTexture] call ExileServer_system_territory_database_insert;
["announceTerritoryRequest", [netId _flagObject]] call ExileServer_system_network_send_broadcast;
