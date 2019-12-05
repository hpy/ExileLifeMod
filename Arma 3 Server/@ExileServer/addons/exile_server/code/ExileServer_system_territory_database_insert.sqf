/**
                    * ExileServer_system_territory_database_insert
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

                    private["_flagObject","_territoryName","_flagTexture","_territorySize","_owner","_position","_vectorDirection","_vectorUp","_build","_moderators","_territoryZone","_data","_extDBMessage","_territoryID"];
_flagObject = _this select 0;
_territoryName = _this select 1;
_flagTexture = _this select 2;
_territorySize = ((getArray(missionConfigFile >> "CfgTerritories" >> "prices")) select 0)select 1;
_owner = _flagObject getVariable ["ExileOwnerUID",""];
_position = getPosATL _flagObject;
_vectorDirection = vectorDir _flagObject;
_vectorUp = vectorUp _flagObject;
_build_rights = _flagObject getVariable ["ExileTerritoryBuildRights",[]];
_moderators = _flagObject getVariable ["ExileTerritoryModerators",[]];
_territoryZone = _flagObject getVariable ["ExileLifeTerritoryZone",""];
_data =
[
_owner,
	_territoryName,
	_territoryZone,
	_position select 0,
	_position select 1,
	_position select 2,
	_vectorDirection select 0,
	_vectorDirection select 1,
	_vectorDirection select 2,
	_vectorUp select 0,
	_vectorUp select 1,
	_vectorUp select 2,
	_territorySize,
	1,
	_flagTexture,
	_build_rights,
	_moderators,
	_flagObject getVariable ["ExileLifeOwnerPID",-1]
];
_extDBMessage = ["createTerritory", _data] call ExileServer_util_extDB2_createMessage;
_territoryID = _extDBMessage call ExileServer_system_database_query_insertSingle;
_flagObject setVariable ["ExileDatabaseID",_territoryID];
_flagObject setVariable ["ExileFlagTexture",_flagTexture];
true
