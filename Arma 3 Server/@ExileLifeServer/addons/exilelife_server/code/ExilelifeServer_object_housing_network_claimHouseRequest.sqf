/**
                    * ExilelifeServer_object_housing_network_claimHouseRequest
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

                    private["_sessionID","_paramaters","_objectClassName","_objectPosition","_territoryName","_alphabet","_forbiddenCharacter","_playerObject","_maximumNumberOfTerritoriesPerPlayer","_numberOfTerritories","_maximumDistanceFromSafeZones","_isInRange","_building","_maximumTerritoryRadius","_object"];
_sessionID = _this select 0;
_paramaters = _this select 1;
_objectClassName = _paramaters select 0;
_objectPosition = _paramaters select 1; 
_territoryName = _paramaters select 2;
try
{
	_territoryName = _territoryName call ExileClient_util_string_trim;
	_alphabet = getText (missionConfigFile >> "CfgClans" >> "clanNameAlphabet");
	_forbiddenCharacter = [_territoryName, _alphabet] call ExileClient_util_string_containsForbiddenCharacter;
	if !(_forbiddenCharacter isEqualTo -1) then 
	{
		throw "Forbidden Character";
	};
	if !(_objectClassName isEqualTo "ExileLife_Construction_SleepingBag_Preview") then 
	{
		throw format ["What are you doing? You cant place a %1 just anywhere you want to!",_objectClassName];
	};
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then 
	{
		throw "Invalid Player Object";
	};
	_maximumNumberOfTerritoriesPerPlayer = getNumber (missionConfigFile >> "CfgTerritories" >> "maximumNumberOfTerritoriesPerPlayer");
	_numberOfTerritories = _playerObject call ExileClient_util_territory_getNumberOfTerritories;
	if (_numberOfTerritories >= _maximumNumberOfTerritoriesPerPlayer) then
	{
		throw "You have reached the maximum number of territories you can own.";
	};
	_maximumDistanceFromSafeZones = getNumber (missionConfigFile >> "CfgTerritories" >> "maximumDistanceFromSafeZones");
	_isInRange = [_objectPosition, "Guard"] call ExileLifeClient_util_world_isGangTerritoryInRange;
	if !(_isInRange isEqualTo 1) then
	{
		_isInRange = [_objectPosition, (_playerObject getVariable ['ExileLifeClientGang',""])] call ExileLifeClient_util_world_isGangTerritoryInRange;
		if !(_isInRange == 1) then
		{
			throw "Its not safe to settle out here!";	
		};
	};
	_building = ((lineIntersectsSurfaces [ getPosWorld _playerObject vectorAdd [0, 0, 50],        getPosWorld _playerObject vectorAdd [0, 0, -50],      _playerObject, objNull, true, 1, "GEOM", "NONE"   ] select 0) select 3);
	if !((typeof _building) in ExileLifeHouses) then 
	{
		throw "You cannot settle here!";
	};
	if (_building getVariable ["ExileLifeTerritoryClaimed", false]) then 
	{
		throw "This house has already been claimed";
	};
	_maximumTerritoryRadius = getNumber (missionConfigFile >> "CfgTerritories" >> "minimumDistanceToOtherTerritories");
	if ([_objectPosition, _maximumTerritoryRadius] call ExileClient_util_world_isTerritoryInRange) then 
	{
		throw "You are too close to enemy territory.";
	};
	_object = createVehicle[_objectClassName, _objectPosition, [], 0, "CAN_COLLIDE"];	
	_object setPos _objectPosition;
	_object enableSimulationGlobal true;
	_object setVariable ["ExileFlagTexture","house"]; 
	_object setVariable ["ExileTerritoryName",_territoryName];
	_object setVariable ["ExileOwnerUID",getPlayerUID _playerObject,true];
	[_object, _playerObject] call ExileServer_system_swapOwnershipQueue_add;
	[_sessionID, "constructionResponse", [netid _object]] call ExileServer_system_network_send_to;
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Construction aborted!", _exception]]] call ExileServer_system_network_send_to;
	_exception call ExileServer_util_log;
};
true
