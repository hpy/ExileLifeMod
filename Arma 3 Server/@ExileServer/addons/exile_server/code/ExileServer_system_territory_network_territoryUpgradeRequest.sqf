/**
                    * ExileServer_system_territory_network_territoryUpgradeRequest
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

                    private["_sessionID","_parameters","_sleepingBag","_playerObject","_databaseID","_moderators","_level","_territoryConfig","_territoryLevels","_territoryPrice","_territoryRange","_playerMoney","_territoryGang","_gangBankName","_gangBankBalance","_newgangBankBalance","_logging","_territoryLog"];
 _sessionID = _this select 0;
_parameters = _this select 1;
_sleepingBag = _parameters select 0;
try
{
	if (isNull _sleepingBag) then
	{
		throw "Invalid flag object";
	};
	if ((_sleepingBag getVariable ["ExileFlagStolen", 0]) isEqualTo 1) then
	{
		throw "Flag is stolen!";
	};
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw "Player Object NULL";
	};
	_databaseID = _sleepingBag getVariable ["ExileDatabaseID",0];
	_moderators = _sleepingBag getVariable ["ExileTerritoryModerators",[]];
	if !((getPlayerUID _playerObject) in _moderators) then
	{
		throw "No upgrade Access!";
	};
	_level = _sleepingBag getVariable ["ExileTerritoryLevel",_level];
	_territoryConfig = getArray(missionConfigFile >> "CfgTerritories" >> "Prices");
	_territoryLevels = count _territoryConfig;
	if (_territoryLevels < (_level + 1)) then
	{
		throw "This territory has already the highest level.";
	};
	_territoryPrice = (_territoryConfig select _level) select 0;
	_territoryRange = (_territoryConfig select _level) select 1;
	_playerMoney = _playerObject getVariable ["ExileMoney",0];
	if (_playerMoney < _territoryPrice) then
	{
		throw "Not enough pop tabs!";
	};
	_playerMoney = _playerMoney - _territoryPrice;
	_playerObject setVariable ["ExileMoney", _playerMoney, true];
	format["setPlayerMoney:%1:%2", _playerMoney, _playerObject getVariable ["ExileLifePID", -1]] call ExileServer_system_database_query_fireAndForget;
	_territoryGang = _sleepingBag getVariable ["ExileLifeTerritoryZone",""];
	_gangBankName = format ["ExileLifeGangBank:%1",_territoryGang];
	_gangBankBalance = missionNamespace getVariable [_gangBankName,-1];
	_newgangBankBalance = _gangBankBalance + _territoryPrice;
	missionNamespace setVariable [_gangBankName,_newgangBankBalance];
	format["updateGangBank:%1:%2",_newgangBankBalance,_territoryGang] call ExileServer_system_database_query_fireAndForget;
	_sleepingBag setVariable ["ExileTerritoryLevel",_level + 1, true];
	_sleepingBag setVariable ["ExileTerritorySize",_territoryRange, true];
	format ["setTerritoryLevel:%1:%2",_level + 1,_databaseID] call ExileServer_system_database_query_fireAndForget;
	format ["setTerritorySize:%1:%2",_territoryRange,_databaseID] call ExileServer_system_database_query_fireAndForget;
	_sleepingBag call ExileServer_system_territory_updateNearContainers;
	_sleepingBag call ExileServer_system_territory_updateNearConstructions;
	[_sessionID, "toastRequest", ["SuccessTitleOnly", ["Dwelling Upgraded!"]]] call ExileServer_system_network_send_to;
	_logging = getNumber(configFile >> "CfgSettings" >> "Logging" >> "territoryLogging");
	if (_logging isEqualTo 1) then
	{
		_territoryLog = format ["PLAYER ( %1 ) %2 PAID %3 POP TABS TO UPGRADE TERRITORY #%4 TO LEVEL %5 | PLAYER TOTAL POP TABS: %6",getPlayerUID _playerObject,_playerObject,_territoryPrice,_databaseID,(_level + 1),_playerMoney];
		[_territoryLog,"Territory"] call ExileLifeServer_util_A3Log;
	};
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to upgrade!", _exception]]] call ExileServer_system_network_send_to;
};
true