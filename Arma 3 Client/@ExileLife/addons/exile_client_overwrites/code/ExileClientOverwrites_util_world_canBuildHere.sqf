/**
                    * ExileClientOverwrites_util_world_canBuildHere
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

                    private["_constructionConfigName","_position","_playerUID","_player","_result","_requiresTerritory","_canBePlacedOnRoad","_allowDuplicateSnap","_minimumDistanceToTraderZones","_minimumDistanceToSpawnZones","_minimumDistanceToOtherTerritories","_maximumTerritoryRadius","_isInRange","_building","_nearestFlags","_nearest","_radius","_buildRights","_territoryLevelConfigs","_territoryLevelConfig","_numberOfConstructionsAllowed"];
_constructionConfigName = _this select 0;
_position = _this select 1;
_playerUID = _this select 2;
_player = param [3,objNull];
if(isNull _player)then{
	_player = player;
};
_result = 0;
_requiresTerritory = getNumber (configFile >> "CfgConstruction" >> _constructionConfigName >> "requiresTerritory") isEqualTo 1;
_canBePlacedOnRoad = getNumber (configFile >> "CfgConstruction" >> _constructionConfigName >> "canBePlacedOnRoad") isEqualTo 1;
_allowDuplicateSnap = getNumber (configFile >> "CfgConstruction" >> _constructionConfigName >> "allowDuplicateSnap") isEqualTo 1;
_minimumDistanceToTraderZones = getNumber (missionConfigFile >> "CfgTerritories" >> "minimumDistanceToTraderZones");
_minimumDistanceToSpawnZones = getNumber (missionConfigFile >> "CfgTerritories" >> "minimumDistanceToSpawnZones");
_minimumDistanceToOtherTerritories = getNumber (missionConfigFile >> "CfgTerritories" >> "minimumDistanceToOtherTerritories");
_maximumTerritoryRadius = getNumber (missionConfigFile >> "CfgTerritories" >> "maximumRadius");
try
{
	_isInRange = [_position, "Guard"] call ExileLifeClient_util_world_isGangTerritoryInRange;
	if !(_isInRange isEqualTo 1) then
	{
		_isInRange = [_position, ExileLifeClientGang] call ExileLifeClient_util_world_isGangTerritoryInRange;
		if !(_isInRange isEqualTo 1) then
		{
			if (_requiresTerritory) then
			{
				throw 4;
			};
		};
	};
	if (_position call ExileClient_util_world_isInConcreteMixerZone) then
	{
		throw 11;
	};
	if (_position call ExileClient_util_world_isInNonConstructionZone) then
	{
		throw 10;
	};
	if (_position call ExileClient_util_world_isInRadiatedZone) then
	{
		throw 8;
	};
	if !(_canBePlacedOnRoad) then
	{
		if (isOnRoad [_position select 0, _position select 1, 0]) then
		{
			throw 3;
		};
	};
	if !(_allowDuplicateSnap) then
	{
		{
			if (_position isEqualTo (getPosASL _x)) then
			{
				throw 7;
			};
		}
		forEach ((ASLtoAGL _position) nearObjects ["Exile_Construction_Abstract_Static", 3]);
	};
	if (_constructionConfigName isEqualTo "SquatersSleepingBag") then
	{
		if ([_position, _minimumDistanceToOtherTerritories] call ExileClient_util_world_isTerritoryInRange) then
		{
			_building = player call ExileLifeClient_util_housing_canSquatHere;
			if !(_building isEqualTo "") then
			{
				throw 2;
			};
		};
	}
	else
	{
		_nearestFlags = [];
		{
			_nearest = (nearestObjects [ASLtoAGL _position,  [_x], _maximumTerritoryRadius]);
			if !(_nearest isEqualTo []) then
			{
				_nearestFlags append _nearest;
			};
 		}
 		forEach ["ExileLife_Construction_SleepingBag_Static", "Exile_Construction_Flag_Static"];
		if !(_nearestFlags isEqualTo []) then
		{
			{
				_radius = _x getVariable ["ExileTerritorySize", -1];
				if ((_position distance (getPosASL _x)) < _radius) then
				{
					_buildRights = _x getVariable ["ExileTerritoryBuildRights", []];
					if (_playerUID in _buildRights) then
					{
						_territoryLevelConfigs = getArray (missionConfigFile >> "CfgTerritories" >> "prices");
						_territoryLevelConfig = _territoryLevelConfigs select ((_x getVariable ["ExileTerritoryLevel", 0]) - 1);
						_numberOfConstructionsAllowed = _territoryLevelConfig select 2;
						if ((_x getVariable ["ExileFlagStolen", 0]) isEqualTo 1) then
						{
							throw 9;
						};
						if ((_x getVariable ["ExileTerritoryNumberOfConstructions", 0]) >= _numberOfConstructionsAllowed) then
						{
							throw 6;
						};
						_building = objectfromNetId (_x getVariable ["ExileLifeTerritoryBuildingID", ""]);
						if(isServer)then{
							if !(((lineIntersectsSurfaces [ getPosWorld _player vectorAdd [0, 0, 50], getPosWorld _player vectorAdd [0, 0, -50], _player, objNull, true, 1, "GEOM", "NONE"   ] select 0) select 3) isEqualTo (_building)) then
							{
								throw 1;
							};
						}else{
							if !(((lineIntersectsSurfaces [ getPosWorld ExileClientConstructionObject vectorAdd [0, 0, 50], getPosWorld ExileClientConstructionObject vectorAdd [0, 0, -50], ExileClientConstructionObject, objNull, true, 1, "GEOM", "NONE"   ] select 0) select 3) isEqualTo (_building)) then
							{
								throw 1;
							};
						};
						throw 0;
					};
				};
				throw 2;
			}
			forEach _nearestFlags;
		};
		if (_requiresTerritory) then
		{
			throw 1;
		};
	};
}
catch
{
	_result = _exception;
};
_result
