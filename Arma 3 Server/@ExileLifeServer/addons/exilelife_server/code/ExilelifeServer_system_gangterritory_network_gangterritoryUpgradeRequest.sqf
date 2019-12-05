/**
                    * ExilelifeServer_system_gangterritory_network_gangterritoryUpgradeRequest
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

                    private["_sessionID","_parameters","_gang","_PlayerObject","_PlayersGang","_GangBoss","_GangBossUID","_PlayerUID","_GangMarkerName","_CurrentGangTerritoryRadius","_GangTerritoryUpgrade","_ind","_newind","_NewGangTerritoryLevel","_GangTerritoryRadius","_GangTerritoryPrice","_GangBank","_GangBossBankAccount","_GangBossBankAccountUpdate","_GangTerritoryName","_enemygang"];
_sessionID = _this select 0;
_parameters = _this select 1;
_gang = _parameters select 0;
try
{
	_PlayerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _PlayerObject) then
	{
		throw "You dont exist!";
	};
	_PlayersGang = _PlayerObject getVariable ['ExileLifeClientGang', ""];
	_GangBoss = format ["ExileLifeGangBoss:%1",_PlayersGang];
	_GangBossUID = missionNamespace getVariable _GangBoss;
	_PlayerUID = getPlayerUID _PlayerObject;
	if !(_PlayerUID == _GangBossUID) then
	{
		throw "No upgrade Access!";
	};
	if !(_PlayersGang == _gang) then
		{
	throw "You do not have permission to do that!";
	};
	_GangMarkerName = format ["%1_TERRITORY",_PlayersGang];
	_CurrentGangTerritoryRadius = (getMarkerSize _GangMarkerName) select 0;
	_GangTerritoryUpgrade = getArray(missionConfigFile >> "CfgGangData" >> _PlayersGang >> "GangTerritoryUpgrade");
	_ind = ((count _GangTerritoryUpgrade) - 1);
	{
		if ((_x select 1) == (_CurrentGangTerritoryRadius)) then
		{
		_ind = _forEachIndex;
		};
	}forEach _GangTerritoryUpgrade;
	_newind = _ind + 1;
	_NewGangTerritoryLevel = (_GangTerritoryUpgrade select _newind) select 0;
	_GangTerritoryRadius = (_GangTerritoryUpgrade select _newind) select 1;
	_GangTerritoryPrice = (_GangTerritoryUpgrade select _newind) select 2;
	if (isNil "_NewGangTerritoryLevel") then
	{
		throw "Maximum Gang Territory Size Reached";
	};
	_GangBank = format ["ExileLifeGangBank:%1",_PlayersGang];
	_GangBossBankAccount = missionNamespace getVariable _GangBank;
	if (_GangBossBankAccount < _GangTerritoryPrice) then
	{
		throw "Insufficient Gang Funds";
	};
	if (_GangTerritoryPrice == 0) then
	{
		throw "Error with your Gangs Funds";
	};
	_GangBossBankAccount = _GangBossBankAccount - _GangTerritoryPrice;
	_GangBossBankAccountUpdate = missionNamespace setVariable [_GangBank,_GangBossBankAccount];
	format["updateGangBank:%1:%2", _GangBossBankAccount,_PlayersGang] call ExileServer_system_database_query_fireAndForget;
	_GangTerritoryName = format ["%1_ExileLifeTerritory",_PlayersGang];
	_CurrentGangTerritoryRadius = missionNamespace setVariable [_GangTerritoryName, _GangTerritoryRadius];
	format ["updateGangTerritory:%1:%2",_GangTerritoryRadius,_PlayersGang] call ExileServer_system_database_query_fireAndForget;
	_GangMarkerName setMarkerSize [_GangTerritoryRadius,_GangTerritoryRadius];
	[_gang, "toastRequest", ["SuccessTitleAndText", ["Domination!", (format ['The %1 have expanded into new territory!',_gang])]]] call ExileLifeServer_system_network_send_to_gang;
	_enemygang = [];
	switch (_gang) do {
	case "Mafia": 	{ _enemygang = ["Syndicate","Yakuza","Cartel"]};
	case "Syndicate":	{ _enemygang = ["Mafia","Yakuza","Cartel"]};
	case "Yakuza": 	{ _enemygang = ["Syndicate","Mafia","Cartel"]};
	case "Cartel": 	{ _enemygang = ["Syndicate","Yakuza","Mafia"]};
	};
	{
		[_gang, "toastRequest", ["ErrorTitleAndText", ["Domination!", (format ['The %1 have expanded into new territory!',_gang])]]] call ExileLifeServer_system_network_send_to_gang;
	}forEach _enemygang;
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Error!", _exception]]] call ExileServer_system_network_send_to;
};
call ExileLifeServer_world_loadGangStats; 
